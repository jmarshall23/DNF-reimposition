//================================================================================
//	Pixel Shader Ops
//	Copyright 2007 3D Realms, Inc. All Rights Reserved.
//	John Pollard
//================================================================================

//================================================================================
//	FEMU_OP_TexCoords
//================================================================================
FEMU_OP_TexCoords(handle_tex TexIndex, handle_samp InNvStereoTex)
{
	float4 Tex = In.Tex[TexIndex];
	
	if (TexCoordOps[TexIndex].TransformFlag == FEMU_TF_Count2_Persp) {
		Tex = float4(Tex.x / Tex.y, 1.0f, 1.0f, 1.0f);
	} else if (TexCoordOps[TexIndex].TransformFlag == FEMU_TF_Count3_Persp) {
		Tex = float4(Tex.x / Tex.z, Tex.y / Tex.z, 1.0f, 1.0f);
	} else if (TexCoordOps[TexIndex].TransformFlag == FEMU_TF_Count4_Persp) {
		Tex = float4(Tex.x / Tex.w, Tex.y / Tex.w, Tex.z / Tex.w, 1.0f);
	}
	return Tex;
}

//================================================================================
//	FEMU_OP_Diffuse
//================================================================================
FEMU_OP_Diffuse
{
	return GetDiffuse(In);
}

//================================================================================
//	FEMU_OP_Texture
//================================================================================
FEMU_OP_Texture(handle_samp SamplerIndex, result Tex)
{
	return  SampleTexture(SamplerIndex, Tex);
}

//================================================================================
//	FEMU_OP_TextureProj5
//	Sample from 5 directions using WorldPos, and blend between them using WorldNormal
//================================================================================
FEMU_OP_TextureProj5(handle_samp SamplerIndex, handle_tex TexIndex, result ShiftScale)
{
	float4	WorldPos	= float4(In.Tex[TexIndex+0]);
	float4	WorldNormal = float4(In.Tex[TexIndex+1]);
	
	float4 Scale = float4(ShiftScale.x, ShiftScale.y, 1.0f, 1.0f);
	float4 Shift = float4(ShiftScale.z, ShiftScale.w, 1.0f, 1.0f);
	
	float4 ColorX = SampleTexture(SamplerIndex, float4(WorldPos.yz, 0,0)*Scale + Shift);
	float4 ColorY = SampleTexture(SamplerIndex, float4(WorldPos.xz, 0,0)*Scale + Shift);
	float4 ColorZ = SampleTexture(SamplerIndex, float4(WorldPos.xy, 0,0)*Scale + Shift);
	
	float DotX = abs(WorldNormal.x);
	float DotY = abs(WorldNormal.y);
	float DotZ = abs(WorldNormal.z);

	float4 Color = ColorZ;
	
	DotX = saturate(DotX*1.5f);
	DotY = saturate(DotY*1.5f);
	
	Color = lerp(Color, ColorX, DotX);
	Color = lerp(Color, ColorY, DotY);

	return Color;
	//return  ColorX*DotX + ColorY*DotY + ColorZ*DotZ;
}

FEMU_OP_Add(result Arg1, result Arg2)
{
	return Arg1 + Arg2;
}

FEMU_OP_AddSmooth(result Arg1, result Arg2)
{
	return Arg1 + Arg2*(1-Arg1);
}

FEMU_OP_Subtract(result Arg1, result Arg2)
{
	return Arg1 - Arg2;
}

FEMU_OP_Dot3Biased(result Arg1, result Arg2)
{
	return dot(2.0*(Arg1-0.5), 2.0*(Arg2-0.5));
}

FEMU_OP_Dot3(result Arg1, result Arg2)
{
    return dot(Arg1.xyz, Arg2.xyz);
}

FEMU_OP_AddSigned2X(result Arg1, result Arg2)
{
	return 2.0*(Arg1+Arg2-0.5);
}

FEMU_OP_Min(result Arg1, result Arg2)
{
	return min(Arg1, Arg2);
}

FEMU_OP_Max(result Arg1, result Arg2)
{
	return max(Arg1, Arg2);
}

FEMU_OP_Exp(result Arg1, result Arg2)
{
	return pow(Arg1, Arg2);
}

FEMU_OP_Cross(result Arg1, result Arg2)
{
	return float4(cross(Arg1.rgb, Arg2.rgb), 0.0f);
}

FEMU_OP_AddPreMultDiffAlpha(result Arg1, result Arg2)
{
	float4 Diffuse = GetDiffuse(In);
	
	return Arg1*Diffuse.a+Arg2*Diffuse.a;
}

FEMU_OP_Mul(result Arg1, result Arg2)
{
	return Arg1 * Arg2;
}

FEMU_OP_Mul2X(result Arg1, result Arg2)
{
	return Arg1 * Arg2 * 2;
}

FEMU_OP_Mul4X(result Arg1, result Arg2)
{
	return Arg1 * Arg2 * 4;
}

FEMU_OP_Mask(result Arg1, handle_int MaskR, handle_int MaskG, handle_int MaskB, handle_int MaskA)
{
	float4 rgba = Arg1;
	
	if (MaskR == 2)
		rgba.r = Arg1.g;
	else if (MaskR == 3)
		rgba.r = Arg1.b;
	else if (MaskR == 4)
		rgba.r = Arg1.a;

	if (MaskG == 1)
		rgba.g = Arg1.r;
	else if (MaskG == 3)
		rgba.g = Arg1.b;
	else if (MaskG == 4)
		rgba.g = Arg1.a;
	
	if (MaskB == 1)
		rgba.b = Arg1.r;
	else if (MaskB == 2)
		rgba.b = Arg1.g;
	else if (MaskB == 4)
		rgba.b = Arg1.a;

	if (MaskA == 1)
		rgba.a = Arg1.r;
	else if (MaskA == 2)
		rgba.a = Arg1.g;
	else if (MaskA == 3)
		rgba.a = Arg1.b;

	return rgba;
}

FEMU_OP_AlphaNormalize(result Arg1, result Arg2)
{
	float Alpha = saturate(Arg1.a-Arg2.a);
	float MaxColor = GetDiffuse(In).a-Arg2.a;
	
	if (MaxColor > 0)
		Alpha /= MaxColor;
	
	return float4(Arg1.rgb, Alpha);
}

//================================================================================
//	FEMU_OP_Mul_Alpha
//================================================================================
FEMU_OP_Mul_Alpha(result Arg1, result Arg2, result Arg3)
{
	return float4(lerp(Arg1.rgb, Arg1.rgb*Arg2.rgb, Arg3.a), Arg3.a);
}

FEMU_OP_BlendDiffuseAlpha(result Arg1, result Arg2)
{
	float4 Diffuse = GetDiffuse(In);

	return Arg1*Diffuse.a + Arg2*(1-Diffuse.a);
}

//================================================================================
//	FEMU_OP_DeferredBasePass_HiJackOp
//================================================================================
FEMU_OP_DeferredBasePass_HiJackOp
(
	handle_res	InDiffuse, 
	handle_res	InNormal, 
	handle_res	InSpecOnly, 
	handle_tex	ScratchCoords, 
	const_h		InConst1, 
	handle_res	InEmissive,
	result      InBaseCoords,
	handle_samp	InOverlayDiffuse,
	handle_samp	InOverlayNormal,
	handle_samp	InOverlaySpecOnly,
	handle_samp	InOverlayCube,
	const_h		InOverlayConst1,
	const_h		InOverlayConst2,
	vary		Passes[5]
)
{
}

//================================================================================
//	FEMU_OP_DeferredBasePass
//================================================================================
FEMU_OP_DeferredBasePass
(
	handle_res	InDiffuse, 
	handle_res	InNormal, 
	handle_res	InSpecOnly, 
	handle_tex	ScratchCoords, 
	const_h		InConst1, 
	handle_res	InEmissive,
	result      InBaseCoords,
	handle_samp	InOverlayDiffuse,
	handle_samp	InOverlayNormal,
	handle_samp	InOverlaySpecOnly,
	handle_samp	InOverlayCube,
	const_h		InOverlayConst1,
	const_h		InOverlayConst2,
	vary		Passes[5]
)
{
	half	SpecExp			= InConst1.x;
	half	AmbientScale	= InConst1.y;
	half	BloomScale		= InConst1.z;
	half	SpecScale		= InConst1.w;
	
	float3x3 TexToCamera = XFormFromStages(In, ScratchCoords+0);
	
	half4 Normal;
	half4 OverlayDiffuse = float4(0,0,0,0);
	half4 OverlayNormal;
	
	if (InOverlayDiffuse != NULL_HANDLE && InOverlayNormal != NULL_HANDLE )
	{
		half3 spec_exp_bloom_scale = GetSpecExpAndBloomScale(InNormal, InSpecOnly, InBaseCoords, InOverlaySpecOnly, InOverlayDiffuse, InOverlayNormal, InOverlayConst1, 
															 InOverlayConst2, TexToCamera, SpecScale, Normal, OverlayDiffuse, OverlayNormal, SpecExp, BloomScale);
															  
		SpecExp = spec_exp_bloom_scale.x;
		BloomScale = spec_exp_bloom_scale.y;
		SpecScale = spec_exp_bloom_scale.z;
	}
	else
	{
	    Normal = SetupNormalSpec_XForm(In, InNormal, InSpecOnly, 1.0f, TexToCamera, false);
	}
	
	half4	Camera		= half4(In.Tex[ScratchCoords+2].w, SpecExp, 0.0f, 0.0f);
	half4	Emissive	= half4(0,0,0,BloomScale);
	
	// Write out emissive if we have it
	if (InEmissive != NULL_HANDLE)
		Emissive.rgb = Results[InEmissive].rgb;
	
	// Write out diffuse if we have it
	if (InDiffuse != NULL_HANDLE)
	{
		half4 Diffuse = half4(Results[InDiffuse].rgb, AmbientScale);
	
		// Draw up to 3 additional passes (for ULayerMaterial)
		for (int i=0; i<Passes; i++)
		{		
			int Index = i*5;
			
			// See if we need to blend multiple diffuse/normals
			half Alpha = Results[VARYARG(Index+3)].r;
			
			// For cylindrical mapping, we need to read two diffuse, and two normals/spec
			//	and then blend depending on percentage of each axis that the two readings face
			Diffuse.rgb = lerp(Diffuse.rgb, Results[VARYARG(Index+0)].rgb, Alpha);
	
			half4 Normal2 = SetupNormalSpec_XForm(In, VARYARG(Index+1), VARYARG(Index+2), 1, TexToCamera, false);
			
			Normal = lerp(Normal, Normal2, Alpha);
			Normal.xyz = normalize(Normal.xyz);
			
			half LayerSpecExp = Consts[VARYARG(Index+4)].x;
			half LayerSpecScale = Consts[VARYARG(Index+4)].y;
			
			// Lerp exp
			Camera.g = lerp(Camera.g, LayerSpecExp, Alpha);
			
			// Lerp spec scale
			SpecScale = lerp(SpecScale, LayerSpecScale, Alpha);

		}
		
		if (InOverlayDiffuse != NULL_HANDLE && InOverlayNormal != NULL_HANDLE )
	    {
		    float3x3 TangentToWorld = float3x3( In.Tex[ScratchCoords+3].xyz,
		                                        In.Tex[ScratchCoords+4].xyz,
		                                        In.Tex[ScratchCoords+5].xyz );
		    
		    half3 OverlayCube = float4(0,0,0,0);
		    
		    if( InOverlayCube != NULL_HANDLE )
		    {
		        half3  WorldV = half3(In.Tex[ScratchCoords+3].w, In.Tex[ScratchCoords+4].w, In.Tex[ScratchCoords+5].w);
            	
        	    half3  WorldN = mul(Normal, transpose(TexToCamera)); // Rotate normal by CameraToWorld
        	           WorldN = normalize(mul(WorldN, TangentToWorld));
        	           
                OverlayCube = texCUBE( Sampler[ InOverlayCube ], reflect(WorldV, WorldN) ).rgb;
            }
        	       
        	Diffuse = ComputeOverlayBumpColor( Diffuse, OverlayDiffuse, InOverlayCube, OverlayCube, InOverlayConst1.z );
		}

		// Pack normal
		Normal.xyz = Normal.xyz*0.5f+0.5f;
		Normal.a *= SpecScale;
		
		g_PSInfo.Color[1] = Camera;
		g_PSInfo.Color[2] = Normal;
		g_PSInfo.Color[3] = Emissive;
        
		return Diffuse;
	}
	
	// Pack normal
	Normal.xyz = Normal.xyz*0.5+0.5;
	
	Normal.a *= SpecScale;

	g_PSInfo.Color[0] = Normal;
	g_PSInfo.Color[1] = Camera;
	g_PSInfo.Color[2] = Emissive;
	
	return Normal;
}

//================================================================================
//	FEMU_OP_DeferredLight_HiJackOp
//================================================================================
FEMU_OP_DeferredLight_HiJackOp
(
	handle_tex		InCoords, 
	handle_samp		InPos, 
	handle_samp		InNormal, 
	handle_samp		InAtten, 
	handle_samp		InFilter, 
	handle_samp		InCubeSpec,
	handle_const	InConst, 
	handle_samp		InShadowCube, 
	handle_samp		InDirShadowMap, 
	handle_const	InConst1, 
	handle_samp		InDiffuse, 
	handle_int		InNumSamples, 
	handle_const	InConst2, 
	handle_int		bSpotLight,
	handle_int		ShadowFilterMode,
	handle_samp		InHackFilter,
	handle_const	InLightDir,
	handle_samp		InRotMap,
	handle_const	InSpecConst,
	handle_samp		InDummyHandle		// Dummy!
)
{
}

//================================================================================
//	FEMU_OP_DeferredLight
//================================================================================
FEMU_OP_DeferredLight
(
	handle_tex		InCoords, 
	handle_samp		InPos, 
	handle_samp		InNormal, 
	handle_samp		InAtten, 
	handle_samp		InFilter, 
	handle_samp		InCubeSpec,
	handle_const	InConst, 
	handle_samp		InShadowCube, 
	handle_samp		InDirShadowMap, 
	handle_const	InConst1, 
	handle_samp		InDiffuse, 
	handle_int		InNumSamples, 
	handle_const	InConst2, 
	handle_int		bSpotLight,
	handle_int		ShadowFilterMode,
	handle_samp		InHackFilter,
	handle_const	InLightDir,
	handle_samp		InRotMap,
	handle_const	InSpecConst, 
	handle_samp		InNvStereoTex		// For nVidia 3D Vision fixes
)
{
	int		Index			= InCoords;
	
	float4	CameraSpacePos;
	half4	CameraNormal;
	half3	Diffuse;
	half	SpecularPower;
	float2 ScreenSpace;
	float3	VertToLight;
	half3	VertToCamera;
	half3	Half;
	
	//MFM spotlight near plane hack
	float	spotLightNearPlane = Consts[InSpecConst].w;

	CameraNormal = DeferredLight_GetLightData(In.Tex[Index], In.Tex[Index+1], InCoords, InPos,  InNormal, InDiffuse, InNvStereoTex,
											  CameraSpacePos, Diffuse, SpecularPower, ScreenSpace, VertToLight, VertToCamera, Half);
	
	half	NDotL			= 0; half	Atten			= 1; 

	if (InLightDir != NULL_HANDLE)
	{
		NDotL = saturate(dot(CameraNormal.xyz, Consts[InLightDir].xyz)); Atten = Consts[InConst].w;
	}
	else
	{
		NDotL = DeferredLight_GetLightSpacePos(InConst, InAtten, CameraNormal, CameraSpacePos, VertToLight, Atten);	
	}
	
	half	NDotH = saturate(dot(CameraNormal.xyz, Half));
	
	// Get specular power
	NDotH = pow(NDotH, SpecularPower);
	half4	FinalColor		= Lights[0].Color.rgba * Atten;
	half3 CubeSpec = float3(1,1,1);
	
	if (InFilter != NULL_HANDLE)
	{
		if (bSpotLight != 0)		// Spot light mode
		{
			DeferredLight_GetSpotColor(InFilter, CameraSpacePos,spotLightNearPlane, FinalColor);
		}
		else
		{	// Point light mode
			FinalColor.rgba *= texCUBE(Sampler[InFilter], mul(half4(CameraSpacePos.xyz, 1), Lights[0].LocalToFilter).rgb).rgbr;
		}
	}
	
	if (InCubeSpec != NULL_HANDLE)
	{
		CubeSpec = GetCubeSpec(Half, CameraNormal, InCubeSpec, InSpecConst);
	}

	// Cubemap variance shadowmap
	if (InDirShadowMap == NULL_HANDLE)
	{
		if (InShadowCube != NULL_HANDLE)
		{
			float3 ShadowCamera = mul(float4(CameraSpacePos.xyz,1), CameraToShadowCubeMap);
			FinalColor.rgba *= HandleVarianceShadow(InShadowCube, ShadowCamera, Consts[InConst].y, Consts[InConst].z, Consts[InConst].x, false, true, Consts[InConst2].z);
		}
	}
	
	// 2d directional shadowmap
	if (InDirShadowMap != NULL_HANDLE)
	{
		DeferredLight_HandleDirShadowMap(InConst1, InConst2, InNumSamples, ShadowFilterMode, InDirShadowMap, InRotMap, InConst, ScreenSpace, CameraSpacePos, FinalColor);
	}
	
	if (InHackFilter != NULL_HANDLE)
		FinalColor.rgba *= tex2Dproj(Sampler[InHackFilter], In.Tex[Index]).r;
		
	return float4(Diffuse.rgb * FinalColor.rgb*NDotL, 0);
}

//================================================================================
//	FEMU_OP_GenShadowMapTestResults
//================================================================================
FEMU_OP_GenShadowMapTestResults
(
	handle_tex		InCoords, 
	handle_samp		InPos, 
	handle_const	InConst, 
	handle_samp		InDirShadowMap, 
	handle_const	InConst1, 
	handle_int		InNumSamples, 
	handle_const	InConst2, 
	handle_int		ShadowFilterMode
)
{
	int		Index			= InCoords;
	float4	CameraSpacePos	= tex2Dproj(Sampler[InPos], In.Tex[Index]);		// Sample camera space position

	// Unpack camera space position
	float2 ScreenSpace = In.Tex[Index+1].xy / In.Tex[Index+1].w;
	CameraSpacePos.z = UNPACK_CAMERA_Z(CameraSpacePos.r);
	CameraSpacePos.xy = ScreenSpace * CameraSpacePos.z;

	half FinalShadow = 1;
	
	// 2d directional shadowmap
	if (InDirShadowMap != NULL_HANDLE)
	{
		#define SHADOW_END1		(Consts[InConst2].x)
		#define SHADOW_END2		(Consts[InConst2].y)
		
		if (CameraSpacePos.z < SHADOW_END2)
		{
			float3	Splits		= Consts[InConst1].xyz;
			float3  ZResults	= (Splits < CameraSpacePos.z);
			int		MatrixIndex	= dot(ZResults, 1.0f);	
		
			// SHADOW_MAP
			float3 ShadowScreen = mul(half4(CameraSpacePos.xyz, 1), CameraToShadowMap[MatrixIndex]);

			//float2 ShadowProj = ShadowScreen.xy / ShadowScreen.w;
			float2 ShadowProj = ShadowScreen.xy;		// No need to divide, we know the matrix is ortho

			float ScaledDist = (ShadowScreen.z-NearFar[MatrixIndex].x) / NearFar[MatrixIndex].y;
		
			// FIXME: This needs rotation map now
			float Shadow = 0;//FilterShadow(Sampler[InDirShadowMap], Sampler[InRotMap], ScaledDist-Consts[InConst].x, ShadowProj, NearFar[0].zw, ScreenSpace, 1, ShadowFilterMode);
		
			float FadeAlpha = max(CameraSpacePos.z-SHADOW_END1,0) / (SHADOW_END2-SHADOW_END1);
			
			FadeAlpha += (1-Consts[InConst2].z);
			
			Shadow = lerp(Shadow, 1, saturate(FadeAlpha));

			FinalShadow *= Shadow;
		}
	}

	return (float4)FinalShadow;
}

//================================================================================
//	FEMU_OP_Parallax
//	Args:
//		TexCoords, CameraVector, HeightMap, Const
//================================================================================
FEMU_OP_Parallax(result TexCoords, handle_tex InCameraVector, result HeightMap, const ParallaxScale)
{
	float3	Camera	= normalize(In.Tex[InCameraVector].xyz);
	float	Height	= HeightMap.x;
		
	return TexCoords + float4(Camera*(Height*ParallaxScale.x-ParallaxScale.y), 0.0f);
}

//========================================================================================================
//	FEMU_OP_AlphaTest
//========================================================================================================
FEMU_OP_AlphaTest(result Arg1, const Arg2)
{
	clip(Arg1.a - Arg2.x);
	return Arg1;
}

//================================================================================
//	FEMU_OP_Lerp
//================================================================================
FEMU_OP_Lerp(handle_res Arg1, handle_res Arg2, handle_res InAlpha, handle_int Mode)
{
	float Alpha = 0.0f;
	
	if (Mode == 0)
		Alpha = Results[InAlpha].a;
	else if (Mode == 1)
		Alpha = Results[InAlpha].r;
	else if (Mode == 2)
		Alpha = Results[InAlpha].g;
	else if (Mode == 3)
		Alpha = Results[InAlpha].b;
	
	return lerp(Results[Arg1], Results[Arg2], Alpha);
}

//================================================================================
//	FEMU_OP_SetAlpha
//================================================================================
FEMU_OP_SetAlpha(handle_res Arg1, handle_res Arg2)
{
	Results[Arg1].a = Results[Arg2].a;
	return Results[Arg1];
}

//================================================================================
//	FEMU_OP_Const
//================================================================================
FEMU_OP_Const(handle_const ConstIndex)
{
	return Consts[ConstIndex];
}

//================================================================================
//	FEMU_OP_ReturnValue
//================================================================================
FEMU_OP_ReturnValue(result Arg1)
{
	return Arg1;
}

//================================================================================
//	FEMU_OP_FakeBumpMap
//	Args:
//		Bump, BumpTargetSampler, BumpTargetCoords, C_Const
//================================================================================
//FEMU_OP_FakeBumpMap(result InBump, handle_samp InTargetSampIndex, result InUV, handle_const InConstIndex, handle_res InBump2)
FEMU_OP_FakeBumpMap
(
	handle_res InBump,				// NormalMap 1
	handle_int InBumpMode,			// NoSpec flag 1
	handle_samp InTargetSampIndex,	// FrameBuffer sampler
	result InUV,					// FrameBuffer UV
	handle_const InConstIndex,		// CA_Shift consts
	handle_res InBump2,				// NormalMap 2
	handle_int InBumpMode2,			// NoSpec flag 2
	handle_res InEdgeFadeResult,	// EdgeFadeDist result
	handle_res InAlphaMapResult		// AlphaMap result
)
{
    float3 N1 = SetupNormalSpec(InBump, (InBumpMode == 1) ? InBump : NULL_HANDLE).xyz;
    
	if (InBump2 != NULL_HANDLE)
	{
	    float3 N2 = SetupNormalSpec(InBump2, (InBumpMode2 == 1) ? InBump2 : NULL_HANDLE).xyz;
		       N1 = AddNormals(N1, N2);
    }
	
#if bHasVertexColor
	float Alpha = In.Diffuse.a;
#else
	float Alpha = 1;
#endif

	// Handle edge fade distance.
	if (InEdgeFadeResult != NULL_HANDLE)
		Alpha *= Results[InEdgeFadeResult].a;
	
	// Read AlphaMap if available.
	if (InAlphaMapResult != NULL_HANDLE )
		Alpha *= Results[InAlphaMapResult].a;	
	
	// RAF: Fade out perturb based on alpha.
	float2 UVDelta = N1.rg * 0.15f * Alpha;
	if (InConstIndex != NULL_HANDLE)
	{
		float4 CA_Args = Consts[InConstIndex];
	
		// RAF: Also fade out CA_Filter with alpha.
		UVDelta.x += CA_Args.x * Alpha;
		UVDelta.y += CA_Args.y * Alpha;
	
		float r = SampleTexture(InTargetSampIndex, float4(InUV.x+UVDelta.x*CA_Args.z, InUV.y+UVDelta.y, 0, 0)).r;
		float g = SampleTexture(InTargetSampIndex, float4(InUV.x+UVDelta.x, InUV.y+UVDelta.y*CA_Args.w, 0, 0)).g;
		float b = SampleTexture(InTargetSampIndex, float4(InUV.x+UVDelta.x, InUV.y+UVDelta.y, 0, 0)).b;
		float a = SampleTexture(InTargetSampIndex, float4(InUV.x+UVDelta.x, InUV.y+UVDelta.y, 0, 0)).a;
	
		return float4(r,g,b,a);
	}
	
	return SampleTexture(InTargetSampIndex, float4(InUV.xy+UVDelta, 0, 0));
}

//================================================================================
//	FEMU_OP_BumpCubeEnvMap
//================================================================================
FEMU_OP_BumpCubeEnvMap(handle_res InNormal, handle_int bNoSpecInterface, handle_samp InBumpTarget, handle_tex InTexIndex)
{
	int			Index = InTexIndex;
	
	float3		N = SetupNormalSpec(InNormal, (bNoSpecInterface == 1) ? InNormal : NULL_HANDLE).xyz;
	float3		E = float3(In.Tex[Index].w, In.Tex[Index+1].w, In.Tex[Index+2].w);
	float3x3	M = float3x3(In.Tex[Index].xyz,In.Tex[Index+1].xyz, In.Tex[Index+2].xyz);
					
	return texCUBE(Sampler[InBumpTarget], reflect(E, mul(N, M)));
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
	vary			NumLights[2]	
)
{
#define NEW_WATER_ALPHA
	// Needs:
	// Once
	// TexToWorld transform		(3 uv's)
	// World water normal		(texture)
	// Camera position			(1 uv, share TexToWorld)
	
	// Per light
	// WorldToAtten transform	(const register)
	// WorldToFilter transform	(const register)
	// World light position		(const register)
	
	// Get water normal 1
	float3 Normal = SetupNormalSpec(InBumpTex1, (InBumpMode1 == 1) ? InBumpTex1 : NULL_HANDLE).xyz;
	
	float3 CameraSpacePos;
		
	CameraSpacePos.x = In.Tex[InScratchTex+0].w;
	CameraSpacePos.y = In.Tex[InScratchTex+1].w;
	CameraSpacePos.z = In.Tex[InScratchTex+2].w;
	
	// Merge in normal 2 if we have it
	if (InBumpTex2 != NULL_HANDLE)
	{
		// If a second normalmap was supplied, average them
		float3 Normal2 = SetupNormalSpec(InBumpTex2, (InBumpMode2 == 1) ? InBumpTex2 : NULL_HANDLE).xyz;
		
		Normal = AddNormals(Normal, Normal2);
	}
	
	float3x3 TexToCamera = XFormFromStages(In, InScratchTex);
		
	// If we have a camera normalmap buffer, use that to affect final camera normal
	if (InCamNormalSampler != NULL_HANDLE)
	{
		float3 FBCameraNormal = tex2D(Sampler[InCamNormalSampler], Results[InRefractCoords]).xyz;
		
		FBCameraNormal = FBCameraNormal*2-1;
		
		float3 FBLocalNormal = normalize(mul(FBCameraNormal.xyz, transpose(TexToCamera)));
		
		FBLocalNormal = lerp(float3(0,0,1), FBLocalNormal, Consts[InConstIndex+3].y);
		//FBLocalNormal = lerp(float3(0,0,1), FBLocalNormal, 0.7);
		
		Normal = AddNormals(FBLocalNormal, Normal);
	}

	// Put normal in cameraspace
	float3	CameraNormal = normalize(mul(Normal.xyz, TexToCamera));

	// Calc x/y offset from center
	float3	VecU = TexToCamera[0];
	float3	VecV = TexToCamera[1];
		
	float	XOfs = dot(CameraNormal, VecU);
	float	YOfs = dot(CameraNormal, VecV);

	// Get some consts
	float4	WaterColor = float4(Consts[InConstIndex].xyz, Consts[InConstIndex].w);
	float3  FresnelParams = Consts[InConstIndex+1].xyz;
	float4	Refl			= float4(0,0,0, Consts[InConstIndex+2].x);
	float4	Refr			= float4(WaterColor.xyz, Consts[InConstIndex+2].y);
	
	float	Dot				= 1.0f - dot(-normalize(CameraSpacePos), CameraNormal);
	float	MiddleGray		= Consts[InConstIndex+3].x;
	
	float	SpecularExp			= Consts[InConstIndex+2].z;
	float	SpecScale			= Consts[InConstIndex+2].w;
	
	float3	EmissiveTint		= Consts[InConstIndex+4].xyz;
	float	BloomScale			= Consts[InConstIndex+4].w;
	
	float FinalAlpha = 1;
		
	// If we have a camera distance buffer, use that to soften water edge
	if (InCameraSampler != NULL_HANDLE && Consts[InConstIndex+1].w > 0.0f)
	{
		// Soften water edge
		float3 Dist;
        // gbx:barnason - Consts[InConstIndex+3].zw contains 0.5 / viewportsize to correct a half pixel offset in the texture coord
		Dist.x = UNPACK_CAMERA_Z(tex2D(Sampler[InCameraSampler], Results[InRefractCoords].xy + Consts[InConstIndex+3].zw));
		Dist.y	= CameraSpacePos.z;
		Dist.z = max(Dist.x-Dist.y, 0);
		
		FinalAlpha = lerp(1.0, 0, 1-saturate(Dist.z/Consts[InConstIndex+1].w));
		//FinalAlpha = max(0.2,FinalAlpha);
	}

	// Modulate surface alpha texture
	if (InSurfaceAlpha != NULL_HANDLE)
		FinalAlpha *= Results[InSurfaceAlpha].a;

	// Either sample from a cube by reflecting, or sample from a texture and perturb
	if (InBumpTargetSamp != NULL_HANDLE)
	{
		int Type = Samplers[InBumpTargetSamp].TexType;

		if (Type == FEMU_TT_CUBE)
		{
			float3 Reflected = reflect(normalize(CameraSpacePos), CameraNormal);
			
			if (CameraToWorldIndex != NULL_HANDLE)
				Reflected = mul(Reflected, (float3x3)UserMatrices[CameraToWorldIndex]);
			
			Refl.rgb = texCUBE(Sampler[InBumpTargetSamp], Reflected).xyz;
		}
		else
		{
			float2	uv = Results[InTargetCoords] + float2(XOfs, YOfs)*Refl.w;
			
			Refl.rgb = SampleTexture(InBumpTargetSamp, float4(uv.x, uv.y, 0, 0)).xyz;
		}
	}

	if (InRefractSamp != NULL_HANDLE)
	{
	#ifdef NEW_WATER_ALPHA
		Refr.w *= FinalAlpha;
	#endif
		
		// If we have a refraction texture, use that instead of defaulted water color
		Refr.rgb = SampleTexture(InRefractSamp, Results[InRefractCoords] - float4(float2(XOfs, YOfs)*Refr.w, 0, 0)).rgb;
	}

	float	SurfaceAlpha	= 0;
	float3	SurfaceColor	= 0;
	float3	Specular		= 0;
	float3	Diffuse			= 0;
	
	// Surface texture
	if (InSurfaceTex != NULL_HANDLE)
	{
		// Override surface alpha
		SurfaceAlpha = Results[InSurfaceTex].a;
		
		SurfaceColor.rgb = Results[InSurfaceTex].rgb;
		
		float4 SurfaceNormal = SetupNormalSpec(InSurfaceNorm, InSurfaceSpec);
		
		// Lerp specular scale towards water specular
		SpecScale = lerp(SpecScale, SurfaceNormal.a, SurfaceAlpha);
		
		// Blend surface normal with water normal
		SurfaceNormal.xyz = AddNormals(Normal, SurfaceNormal.xyz);

		// Bring normal into camera space
		SurfaceNormal.xyz = normalize(mul(SurfaceNormal.xyz, TexToCamera));
		
		// Lerp final camera normal towards surface camera normal
		CameraNormal = lerp(CameraNormal, SurfaceNormal.xyz, SurfaceAlpha);
	}
	
	if (AmbientColor1 != NULL_HANDLE)
	{
		// Need to do lighting
		const half3 VertToCamera = normalize(-CameraSpacePos.xyz);
		
		// Add ambient
		const half Alpha = dot(Consts[AmbientVector].xyz, CameraNormal)*0.5 + 0.5f;
		
		Diffuse += SurfaceColor.rgb * lerp(Consts[AmbientColor1].xyz, Consts[AmbientColor2].xyz, Alpha);
		
#ifdef _XBOX	
		const int num_lights_to_use = min(NumLights, 1);
#else
		const int num_lights_to_use = NumLights;
#endif

		for (int i=0; i<num_lights_to_use; ++i)
		{
			const int		Index			= i*2;
			const int		bDirLight		= VARYARG(Index);
			const int		arg_1 = VARYARG(Index+1);
			
			// [call]
			LightWater(i, bDirLight, arg_1, CameraSpacePos, CameraNormal, VertToCamera, SpecularExp, SpecScale, Diffuse, Specular);	
		}
		
	#if 1
		if (InLumMap != NULL_HANDLE)
		{
			float Scale = MiddleGray / max(tex2D(Sampler[InLumMap], float2(0,0)).r,0.00001f);
			
			Diffuse = saturate(Scale*Diffuse);
			Specular = saturate(Scale*Specular);
		}
	#endif

		// Modulate water color by diffuse lighting
		WaterColor.xyz	= saturate(Diffuse*WaterColor.xyz);
		
		// Modulate surfacecolor by diffuse lighting
		SurfaceColor	= saturate(Diffuse*SurfaceColor);
		
		// If this is a cubemap, which means it is artifically lit up, we assume we want to darken it by lighting
		//	 as opposed to letting a true reflection shine through
		if (InBumpTargetSamp != NULL_HANDLE)
		{
			int Type = Samplers[InBumpTargetSamp].TexType;

			if (Type == FEMU_TT_CUBE)
				Refl.rgb *= Diffuse;
		}
		
		// Write specular into bloom buffer.
		g_PSInfo.Color[1].rgb = Specular;
	}
	
	// Add emissive bloom tint.
	g_PSInfo.Color[1].rgb += EmissiveTint * SurfaceColor;	

	float3 OriginalRefr = Refr.rgb;
	
	// Blend between refraction and watercolor
	Refr.rgb = lerp(Refr.rgb, WaterColor.xyz, WaterColor.w);
	
	float FresnelAlpha = lerp(FresnelParams.x, FresnelParams.y, Dot);
	float Fresnel = saturate(pow(FresnelAlpha, FresnelParams.z));

	// Blend between Refraction color and Reflection color using fresnel term
	float4 OutColor = float4(lerp(Refr.rgb, Refl.rgb, Fresnel).xyz, 1);
	
	// If we had a surface texture, blend towards that using surface alpha
	if (InSurfaceTex != NULL_HANDLE)
		OutColor.rgb = lerp(OutColor.rgb, SurfaceColor, SurfaceAlpha);

	// Finally, add in specular
	if (AmbientColor1 != NULL_HANDLE)
		OutColor.rgb += Specular;

#ifdef NEW_WATER_ALPHA
	OutColor.rgb = lerp(OriginalRefr, OutColor.rgb, FinalAlpha);

	if (FinalAlpha < 0.2f)
		OutColor.a = FinalAlpha/0.2f;		// Have the last 20% use real alpha to fade out.
	else
		OutColor.a = 1.0f;
#else
	OutColor.a = FinalAlpha;
#endif

	g_PSInfo.Color[1].a = BloomScale * OutColor.a;

	return OutColor;
}

//================================================================================
//    FEMU_OP_SoftEdge
//================================================================================
FEMU_OP_SoftEdge(result OriginalColor, handle_samp CameraSampler, handle_res InCoords, const Const1, handle_tex InScratchTex, handle_int Mode)
{
    // Soften edge
    float Dist1 = UNPACK_CAMERA_Z(tex2D(Sampler[CameraSampler], Results[InCoords].xy).r);
    float Dist2 = In.Tex[InScratchTex].x;

    OriginalColor.a = lerp(OriginalColor.a, 0, 1-saturate(abs(Dist1-Dist2)/Const1.x));
    
    if (Mode == 1)
		OriginalColor.rgb *= OriginalColor.a;

    return OriginalColor;
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
	float3	Color		= Lights[InLightIndex].Color;
	float	DistAtten	= tex3D(Sampler[InAtten], In.Tex[InStartCoords+0]).b;
	float3	Light		= normalize(In.Tex[InStartCoords+1]);
	float4	Normal		= SetupNormalSpec(InNormal, InSpecOnly);
	
	float	NDotL		= saturate(dot(Light, Normal.xyz));

	if (InDiffuse == NULL_HANDLE)
	{
		// If we don't have diffuse, then we need to write specular out to alpha channel, and composite it back in a later pass
		
		// Self shadow and pre multiply color
		Color *= DistAtten * saturate(Light.b*8);
	
		// Madulate diffuse color with lighting term
		float4 Result = float4(Color*NDotL, 0);
	
		// Add specular if needed
		if (InNormal != NULL_HANDLE)
		{
			float3	Half	= normalize(float3(In.Tex[InStartCoords+0].w, In.Tex[InStartCoords+1].w, In.Tex[InStartCoords+2].w));
			float	NDotH	= saturate(dot(Half, Normal.rgb));
		
			NDotH = pow(NDotH, Consts[SpecConstIndex].x) * Consts[SpecConstIndex].y;
		
			Result.a += NDotH * Normal.a;
		}
		
		// Filter through cubemap if needed
		if (InFilter != NULL_HANDLE)
		{
			if (bSpotLight != 0)		// Spotlight mode, uses a 2d projective texture
			{
				float4 Tex = float4(In.Tex[InStartCoords+2].xy, 0, In.Tex[InStartCoords+2].z);
				Result.rgb *= tex2Dproj(Sampler[InFilter], Tex).rgbr;
			}
			else
				Result.rgba *= texCUBE(Sampler[InFilter], In.Tex[InStartCoords+2].xyz).rgbr;
		}
		
		return Result;
	}

	float4 Result = Results[InDiffuse];
	
	// Self shadow and pre multiply color
	Color *= DistAtten * saturate(Light.b*8) * 2;

	// Modulate diffuse color with lighting term
	Result.rgb *= Color*NDotL;
	
	// Add specular if needed
	if (InNormal != NULL_HANDLE)
	{
		float3	Half	= normalize(float3(In.Tex[InStartCoords+0].w, In.Tex[InStartCoords+1].w, In.Tex[InStartCoords+2].w));
		float	NDotH	= saturate(dot(Half, Normal.rgb));
		
		NDotH = pow(NDotH, Consts[SpecConstIndex].x) * Consts[SpecConstIndex].y;
		
		Result.rgb += Color * NDotH * Normal.a;
	}
	
	// Filter through cubemap if needed
	if (InFilter != NULL_HANDLE)
	{
		if (bSpotLight != 0)		// Spotlight mode, uses a 2d projective texture
		{
			float4 Tex = float4(In.Tex[InStartCoords+2].xy, 0, In.Tex[InStartCoords+2].z);
			Result.rgb *= tex2Dproj(Sampler[InFilter], Tex).rgb;
		}
		else
			Result.rgb *= texCUBE(Sampler[InFilter], In.Tex[InStartCoords+2].xyz).rgb;
	}

	return Result;
}

//================================================================================
//	FEMU_OP_Bloom
//================================================================================
FEMU_OP_Bloom(handle_res Arg1, handle_res Arg2)
{
#if 1
	float4 Result = float4(0,0,0,0);
	
	g_PSInfo.Color[1] = float4(0,0,0,0);
	
	if (Arg1 == NULL_HANDLE)
	{
		g_PSInfo.Color[1] = float4(0,0,0,0);
	}
	else
	{
		g_PSInfo.Color[1] = Results[Arg1] * Results[Arg2];
		Result = Results[Arg1];
	}
	
	return Result;
#else
	if (Arg1 != NULL_HANDLE)
	{
		g_PSInfo.Color[1] = Results[Arg1] * Results[Arg2];
		return Results[Arg1];
	}
	
	g_PSInfo.Color[1] = float4(0,0,0,0);
	return g_PSInfo.Color[1];
#endif
}

//================================================================================
//	FEMU_OP_BloomXBox
//================================================================================
FEMU_OP_BloomXBox(handle_res Arg1, handle_res Arg2)
{
#if 1
	float4 Result = float4(0,0,0,0);
	
	g_PSInfo.Color[0] = float4(0,0,0,0);
	
	if (Arg1 == NULL_HANDLE)
	{
		g_PSInfo.Color[0] = float4(0,0,0,0);
	}
	else
	{
		g_PSInfo.Color[0] = Results[Arg1] * Results[Arg2];
		Result = Results[Arg1];
	}
	
	return Result;
#else
	if (Arg1 != NULL_HANDLE)
	{
		g_PSInfo.Color[0] = Results[Arg1] * Results[Arg2];
		return Results[Arg1];
	}
	
	g_PSInfo.Color[0] = float4(0,0,0,0);
	return g_PSInfo.Color[0];
#endif
}

//================================================================================
//	FEMU_OP_ForwardBasePass
//	Args:
//		Diffuse, Normal, SpecOnly, Emissive, Const1, Const2, LightVector
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
	float4	Diffuse		= float4(1,1,1,0);
	float4	Normal		= SetupNormalSpec(InNormal, InSpecOnly);
	float3	Color1		= Consts[Const1];
	float3	Color2		= Consts[Const2];
	float3	LightVector	= In.Tex[InLightTexIndex].xyz;
	float	Alpha		= (dot(LightVector, Normal) + 1.0f) * 0.5f;

	if (InDiffuse != NULL_HANDLE)
		Diffuse = Results[InDiffuse];

	// Modulate texcolor with ambient light
	Diffuse.rgb *= lerp(Color1, Color2, Alpha);

	if (InEmissive != NULL_HANDLE)
		Diffuse.rgb += Results[InEmissive].rgb;
	
	return Diffuse;
}

//================================================================================
//	FEMU_OP_DeferredBasePass_ThermalBS
//	Args:
//		Normal, SpecOnly, Coords
//================================================================================
FEMU_OP_DeferredBasePass_ThermalBS
{
	float3x3 TexToCamera = XFormFromStages(In, ARG(2)+1);

	g_PSInfo.Color[0] = float4(0.0f,0,0,0);		// Currently not using!!!
	g_PSInfo.Color[1] = float4(In.Tex[ARG(2)].z, HeatIntensity.a, 0.0f, 0.0f);
	g_PSInfo.Color[2] = SetupNormalSpec_XForm(In, ARG(0), ARG(1), 1, TexToCamera, true);

	return g_PSInfo.Color[0];
}

//================================================================================
//	FEMU_OP_ForwardDistanceFog
//	Distance fog for forward style rendering
//================================================================================
FEMU_OP_ForwardDistanceFog(handle_samp FogSamplerIndex, handle_tex UVIndex, const FogParms, const FogColor, handle_int AlphaMode, handle_res AlphaResult)
{
	//float4 Result = float4(FogColor.rgb, SampleTexture(FogSamplerIndex, In.Tex[UVIndex]).a * FogParms.z);
	
	float	FogAlpha = In.Tex[UVIndex].x;
	
	FogAlpha = lerp(0,FogParms.z, FogAlpha);

	float4 Result = float4(FogColor.xyz,FogAlpha);
	//return Result;
	
	if (AlphaResult != NULL_HANDLE)
	{
		float4 AlphaColor = Results[AlphaResult];
		
		if (AlphaMode == 0)
		{
			// Normal alpha
			float Alpha = AlphaColor.a;
			
			Result.a *= Alpha;
		}
		else if (AlphaMode == 1)
		{
			// Modulated texture.  RGB 128 = 0 alpha (neutral color)			
			float Alpha = (AlphaColor.r + AlphaColor.g + AlphaColor.b) / 3;
		
			//if (abs(Alpha-0.5) < 0.1f)
			//	Result.a = 0;
		
			Result.a *= saturate(abs(Alpha-0.5) / 0.2f);
		}
		else if (AlphaMode == 2) // FB_Brighten
		{
		    float SrcAlpha = AlphaColor.a;
			float Alpha = (AlphaColor.r + AlphaColor.g + AlphaColor.b) / 3;
			
			Result.a *= Alpha * SrcAlpha;
		}
		else if (AlphaMode == 3) // FB_Translucent
		{
		    Result.a *= (AlphaColor.r + AlphaColor.g + AlphaColor.b) / 3;
		}
	}
	
	return Result;
}

//================================================================================
//	FEMU_OP_FogVolumePass0
//	Args:
//		PosBuffer, TexIndex, Const
//================================================================================
FEMU_OP_FogVolumePass0
{
	half	CameraZDist	= UNPACK_CAMERA_Z(tex2Dproj(Sampler[ARG(0)], In.Tex[ARG(1)]).r);		// Sample worldspace position
	half	FogNear		= Consts[ARG(2)].x;
	half	FogScale	= Consts[ARG(2)].y;

	return float4(0,0,0,(CameraZDist - FogNear) * FogScale);
}

//================================================================================
//	FEMU_OP_FogVolumePass1
//================================================================================
FEMU_OP_FogVolumePass1(handle_samp FogSamplerIndex, handle_tex UVIndex, const FogParms)
{
	return SampleTexture(FogSamplerIndex, In.Tex[UVIndex]);
}

//================================================================================
//	FEMU_OP_HeightFog_Forward
//================================================================================
FEMU_OP_HeightFog_Forward(handle_samp FogSampler, handle_tex TexIndex, handle_Const ConstIndex1, handle_const ConstIndex2, handle_int AlphaMode, handle_res AlphaResult)
{
	float4 Result = SampleTexture(FogSampler, In.Tex[TexIndex]);
	
	if (AlphaResult != NULL_HANDLE)
	{
		float4 AlphaColor = Results[AlphaResult];
		
		if (AlphaMode == 0)
		{
			// Normal alpha
			float Alpha = AlphaColor.a;
			
			Result.a *= Alpha;
		}
		else if (AlphaMode == 1)
		{
			// Modulated texture.  RGB 128 = 0 alpha (neutral color)
			
			float Alpha = (AlphaColor.r + AlphaColor.g + AlphaColor.b) / 3;
		
			//if (abs(Alpha-0.5) < 0.1f)
			//	Result.a = 0;
		
			Result.a *= saturate(abs(Alpha-0.5) / 0.2f);
		}
	}
	
	return Result;
}

//================================================================================
//	FEMU_OP_HeightFog_ForwardNew
//================================================================================
FEMU_OP_HeightFog_ForwardNew(handle_const FogPlaneConstIndex, handle_const DistConstIndex, handle_tex TexCoords, handle_const ParamsIndex)
{
	half3	CameraSpacePos	= In.Tex[TexCoords].xyz;
	half4	FogPlane		= Consts[FogPlaneConstIndex];
	half4	Params			= Consts[ParamsIndex];
	/*
	half4	FogPlane2		= Consts[FogPlaneConstIndex2];
	
	float DotStart = dot(float4(0,0,0,1), FogPlane2);
	float DotEnd = dot(float4(CameraSpacePos.xyz,1), FogPlane2);
	
	if (DotEnd < 0.0f)
	{
		float Alpha = DotStart / (DotEnd-DotStart);
		CameraSpacePos = float3(0,0,0) + (CameraSpacePos - float3(0,0,0)) * Alpha;
	}
	*/

	float Result = saturate(CameraSpacePos.z * Consts[DistConstIndex].x);
		
	float CameraDepthPercent = saturate(dot(float4(0,0,0,1), FogPlane));
	float GeometryDepthPercent = saturate(dot(float4(CameraSpacePos.xyz,1), FogPlane));
	
	float FinalPercent = lerp(GeometryDepthPercent, 1.0f, CameraDepthPercent);

	Result *= FinalPercent;
	
	Result *= Params.x;

	//float Fog = saturate(1-exp(-saturate(Result)));
	float Fog = (1-exp(-(Result)));
	
	Fog = lerp(0,Fog, Params.y);
	
	return float4(Consts[DistConstIndex].yzw,Fog);
}

//================================================================================
//	FEMU_OP_HeightFog_Deferred
//	Args:
//		PosBuffer, TexIndex, Const1, Const2
//================================================================================
FEMU_OP_HeightFog_Deferred(handle_samp Depth, handle_tex TexIndex, handle_const Const1, handle_const Const2, handle_const Const3, handle_samp InNvStereoTex)
{
	// If running with stereo, need to stereoize the position or we'll come up with the wrong location to read from
	float4 Tex = NvFixTexCoord(In.Tex[TexIndex], InNvStereoTex);

	half	CameraZDist		= UNPACK_CAMERA_Z(tex2Dproj(Sampler[Depth], Tex).r);		// Sample worldspace position
	half3	CameraSpacePos	= float3((In.Tex[TexIndex+1].xy / In.Tex[TexIndex+1].w) * CameraZDist, CameraZDist);
	half4	FogPlane		= Consts[Const1];
	half	FogScale		= Consts[Const2].x;
	half	DensityScale	= Consts[Const3].x;
	half	Opacity			= Consts[Const3].y;
	
	float Result = saturate(CameraSpacePos.z * FogScale);
		
	float CameraDepthPercent = saturate(dot(float4(0,0,0,1), FogPlane));
	float GeometryDepthPercent = saturate(dot(float4(CameraSpacePos.xyz,1), FogPlane));
	
	float FinalPercent = lerp(GeometryDepthPercent, 1.0f, CameraDepthPercent);

	Result *= FinalPercent;
	
	Result *= DensityScale;
	
	//float Fog = saturate(1-exp(-saturate(Result)));
	float Fog = (1-exp(-(Result)));

	Fog = lerp(0,Fog, Opacity);
		
	return float4(Consts[Const2].yzw,Fog);
}

//================================================================================
//	FEMU_OP_GenerateFocalPlane
//================================================================================
FEMU_OP_GenerateFocalPlane(handle_samp DepthSampler, handle_samp LastFocalPlaneSampler, handle_const TimeDelta, handle_const MiscParms)
{
    float LastFocalDepth	= tex2D( Sampler[ LastFocalPlaneSampler ], float2(0.5f, 0.5f )).r;		
    float LastFocalMin		= tex2D( Sampler[ LastFocalPlaneSampler ], float2(0.5f, 0.5f )).g;		
    float LastFocalMax		= tex2D( Sampler[ LastFocalPlaneSampler ], float2(0.5f, 0.5f )).b;		
    float LastHitPawn		= tex2D( Sampler[ LastFocalPlaneSampler ], float2(0.5f, 0.5f )).a;
    
    float OverrideDepth = Consts[TimeDelta].y;
    float OverrideMin = Consts[TimeDelta].z;
    float OverrideMax = Consts[TimeDelta].w;
    
    float WantedPackedDepth = tex2D( Sampler[ DepthSampler ], float2(0.5f, 0.5f )).r;
    
    // If we have a max auto focus distance, clamp to that now.
    if (Consts[MiscParms].y > 0)
		WantedPackedDepth = min( PACK_CAMERA_Z(Consts[MiscParms].y), WantedPackedDepth );
	
	// Ported directly from unreal script
	float MinRange		= 25.0f;
	float MaxRange		= 163840.0f;
	float MinDistance	= 0.0;
	float MaxDistance	= 327680.0f;
	float Distance		= UNPACK_CAMERA_Z(WantedPackedDepth);
	float FocalRange	= MinRange + 2.0f * (min(1.0f, (max(Distance,MinDistance) - MinDistance) / (MaxDistance - MinDistance)) * (MaxRange-MinRange));	

    float WantedFocalMin	= FocalRange;
    float WantedFocalMax	= FocalRange;
    
	// Allow overrides
	if (OverrideDepth >= 0)
		WantedPackedDepth = PACK_CAMERA_Z(OverrideDepth);

	if (OverrideMin >= 0)
		WantedFocalMin = OverrideMin;    

	if (OverrideMax >= 0)
		WantedFocalMax = OverrideMax;    
	
	float WantedHitPawn = Consts[MiscParms].x;
    
    float LerpAlpha		= saturate(12.5f*Consts[TimeDelta].x);

	// gbx:barnason BUCKEYE-18091, BUCKEYE-20532: Fixed DOF flickering when focusing on/off a pawn.
	// turns out that the pawn parameter doesn't really do much at all with the speed that we lerp
    LerpAlpha = saturate(LerpAlpha + WantedHitPawn);
    /*
    float PawnLerpAlpha	= saturate(0.5f*Consts[TimeDelta].x);
    
    // This logic is basically just trying to lock on to the last focus point when it was a pawn
    if (WantedHitPawn < 0.5f)
		LerpAlpha = lerp(0, LerpAlpha, saturate((1-LastHitPawn)-0.2f)*(1.0f/0.8f));
    else
		PawnLerpAlpha = saturate(10.0f*Consts[TimeDelta].x);
    
    float OutHitPawn	= lerp(LastHitPawn, WantedHitPawn, PawnLerpAlpha);
    */		    

    float OutFocalDepth = lerp(LastFocalDepth, WantedPackedDepth, LerpAlpha);
    float OutFocalMin	= lerp(LastFocalMin, WantedFocalMin, saturate(LerpAlpha*2));
    float OutFocalMax	= lerp(LastFocalMax, WantedFocalMax, saturate(LerpAlpha*2));
    float OutHitPawn    = 0;
            
    return float4(OutFocalDepth, 1.0f / OutFocalMin, 1.0f /OutFocalMax, OutHitPawn);
}

//================================================================================
//	FEMU_OP_AvgDepthBuffer0
//================================================================================
FEMU_OP_AvgDepthBuffer0( result BaseCoords, handle_samp DepthBuffer, const Offset )
{
	return tex2D( Sampler[DepthBuffer], BaseCoords + Offset ).rrrr;
}

//================================================================================
//	FEMU_OP_AvgDepthBuffer1
//================================================================================
FEMU_OP_AvgDepthBuffer1( result BaseCoords, handle_samp DepthBuffer, const Parms, handle_int Size, handle_int Vertical )
{
	float CenterDepthPacked = tex2D( Sampler[DepthBuffer], BaseCoords );
	float MinDepthPacked = CenterDepthPacked;
	
	half SizeH = (half)Size;
	int  NumSamples = 2 * Size + 1;
		
	for( int i = 0; i < NumSamples; i++ )
	{
		half2 Offset = float2(0,0);
        
        Offset[ Vertical ] = (float)(i - Size) * Parms;
        
		float TapDepthPacked = tex2D( Sampler[DepthBuffer], BaseCoords + Offset ).r;
		float LerpAmount     = 1.0 - (0.95 * abs(( i - SizeH ) / SizeH ));
        float LerpedDepth    = lerp( CenterDepthPacked, TapDepthPacked, LerpAmount );
        
        MinDepthPacked = min( MinDepthPacked, LerpedDepth );
	}
	
	return MinDepthPacked.xxxx;
}

//========================================================================================================
//	FEMU_OP_DepthOfField0
//========================================================================================================
FEMU_OP_DepthOfField0( result CameraPos, result BlurredCameraPos, handle_samp FocalPlane, const Parms )
{
    half CameraZDist	= UNPACK_CAMERA_Z( CameraPos.r );					
	half BlurredZ		= UNPACK_CAMERA_Z( BlurredCameraPos.r );			
	half4 FocalData		= tex2D( Sampler[FocalPlane], float2(0.5f, 0.5f) );	
	
	half PlaneDist		= UNPACK_CAMERA_Z(FocalData.r);	// Distance where focus is 100%.
	half FocalDistMin	= FocalData.g;				// If closer than PlaneDist, distance from plane where focus is 0%.
	half FocalDistMax	= FocalData.b;				// If further than PlaneDist, distance from plane where focus is 0%.
	
	half BlurAmount		= Parms.x;	// Current blur amount for 0% focus, 0 - 1.
	half Pow			= Parms.y;	// Control the curve of the fade
	half WeaponDist     = Parms.z;
	half WeaponDistDelta= Parms.w;

	// Compute blur factor for raw depth.
    float DOFBlur = ComputeDepthOfField( CameraZDist, PlaneDist, FocalDistMin, FocalDistMax, BlurAmount, Pow );
    if( CameraZDist <= WeaponDist )
    {
        if( CameraZDist <= WeaponDist - WeaponDistDelta )
			DOFBlur = 1.0f;
        else
			DOFBlur = lerp( DOFBlur, 1.0f, (WeaponDist - CameraZDist) / WeaponDistDelta );
    }

	// Compute blur factor for blurred depth.
	float DOFBlur2 = ComputeDepthOfField( BlurredZ, PlaneDist, FocalDistMin, FocalDistMax, BlurAmount, Pow );
	if( BlurredZ <= WeaponDist )
    {
        if( BlurredZ <= WeaponDist - WeaponDistDelta )
			DOFBlur2 = 1.0f;
        else
			DOFBlur2 = lerp( DOFBlur2, 1.0f, (WeaponDist - BlurredZ) / WeaponDistDelta );
    }

	// Compute final blur factor.
	// What's happening here is we lerp towards the blurred depth factor if it's closer to the camera and blurrier.
	// This way we can preserve a clean edge for objects that are in focus, while allow out of focus objects
	// to blur into regions of focus.
	DOFBlur = lerp( DOFBlur, DOFBlur2, saturate(100.0f * (DOFBlur2 - DOFBlur)) * saturate(100.0f * (CameraZDist - BlurredZ)));
	return float4( 0, 0, 0, DOFBlur );
}

//========================================================================================================
//	FEMU_OP_DepthOfField1
//========================================================================================================
FEMU_OP_DepthOfField1( result Color, result ColorBlurred )
{
    // The alpha component of Color will hold the focus factor for the pixel.  
    // We lerp towards ColorBlurred based on this focus factor.
	return lerp( Color, ColorBlurred, Color.a );
}

//========================================================================================================
//	FEMU_OP_PixelMotionBlur0
//	Args:
//		Coords, MehsMode, BlurFactor
//========================================================================================================
FEMU_OP_PixelMotionBlur0(handle_tex TexIndex, handle_const ConstIndex, handle_samp DepthIndex, handle_samp FBIndex, handle_samp InNvStereoTex)
{
// icecoldduke - jmarshall - change motion blur to cas
	// If running with stereo, need to stereoize the position or we'll come up with the wrong location to read from
	float2 Tex = NvFixTexCoord(In.Tex[TexIndex+2], InNvStereoTex).xy / In.Tex[TexIndex+2].w;
	float4 SceneColor;

	SceneColor.xyz = ContastAdaptiveSharpen(FBIndex, Tex, In.Tex[TexIndex + 3].xy);
	SceneColor.w = 1;

	return SceneColor;
// jmarshall end
}


//================================================================================
//	FEMU_OP_DeferredAmbient_Bumps
//================================================================================
FEMU_OP_DeferredAmbient_Bumps
(
	result			InBaseCoords,
	handle_samp		DiffuseSamp,
	handle_samp		NormalSamp,
	handle_samp		EmissiveSamp,
	const_h			Ambient1,
	const_h			Ambient2,
	const_h			CameraVector,
	handle_int		bNewWay,
	const_h			NewScaleBump,
	const_h			NewColor
)
{ 
	half3	Diffuse			= tex2D(Sampler[DiffuseSamp], InBaseCoords);
	half	AmbientScale	= tex2D(Sampler[DiffuseSamp], InBaseCoords).a;
	half3	CameraNormal	= tex2D(Sampler[NormalSamp], InBaseCoords);
	half3	Emissive		= tex2D(Sampler[EmissiveSamp], InBaseCoords);
	
	CameraNormal = CameraNormal*2-1;

	if (bNewWay)
	{
		half	Alpha1			= dot(CameraVector.xyz, CameraNormal)*0.5 + 0.5f;
		half	Alpha2			= Alpha1;
	
		Alpha1 = saturate(Alpha1*2.0f);
		Alpha2 = saturate((Alpha2-0.5f)*2.0f);
	
		Alpha1 = 1-pow(1-Alpha1, NewScaleBump.z);
		Alpha2 = pow(Alpha2, NewScaleBump.z);

		float3 Color1 = NewColor.xyz*NewScaleBump.x;
		float3 Color2 = NewColor.xyz*NewScaleBump.y;
		float3 Color3 = NewColor.xyz*NewScaleBump.x;
			
		g_PSInfo.Color[0].rgb = lerp(Color1, Color2, Alpha1);
		g_PSInfo.Color[0].rgb = lerp(g_PSInfo.Color[0].rgb, Color3, Alpha2);
	
		g_PSInfo.Color[0] = float4(g_PSInfo.Color[0].rgb*Diffuse, 1);
	}
	else
	{
		half	Alpha			= dot(CameraVector.xyz, CameraNormal)*0.5 + 0.5f;
	
		// Modulate texcolor with ambient light
		g_PSInfo.Color[0] = half4(Diffuse * lerp(Ambient1.xyz, Ambient2.xyz, Alpha), 1);
	}
	
	g_PSInfo.Color[0].rgb *= AmbientScale;						// Ambient scale

	g_PSInfo.Color[0].rgb += Emissive;							// Emissive
	
	g_PSInfo.Color[0].rgb /= 4;									// Will get multiplied back out before display

	return g_PSInfo.Color[0];
}

//========================================================================================================
//	FEMU_OP_DeferredFog
//	Args:
//		CameraPos, Const1, Const2
//========================================================================================================
FEMU_OP_DeferredFog(result DepthBuffer, handle_const Const1, handle_const Const2, handle_tex TexCoords)
{
	half4	FogColor		= Consts[Const1];
	half4	FogParms		= Consts[Const2];
	float	CameraZDist		= UNPACK_CAMERA_Z(DepthBuffer.r);		// Sample worldspace position
	float	Alpha			= saturate((CameraZDist-FogParms.x)*FogParms.y);
	
	/*
	float3	CameraPos		= In.Tex[TexCoords].xyz*CameraZDist;//float3(In.Tex[TexCoords].xy*CameraZDist,CameraZDist);
	
	float3	WorldPos		= mul(float4(CameraPos,1), CameraToWorld);
	WorldPos.z *= FogParms.w;
	CameraPos = mul(float4(WorldPos,1), WorldToCamera);
	
	float	Alpha			= saturate((CameraPos.z-FogParms.x)*FogParms.y);
	*/

	float	TrueAlpha		= lerp(0,FogParms.z, Alpha);
	TrueAlpha = saturate(TrueAlpha);
	
	return float4(FogColor.rgb,TrueAlpha);	
}

//================================================================================
//	FEMU_OP_DeferredFSAA
//	Args:
//		BaseCoords, Pos, Normal, FrameBuffer, Const1, Const2, PencilMode
//================================================================================
FEMU_OP_DeferredFSAA
{
	int		TexIndex = ARG(0);
	half	Alpha = EdgeDetector(In, TexIndex, Sampler[ARG(2)], Sampler[ARG(1)], true, true, Consts[ARG(4)], Consts[ARG(5)]);

	if (ARG(6) == 1)
		return float4(Alpha,Alpha,Alpha,0);

	float2 Offset = In.Tex[TexIndex+0] * (1-Alpha);
	
	//return tex2D(Sampler[ARG(3)], In.Tex[TexIndex+0]);	// For testing
	
	half4 s0 = tex2D(Sampler[ARG(3)], Offset + In.Tex[TexIndex+1] * Alpha);
	half4 s1 = tex2D(Sampler[ARG(3)], Offset + In.Tex[TexIndex+2] * Alpha);
	half4 s2 = tex2D(Sampler[ARG(3)], Offset + In.Tex[TexIndex+3] * Alpha);
	half4 s3 = tex2D(Sampler[ARG(3)], Offset + In.Tex[TexIndex+4] * Alpha);
	
	return float4((s0 + s1 + s2 + s3) / 4.0f);
}

//================================================================================
//	FEMU_OP_FXAA
//================================================================================
FEMU_OP_FXAA
(
  	result          TexCoords,
    handle_const    PSParams,
 	handle_samp     FrameBuffer
)
{
    return float4(FxaaPixelShader(In.Tex[0].xy, Sampler[0], Consts[PSParams].xy), 1);
}

//================================================================================
//	FEMU_OP_DeferredPosOnly
//================================================================================
FEMU_OP_DeferredPosOnly
{
	g_PSInfo.Color[0] = float4(0,0,0,1);		// Set spec to 1 so that blooms will kick in
	g_PSInfo.Color[1] = float4(In.Tex[ARG(0)].z, 0.0f, 0.0f, 0.0f);	// Camera Pos
	g_PSInfo.Color[2] = float4(0,0,0,0);		// Clear emissive
	
	return g_PSInfo.Color[0];
}

//================================================================================
//	FEMU_OP_ThermalPostPass1
//	Args:
//		BaseCoords, Pos, Normal, HotTexture, ColdTexture, Const1
//================================================================================
FEMU_OP_ThermalPostPass1
{
	float	CameraZDist		= UNPACK_CAMERA_Z(tex2D(Sampler[ARG(1)], Results[ARG(0)]).r);
	float	ThermalZ		= tex2D(Sampler[ARG(2)], Results[ARG(0)]).z*2-1;
	float	Dot				= abs(ThermalZ*1.02f);
	float	ThermalValue	= tex2D(Sampler[ARG(1)], Results[ARG(0)]).g;
	float3	Middle			= Consts[ARG(5)].rgb;
	float4  HotColor		= tex2D(Sampler[ARG(3)], float2(Dot, 0.5f));
	float4  ColdColor		= tex2D(Sampler[ARG(4)], float2(Dot, 0.5f));
	
	float4	Color;
	
	if (ThermalValue >= 0.0f)
		Color = float4(lerp(Middle, HotColor, ThermalValue), 1);
	else
		Color = float4(lerp(Middle, ColdColor, -ThermalValue), 1);
	
	// Lerp from hot/middle/cold color to fog based on distance
	return lerp(Color, float4(0.7,0.7,0.7,1), saturate(CameraZDist/4000.0f));
}

//================================================================================
//	FEMU_OP_ThermalPostPass2
//	Args:
//		BaseCoords, Diffuse, Pos, Normal, Const
//================================================================================
FEMU_OP_ThermalPostPass2
{
	float	Cold		= 1-abs(tex2D(Sampler[ARG(2)], In.Tex[ARG(0)]).g);
	float	CameraZDist	= UNPACK_CAMERA_Z(tex2D(Sampler[ARG(2)], In.Tex[ARG(0)]).r);
	half	EdgeAlpha	= EdgeDetector(In, 0, Sampler[ARG(3)], Sampler[ARG(2)], true, true, half4(0.85f, 0.6f, 0.0f, 0.0f), half4(0.25f, 0.25f, 0.7f, 0.0f));
	float	Alpha		= 1.0f - saturate(CameraZDist/800.0f);
	
	float3 Color = float3(0.55,0.55,0.9)*Cold;
	Color = lerp(Color,float3(0.7,0.7,0.7),1-Alpha);
	
	return float4(Color,EdgeAlpha*Alpha*Cold);
}

//================================================================================
//	FEMU_OP_DeferredBasePass_Thermal
//================================================================================
FEMU_OP_DeferredBasePass_Thermal
{
	g_PSInfo.Color[0] = float4(0.0,0,0,0);		// Currently not using!!!
	g_PSInfo.Color[1] = float4(In.Tex[ARG(0)].z, HeatIntensity.a, 0.0f, 0.0f);
	g_PSInfo.Color[2] = In.Tex[ARG(0)+1];
	
	return g_PSInfo.Color[0];
}

//========================================================================================================
//	FEMU_OP_TexScaleShift
//========================================================================================================
FEMU_OP_TexScaleShift(result BaseUV, const ShiftScale)
{
	return BaseUV*float4(ShiftScale.xy, 1, 1)+float4(ShiftScale.zw, 0, 0);
}

//================================================================================
//	FEMU_OP_DeferredBasePass_Detail
//	Args: 
//		Diffuse, Normal, SpecOnly, ScratchCoords, Const1, Emissive
//================================================================================
FEMU_OP_DeferredBasePass_Detail
{
	half	SpecExp			= Consts[ARG(4)].x;
	half	AmbientScale	= Consts[ARG(4)].y;
	half	BloomScale		= Consts[ARG(4)].z;
	half	SpecScale		= Consts[ARG(4)].w;
	int		ScratchCoords	= ARG(3);
	
	float3x3 TexToCamera = XFormFromStages(In, ScratchCoords+0);
	
	half4	Camera		= half4(In.Tex[ScratchCoords+2].w, SpecExp, 0.0f, 0.0f);
	half4	Normal		= SetupNormalSpec(ARG(1), ARG(2));
	half4	Emissive	= half4(0,0,0,BloomScale);
	
	// Write out emissive if we have it
	if (ARG(5) != NULL_HANDLE)
		Emissive.rgb = Results[ARG(5)].rgb;
	
	half4	Diffuse		= half4(Results[ARG(0)].rgb, AmbientScale);
	half3	Diffuse2	= Results[ARG(6)].rgb;
	half4	Normal2		= SetupNormalSpec(ARG(7), ARG(8));
	half	Alpha		= Results[ARG(9)].a;
		
	Diffuse2	= lerp(half3(0.5f, 0.5f, 0.5f), Diffuse2, Alpha);
	Normal2.xyz	= lerp(Normal.xyz, Normal2.xyz, Alpha);
		
	Diffuse.rgb = Diffuse.rgb*Diffuse2*2;
		
	Normal.xy /= Normal.z;
	Normal2.xy /= Normal2.z;
		
	Normal.xyz = half3(Normal.xy + Normal2.xy, 1.0f);
		
	Normal.a *= SpecScale;

	// Put Normal portion in camera space
	Normal.xyz = normalize(mul(Normal.xyz, TexToCamera));

	// Pack normal
	Normal.xyz = Normal.xyz*0.5+0.5;
		
	g_PSInfo.Color[1] = Camera;
	g_PSInfo.Color[2] = Normal;
	g_PSInfo.Color[3] = Emissive;
		
	return Diffuse;
}

//================================================================================
//	FEMU_OP_DistanceColor
//================================================================================
FEMU_OP_DistanceColor
{
	float Alpha = (In.Tex[ARG(0)].z - Consts[ARG(1)].x) / Consts[ARG(1)].y;
	
	return lerp(Consts[ARG(2)], Consts[ARG(3)], saturate(Alpha));
}

//================================================================================
//	FEMU_OP_Mul2X_Alpha
//================================================================================
FEMU_OP_Mul2X_Alpha(result Arg1, result Arg2, result Arg3)
{
	return float4(lerp(Arg1.rgb, Arg1.rgb*Arg2.rgb*2, Arg3.a), Arg3.a);
}

//================================================================================
//	FEMU_OP_ShadowMapPass
//	Draw depth values into shadow map
//================================================================================
FEMU_OP_ShadowMapPass
{
	// SHADOW_MAP
	float Val	= 0;
	float Alpha = 1;
	
	if (ARG(2) == 1)		// Directional shadowmaps
		Val = saturate((In.Tex[ARG(0)].z-Consts[ARG(1)].x) / Consts[ARG(1)].y);
	else if (ARG(2) == 0)		// Point light
		Val = ((length(In.Tex[ARG(0)].xyz)-Consts[ARG(1)].x) / Consts[ARG(1)].y);
	
	if (ARG(3) != NULL_HANDLE)
	{
		Alpha = Results[ARG(3)].a;
		
		clip(Alpha-Consts[ARG(1)].z);
	}
	
	// SHADOW_MAP
	return float4(Val, Val*Val, Val, Alpha);
}


//================================================================================
//	FEMU_OP_1DConvolutionFilter
//	Args:
//		Width, bVertical, Const1, BaseCoords, Source, Weights
//================================================================================
FEMU_OP_1DConvolutionFilter(handle_int Arg1, handle_int Arg2, handle_const Arg3, handle_res Arg4, handle_samp Arg5, handle_const Arg6, handle_samp DepthMap)
{
#ifdef GAUSSIAN_OLD
	int		Width = ARG(0);
	float	TexWidth = Consts[ARG(2)].x;
	float	TexHeight = Consts[ARG(2)].y;
	float	DimSizeInv = (ARG(1) == 1) ? 1.0f / TexHeight : 1.0f / TexWidth;

	int		NumSamples = 2 * Width + 1;

	float4	Val = float4(0, 0, 0, 0);

	float4  CenterColor;
	float	CenterDepth;
	float	Scale = 1;

	if (DepthMap != NULL_HANDLE)
	{
		CenterDepth = UNPACK_CAMERA_Z(tex2D(Sampler[DepthMap], Results[ARG(3)]).r);
		CenterColor = tex2D(Sampler[ARG(4)], Results[ARG(3)]);
	}

	for (int i = 0; i < NumSamples; i++)
	{
		float2 Offset = float2(0, 0);

		Offset[ARG(1)] = (float)(i - Width) * DimSizeInv;
#if 0
		if (DepthMap != NULL_HANDLE)
		{
			float   TapDepth = UNPACK_CAMERA_Z(tex2D(Sampler[DepthMap], Results[ARG(3)] + Offset).r);
			float4  TapColor = tex2D(Sampler[ARG(4)], Results[ARG(3)] + Offset);

			//TapColor.a = TapDepth < CenterDepth ? TapColor.a : 0;//CenterColor.a;

			//TapColor.a = lerp( CenterColor.a, TapColor.a, TapColor.a );

			if (TapDepth > CenterDepth)
				TapColor.a = CenterColor.a;
			//TapColor.a = lerp( CenterColor.a, TapColor.a, TapColor.a );

		//float DeltaDepth    = abs(Depth - OriginalDepth);

		//Result += lerp( ColorLerped, ColorBlurred, saturate( DeltaDepth / Params1.x ) );

			Val += TapColor * Consts[ARG(5) + i].x;
#if 0		
			float NewDepth = UNPACK_CAMERA_Z(tex2D(Sampler[DepthMap], Results[ARG(3)] + Offset).r);

			float depthDif = NewDepth - Depth;
			float depthDifSqr = depthDif * depthDif;

			// Blur if samples are less than 10cm apart	and angle between their normals is less than about 10 deg
			//if( ( dot( newnormal, norm) > 0.99 ) && ( depthDifSqr < 100.0 ) )
			//if(( depthDifSqr < 10.0 ) )
			{
				Scale *= Consts[ARG(5) + i].x;
				Val += tex2D(Sampler[ARG(4)], Results[ARG(3)] + Offset);// * Consts[ARG(5)+i].x;
			}
#endif
		}
		else
#endif
		{
			Val += tex2D(Sampler[ARG(4)], Results[ARG(3)] + Offset) * Consts[ARG(5) + i].x;
		}
	}

	return Val;
#else
	int		KernelSize = ARG(0);
	float	TexWidth = Consts[ARG(2)].x;
	float	TexHeight = Consts[ARG(2)].y;
	float	DimSizeInv = (ARG(1) == 1) ? 1.0f / TexHeight : 1.0f / TexWidth;
	float4	Output = tex2D(Sampler[ARG(4)], Results[ARG(3)]) * Consts[ARG(5)].x;
	float4	depth = 0.0f;

	if (DepthMap != NULL_HANDLE)
		depth = UNPACK_CAMERA_Z(tex2D(Sampler[DepthMap], Results[ARG(3)]).r);

	float Scale = 1;

	// Loop over the kernel width
	for (int i = 1; i <= KernelSize; ++i)
	{
		float2 Offset = float2(0, 0);

		Offset[ARG(1)] = (float)i * DimSizeInv;

		// Negative side
		float4 Val = tex2D(Sampler[ARG(4)], Results[ARG(3)] - Offset);

		// Positive side
		Val += tex2D(Sampler[ARG(4)], Results[ARG(3)] + Offset);

		if (DepthMap != NULL_HANDLE)
		{
			/*
			float newdepth = UNPACK_CAMERA_Z(tex2D( Sampler[DepthMap], Results[ARG(3)] + Offset).r);

			float depthDif = newdepth - depth;
			float depthDifSqr = depthDif* depthDif;

			// Blur if samples are less than 10cm apart	and angle between their normals is less than about 10 deg
			//if( ( dot( newnormal, norm) > 0.99 ) && ( depthDifSqr < 100.0 ) )
			if(( depthDifSqr < 1.0 ) )
			{
				Scale *= Consts[ARG(5)+i].x;
				Output += Val;
			}
			*/
		}
		else
		{
			// Add weighted contribution
			Output += Val * Consts[ARG(5) + i].x;
		}
	}

	if (DepthMap != NULL_HANDLE)
		Output *= Scale;

	return Output;
#endif
}

//================================================================================
//	FEMU_OP_CalcLum
//================================================================================
FEMU_OP_CalcLum(handle_samp Arg1, handle_res Arg2, handle_const Arg3, handle_int InMode)
{
#if 1
	int		Mode		= ARG(3);
	float	Total		= 0.0f;
	float	Val1		= Consts[ARG(2)].z;
	float	Val2		= Consts[ARG(2)].w;

	float3	Temp		= float3(0,0,0);
	
	// HDRSTUFF
	// Pass 1: Log Sum Avg
	// Pass 2: Sum Avg
	// Pass 3: Exp Sum Avg
	for (int i=0; i<16; i++)
	{
		float3 Color = tex2D(Sampler[ARG(0)], Results[ARG(1)] + Consts[ARG(2)+i].xy);
		
	#if 0
		if (Mode == 0)
			Total += log(dot(Color.rgb+Color.a, LUMINANCE_VECTOR)+0.0001f);
		else
			Total += Color.r;
	#else
		if (Mode == 0)
			//Total += dot(Color*4, 1) / 3;		// Unpack HDR value (x4 is because because values are scaled by 1/4)
			Temp += Color;
		else
			Total += Color.r;
	#endif
	
	}
	
	if (Mode == 0)
		Total = dot(Temp*4, 1) / 3;				// Unpack HDR and average value (x4 is because because values are scaled by 1/4)
		
	if (Mode == 2)
	{
	#if 0
		// Divide the sum to complete the average, and perform an exp() to complete
		// the average luminance calculation
		Total = exp(Total/16);
		Total = clamp(Total, 0.06, 0.25f);
	#else
		if (isinf(Total))
			Total = 0.0f;
		else if (isnan(Total))
			Total = 0.0f;
			
		Total /= 16;
		//Total = clamp(Total, Val1, Val2);
		Total = max(Total, 0.15f);
	#endif
		
	}
	else
		Total /= 16.0f;
			
//Total = 1.0f;		
	//Total = min(Total,1.17);	
	return float4(Total,Total,Total,1);
#else
    return tex2D(Sampler[ARG(0)], Results[ARG(1)]);
#endif
}

//================================================================================
//	FEMU_OP_CalcAdaptedLum
//================================================================================
FEMU_OP_CalcAdaptedLum(handle_samp Arg1, handle_samp Arg2, handle_const Arg3)
{
    float AdaptedLum = tex2D(Sampler[ARG(0)], float2(0.5f, 0.5f)).r;
    float CurrentLum = tex2D(Sampler[ARG(1)], float2(0.5f, 0.5f)).r;
    
    if (isnan(AdaptedLum))
		AdaptedLum = 1.0f;
    if (isinf(AdaptedLum))
		AdaptedLum = 1.0f;
    
    float NewAdaptation = AdaptedLum + (CurrentLum - AdaptedLum) * Consts[ARG(2)].x;
    
    //NewAdaptation = clamp(NewAdaptation, 0.00001, CurrentLum);
    NewAdaptation = clamp(NewAdaptation, 0.0001, 10.0f);
    
    return float4(NewAdaptation, NewAdaptation, NewAdaptation, 1.0f);
}

//========================================================================================================
//	FEMU_OP_FinalHDRPass
//========================================================================================================
FEMU_OP_FinalHDRPass_Emissive(handle_res Arg1, handle_samp Arg2, handle_const Arg3, handle_samp Arg4, handle_samp Arg5, handle_int InMode, handle_samp hNormalSpec, handle_samp Modulate, handle_const Arg9, handle_samp HDRSource)
{
		float4 UV = Results[ARG(0)];
	
	half3	Emissive	= tex2D(Sampler[ARG(4)], UV);
	// half	BloomScale	= tex2D(Sampler[ARG(4)], UV).a*5;
	half	BloomScale	= tex2D(Sampler[ARG(4)], UV).a*10.0f;
	half	HRDClip		= Consts[ARG(2)].r;
	half4 NormalSpec = half4(0,0,0,1);
	
	// float LumScale = (ARG(5) == 1) ? AdaptedLum/MiddleGray : MiddleGray/max(AdaptedLum, 0.0001f);
	
	half3 HDR	= tex2D(Sampler[HDRSource], UV);
	
	if (hNormalSpec != NULL_HANDLE)
		NormalSpec = tex2D(Sampler[hNormalSpec], UV);

	//HRDClip = lerp(3, HRDClip, NormalSpec.a);

	// Emissive Bloom
	g_PSInfo.Color[0] = float4(Emissive * BloomScale, 1);
	
	// Bright pass filter
	// float3 BrightColor = max(g_PSInfo.Color[0].rgb-HRDClip, 0);
	float3 BrightColor = max(HDR.rgb-HRDClip, 0);
	
	BrightColor /= (3.0f + BrightColor);
		
	g_PSInfo.Color[0].rgb += BrightColor * 4.0f * saturate(NormalSpec.a-0.2f);
	// g_PSInfo.Color[0].rgb += BrightColor  * saturate(NormalSpec.a-0.8f);

	return g_PSInfo.Color[0];
}

//========================================================================================================
//	FEMU_OP_FinalHDRPass
//========================================================================================================
FEMU_OP_FinalHDRPass_Diffuse(handle_res Arg1, handle_samp Arg2, handle_const Arg3, handle_samp Arg4, handle_samp Arg5, handle_int InMode, handle_samp hNormalSpec, handle_samp Modulate, handle_const Arg9)
{
	float4 UV = Results[ARG(0)];
	
	half3	Emissive	= tex2D(Sampler[ARG(4)], UV);
	half	BloomScale	= tex2D(Sampler[ARG(4)], UV).a*5;
	half	HRDClip		= Consts[ARG(2)].r;
	
	g_PSInfo.Color[0] = tex2D(Sampler[ARG(1)], UV)*4;		// Unpack HDR value
	
	if (Modulate != NULL_HANDLE)
		g_PSInfo.Color[0].rgb *= tex2D(Sampler[Modulate], UV);

	half4 NormalSpec = half4(0,0,0,1.0f);
	
	if (hNormalSpec != NULL_HANDLE)
		NormalSpec = tex2D(Sampler[hNormalSpec], UV);

	//HRDClip = lerp(3, HRDClip, NormalSpec.a);
	
	if (ARG(3) != NULL_HANDLE)
	{
		half	MiddleGray	= Consts[ARG(2)].g;
		float	AdaptedLum	= tex2D(Sampler[ARG(3)], float2(0,0)).r;

		float Scale = (ARG(5) == 1) ? AdaptedLum/MiddleGray : MiddleGray/max(AdaptedLum, 0.0001f);
		
		// Clamp scale factor
		Scale = clamp(Scale, Consts[ARG(8)].r, Consts[ARG(8)].g);

		if (Scale > 1.0f && ARG(5) == 0)
		{
			// What this is trying to do, is keep dark areas dark
			//	 So the closer the average color is to black, the less it will be affected
			half LowOfs		= Consts[ARG(2)].b;
			half LowScale	= Consts[ARG(2)].a;
		
			float CurrentAvg = saturate((dot(g_PSInfo.Color[0].rgb,1)/3)*LowScale+LowOfs);
		
			Scale = lerp(Scale, 1.0f, 1.0f-CurrentAvg);
			
			//Scale = lerp(Scale, 1, 1.0f-saturate(NormalSpec.a+0.5f));
		}
	
		g_PSInfo.Color[0].rgb *= Scale;
	
		if (ARG(5) == 1)
		{
			float CurrentAvg = saturate((dot(g_PSInfo.Color[0].rgb,1)/3));
		
			HRDClip = lerp(HRDClip, 0.65, CurrentAvg);
			
			half Scale	= Consts[ARG(2)].b;
			half Add	= Consts[ARG(2)].a;
			
			g_PSInfo.Color[0].rgb *= Scale;
			g_PSInfo.Color[0].rgb += Add;
		}
	}
	return g_PSInfo.Color[0];
}

//========================================================================================================
//	FEMU_OP_FinalHDRPass
//========================================================================================================
FEMU_OP_FinalHDRPass(handle_res Arg1, handle_samp Arg2, handle_const Arg3, handle_samp Arg4, handle_samp Arg5, handle_int InMode, handle_samp hNormalSpec, handle_samp Modulate, handle_const Arg9)
{
	float4 UV = Results[ARG(0)];
	
	half3	Emissive	= tex2D(Sampler[ARG(4)], UV);
	half	BloomScale	= tex2D(Sampler[ARG(4)], UV).a*5;
	half	HRDClip		= Consts[ARG(2)].r;
	
	g_PSInfo.Color[0] = tex2D(Sampler[ARG(1)], UV)*4;		// Unpack HDR value
	
	if (Modulate != NULL_HANDLE)
		g_PSInfo.Color[0].rgb *= tex2D(Sampler[Modulate], UV);

	half4 NormalSpec = half4(0,0,0,1);
	
	if (hNormalSpec != NULL_HANDLE)
		NormalSpec = tex2D(Sampler[hNormalSpec], UV);

	//HRDClip = lerp(3, HRDClip, NormalSpec.a);

	// Emissive Bloom
	g_PSInfo.Color[1] = float4(Emissive * BloomScale, 1.0f);
	
	if (ARG(3) != NULL_HANDLE)
	{
		half	MiddleGray	= Consts[ARG(2)].g;
		float	AdaptedLum	= tex2D(Sampler[ARG(3)], float2(0,0)).r;

		float Scale = (ARG(5) == 1) ? AdaptedLum/MiddleGray : MiddleGray/max(AdaptedLum, 0.0001f);
		
		// Clamp scale factor
		Scale = clamp(Scale, Consts[ARG(8)].r, Consts[ARG(8)].g);

		if (Scale > 1.0f && ARG(5) == 0)
		{
			// What this is trying to do, is keep dark areas dark
			//	 So the closer the average color is to black, the less it will be affected
			half LowOfs		= Consts[ARG(2)].b;
			half LowScale	= Consts[ARG(2)].a;
		
			float CurrentAvg = saturate((dot(g_PSInfo.Color[0].rgb,1)/3)*LowScale+LowOfs);
		
			Scale = lerp(Scale, 1.0f, 1.0f-CurrentAvg);
			
			//Scale = lerp(Scale, 1, 1.0f-saturate(NormalSpec.a+0.5f));
		}
	
		g_PSInfo.Color[0].rgb *= Scale;
	
		if (ARG(5) == 1)
		{
			float CurrentAvg = saturate((dot(g_PSInfo.Color[0].rgb,1)/3));
		
			HRDClip = lerp(HRDClip, 0.65, CurrentAvg);
			
			half Scale	= Consts[ARG(2)].b;
			half Add	= Consts[ARG(2)].a;
			
			g_PSInfo.Color[0].rgb *= Scale;
			g_PSInfo.Color[0].rgb += Add;
		}
	}
	
	// Bright pass filter
	float3 BrightColor = max(g_PSInfo.Color[0].rgb-HRDClip, 0);
	
	BrightColor /= (3.0f + BrightColor);
		
	g_PSInfo.Color[1].rgb += BrightColor * 4.0f * saturate(NormalSpec.a-0.2f);
	//g_PSInfo.Color[1].rgb += BrightColor * 3.0f * saturate(NormalSpec.a);
	
	//g_PSInfo.Color[1].rgba = float4(1,0,0,0);
	
	return g_PSInfo.Color[0];
}

//================================================================================
//	FEMU_OP_CalcAvg
//================================================================================
FEMU_OP_CalcAvg(handle_samp Arg1, handle_res Arg2, handle_const Arg3, handle_int Arg4, handle_int Arg5)
{
	int		Size		= ARG(3);
	float4	Total		= 0.0f;

	for (int i=0; i<Size; i++)
		Total += tex2D(Sampler[ARG(0)], Results[ARG(1)] + Consts[ARG(2)+i].xy);
		
	Total /= Size;
	
	Total *= Consts[ARG(2)].z;
	
	if (ARG(4) == 1)
		Total.a = Consts[ARG(2)].a;
			
	return Total;
}

//================================================================================
//	FEMU_OP_StarBlur
//================================================================================
FEMU_OP_StarBlur(handle_samp Arg1, handle_res Arg2, handle_const Arg3, handle_const Arg4, handle_int Arg5, const Const1)
{
	int		NumSamples = ARG(4);
    float4	Color = 0.0f, Pixel = 0.0f;
    float	TestVal;
    float	MinIntensity = Const1.x;
    float	FullIntensity = Const1.y;  
    float	IntensityRange = Const1.z;
    float3  rgb2lum = float3(0.30, 0.59, 0.11);
   
    // Sample from n points along the star line
    for(int i = 0; i < NumSamples; i++)
    {
		Pixel = tex2D(Sampler[ARG(0)], Results[ARG(1)] + Consts[ARG(3)+i].xy);
		TestVal = dot(Pixel.rgb, rgb2lum);
		if (TestVal > MinIntensity)
		{
			if (TestVal >= FullIntensity)		
				Color += Pixel * Consts[ARG(2)+i];		
			else
				Color += Pixel * Consts[ARG(2)+i] * min(1.0f, (TestVal - MinIntensity) / IntensityRange);
		}		
	}
    	
    return Color;
}

//================================================================================
//	FEMU_OP_StarMerge
//================================================================================
FEMU_OP_StarMerge(handle_samp Arg1, handle_res Arg2, handle_const Arg3, handle_int Arg4)
{
	int		NumMerges = ARG(3);
    float4	Color = 0.0f;
        
    // Sample from n points along the star line
    for(int i = 0; i < NumMerges; i++)
		Color += tex2D(Sampler[ARG(0)+i], Results[ARG(1)]) * Consts[ARG(2)+i];
	
	//Color = saturate(Color-0.7f)*2;
    	
    return Color;
}

//================================================================================
//	FEMU_OP_RestoreZBuffer
//================================================================================
FEMU_OP_RestoreZBuffer(handle_res Arg1, handle_res Arg2)
{
	g_PSInfo.Depth = Results[ARG(0)].r;
	
	if (ARG(1) != NULL_HANDLE)
		return Results[ARG(1)];
	
	return float4(0,0,0,0);
}

//================================================================================
//	FEMU_OP_LightShaft
//================================================================================
FEMU_OP_LightShaft(handle_tex UVIndex1, handle_samp TextureIndex, handle_tex UVIndex2, handle_samp ShadowCubeIndex, const LightLoc, const Const1, const Const2, handle_samp FBSamp, handle_res FBCoords, handle_const Const3, handle_samp CookieIndex)
{
	float4 UV = float4(In.Tex[UVIndex1].xy/In.Tex[UVIndex1].w, 0, 0);
	
	UV += float4(Consts[Const3].y, Consts[Const3].z, 0, 0);
	
	half4 Value = tex2D(Sampler[TextureIndex], UV.xy) * Const2;
	
	if (CookieIndex != NULL_HANDLE)
		Value *= tex2Dproj(Sampler[CookieIndex], In.Tex[UVIndex1]);

	// Fade at near/far plane
	Value *= 1-saturate(In.Tex[UVIndex2+1].x);//, 1);
	Value *= saturate(In.Tex[UVIndex2+1].y);
	
	// Do cubemap variance shadows
	if (ShadowCubeIndex != NULL_HANDLE)
		Value *= HandleVarianceShadow(ShadowCubeIndex, In.Tex[UVIndex2+0], Const1.x, Const1.y, 0.0002f, false, false, 1.0f);
	
	// Soft edge
	if (FBSamp != NULL_HANDLE)
	{
		float Dist1 = UNPACK_CAMERA_Z(tex2D(Sampler[FBSamp], Results[FBCoords].xy).r);
		float Dist2	= In.Tex[UVIndex2+1].z;

		Value *= saturate(abs(Dist1-Dist2)/Consts[Const3].x);
	}
		
	return Value;
}

//================================================================================
//	FEMU_OP_MergeShadows
//================================================================================
FEMU_OP_MergeShadows(handle_res Arg1, handle_samp Arg2, handle_samp Arg3)
{
	float4 Source1 = tex2D(Sampler[ARG(1)], Results[ARG(0)]);
	float4 Source2 = tex2D(Sampler[ARG(2)], Results[ARG(0)]);
	float4 Result  = Source1;
	
	if (Source2.r < Source1.r)
		Result = Source2;
	
	return Result;
}

//================================================================================
//	FEMU_OP_AmbientOcclusion
//================================================================================
FEMU_OP_AmbientOcclusion(handle_samp InCameraPos, handle_samp InNormal, handle_tex TexCoords, handle_const VectStart, handle_samp InRandNormals, handle_int NumSamples, handle_samp PrevFrame)
{
#define AO_MODE	(3)

	float4 SSAO_Normals[16] =
	{
		float4(0.355512, 	-0.709318, 	-0.102371,	0.0 ),
		float4(0.534186, 	0.71511, 	-0.115167,	0.0 ),
		float4(-0.87866, 	0.157139, 	-0.115167,	0.0 ),
		float4(0.140679, 	-0.475516, 	-0.0639818,	0.0 ),
		float4(-0.0796121, 	0.158842, 	-0.677075,	0.0 ),
		float4(-0.0759516, 	-0.101676, 	-0.483625,	0.0 ),
		float4(0.12493, 	-0.0223423,	-0.483625,	0.0 ),
		float4(-0.0720074, 	0.243395, 	-0.967251,	0.0 ),
		float4(-0.207641, 	0.414286, 	0.187755,	0.0 ),
		float4(-0.277332, 	-0.371262, 	0.187755,	0.0 ),
		float4(0.63864, 	-0.114214, 	0.262857,	0.0 ),
		float4(-0.184051, 	0.622119, 	0.262857,	0.0 ),
		float4(0.110007, 	-0.219486, 	0.435574,	0.0 ),
		float4(0.235085, 	0.314707, 	0.696918,	0.0 ),
		float4(-0.290012, 	0.0518654, 	0.522688,	0.0 ),
		float4(0.0975089, 	-0.329594, 	0.609803,	0.0 )
	};

#if (AO_MODE == 0)
#elif (AO_MODE == 1)
#elif (AO_MODE == 2)
    float2 SSTex = In.Tex[TexCoords].xy / In.Tex[TexCoords].w;

    // Get camera distance
    //float CameraDist = UNPACK_CAMERA_Z(tex2Dproj(Sampler[InCameraPos], In.Tex[TexCoords]).r);
    float CameraDist = UNPACK_CAMERA_Z(tex2D(Sampler[InCameraPos], SSTex).r);
    
    float3 Normal = tex2Dproj(Sampler[InNormal], In.Tex[TexCoords])*2-1;
    
	float3 CameraPos = float3((In.Tex[TexCoords+1].xy / In.Tex[TexCoords+1].w) * CameraDist, CameraDist);

    // Get random reflection plane
    float3 Plane = tex2D(Sampler[InRandNormals], In.Tex[TexCoords]*100.0f )*2-1;
    Plane = normalize(Plane);
    
    float Radius = Consts[VectStart+4].w;
    
	Radius *= saturate((CameraDist-100) / 64.0f) * (1.0f + CameraDist / 20000.0f ); 

    float Total = 0;
    
	float Bias = Consts[VectStart+5].w;
	
	for( int i=0; i<NumSamples; i++ )
	{
		float3 SampleDir = Radius*SSAO_Normals[i].xyz;
		//float3 SampleDir = Radius*reflect(SSAO_Normals[i].xyz, Plane);
		
		//if (dot(SampleDir, Normal.xyz) < 0)
		//	SampleDir += Normal * Radius;
		
		/*
		if( dot(SampleDir, Normal.xyz) < 0.0 )
		{
			// Reflect it and put it in the upper hemisphere for the surface normal
			SampleDir = reflect(SampleDir, Normal);
		}
		*/

        float3 SphereCameraPos = CameraPos + SampleDir;

        float2 SphereScreenPos = (SphereCameraPos.xy/SphereCameraPos.z)*float2(Consts[VectStart+0].w,-Consts[VectStart+1].w);
        SphereScreenPos = SphereScreenPos*0.5 + 0.5;
        SphereScreenPos.xy += float2(1.0f/1024.0f, 1.0f/768.0f);
        float SphereSampleDepth = UNPACK_CAMERA_Z(tex2D(Sampler[InCameraPos],SphereScreenPos).r);
        //SampleDir.y *= -1;
        //float SphereSampleDepth = UNPACK_CAMERA_Z(tex2D(Sampler[InCameraPos],SSTex+SampleDir.xy/CameraDist).r);// + SampleDir.z*0.001f;

		// If the point on the sphere is behind the surface, and it's not too far behind it, assume it is in shadow
		float SphereCenterSampledDepth = CameraDist;
				
		float Delta = (SphereCenterSampledDepth - SphereSampleDepth);//-Bias;
		
		//float Radius2d = length(SSAO_Normals[i].xy);
		
		if (delta < 90)
			Total += delta/Consts[VectStart+2].w;
	}
   
	float Shadow = (Total/(float)NumSamples);// * Consts[VectStart+2].w;
	//Shadow = pow(Shadow, Consts[VectStart+6].w);
	
	if (Shadow < Consts[VectStart+6].w)
		return 1;
	
	float Strength = Consts[VectStart+3].w;
	return Strength;
	
	//Shadow = 1-saturate(Shadow);
	//Shadow = Shadow*0.7f + 0.3f;
	//return Shadow;
#elif (AO_MODE == 3)
    // Get camera distance
    float CameraDist = UNPACK_CAMERA_Z(tex2Dproj(Sampler[InCameraPos], In.Tex[TexCoords]).r);

    float3 Normal = tex2Dproj(Sampler[InNormal], In.Tex[TexCoords])*2-1;
    
	float3 CameraPos = float3((In.Tex[TexCoords+1].xy / In.Tex[TexCoords+1].w) * CameraDist, CameraDist);

    // Get random reflection plane
    //float3 Plane = tex2D(Sampler[InRandNormals], In.Tex[TexCoords]*100.0f )*2-1;
    //Plane = normalize(Plane);
    
    float Radius = Consts[VectStart+4].w;

    float Total = 0.0;
    			
	for( int i=0; i<NumSamples; i++ )
	{
		//float3 SampleDir = Radius*Consts[VectStart+i].xyz;
		//float3 SampleDir = Radius*reflect(SSAO_Normals[i].xyz, Plane);
		float3 SampleDir = Radius*SSAO_Normals[i].xyz;
		
		if (dot(SampleDir, Normal.xyz) < 0)
			SampleDir += Normal * Radius * Consts[VectStart+6].w;
		/*
		if( dot(SampleDir, Normal.xyz) < 0.0 )
		{
			// Reflect it and put it in the upper hemisphere for the surface normal
			SampleDir = reflect(SampleDir, Normal);
		}
		*/

        float3 SampleCameraPos = CameraPos + SampleDir;

        float2 ScreenPos = (SampleCameraPos.xy/SampleCameraPos.z)*float2(Consts[VectStart+0].w,-Consts[VectStart+1].w);
        ScreenPos = ScreenPos*0.5 + 0.5;
        ScreenPos.xy += float2(Consts[VectStart+7].w,Consts[VectStart+8].w);
		//ScreenPos.xy += float2(Consts[VectStart+10].w,Consts[VectStart+11].w);
        float SampleDepth = UNPACK_CAMERA_Z(tex2D(Sampler[InCameraPos],ScreenPos).r);

		// If the point on the sphere is behind the surface, and it's not too far behind it, assume it is in shadow
		if (SampleCameraPos.z > SampleDepth+Consts[VectStart+5].w)
		{
			float ZDelta = (SampleCameraPos.z-SampleDepth);//-Consts[VectStart+5].w;
			
			//Total += ZDelta / Consts[VectStart+2].w;
			
			// 1/d^2 falloff
			Total += 1.0 / ( 1.0 + ( ZDelta * ZDelta  )*Consts[VectStart+2].w );
		}
	}
   
	Total = lerp(0, Total, saturate(CameraDist / 200.0f));
	Total = lerp(Total, 0, saturate((CameraDist-1000.0f) / 500.0f));
	
	float Strength = Consts[VectStart+3].w;
	Total *= 2.0*Strength/(float)NumSamples;
	
	Total = 1-saturate(Total);

#if 1
	// Merge in with prev ambient occlusion solution
	float3	PrevCameraPos	= mul(float4(CameraPos,1), CameraToPrevCamera);
	float2	PrevScreenSpace	= PrevCameraPos.xy / PrevCameraPos.z;

	float2 PrevScreenPos = PrevScreenSpace*float2(Consts[VectStart+0].w,-Consts[VectStart+1].w);
	PrevScreenPos = PrevScreenPos*0.5 + 0.5f;
	//PrevScreenPos.xy += float2(Consts[VectStart+10].w,Consts[VectStart+11].w);
	PrevScreenPos.xy += float2(Consts[VectStart+7].w,Consts[VectStart+8].w);

	float PrevValue = tex2D(Sampler[PrevFrame], PrevScreenPos).r;
		
	if (Total > PrevValue)
		return Total;
		
	Total = lerp(PrevValue, Total, Consts[VectStart+9].w);
#endif
	
	return Total;
#endif
}

//================================================================================
//	FEMU_OP_FinalizeAmbientOcclusion
//================================================================================
FEMU_OP_FinalizeAmbientOcclusion(handle_tex TexCoords, handle_const InConst, handle_samp InCameraPos, handle_samp CurrentFrameFrame, handle_samp PrevFrame)
{
    // Get camera distance
    float CameraDist = UNPACK_CAMERA_Z(tex2Dproj(Sampler[InCameraPos], In.Tex[TexCoords]).r);

	float3 CameraPos = float3((In.Tex[TexCoords+1].xy / In.Tex[TexCoords+1].w) * CameraDist, CameraDist);

    float2 ScreenPos = (CameraPos.xy/CameraPos.z)*float2(Consts[InConst].x,-Consts[InConst].y);
    ScreenPos = ScreenPos*0.5 + 0.5;
    ScreenPos.xy += float2(Consts[InConst].z,Consts[InConst].w);

	float3	PrevCameraPos	= mul(float4(CameraPos,1), CameraToPrevCamera);
	float2	PrevScreenSpace	= PrevCameraPos.xy / PrevCameraPos.z;

	float2 PrevScreenPos = PrevScreenSpace*float2(Consts[InConst].x,-Consts[InConst].y);
	PrevScreenPos = PrevScreenPos*0.5 + 0.5;
	PrevScreenPos.xy += float2(Consts[InConst].z,Consts[InConst].w);

	float4 PrevValue = tex2D(Sampler[PrevFrame], PrevScreenPos).r;
	float4 CurValue = tex2D(Sampler[CurrentFrameFrame], ScreenPos).r;

	if (CurValue.r > PrevValue.r)
		return CurValue;
	
	return lerp(PrevValue, CurValue, 0.05f);
}

//================================================================================
//	FEMU_OP_BlurAmbientOcclusion
//================================================================================
FEMU_OP_BlurAmbientOcclusion(handle_samp Source, handle_samp Normal, handle_samp DepthMap, handle_res TexCoords, handle_int dir, handle_res InvTexSize)
{
	float4 color 	= tex2D( Sampler[Source], 	Results[TexCoords]);
	float4 norm 	= tex2D( Sampler[Normal], 	Results[TexCoords]);
	float4 depth 	= UNPACK_CAMERA_Z(tex2D( Sampler[DepthMap], Results[TexCoords]).r);

	float num = 1;

	int blurdist = 8;
	float2 blurdir;
	
	if(dir == 0)
	{
		blurdir = float2(Results[InvTexSize].x,0);
	}	
	else
	{
		// dir == 1
		blurdir = float2(0,Results[InvTexSize].y);
	}
		
	for( int i = -blurdist/2; i <= blurdist/2; i+=1)
	{
		float4 texCoord = float4(Results[TexCoords] + i * blurdir.xy, 0, 0 );
		
		float4 newsample 	= tex2D( Sampler[Source], 	texCoord);
		float4 newnormal 	= tex2D( Sampler[Normal], 	texCoord);
		float4 newdepth 	= UNPACK_CAMERA_Z(tex2D( Sampler[DepthMap], texCoord).r);
		
		float depthDif = newdepth - depth;
		float depthDifSqr = depthDif* depthDif;
				
		//if( ( dot( newnormal, norm) > 0.99 ) && ( depthDifSqr < 100.0 ) )
		if(( depthDifSqr < 100.0 ) )
		{
			num +=   ( blurdist/2 - abs(i));
			color += newsample *  ( blurdist/2 - abs(i));
		}
	}

	// Only the first component matters
	return color / num;	
}

//================================================================================
//	FEMU_OP_Foliage
//================================================================================
FEMU_OP_Foliage(result Texture, handle_tex Scratch, const_h Const)
{
	g_PSInfo.Color[1] = float4(In.Tex[Scratch].w,0,0,0);	// Dist/Spec

	float3 Normal = In.Tex[Scratch].xyz;
	
	Normal.xyz = Normal.xyz*0.5+0.5;

	g_PSInfo.Color[2] = float4(Normal.xyz,0);	// Normal
	
	//clip(Texture.a-0.003);
	clip(Texture.a-Const.y);
	
	Texture.a = Const.x;		// Ambient scale

	Texture.rgb *= saturate(In.Tex[Scratch+1].x+0.2f);
	
	return Texture;
}

//================================================================================
//    FEMU_OP_FinalBloomPass
//================================================================================
FEMU_OP_FinalBloomPass(result InCoords, handle_samp InBloomBuffer, handle_samp InDepth, result FogConsts)
{
    // This will properly fog blooms.    
    float  Depth   = UNPACK_CAMERA_Z(SampleTexture(InDepth, InCoords).r);
    float4 Texture = SampleTexture(InBloomBuffer, InCoords);
    
    // RAF: r_DrawBloomBuffer debuggery.
	if( FogConsts.w > 0.0f )
		return Texture;    
 
    float FogBegin	    = FogConsts.x;
    float FogEnd		= FogConsts.y;
    float FogOpacity	= FogConsts.z;
 
    return Texture * lerp(1, (1.0f - saturate((Depth - FogBegin)/FogEnd)), FogOpacity);
}

//================================================================================
//	FEMU_OP_PostProcessor
//================================================================================
FEMU_OP_PostProcessor(result InCoords, handle_samp InFB, result SceneShadows, result SceneMidTones, result SceneHighLights)
{
    float SceneDesaturation = SceneShadows.w;
    
    float4 FB = SampleTexture(InFB, InCoords);

	float3 Color0 = ((saturate(FB.rgb - SceneShadows.rgb)) / SceneHighLights.rgb);
	
	Color0.rgb = pow(Color0.rgb, SceneMidTones.rgb);
	
	float3 rgb2lum = float3(0.30, 0.59, 0.11);
	float3 Color1 = dot(Color0.rgb, rgb2lum);// /3;
	
	float3 OutputColor = saturate(lerp(Color0, Color1, SceneDesaturation));
	
	return float4(OutputColor, FB.a);
}

//================================================================================
//	FEMU_OP_OverlayBumpDiffuse
//================================================================================
FEMU_OP_OverlayBumpDiffuse
(
    result      InBaseCoords,   
    handle_tex  InScratchCoords,
    result      InDiffuse,
    result		InNormalSpec,
	handle_samp	InOverlayDiffuse,
	handle_samp	InOverlayCube,
	const_h		InOverlayConst
)
{
    half4 OverlayDiffuse = tex2D( Sampler[ InOverlayDiffuse ], InBaseCoords * InOverlayConst.xy );
    half3 OverlayCube    = float4(0,0,0,0); 
	    
    if( InOverlayCube != NULL_HANDLE )
    {
        float3x4 TangentToWorld = float3x4(In.Tex[InScratchCoords+0], In.Tex[InScratchCoords+1], In.Tex[InScratchCoords+2]);

		half3 N      = InNormalSpec.xyz*2-1;   
        half3 WorldV = float3(TangentToWorld[0].w, TangentToWorld[1].w, TangentToWorld[2].w);
        OverlayCube  = texCUBE( Sampler[ InOverlayCube ], reflect(WorldV, mul(N, (float3x3)TangentToWorld) ) ).rgb;
    }

    return ComputeOverlayBumpColor( InDiffuse, OverlayDiffuse, InOverlayCube, OverlayCube, InOverlayConst.z );
}

//================================================================================
//	FEMU_OP_FakeDirectionalLight
//================================================================================
FEMU_OP_FakeDirectionalLight( result InDiffuse, handle_res InNormal, handle_tex InScratchCoords, handle_res InSpecOnly, const InConst1, const InConst2 )
{
	const half3 LightPos = half3( 2500.0, 2500.0, -1500.0 );
	const half3 LightDir = half3( 0.57735, 0.57735, -0.57735 );

	// Get pixel information.
	float3		CameraSpacePos	= float3( In.Tex[InScratchCoords+0].w, In.Tex[InScratchCoords+1].w, In.Tex[InScratchCoords+2].w );
	float3x3	TexToCamera		= XFormFromStages( In, InScratchCoords );
	float4		CameraNormal	= SetupNormalSpec_XForm( In, InNormal, InSpecOnly, 1.0f, TexToCamera, false );	

	// Get material information.
	half		SpecularScale	= InConst1.x * CameraNormal.w;
	half		SpecularPower	= InConst1.y;
	half		AmbientScale	= InConst1.z;	// TODO: Use this for something?

	// Get light information.
	half3		LightColor		= InConst2.xyz;	// This is actualy LightColor * LightIntensity.

	// Compute lighting.
	float3		VertToLight		= normalize( LightPos - CameraSpacePos );
	half3		VertToCamera	= normalize( -CameraSpacePos );
	half3		Half			= normalize( VertToCamera + (half3)VertToLight );
	half		NDotL			= saturate( dot( CameraNormal.xyz, LightDir ));
	half		NDotH			= pow( saturate( dot( CameraNormal.xyz, Half )), SpecularPower );
	
	// TODO: Output a percentage of the result to the bloom buffer?
	// g_PSInfo.Color[1] = ???;

	// Return modified color with original alpha.
	return float4( saturate( InDiffuse.rgb * LightColor * NDotL + LightColor * NDotH * SpecularScale ), InDiffuse.a );
}

//================================================================================
//  FEMU_OP_EmissiveBloom
//================================================================================
FEMU_OP_EmissiveBloom( result InDiffuse, result InEmissive, result BloomTint )
{
	// Modulate emissive with vertex color.
	float4 Emissive = float4( InEmissive.rgb * In.Diffuse.rgb, InEmissive.a );

    // Output tinted emissive bloom.
    g_PSInfo.Color[1] = InEmissive * BloomTint * InDiffuse.a;

    // Add emissive to color.  Keep original alpha.
    return float4( InDiffuse.rgb + Emissive.rgb, InDiffuse.a );
}

//================================================================================
//  FEMU_OP_BinkShader
// 
//	Converts Bink's YCrCbA to RGBA.
//
//	See StrYCrCbToRGBNoPixelAlpha & StrYCrCbAToRGBA in binktexturesDX9.cpp for
//	the original HLSL code.
//================================================================================
FEMU_OP_BinkShader( result InCoords, handle_samp YPlane, handle_samp cRPlane, handle_samp cBPlane, handle_samp APlane )
{
	const float4 crc = { 1.595794678f, -0.813476563f, 0.0f, 0.0f };
	const float4 crb = { 0.0f, -0.391448975f, 2.017822266f, 0.0f };
	const float4 adj = { -0.87065506f, 0.529705048f, -1.081668854f, 0.0f };

	float4 p;
	
	p = tex2D( Sampler[ YPlane ], InCoords ).a * 1.164123535f;
	
	p += (crc * tex2D( Sampler[ cRPlane ], InCoords ).a) + (crb * tex2D( Sampler[ cBPlane ], InCoords ).a) + adj;
	
	// See if we have an alpha sampler.
	if( APlane != NULL_HANDLE )
		p.w = tex2D( Sampler[ APlane ], InCoords ).a;
	else
		p.w = 1.0f;
		
	return p;
}

//================================================================================
//	FEMU_OP_ScreenFillFromTexture - Fills the screen from a texture
//================================================================================
FEMU_OP_ScreenFillFromTexture(result InCoords, handle_samp InFB)
{
    float4 FB = SampleTexture(InFB, InCoords);

	return FB;
}

//================================================================================
//	FEMU_OP_ComputeNormalSpec
//================================================================================
FEMU_OP_ComputeNormalSpec
(
    result      InBaseCoords,
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
	float3x3 TexToCamera = XFormFromStages( In, InScratchCoords+0 );

	half4 OverlayDiffuse = half4(0,0,0,0);
	half4 OverlayNormal, Normal;
	float SpecScale = 1.0f;
	
	if( InOverlayDiffuse != NULL_HANDLE && InOverlayNormal != NULL_HANDLE )
	{
	    OverlayDiffuse  = tex2D( Sampler[ InOverlayDiffuse ], InBaseCoords * InOverlayConst1.xy );
	    OverlayNormal   = SetupNormalSpecEx( InOverlayNormal, InOverlaySpecOnly, InBaseCoords * InOverlayConst1.xy );
	    
	    Normal          = SetupNormalSpec( InNormal, InSpecOnly );
	    	    
	    OverlayNormal   = lerp( Normal, OverlayNormal, OverlayDiffuse.a ); // Lerp from regular N to OverlayN based off OverlayDiffuse.a
	    
	    Normal.xyz      = normalize( lerp( Normal.xyz, normalize( OverlayNormal.xyz ), InOverlayConst1.z ));
	    Normal.xyz      = mul( Normal.xyz, TexToCamera ).xyz;
	    Normal.w        = lerp( Normal.w, OverlayNormal.w, InOverlayConst1.z );
		
		SpecScale       = lerp( SpecScale, InOverlayConst2.z, OverlayDiffuse.a );
	}
	else
	{
	    Normal = SetupNormalSpec_XForm( In, InNormal, InSpecOnly, 1.0f, TexToCamera, false );
	}
	
	// Pack normal.
	Normal.xyz = Normal.xyz*0.5+0.5;
	
	// Apply specular scale.	
	Normal.a *= SpecScale;
		
	return Normal;
}


//================================================================================
//	FEMU_OP_RimLightEffect
//================================================================================
FEMU_OP_RimLightEffect
(
	handle_tex  InScratchCoords,
	result		InDiffuse,
	result		InNormalSpec,
	const_h		InConst1,
	const_h		InConst2,
	handle_res	InAlpha,
	handle_res	InColor	
)
{
	half RimLightIntensity	= InConst2.x;
	half RimLightExponent	= InConst2.y;
	half RimLightFalloff	= InConst2.z;	
	
	half3 Normal = InNormalSpec.xyz*2-1;
	half3 ToCamera = normalize( -half3( In.Tex[InScratchCoords+0].w, In.Tex[InScratchCoords+1].w, In.Tex[InScratchCoords+2].w ));
	
	// Compute fresnel factor.
	half Fresnel = pow( 1.0f - max( dot( Normal, ToCamera ), 0 ), RimLightExponent );
	
	// Compute base color.
	half3 RimLight = half3( InConst1.x, InConst1.y, InConst1.z );
	if( InColor != NULL_HANDLE )
		RimLight *= Results[InColor].rgb;
	
	// Apply intensity and falloff.
	RimLight *= pow( Fresnel * RimLightIntensity, RimLightFalloff );
	
	// Apply alpha.
	if( InAlpha != NULL_HANDLE )
		RimLight *= Results[InAlpha].a;
		
	// Combine with diffuse.
	half3 Ones = half3( 1, 1, 1 );
	return half4( Ones - ((Ones - InDiffuse) * (Ones - RimLight)), InDiffuse.a );
}

//================================================================================
//	FEMU_OP_UberPostGather
//================================================================================
FEMU_OP_UberPostGather
(
	handle_const    Params,
	handle_tex      TexCoords,
	handle_samp     Diffuse
)
{
	#define NUM_SAMPLES 4

	float4 OutColor = 0;

	//Go through each chunk and take samples.  NUM_SAMPLES must be a factor of 2.
	for(int ChunkIndex = 0; ChunkIndex < NUM_SAMPLES / 2; ChunkIndex++)
    {
		OutColor.rgb += SampleTexture(Diffuse, float4(In.Tex[TexCoords + ChunkIndex].xy, 0, 0)).rgb;
		OutColor.rgb += SampleTexture(Diffuse, float4(In.Tex[TexCoords + ChunkIndex].wz, 0, 0)).rgb;
	}

	OutColor.rgb /= NUM_SAMPLES;

    return OutColor;		
}

//================================================================================
//	FEMU_OP_UberPostBlend
//================================================================================
FEMU_OP_UberPostBlend
(
 	result          TexCoords,
    handle_const    PSParams,
 	handle_samp     FrameBuffer,
    handle_samp     UberBuffer,
    handle_samp     ZBuffer,
    handle_samp     FocalPlane,
    handle_samp     BloomBuffer
)
{    

// jmarshall - new post pass for Duke Nukem Forever
	float4 SceneColor = SampleTexture(FrameBuffer, TexCoords);
	float  SceneDepth = UNPACK_CAMERA_Z((SampleTexture(ZBuffer, TexCoords)).r);
    
    //////////////////////
    // Bloom
    //////////////////////

    float FogBegin	    = Consts[PSParams+1].x;
    float FogEnd		= Consts[PSParams+1].y;
    float FogOpacity	= Consts[PSParams+1].z;
	SceneColor += SampleTexture(BloomBuffer, TexCoords) *lerp(1, (1.0f - saturate((SceneDepth - FogBegin) / FogEnd)), FogOpacity);

	//////////////////////
	// Tone mapping
	//////////////////////

	float4 SceneShadows = Consts[PSParams + 2];
	float SceneDesaturation = SceneShadows.w;
	float4 SceneMidTones = Consts[PSParams + 3];
	float4 SceneHighLights = Consts[PSParams + 4];

	float3 Color0 = SceneColor.rgb;
	if (SceneShadows.z >= 0.0)
	{
		Color0 = ((saturate(SceneColor.rgb - SceneShadows.rgb)) / SceneHighLights.rgb);

		Color0.rgb = pow(Color0.rgb, SceneMidTones.rgb);
	}

	SceneColor.rgb = Color0; // saturate(lerp(Color0, SceneColor, SceneDesaturation));
// jmarshall end
	return SceneColor;
}
