//================================================================================
//	ShaderRuntime_VS
//	Copyright 2007 3D Realms, Inc. All Rights Reserved.
//	John Pollard
//================================================================================

#define ARG(Index)			(Args[ArgStart+Index])
#define VARYARG(Index)		(Args[VaryArgStart+Index])
#define PACK_CAMERA_Z(Z)	((Z)*0.2f)
#define UNPACK_CAMERA_Z(Z)	((Z)*(1.0f/0.2f))
//#define PACK_CAMERA_Z(Z)	(Z)

// FIXME: Generate this on the fly?
vector	OneOverViewportSize;

#ifdef WITH_NV_STEREO
	sampler NvStereoFixTex : register(vs, s0);
#endif

float4 NvMonoToStereoClipPosVS(float4 InMonoClipPos)
{
#ifdef WITH_NV_STEREO
	if (InMonoClipPos.w == 1.0) {
		return InMonoClipPos;
	}

	// stereoParams.x is separation
	// stereoParams.y is convergence
	float2 stereoParams = tex2Dlod(NvStereoFixTex, float4(1.0f / 16, 0.5, 0, 0)).xy;
	float4 OutStereoClipPos = InMonoClipPos;
	
	// Perform the stereo transform for shaders that skipped it. 
	// The stereo transform is StereoClipPos.x += (Separation * (StereoClipPos.w - Convergence));
	OutStereoClipPos.x += (stereoParams.x * (InMonoClipPos.w - stereoParams.y));

	return OutStereoClipPos;
#else
	return InMonoClipPos;
#endif
}

//================================================================================
//	HandleVertexLighting
//	Handle dx8 style hw lights
//================================================================================
float3 HandleVertexLighting(float3 Diffuse, float4 LocalPos, float3 Normal)
{
	float4 WorldPos		= mul(LocalPos, LocalToWorld);				// Rotate vertex position into world
	float3 WorldNormal	= mul(Normal, (float3x3)LocalToWorld);		// Rotate vertex normal into world
	float3 TotalLight	= float3(0,0,0);
	
	for (int i=0; i< NumLights; i++)
	{
		float3	VertToLight	= normalize((Lights[i].Location - WorldPos).rgb);		// Get vertex to light vector
		float4	LightPos	= mul(LocalPos, Lights[i].LocalToLightAtten3D);
		//float	Dot3		= bTwoSidedLighting ? abs(dot(VertToLight, WorldNormal)) : max(dot(VertToLight, WorldNormal), 0);
		float	Dot3		= bTwoSidedLighting ? 1.0f : max(dot(VertToLight, WorldNormal), 0);
		float	Atten		= 1.0f - clamp(length(LightPos.rgb*2-1), 0, 1);

		TotalLight += (Lights[i].Color * Dot3 * Atten).rgb;		// Attenuate
	}
	
	if (bVertexAmbientLighting && bHasVertexColor)
		TotalLight += Diffuse;							// Add vertex color in
	else
		TotalLight *= Diffuse;
	
	if (bModulateAmbient)
		TotalLight *= AmbientLighting;
	else
		TotalLight += AmbientLighting;					// Add in ambient
		
	return TotalLight;
}

static float3 FoliageLocal;

//================================================================================
//	HandleBillboardPolys
//================================================================================
float4 HandleBillboardPolys(const VS_INPUT In, float4 Position)
{
#if (bHasTexCoordOps > 0)
	float Size = 1-saturate((Position.z-g_MiscFoliage.x) / g_MiscFoliage.y);
	
	Size *= g_Time.y;
	
	Position = In.vPosition;

	float3 CamPos = float3(g_Time.z, g_Time.w, Position.z);
	
	float3 Vector = (Position.xyz - CamPos);
	float Length = length(Vector);
	
	Vector /= Length;
	
	Length = 1-saturate(Length/150);
	
	matrix Trans = transpose(LocalToCamera);
	
	Position.x += sin((g_Time.x + Position.x*10.2f + Position.y*15.2f) * 0.06f) * 4.0f * In.vTexCoords[7].z;
	Position.y += cos((g_Time.x + Position.x*10.2f + Position.y*15.2f) * 0.06f) * 4.0f * In.vTexCoords[7].z;

	float3 XVector = Trans[0];
	float3 ZVector = -Trans[1];
	
	ZVector.z -= 2.0f;
	ZVector = normalize(ZVector);
	
	Position.xyz += XVector * In.vTexCoords[7].x * Size;
	Position.xyz += ZVector * In.vTexCoords[7].y * Size;
	
	Position.xyz += Vector * Length * 20.0f * In.vTexCoords[7].z;

	FoliageLocal = Position.xyz;
	
	Position = mul(float4(Position.xyz, 1), LocalToScreen);
#endif	
	return Position;
}

#ifdef WITH_TEXCOORD_OPS

void HandleTransformFlag(const TexCoordOp TexOp, const int Index, inout VS_OUTPUT Out)
{
#if (bHasTexCoordOps > 0)

	if (TexOp.TransformFlag != FEMU_TF_None)
		Out.vTexCoords[Index] = mul(Out.vTexCoords[Index], StageMatrices[Index]);
		
#endif
}

//================================================================================
//	HandleTexCoordOp
//================================================================================
void HandleTexCoordOp_StreamIndex7(const TexCoordOp TexOp, const int Index, float3 LocalNormal, const VS_INPUT In, inout VS_OUTPUT Out)
{

#if (bHasTexCoordOps > 0)

	Out.vTexCoords[Index] = In.vTexCoords[TexOp.StreamIndex];
	
	// Make sure unused components are properly initialized
	if (TexOp.TransformFlag == FEMU_TF_Count2 || TexOp.TransformFlag == FEMU_TF_Count2_Persp)
	{
		Out.vTexCoords[Index].z = 1.0f;
		Out.vTexCoords[Index].w = 1.0f;
	}
	else if (TexOp.TransformFlag == FEMU_TF_Count3 || TexOp.TransformFlag == FEMU_TF_Count3_Persp)
		Out.vTexCoords[Index].w = 1.0f;
	else
	{
		Out.vTexCoords[Index].z = 1.0f;
		Out.vTexCoords[Index].w = 1.0f;
	}
	
	HandleTransformFlag(TexOp, Index, Out);
	
#endif	
}

void HandleTexCoordOp_CameraPos(const TexCoordOp TexOp, const int Index, float3 LocalNormal, const VS_INPUT In, inout VS_OUTPUT Out)
{
#if (bHasTexCoordOps > 0)
#ifdef WITH_NV_STEREO
	// Use the computed vPosition field, then convert to correct stereo, then convert back to eye space.
	Out.vTexCoords[Index] = Out.vPosition;
	Out.vTexCoords[Index].x = NvMonoToStereoClipPosVS(Out.vTexCoords[Index]).x;
	Out.vTexCoords[Index] = mul(Out.vTexCoords[Index], ScreenToCamera);
	Out.vTexCoords[Index] /= Out.vTexCoords[Index].w;
#else
	Out.vTexCoords[Index] = mul(float4(In.vPosition.xyz,1), LocalToCamera);
#endif

 	HandleTransformFlag(TexOp, Index, Out);	
#endif	
}

void HandleTexCoordOp_WorldPos(const TexCoordOp TexOp, const int Index, float3 LocalNormal, const VS_INPUT In, inout VS_OUTPUT Out)
{
#if (bHasTexCoordOps > 0)

	Out.vTexCoords[Index] = mul(float4(In.vPosition.xyz,1), LocalToWorld);
	
	HandleTransformFlag(TexOp, Index, Out);
	
#endif	
}

void HandleTexCoordOp_CameraReflection(const TexCoordOp TexOp, const int Index, float3 LocalNormal, const VS_INPUT In, inout VS_OUTPUT Out)
{
#if (bHasTexCoordOps > 0)

	// Put pos in camera space
	float4 TexCoords = mul(In.vPosition, LocalToCamera);	
	// Put normal in camera space
	LocalNormal = mul(LocalNormal, (float3x3)LocalToCamera);
	// Reflect vector by vertex normal and normalize
	TexCoords.xyz = reflect(normalize(TexCoords.xyz), normalize(LocalNormal));
	
	// Since we are now dealing with a normal, only rotate, don't translate
	if (TexOp.TransformFlag != FEMU_TF_None)
		TexCoords.xyz = mul(TexCoords, (float3x3)StageMatrices[Index]).xyz;

	Out.vTexCoords[Index] = TexCoords;

#endif	
}

void HandleTexCoordOp_CameraNormal(const TexCoordOp TexOp, const int Index, float3 LocalNormal, const VS_INPUT In, inout VS_OUTPUT Out)
{
#if (bHasTexCoordOps > 0)

	float4 WorldCoords = mul(float4(In.vPosition.xyz,1), LocalToWorld);	
	
	//float3 WorldNormal = mul(In.vNormal, (float3x3)LocalToWorld);
	float3 WorldNormal = mul(LocalNormal, (float3x3)LocalToWorld);
	
	WorldNormal = normalize(WorldNormal);
	
	Out.vTexCoords[Index+0]		= WorldCoords;
	Out.vTexCoords[Index+1].xyz = WorldNormal;

#endif	
}

//================================================================================
//	HandleFSAACoords
//================================================================================
void HandleFSAACoords(const VS_INPUT In, int Index, int ConstIndex, inout VS_OUTPUT Out)
{
#if (bHasTexCoordOps > 0)
	float4 Tex = In.vTexCoords[0];
			
	float XOfs = Consts[ConstIndex].z;
	float YOfs = Consts[ConstIndex].w;
		
	Out.vTexCoords[Index+0] = float4(Tex.x, Tex.y, 1.0f, 1.0f);				// Center
	Out.vTexCoords[Index+1] = float4(Tex.x-XOfs, Tex.y-YOfs, 1.0f, 1.0f);	// Left Top
	Out.vTexCoords[Index+2] = float4(Tex.x+XOfs, Tex.y+YOfs, 1.0f, 1.0f);	// Right bottom
	Out.vTexCoords[Index+3] = float4(Tex.x+XOfs, Tex.y-YOfs, 1.0f, 1.0f);	// Right Top
	Out.vTexCoords[Index+4] = float4(Tex.x-XOfs, Tex.y+YOfs, 1.0f, 1.0f);	// Left Bottom
	Out.vTexCoords[Index+5] = float4(Tex.x-XOfs, Tex.y, Tex.x+XOfs, Tex.y);	// Left / Right
	Out.vTexCoords[Index+6] = float4(Tex.x, Tex.y-YOfs, Tex.x, Tex.y+YOfs);	// Top / Bottom
#endif	
}

//================================================================================
//	CalcTexToLocal
//================================================================================
float3x3 CalcTexToLocal(const VS_INPUT In)
{
#if (bProjectorLighting)

	return (float3x3)ProjectorTexToLocal;	
	
#else

	#if ((bHasVertexNormal == 1) && (bHasTexCoordOps > 0))	
		float3 XAxis = In.vTexCoords[3].xyz;
		float3 YAxis = bMeshLighting ? cross(In.vNormal, In.vTexCoords[3].xyz) * In.vTexCoords[0].z : In.vTexCoords[4].xyz;
		float3 ZAxis = In.vNormal.xyz;		
	#else 
		float3 XAxis = float3(0,-1,0);
		float3 YAxis = float3(0,0,1);
		float3 ZAxis = float3(1,0,0);
	#endif	
	
	return float3x3(XAxis, YAxis, ZAxis);
	
#endif
}



//================================================================================
//	HandleTexCoordOp
//================================================================================
void HandleTexCoordOp(const TexCoordOp TexOp, const int Index, float3 LocalNormal, const VS_INPUT In, inout VS_OUTPUT Out)
{
#if (bHasTexCoordOps > 0)
	//if (TexOp.StreamIndex == FEMU_TCI_Nop)		// This was a reserved tex coord
	//	return;
	
	if (TexOp.StreamIndex <= 7)
	{
		Out.vTexCoords[Index] = In.vTexCoords[TexOp.StreamIndex];
		
		// Make sure unused components are properly initialized
		if (TexOp.TransformFlag == FEMU_TF_Count2 || TexOp.TransformFlag == FEMU_TF_Count2_Persp)
		{
			Out.vTexCoords[Index].z = 1.0f;
			Out.vTexCoords[Index].w = 1.0f;
		}
		else if (TexOp.TransformFlag == FEMU_TF_Count3 || TexOp.TransformFlag == FEMU_TF_Count3_Persp)
			Out.vTexCoords[Index].w = 1.0f;
		else
		{
			Out.vTexCoords[Index].z = 1.0f;
			Out.vTexCoords[Index].w = 1.0f;
		}
	}
	else if (TexOp.StreamIndex == FEMU_TCI_CameraPos)				// From camera space
		Out.vTexCoords[Index] = mul(float4(In.vPosition.xyz,1), LocalToCamera);	
	else if (TexOp.StreamIndex == FEMU_TCI_WorldPos)				// From world space
		Out.vTexCoords[Index] = mul(float4(In.vPosition.xyz,1), LocalToWorld);	
	else if (TexOp.StreamIndex == FEMU_TCI_CameraReflection)		// From camera space reflected by normal
	{
		// Put pos in camera space
		float4 TexCoords = mul(In.vPosition, LocalToCamera);	
		// Put normal in camera space
		LocalNormal = mul(LocalNormal, (float3x3)LocalToCamera);
		// Reflect vector by vertex normal and normalize
		TexCoords.xyz = reflect(normalize(TexCoords.xyz), normalize(LocalNormal));
		
		// Since we are now dealing with a normal, only rotate, don't translate
		if (TexOp.TransformFlag != FEMU_TF_None)
			TexCoords.xyz = mul(TexCoords, (float3x3)StageMatrices[Index]).xyz;
	
		Out.vTexCoords[Index] = TexCoords;
		
		return;		// We already transformed the texcoords, so bail out
	}
	else if (TexOp.StreamIndex == FEMU_TCI_CameraNormal)
	{
	#if 1
		/*
		// Put pos in camera space
		float4 TexCoords = mul(In.vPosition, LocalToCamera);	
		// Put normal in camera space
		LocalNormal = mul(LocalNormal, (float3x3)LocalToCamera);
		// Reflect vector by vertex normal and normalize
		TexCoords.xyz = reflect(normalize(TexCoords.xyz), normalize(LocalNormal));
		
		// Since we are now dealing with a normal, only rotate, don't translate
		if (TexOp.TransformFlag != FEMU_TF_None)
			TexCoords.xyz = mul(TexCoords, (float3x3)StageMatrices[Index]).xyz;
	
		Out.vTexCoords[Index] = TexCoords;
		*/
		
		float4 WorldCoords = mul(float4(In.vPosition.xyz,1), LocalToWorld);	
		
		//float3 WorldNormal = mul(In.vNormal, (float3x3)LocalToWorld);
		float3 WorldNormal = mul(LocalNormal, (float3x3)LocalToWorld);
		
		WorldNormal = normalize(WorldNormal);
		
		Out.vTexCoords[Index+0]		= WorldCoords;
		Out.vTexCoords[Index+1].xyz = WorldNormal;

		return;		// We already transformed the texcoords, so bail out
	#else
		// The idea here would be to send the world normal down the vertex pipe.
		// Then in the pixel shader, sample the texel color from 5 axes, and then blend between
		//	them using the world space vertex normal (passed from here)
		
		float4 WorldCoords = mul(float4(In.vPosition.xyz,1), LocalToWorld);	
		
		float4 Axis1 = float4(WorldCoords.xz, 1, 1) * 0.001f;
		float4 Axis2 = float4(WorldCoords.yz, 1, 1) * 0.001f;
		float4 Axis3 = float4(WorldCoords.yx, 1, 1) * 0.001f;

		// float3 WorldNormal = mul(In.vNormal, (float3x3)LocalToWorld);
		float3 WorldNormal = mul(LocalNormal, (float3x3)LocalToWorld);
		
		WorldNormal = normalize(WorldNormal);
		
		float3 AxisAlpha;
		
		AxisAlpha.x = abs(dot(WorldNormal, float3(0,1,0)));
		AxisAlpha.y = abs(dot(WorldNormal, float3(1,0,0)));
		AxisAlpha.z = abs(dot(WorldNormal, float3(0,0,1)));
		
		//Out.vTexCoords[Index] = Axis1;
		
		//AxisAlpha = 1;
		
		//float2 Alpha1 = normalize(AxisAlpha.xy);
		//float2 Alpha2 = normalize(AxisAlpha.yz);
		
		Out.vTexCoords[Index] = float4(WorldNormal, 1);
		
		//Out.vTexCoords[Index] = Axis1*AxisAlpha.x + Axis2*AxisAlpha.y + Axis3*AxisAlpha.z;
		//Out.vTexCoords[Index] = Axis1*Alpha1.x + Axis2*Alpha1.y;
		//Out.vTexCoords[Index] = Out.vTexCoords[Index]*Alpha2.x + Axis3*Alpha2.y;
		
		
		/*
		if (Alpha1 > 0.1f || Alpha1 < -0.1)
			Out.vTexCoords[Index] = Axis1;
		else if (Alpha2 > 0.1f || Alpha2 < -0.1)
			Out.vTexCoords[Index] = Axis2;
		else 
			Out.vTexCoords[Index] = 0;
		*/
			
		return;
	#endif
	}
	
	if (TexOp.TransformFlag != FEMU_TF_None)
		Out.vTexCoords[Index] = mul(Out.vTexCoords[Index], StageMatrices[Index]);
#endif	
}

#endif

void DeferredBasePassVS(in VS_INPUT In, inout VS_OUTPUT Out, in matrix LocalToCamera, int Index, int arg_7, int arg_8)
{
	// const int Index = ARG(3);
		
	// Get camera space position
	float3 CameraSpacePos = mul(float4(In.vPosition.xyz, 1), LocalToCamera).xyz;

#if (/*(bHasVertexNormal == 1) &&*/ (bHasTexCoordOps > 0))
	float3x3 TexToLocal = CalcTexToLocal(In);

	float3x3 TexToCamera = mul(TexToLocal, (float3x3)LocalToCamera);

	// Output TexToCamera matrix
	Out.vTexCoords[Index+0].xyz = TexToCamera[0];
	Out.vTexCoords[Index+1].xyz = TexToCamera[1];
	Out.vTexCoords[Index+2].xyz = TexToCamera[2];
		
	// Stuff camera pos into w values
	Out.vTexCoords[Index+0].w = CameraSpacePos.x;
	Out.vTexCoords[Index+1].w = CameraSpacePos.y;
	Out.vTexCoords[Index+2].w = PACK_CAMERA_Z(CameraSpacePos.z);
	
	if( arg_7 != NULL_HANDLE && arg_8 != NULL_HANDLE )
	{
	    float3x3 TangentToWorld = mul(TexToLocal, (float3x3)LocalToWorld);
	    float4   EyeVec         = mul(In.vPosition, LocalToWorld) - CameraPos;
    		
	    Out.vTexCoords[Index+3] = float4( normalize(TangentToWorld[0]), EyeVec.x );
	    Out.vTexCoords[Index+4] = float4( normalize(TangentToWorld[1]), EyeVec.y );
	    Out.vTexCoords[Index+5] = float4( normalize(TangentToWorld[2]), EyeVec.z );
	}
#endif	
}

void DeferredLightVS(in VS_INPUT In, inout VS_OUTPUT Out, in matrix LocalToCamera, int Index)
{
	// int Index = ARG(0);

#if (bHasTexCoordOps > 0)
	Out.vTexCoords[Index] = Out.vPosition * float4(1,-1,0,1) + Out.vPosition.w;
	Out.vTexCoords[Index].xy += OneOverViewportSize.xy * Out.vTexCoords[Index].w;

	// Output camera space position
	Out.vTexCoords[Index+1].xyz = mul(float4(In.vPosition.xyz, 1), LocalToCamera).xyz;
	Out.vTexCoords[Index+1].w = Out.vPosition.w;
#endif	
}
