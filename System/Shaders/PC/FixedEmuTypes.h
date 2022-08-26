/*=============================================================================
	FixedEmuTypes.h: Duke Forever Direct3D9 support
	Copyright 1997-2003 3D Realms, Inc. All Rights Reserved.
	
	Revision history:
		Created by John Pollard
=============================================================================*/
#ifndef FIXED_EMU_TYPES_H
#define FIXED_EMU_TYPES_H

#define GAUSSIAN_OLD
#define OLD_TRANSPARENT_BUMPS

#define FEMU_MAX_OPS						(48)
#define FEMU_MAX_ARGS						(256)
#define	FEMU_MAX_SAMPLERS					(16)
#define	FEMU_MAX_TEXCOORD_OPS				(16)
#define FEMU_MAX_RESULTS					(FEMU_MAX_OPS)			// Temp registers to hold results of each operation
#define MAX_FIXEDEMU_LIGHTS					(16)
#define FEMU_MAX_CONSTS						(16)
#define FEMU_MAX_MATRICES					(16)

#define NULL_HANDLE							(255)
//#define INVALID_HANDLE						(254)
											
//
//	FEMU_OP		(Operation)
//

#define FEMU_OP_Disable						(0)
#define FEMU_OP_Nop							(1)
#define	FEMU_OP_TexCoords					(2)			// Load TexCoords from In.TexCoords[Arg[0]]
#define FEMU_OP_Diffuse						(3)			// Loads diffuse color 
#define FEMU_OP_Texture						(4)			// Load Texture data
#define FEMU_OP_Add							(5)			// Add Arg[0]+Arg[1]
#define FEMU_OP_AddSmooth					(6)
#define FEMU_OP_Subtract					(7)
#define FEMU_OP_Dot3Biased					(8)
#define FEMU_OP_Dot3						(9)
#define FEMU_OP_AddSigned2X					(10)
#define FEMU_OP_Min							(11)
#define FEMU_OP_Max							(12)
#define FEMU_OP_Exp							(13)
#define FEMU_OP_Cross						(14)
#define FEMU_OP_AddPreMultDiffAlpha			(15)
#define FEMU_OP_Mul							(16)			// Mul Arg[0]*Arg[1]
#define FEMU_OP_Mul2X						(17)			// Mul Arg[0]*Arg[1]*2
#define FEMU_OP_Mul4X						(18)			// Mul Arg[0]*Arg[1]*4
#define FEMU_OP_Mul_Alpha					(19)			// Lerp( Arg[0], Arg[0]*Arg[1], Arg[0].a )
#define	FEMU_OP_BlendDiffuseAlpha			(20)
#define FEMU_OP_DeferredBasePass			(21)			//
#define FEMU_OP_DeferredLight				(22)
#define FEMU_OP_Parallax					(23)		// Shift UV's to simulate parallaxing effect
#define	FEMU_OP_AlphaTest					(24)		// Will early out of a pixel shader if the alphatest fails
#define FEMU_OP_Lerp						(25)
#define FEMU_OP_SetAlpha					(26)		// Override alpha channel with Arg 0
#define	FEMU_OP_Const						(27)
#define	FEMU_OP_ReturnValue					(28)
#define FEMU_OP_FakeBumpMap					(29)
#define FEMU_OP_BumpCubeEnvMap				(30)
#define FEMU_OP_BumpWaterReflection			(31)
#define FEMU_OP_MultiPassLight				(32)
#define FEMU_OP_Bloom						(33)
#define FEMU_OP_ForwardBasePass				(34)		// Base pass for old style forward renderer
#define FEMU_OP_DeferredBasePass_ThermalBS	(35)
#define FEMU_OP_Unused						(36)		// Was shadowvolume
#define FEMU_OP_FogVolumePass0				(37)
#define FEMU_OP_FogVolumePass1				(38)
#define FEMU_OP_HeightFog_Forward			(39)
#define FEMU_OP_HeightFog_Deferred			(40)
#define FEMU_OP_DepthOfField0				(41)
#define FEMU_OP_PixelMotionBlur0			(42)		// Motion blur first pass, initializes velocity buffer
#define FEMU_OP_Unused2						(44)
#define FEMU_OP_DeferredAmbient_Bumps		(45)
#define FEMU_OP_DeferredFog					(46)
#define FEMU_OP_DeferredFSAA				(47)
#define FEMU_OP_DeferredPosOnly				(48)
#define FEMU_OP_ThermalPostPass1			(49)
#define FEMU_OP_ThermalPostPass2			(50)
#define FEMU_OP_DeferredBasePass_Thermal	(51)		// Non bumpshader version of base pass thermal
#define FEMU_OP_TexScaleShift				(52)		// Scales and shifts existing texture coords (in pixel shader, so doesn't rely on number of tex registers)
#define	FEMU_OP_DeferredBasePass_Detail		(53)
#define FEMU_OP_DistanceColor				(54)		// Produces a color based on distance form camera
#define FEMU_OP_Mul2X_Alpha					(55)
#define FEMU_OP_ShadowMapPass				(56)
#define FEMU_OP_1DConvolutionFilter			(57)		// 1d seperable convolution filter
#define FEMU_OP_CalcLum						(58)
#define FEMU_OP_CalcAdaptedLum				(59)
#define FEMU_OP_FinalHDRPass				(60)
#define FEMU_OP_CalcAvg						(61)
#define FEMU_OP_StarBlur					(62)
#define FEMU_OP_StarMerge					(63)
#define FEMU_OP_RestoreZBuffer				(64)
#define FEMU_OP_LightShaft					(65)
#define FEMU_OP_MergeShadows				(66)
#define FEMU_OP_SoftEdge					(67)
#define FEMU_OP_ForwardDistanceFog			(68)		// Distance fog, for forward rendered objects
#define FEMU_OP_TextureProj5				(69)
#define FEMU_OP_GenShadowMapTestResults		(70)
#define FEMU_OP_AmbientOcclusion			(71)
#define FEMU_OP_BlurAmbientOcclusion		(77)
#define FEMU_OP_Foliage						(78)
#define FEMU_OP_HeightFog_ForwardNew		(79)
#define FEMU_OP_AlphaNormalize				(80)
#define FEMU_OP_FinalBloomPass				(81)
#define FEMU_OP_PostProcessor				(82)
#define FEMU_OP_DepthOfField1				(83)
#define FEMU_OP_FinalizeAmbientOcclusion	(84)
#define FEMU_OP_Mask						(85)
#define FEMU_OP_AvgDepthBuffer0			    (86)
#define FEMU_OP_AvgDepthBuffer1			    (87)
#define FEMU_OP_GenerateFocalPlane			(88)
#define FEMU_OP_OverlayBumpDiffuse			(89)
#define FEMU_OP_FakeDirectionalLight		(90)
#define FEMU_OP_EmissiveBloom				(91)
#define FEMU_OP_BinkShader					(92)
#define FEMU_OP_ScreenFillFromTexture		(93)
#define FEMU_OP_ComputeNormalSpec			(94)
#define FEMU_OP_RimLightEffect				(95)
#define FEMU_OP_FinalHDRPass_Emissive		(96)
#define FEMU_OP_FinalHDRPass_Diffuse		(97)
#define FEMU_OP_BloomXBox					(98)
#define FEMU_OP_DeferredBasePass_HiJackOp  (99)
#define FEMU_OP_BumpWaterReflection_NoSNoA	(100)
#define FEMU_OP_DeferredLight_HiJackOp		(101)
#define FEMU_OP_BloomPrePass				(102) // This is only here to make the OfflineShaderCompiler build
#define FEMU_OP_UberPostGather				(103)
#define FEMU_OP_UberPostBlend				(104)
#define FEMU_OP_InteractEmissive			(105)
#define FEMU_OP_DeferredBasePassInteractTint (106)
#define FEMU_OP_DeferredBasePassHoloDuke	(107)
#define FEMU_OP_FXAA				        (108)

//
//	FEMU_TCI	(Texture Coordinate Index)
//

#define FEMU_TCI_TexCoord0					(0)
#define FEMU_TCI_TexCoord1					(1)
#define FEMU_TCI_TexCoord2					(2)
#define FEMU_TCI_TexCoord3					(3)
#define FEMU_TCI_TexCoord4					(4)
#define FEMU_TCI_TexCoord5					(5)
#define FEMU_TCI_TexCoord6					(6)
#define FEMU_TCI_TexCoord7					(7)
#define FEMU_TCI_CameraPos					(8)
#define FEMU_TCI_WorldPos					(9)
#define FEMU_TCI_CameraReflection			(10)
#define FEMU_TCI_CameraNormal				(11)
#define FEMU_TCI_Nop						(12)

//
//	FEMU_TT		(Texture Type)
//

#define FEMU_TT_1D							(0)
#define FEMU_TT_2D							(1)
#define FEMU_TT_3D							(2)
#define FEMU_TT_CUBE						(3)

//
//	FEMU_TF		(Transform Flags)
//

#define FEMU_TF_None						(0)
#define FEMU_TF_Count2						(1)
#define FEMU_TF_Count3						(2)
#define FEMU_TF_Count4						(3)
#define FEMU_TF_Count2_Persp				(4)
#define FEMU_TF_Count3_Persp				(5)
#define FEMU_TF_Count4_Persp				(6)

#define SHADOW_FILTER_NORMAL				(0)
#define SHADOW_FILTER_ATI					(1)
#define SHADOW_FILTER_NVIDIA				(2)
#define SHADOW_FILTER_XBOX					(3)



#endif // FIXED_EMU_TYPES_H
