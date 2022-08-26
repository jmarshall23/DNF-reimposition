//================================================================================
//	Vertex Shader Ops
//	Copyright 2007 3D Realms, Inc. All Rights Reserved.
//	John Pollard
//================================================================================

//================================================================================
//	FEMU_OP_Texture
//================================================================================
FEMU_OP_Texture
{
}

//================================================================================
//	FEMU_OP_TexCoords
//================================================================================
FEMU_OP_TexCoords
{
}

FEMU_OP_DeferredBasePass_HiJackOp
{
	DeferredBasePassVS(In, Out, LocalToCamera, ARG(3), ARG(7), ARG(8));
}

//================================================================================
//	FEMU_OP_DeferredBasePass
//================================================================================
FEMU_OP_DeferredBasePass
{
	DeferredBasePassVS(In, Out, LocalToCamera, ARG(3), ARG(7), ARG(8));
}

FEMU_OP_DeferredBasePass_Detail
{
	const int Index = ARG(3);
		
	// Get camera space position
	float3 CameraPos = mul(float4(In.vPosition.xyz, 1), LocalToCamera).xyz;
			
	float3x3 TexToLocal = CalcTexToLocal(In);

	float3x3 TexToCamera = mul(TexToLocal, (float3x3)LocalToCamera);

	// Output TexToCamera matrix
	Out.vTexCoords[Index+0].xyz = TexToCamera[0];
	Out.vTexCoords[Index+1].xyz = TexToCamera[1];
	Out.vTexCoords[Index+2].xyz = TexToCamera[2];
		
	// Stuff camera pos into w values
	Out.vTexCoords[Index+0].w = CameraPos.x;
	Out.vTexCoords[Index+1].w = CameraPos.y;
	Out.vTexCoords[Index+2].w = PACK_CAMERA_Z(CameraPos.z);
}


FEMU_OP_DeferredLight_HiJackOp
{
	DeferredLightVS(In, Out, LocalToCamera, ARG(0));
}

//================================================================================
//	FEMU_OP_DeferredLight
//================================================================================
FEMU_OP_DeferredLight
{
	DeferredLightVS(In, Out, LocalToCamera, ARG(0));

#if 0

	int Index = ARG(0);
		
	Out.vTexCoords[Index] = Out.vPosition * float4(1,-1,0,1) + Out.vPosition.w;
	Out.vTexCoords[Index].xy += OneOverViewportSize.xy * Out.vTexCoords[Index].w;

	// Output camera space position
	Out.vTexCoords[Index+1].xyz = mul(float4(In.vPosition.xyz, 1), LocalToCamera).xyz;
	Out.vTexCoords[Index+1].w = Out.vPosition.w;
#endif	
}

//================================================================================
//	FEMU_OP_GenShadowMapTestResults
//================================================================================
FEMU_OP_GenShadowMapTestResults
{
	DeferredLightVS(In, Out, LocalToCamera, ARG(0));

#if 0
	int Index = ARG(0);
		
	Out.vTexCoords[Index] = Out.vPosition * float4(1,-1,0,1) + Out.vPosition.w;
	Out.vTexCoords[Index].xy += OneOverViewportSize.xy * Out.vTexCoords[Index].w;

	// Output camera space position
	Out.vTexCoords[Index+1].xyz = mul(float4(In.vPosition.xyz, 1), LocalToCamera).xyz;
	Out.vTexCoords[Index+1].w = Out.vPosition.w;
#endif	
}

//================================================================================
//	FEMU_OP_Parallax
//================================================================================
FEMU_OP_Parallax
{
	float3x3 TexToLocal = CalcTexToLocal(In);
	float3x3 TexToWorld = mul(TexToLocal, (float3x3)LocalToWorld);
			
	float3 WorldPos	= mul(In.vPosition, LocalToWorld).xyz;
				
	// We need tangent space camera vector
	Out.vTexCoords[ARG(1)].xyz = mul(TexToWorld, CameraPos.xyz - WorldPos); // Tangent space camera vector
}

//================================================================================
//	FEMU_OP_BumpCubeEnvMap
//================================================================================
FEMU_OP_BumpCubeEnvMap
{
	int Index = ARG(3);
		
	// FIXME: Snap tangent/binormal to localnormal plane.  This will fix animating normals...
	float3x3 M = mul(CalcTexToLocal(In), (float3x3)LocalToWorld);
		
	Out.vTexCoords[Index+0].xyz = normalize(M[0]);
	Out.vTexCoords[Index+1].xyz = normalize(M[1]);
	Out.vTexCoords[Index+2].xyz = normalize(M[2]);
		
	float4 EyeVec = mul(In.vPosition, LocalToWorld) - CameraPos;

	Out.vTexCoords[Index+0].w = EyeVec.x;
	Out.vTexCoords[Index+1].w = EyeVec.y;
	Out.vTexCoords[Index+2].w = EyeVec.z;
}

//================================================================================
//	FEMU_OP_ShadowMapPass
//================================================================================
FEMU_OP_ShadowMapPass
{
	// SHADOW_MAP
	int Index = ARG(0);
		
	// Get camera space position
	float3 CameraPos = mul(float4(In.vPosition.xyz, 1), LocalToCamera).xyz;
	Out.vTexCoords[Index+0].xyz = CameraPos;
		
	// FIXME: Undo
	//Out.vTexCoords[Index+0] = Out.vPosition;//mul(float4(In.vPosition.xyz, 1), LocalToScreen);
}

//================================================================================
//	FEMU_OP_BumpWaterReflection
//================================================================================
FEMU_OP_BumpWaterReflection
(
	handle_res		InBumpTex1, 
	handle_int		InBumpMode1, 
	handle_res		InBumpTex2, 
	handle_int		InBumpMode2, 
	handle_samp		InBumpTargetSamp, 
	handle_res		InTargetCoords, 
	handle_const	InConstIndex, 
	handle_tex		InScratchTex, 
	handle_samp		InRefractSamp, 
	handle_res		InRefractCoords, 
	handle_res		InSurfaceTex,
	handle_res		InSurfaceNorm,
	handle_res		InSurfaceSpec, 
	handle_res		InSurfaceAlpha,
	handle_samp		InCameraSampler,
	handle_samp		InCamNormalSampler,
	handle_const	AmbientColor1,
	handle_const	AmbientColor2,
	handle_const	AmbientVector,
	handle_matrix	CameraToWorldIndex,
	handle_samp		InLumMap,
	vary			InNumLights[2]
)
{
	float3x3 TexToLocal = CalcTexToLocal(In);

	float3x3 TexToCamera = mul(TexToLocal, (float3x3)LocalToCamera);

	// Output TexToCamera matrix
	Out.vTexCoords[InScratchTex+0].xyz = TexToCamera[0];
	Out.vTexCoords[InScratchTex+1].xyz = TexToCamera[1];
	Out.vTexCoords[InScratchTex+2].xyz = TexToCamera[2];

	// Output camera space position
	float3 CameraPos = mul(In.vPosition, LocalToCamera);
		
	Out.vTexCoords[InScratchTex+0].w = CameraPos.x;
	Out.vTexCoords[InScratchTex+1].w = CameraPos.y;
	Out.vTexCoords[InScratchTex+2].w = CameraPos.z;
}

//================================================================================
//	FEMU_OP_SoftEdge
//================================================================================
FEMU_OP_SoftEdge(, , , , handle_tex InScratchTex, handle_int Mode)
{
	Out.vTexCoords[InScratchTex].x = mul(In.vPosition, LocalToCamera).z;
}

//================================================================================
//	FEMU_OP_DeferredPosOnly
//================================================================================
FEMU_OP_DeferredPosOnly
{
	// Output camera space position
	float4 CameraSpace = mul(float4(In.vPosition.xyz, 1), LocalToCamera);
	
	Out.vTexCoords[ARG(0)].x = CameraSpace.x;
	Out.vTexCoords[ARG(0)].y = CameraSpace.y;
	Out.vTexCoords[ARG(0)].z = PACK_CAMERA_Z(CameraSpace.z);
	Out.vTexCoords[ARG(0)].w = CameraSpace.w;
}

//================================================================================
//	FEMU_OP_ForwardDistanceFog
//	Distance fog for forward style rendering
//================================================================================
FEMU_OP_ForwardDistanceFog(handle_samp FogSamplerIndex, handle_tex UVIndex, handle_const FogParmsIndex, handle_const FogColorIndex, handle_int AlphaMode, handle_res AlphaResult)
{
	float4	CameraPos	= mul(In.vPosition, LocalToCamera);	
	float	FogNear		= Consts[FogParmsIndex].x;
	float	FogScale	= Consts[FogParmsIndex].y;

	Out.vTexCoords[UVIndex].x = saturate(max(CameraPos.z - FogNear,0) * FogScale);
	Out.vTexCoords[UVIndex].y = 0.5f;
}

//================================================================================
//	FEMU_OP_FogVolumePass0
//================================================================================
FEMU_OP_FogVolumePass0
{
	Out.vTexCoords[ARG(1)] = NvMonoToStereoClipPosVS(Out.vPosition) * float4(1,-1,0,1) + Out.vPosition.w;
	Out.vTexCoords[ARG(1)].xy += OneOverViewportSize.xy * Out.vTexCoords[ARG(1)].w;
}

//================================================================================
//	FEMU_OP_FogVolumePass1
//================================================================================
FEMU_OP_FogVolumePass1
{
	float4	CameraPos	= mul(In.vPosition, LocalToCamera);	
	float	FogNear		= Consts[ARG(2)].x;
	float	FogScale	= Consts[ARG(2)].y;

	Out.vTexCoords[ARG(1)].x = (CameraPos.z - FogNear) * FogScale;
	Out.vTexCoords[ARG(1)].y = 0.5f;
}

//================================================================================
//	FEMU_OP_HeightFog_Forward
//================================================================================
FEMU_OP_HeightFog_Forward
{
	float4	WorldPos	= mul(In.vPosition, LocalToWorld);	
	float4	CameraPos	= mul(In.vPosition, LocalToCamera);	
	float4	FogPlane	= Consts[ARG(2)];
	float	FogScale	= Consts[ARG(3)].z;

	Out.vTexCoords[ARG(1)].x = CameraPos.z * FogScale;
	Out.vTexCoords[ARG(1)].y = dot(float4(WorldPos.xyz,1), FogPlane);
}

//================================================================================
//	FEMU_OP_HeightFog_Deferred
//================================================================================
FEMU_OP_HeightFog_Deferred(handle_samp Depth, handle_tex TexIndex, handle_const Const1, handle_const Const2, handle_const Const3, handle_samp InNvStereoTex)
{
	Out.vTexCoords[TexIndex] = Out.vPosition * float4(1,-1,0,1) + Out.vPosition.w;
	Out.vTexCoords[TexIndex].xy += OneOverViewportSize.xy * Out.vTexCoords[TexIndex].w;

	// Output camera space position
	Out.vTexCoords[TexIndex+1].xyz = mul(float4(In.vPosition.xyz, 1), LocalToCamera).xyz;
	Out.vTexCoords[TexIndex+1].w = Out.vPosition.w;
}

//================================================================================
//	FEMU_OP_HeightFog_ForwardNew
//	Uses ray tracing
//================================================================================
FEMU_OP_HeightFog_ForwardNew(handle_const FogPlaneConstIndex, handle_const DistConstIndex, handle_tex TexCoords, handle_const ParamsIndex)
{
#if 0
	float3	WorldPos	= mul(float4(In.vPosition.xyz, 1), LocalToWorld);	
	float4	FogPlane	= Consts[FogPlaneConstIndex];		// World space

	float	Result		= 0;
	float3	CurrentPos	= CameraPos;
	float	Dot1		= dot(float4(CurrentPos.xyz,1), FogPlane);
	float	Dot2		= dot(float4(WorldPos.xyz,1), FogPlane);
	float	Time		= saturate(Dot1 / (Dot1 - Dot2));

	if (Dot1 < 0)
		CurrentPos = lerp(CurrentPos, WorldPos, Time);
	else if (Dot2 < 0)
		CurrentPos = lerp(CurrentPos, WorldPos, 1-Time);

	float3	Segment		= (WorldPos-CurrentPos);
	float3	Delta		= Segment / 4;
	
	float	DeltaLength	= length(Delta)/200;
	
	for (int i=0; i<4; i++)
	{
		float HeightScale = dot(float4(CurrentPos.xyz,1), FogPlane);
		
		HeightScale /= 90.0f;
		
		Result += DeltaLength * pow(saturate(HeightScale),2);
		
		CurrentPos += Delta;
	}
	
	Out.vTexCoords[TexCoords].x = Result;	
#else
	float3	WorldPos	= mul(float4(In.vPosition.xyz, 1), LocalToWorld);	
	float3	CameraPos2	= mul(float4(In.vPosition.xyz, 1), LocalToCamera);	

	Out.vTexCoords[TexCoords].xyz = CameraPos2;
#endif
}

//================================================================================
//	FEMU_OP_MultiPassLight
//================================================================================
FEMU_OP_MultiPassLight
(
	handle_res		InDiffuse, 
	handle_res		InNormal, 
	handle_res		InSpecOnly, 
	handle_samp		InAtten, 
	handle_samp		InFilter, 
	handle_int		InLightIndex, 
	handle_tex		InStartCoords, 
	handle_const	SpecConstIndex, 
	handle_int		bSpotLight
)
{
	// Transform position into light space
	Out.vTexCoords[InStartCoords+0].xyz = mul(In.vPosition, Lights[InLightIndex].LocalToLightAtten3D);
	
	float3x3 WorldToTex = transpose(mul(CalcTexToLocal(In), (float3x3)LocalToWorld));
	//float3x3 WorldToTex = mul(CalcTexToLocal(In), (float3x3)LocalToWorld);
	
	float4 WorldPos	= mul(In.vPosition, LocalToWorld);
	
	// Write out vertex to light in texture space
	Out.vTexCoords[InStartCoords+1].xyz = mul(Lights[InLightIndex].Location - WorldPos, WorldToTex);

	// If we need to filter lighting with cubemap, write out vertex position in local cubemap space (or 2d spotight space)
	if (InAtten != NULL_HANDLE)
	{
		// This filter matrix doubles as the cubemap filter matrix/2d spotlight projective matrix
		if (bSpotLight == 1)
			Out.vTexCoords[InStartCoords+2].xyz = mul(float4(In.vPosition.xyz,1), Lights[InLightIndex].LocalToFilter).xyw;
		else
			Out.vTexCoords[InStartCoords+2].xyz = mul(float4(In.vPosition.xyz,1), Lights[InLightIndex].LocalToFilter).xyz;
	}
	
	// If we need specular lighting, write out half angle vector in texture space
	if (InNormal != NULL_HANDLE)
	{
		float4 VertexToCamera	= normalize(CameraPos - WorldPos);
		float4 VertexToLight	= normalize(Lights[InLightIndex].Location - WorldPos);
		float4 HalfAngle		= VertexToLight+VertexToCamera;
		float3 TexHalfAngle		= mul(HalfAngle, WorldToTex);
		
		Out.vTexCoords[InStartCoords+0].w = TexHalfAngle.x;
		Out.vTexCoords[InStartCoords+1].w = TexHalfAngle.y;
		Out.vTexCoords[InStartCoords+2].w = TexHalfAngle.z;
	}
}

//================================================================================
//	FEMU_OP_LightShaft
//================================================================================
FEMU_OP_LightShaft(handle_tex Index, ,handle_tex Index2,,,const Const1,,handle_samp FBSamp, handle_res FBCoords, handle_const Const3, handle_samp CookieIndex)
{
	//Out.vTexCoords[Index].xyz = mul(float4(In.vPosition.xyz, 1), StageMatrices[Index]).xyz;
	Out.vTexCoords[Index2+0] = mul(float4(In.vPosition.xyz, 1), LocalToCamera);				// We need a camera space position
	Out.vTexCoords[Index2+0] = mul(float4(Out.vTexCoords[Index2+0].xyz,1), CameraToShadowCubeMap);	// Now take it from camera to shadowcubemap
	
	Out.vTexCoords[Index2+1].x =  Out.vTexCoords[Index].z / Const1.w;
	Out.vTexCoords[Index2+1].y = (Out.vTexCoords[Index].z - Const1.z) / 3.0f;
	
	Out.vTexCoords[Index2+1].z = mul(In.vPosition, LocalToCamera).z;		// For soft edge
}

//================================================================================
//	FEMU_OP_ForwardBasePass
//================================================================================
FEMU_OP_ForwardBasePass
(
	handle_res		InDiffuse, 
	handle_res		InNormal, 
	handle_res		InSpecOnly, 
	handle_res		InEmissive, 
	handle_const	Const1, 
	handle_const	Const2, 
	const			AmbientLightVector, 
	handle_tex		InLightTexIndex
)
{
	float3x3 WorldToTex = transpose(mul(CalcTexToLocal(In), (float3x3)LocalToWorld));
		
	// Output local AmbientLightVector
	Out.vTexCoords[InLightTexIndex].xyz = mul(AmbientLightVector, WorldToTex);
}

//================================================================================
//	FEMU_OP_DeferredBasePass_ThermalBS
//================================================================================
FEMU_OP_DeferredBasePass_ThermalBS
{
	int Index = ARG(2);
		
	float3x3 TexToLocal = CalcTexToLocal(In);
	float3x3 TexToCamera = mul(TexToLocal, (float3x3)LocalToCamera);

	// Output camera space position
	Out.vTexCoords[Index+0] = mul(float4(In.vPosition.xyz, 1), LocalToCamera);
			
	// Output TexToCamera matrix
	Out.vTexCoords[Index+1].xyz = TexToCamera[0];
	Out.vTexCoords[Index+2].xyz = TexToCamera[1];
	Out.vTexCoords[Index+3].xyz = TexToCamera[2];
}

//================================================================================
//	FEMU_OP_PixelMotionBlur0
//================================================================================
FEMU_OP_PixelMotionBlur0(handle_tex TexIndex, handle_const ConstIndex, handle_samp Depth, handle_samp FB, handle_samp InNvStereoTex)
{
	// Get current and prev clip space coords
	float4 LocScreen		= mul(float4(In.vPosition.xyz, 1), LocalToScreen);
	float4 PrevLocScreen	= mul(float4(In.vPosition.xyz, 1), PrevLocalToScreen);
		
	Out.vPosition = LocScreen;
		
	Out.vTexCoords[TexIndex+0] = LocScreen;
	Out.vTexCoords[TexIndex+1] = PrevLocScreen;
#if 1
	Out.vTexCoords[TexIndex+2] = Out.vPosition * float4(1,-1,0,1) + Out.vPosition.w;
	Out.vTexCoords[TexIndex+2].xy += OneOverViewportSize.xy * Out.vTexCoords[TexIndex+2].w;

// jmarshall - contrast adaptive sharpen
	Out.vTexCoords[TexIndex+3].xy = OneOverViewportSize.xy;	
// jmarshall end
#endif

}

//================================================================================
//	FEMU_OP_DeferredFSAA
//================================================================================
FEMU_OP_DeferredFSAA
{
	HandleFSAACoords(In, ARG(0), ARG(4), Out);
}

//================================================================================
//	FEMU_OP_ThermalPostPass2
//================================================================================
FEMU_OP_ThermalPostPass2
{
	HandleFSAACoords(In, ARG(0), ARG(4), Out);
}

//================================================================================
//	FEMU_OP_DeferredBasePass_Thermal
//================================================================================
FEMU_OP_DeferredBasePass_Thermal
{
	// Output camera space position
	Out.vTexCoords[ARG(0)+0] = mul(float4(In.vPosition.xyz, 1), LocalToCamera);

	// Output camera space normal
	Out.vTexCoords[ARG(0)+1].xyz = mul(In.vNormal.xyz, (float3x3)LocalToCamera);
}

//================================================================================
//	FEMU_OP_DistanceColor
//================================================================================
FEMU_OP_DistanceColor
{
	// Output camera space position
	Out.vTexCoords[ARG(0)+0] = mul(float4(In.vPosition.xyz, 1), LocalToCamera);
}

//================================================================================
//	FEMU_OP_AmbientOcclusion
//================================================================================
FEMU_OP_AmbientOcclusion(handle_samp InCameraPos, handle_samp InNormal, handle_tex TexCoords, handle_const VectStart, handle_samp InRandNormals, handle_int NumSamples,handle_samp PrevFrame)
{
	Out.vTexCoords[TexCoords] = Out.vPosition * float4(1,-1,0,1) + Out.vPosition.w;
	Out.vTexCoords[TexCoords].xy += OneOverViewportSize.xy * Out.vTexCoords[TexCoords].w;
	
	// Output camera space position
	Out.vTexCoords[TexCoords+1].xyz = mul(float4(In.vPosition.xyz, 1), LocalToCamera).xyz;
	Out.vTexCoords[TexCoords+1].w = Out.vPosition.w;
}

//================================================================================
//	FEMU_OP_AmbientOcclusion
//================================================================================
FEMU_OP_FinalizeAmbientOcclusion(handle_tex TexCoords, handle_const InConst, handle_samp InCameraPos, handle_samp CurrentFrameFrame, handle_samp PrevFrame)
{
	Out.vTexCoords[TexCoords] = Out.vPosition * float4(1,-1,0,1) + Out.vPosition.w;
	Out.vTexCoords[TexCoords].xy += OneOverViewportSize.xy * Out.vTexCoords[TexCoords].w;
	
	// Output camera space position
	Out.vTexCoords[TexCoords+1].xyz = mul(float4(In.vPosition.xyz, 1), LocalToCamera).xyz;
	Out.vTexCoords[TexCoords+1].w = Out.vPosition.w;
}

//================================================================================
//	FEMU_OP_Foliage
//================================================================================
FEMU_OP_Foliage(, handle_tex Scratch, const_h Const)
{
	// Get camera space position
	float3 CameraPos = mul(float4(FoliageLocal.xyz, 1), LocalToCamera).xyz;

	float3 Normal1 = mul(float3(0,0,1), (float3x3)LocalToCamera);
	float3 Normal2 = mul(In.vNormal.xyz, (float3x3)LocalToCamera);
	
	Out.vTexCoords[Scratch].xyz = lerp(Normal1, Normal2, g_MiscFoliage.z);
	
	Out.vTexCoords[Scratch].w = PACK_CAMERA_Z(CameraPos.z);
	
	Out.vTexCoords[Scratch+1].x = lerp(1, In.vTexCoords[7].z, g_MiscFoliage.w);
}

//================================================================================
//    FEMU_OP_FinalBloomPass
//================================================================================
FEMU_OP_FinalBloomPass(,,,)
{
}

//================================================================================
//	FEMU_OP_DeferredFog
//================================================================================
FEMU_OP_DeferredFog(, handle_const Const1, handle_const Const2, handle_tex TexCoords)
{
    /*
    float4 ScreenPos = (In.vTexCoords[0] - 0.5f) * 2.0f;
    
    float4 CameraPos = mul(float4(ScreenPos.x, ScreenPos.y, 0, 1.0f), ScreenToCamera);

	Out.vTexCoords[TexCoords] = CameraPos.xyzw;
	*/
}


//================================================================================
//	FEMU_OP_OverlayBumpDiffuse
//================================================================================
FEMU_OP_OverlayBumpDiffuse
(
    ,
    handle_tex  InScratchCoords,
    ,
    ,
	handle_samp	InOverlayDiffuse,
	handle_samp	InOverlayCube,
	const_h		InOverlayConst
)
{
    float3x3 TexToWorld = mul(CalcTexToLocal(In), (float3x3)LocalToWorld);
    float4   EyeVec     = mul(In.vPosition, LocalToWorld) - CameraPos;
	
    Out.vTexCoords[InScratchCoords+0] = float4(normalize(TexToWorld[0]), EyeVec.x);
    Out.vTexCoords[InScratchCoords+1] = float4(normalize(TexToWorld[1]), EyeVec.y);
    Out.vTexCoords[InScratchCoords+2] = float4(normalize(TexToWorld[2]), EyeVec.z);
}


//================================================================================
//	FEMU_OP_HighlightShader
//================================================================================
FEMU_OP_FakeDirectionalLight( ,, handle_tex InScratchCoords,,, )
{
	// Compute TexToCamera matrix.	
	float3x3 TexToLocal = CalcTexToLocal( In );
	float3x3 TexToCamera = mul( TexToLocal, (float3x3)LocalToCamera );

	// Output TexToCamera matrix.
	Out.vTexCoords[InScratchCoords+0].xyz = TexToCamera[0];
	Out.vTexCoords[InScratchCoords+1].xyz = TexToCamera[1];
	Out.vTexCoords[InScratchCoords+2].xyz = TexToCamera[2];

	// Store camera pos in w component
	float3 CameraPos = mul( float4( In.vPosition.xyz, 1 ), LocalToCamera ).xyz;
	Out.vTexCoords[InScratchCoords+0].w = CameraPos.x;
	Out.vTexCoords[InScratchCoords+1].w = CameraPos.y;
	Out.vTexCoords[InScratchCoords+2].w = CameraPos.z;
}


//================================================================================
//	FEMU_OP_ComputeNormalSpec
//================================================================================
FEMU_OP_ComputeNormalSpec
(
    ,
    handle_tex  InScratchCoords,
    handle_res  InNormal,
    handle_res  InSpecOnly,
	handle_samp	InOverlayDiffuse,
	handle_samp	InOverlayNormal,
	handle_samp	InOverlaySpecOnly,
	const_h		InOverlayConst1,
	const_h		InOverlayConst2
)
{
	float3x3 TexToLocal = CalcTexToLocal(In);

	float3x3 TexToCamera = mul(TexToLocal, (float3x3)LocalToCamera);

	// Output TexToCamera matrix
	Out.vTexCoords[InScratchCoords+0].xyz = TexToCamera[0];
	Out.vTexCoords[InScratchCoords+1].xyz = TexToCamera[1];
	Out.vTexCoords[InScratchCoords+2].xyz = TexToCamera[2];	
}


//================================================================================
//	FEMU_OP_RimLightEffect
//================================================================================
FEMU_OP_RimLightEffect(	handle_tex InScratchCoords,,,,,, )
{
	// Store camera pos in w component
	float3 CameraPos = mul( float4( In.vPosition.xyz, 1 ), LocalToCamera ).xyz;
	Out.vTexCoords[InScratchCoords+0].w = CameraPos.x;
	Out.vTexCoords[InScratchCoords+1].w = CameraPos.y;
	Out.vTexCoords[InScratchCoords+2].w = CameraPos.z;
}

//================================================================================
//	FEMU_OP_UberPostGather
//================================================================================
FEMU_OP_UberPostGather
( 
	handle_const SampleOffsets,
	,
)
{	
	Out.vTexCoords[0] = In.vTexCoords[0].xyyx + Consts[0];
	Out.vTexCoords[1] = In.vTexCoords[0].xyyx + Consts[1];
}
