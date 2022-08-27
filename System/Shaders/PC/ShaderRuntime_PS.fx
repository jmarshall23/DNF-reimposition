//================================================================================
//	ShaderRuntime_PS
//	Copyright 2007 3D Realms, Inc. All Rights Reserved.
//	John Pollard
//================================================================================

#include "Shaders\\PC\\FXAA.fx"

#define ARG(Index)			(Args[ArgStart+Index])
#define VARYARG(Index)		(Args[VaryArgStart+Index])
#define PACK_CAMERA_Z(Z)	((Z)*0.2f)
#define UNPACK_CAMERA_Z(Z)	((Z)*(1.0f/0.2f))
//#define UNPACK_CAMERA_Z(Z)	(Z)

struct PSGlobalInfo
{
    // Optional output colors for additional  RT's
    float4	Color[4];
    float	Depth;
};

static PSGlobalInfo g_PSInfo;// = (PSGlobalInfo)0;

#ifdef WITH_SAMPLERS
//================================================================================
//	SampleTexture
//================================================================================
float4 SampleTexture(const int Index,  float4 TexCoords)
{
	int Type = Samplers[Index].TexType;

	if (Type == FEMU_TT_1D)
		return tex1D(Sampler[Index], TexCoords.x);
	else if (Type == FEMU_TT_2D)
		return tex2D(Sampler[Index], TexCoords.xy);
	else if (Type == FEMU_TT_3D)
		return tex3D(Sampler[Index], TexCoords.xyz);
	else if (Type == FEMU_TT_CUBE)
		return texCUBE(Sampler[Index], TexCoords.xyz);

	return float4(0,0,1,0);		// Return a blue color so it's obvious something went wrong (we can't assert in HLSL!!)
}
#endif

//================================================================================
//	XFormFromStages
//	Generates a 3x3 transform from 3 texture coords.
//================================================================================
float3x3 XFormFromStages(const PS_INPUT In, int BaseStage)
{
#ifdef WITH_TEX_COORDS
	return float3x3(In.Tex[BaseStage+0].xyz,In.Tex[BaseStage+1].xyz,In.Tex[BaseStage+2].xyz);
#else
	return float3x3(float3(1,0,0),float3(0,1,0),float3(0,0,1));
#endif
}

//================================================================================
//	SetupNormalSpec
//	Sets up a normal/spec packed float4
//	If Normal is NULL, a fake normal is returned.
//	If SpecOnly is valid, it is assumed that z must be computed from xy
//	If SpecOnly is not the same as Normal, it is assumed that gloss is stored in SpecOnly.g
//================================================================================
float4 SetupNormalSpec(int Normal, int SpecOnly)
{
	if (Normal == NULL_HANDLE)
		return float4(0,0,1,1);		// Return a fake normal/gloss
		
	float4 NormalTex = Results[Normal];

	//return float4(normalize(NormalTex.xyz*2-1), NormalTex.a);		// Bias and scale normal (normalize it to make it pretty)

	if (SpecOnly != NULL_HANDLE)
	{
		NormalTex.xyz	= float3(NormalTex.a*2-1, NormalTex.y*2-1, 0);
		NormalTex.z		= sqrt(1 - NormalTex.x*NormalTex.x - NormalTex.y*NormalTex.y);
		
		if (SpecOnly != Normal)		// Hacky way to save some args
			NormalTex.a = Results[SpecOnly].g;
	}
	else
		NormalTex.xyz = normalize(NormalTex.xyz*2-1);		// Bias and scale normal (normalize it to make it pretty)
	
	return NormalTex;
}

//================================================================================
//	SetupNormalSpecEx
//	Sets up a normal/spec packed float4
//	If Normal is NULL, a fake normal is returned.
//	If SpecOnly is valid, it is assumed that z must be computed from xy
//	If SpecOnly is not the same as Normal, it is assumed that gloss is stored in SpecOnly.g
//================================================================================
float4 SetupNormalSpecEx(int NormalSamp, int SpecOnlySamp, float2 UV)
{
	if (NormalSamp == NULL_HANDLE)
		return float4(0,0,1,1);		// Return a fake normal/gloss
		
	float4 NormalTex = tex2D( Sampler[NormalSamp], UV );

	//return float4(normalize(NormalTex.xyz*2-1), NormalTex.a);		// Bias and scale normal (normalize it to make it pretty)

	if (SpecOnlySamp != NULL_HANDLE)
	{
		NormalTex.xyz	= float3(NormalTex.a*2-1, NormalTex.y*2-1, 0);
		NormalTex.z		= sqrt(1 - NormalTex.x*NormalTex.x - NormalTex.y*NormalTex.y);
		
		if (SpecOnlySamp != NormalSamp)		// Hacky way to save some args
			NormalTex.a = tex2D( Sampler[SpecOnlySamp], UV ).g;
	}
	else
		NormalTex.xyz = normalize(NormalTex.xyz*2-1);		// Bias and scale normal (normalize it to make it pretty)
	
	return NormalTex;
}

//================================================================================
//	SetupNormalSpec_XForm
//	Same as SetupNormalSpec, but with some extra functionality
//================================================================================
float4 SetupNormalSpec_XForm(const PS_INPUT In, int Normal, int SpecOnly, float SpecScale, const float3x3 XForm, bool Pack)
{
	float4 SpecNormal = SetupNormalSpec(Normal, SpecOnly);
	
	SpecNormal.a *= SpecScale;

	// Put Normal portion in camera space
	SpecNormal.xyz = normalize(mul(SpecNormal.xyz, XForm));
	
	if (Pack)
		SpecNormal.xyz = SpecNormal.xyz*0.5f + 0.5f;
		
	return SpecNormal;
}

//================================================================================
//	SetupNormalSpec_XFormEx
//	Same as SetupNormalSpec, but with some extra functionality
//================================================================================
float4 SetupNormalSpec_XFormEx(const PS_INPUT In, int Normal, int SpecOnly, float SpecScale, const float3x3 XForm, bool Pack, float LerpToZ)
{
	float4 SpecNormal = SetupNormalSpecEx(Normal, SpecOnly, LerpToZ);
	
	SpecNormal.a *= SpecScale;

	// Put Normal portion in camera space
	SpecNormal.xyz = normalize(mul(SpecNormal.xyz, XForm));
	
	if (Pack)
		SpecNormal.xyz = SpecNormal.xyz*0.5f + 0.5f;
		
	return SpecNormal;
}


#define	SMAP_OFS		(1.0f)

//================================================================================
//	FilterShadowPCF
//	Generic Bilinear 2x2 PCF filter
//================================================================================
float FilterShadowPCF(sampler Sampler, float ZCompare, float2 ShadowTex, float2 TexSize, float2 OneOverTexSize)
{
	//return 1;
	
	// Determine the lerp amounts           
	float2 lerps = frac(ShadowTex * TexSize);
		    
	//read in bilerp stamp, doing the shadow checks
	float sourcevals[4];
	sourcevals[0] = (tex2D( Sampler, ShadowTex ).r < ZCompare)? 0.0f: 1.0f;  
	sourcevals[1] = (tex2D( Sampler, ShadowTex + float2(OneOverTexSize.x, 0) ).r < ZCompare)? 0.0f: 1.0f;  
	sourcevals[2] = (tex2D( Sampler, ShadowTex + float2(0, OneOverTexSize.y) ).r < ZCompare)? 0.0f: 1.0f;  
	sourcevals[3] = (tex2D( Sampler, ShadowTex + float2(OneOverTexSize.x, OneOverTexSize.y) ).r < ZCompare)? 0.0f: 1.0f;  
	
	//return sourcevals[0];
        
	// lerp between the shadow values to calculate our light amount
	return lerp(lerp( sourcevals[0], sourcevals[1], lerps.x ),
				lerp( sourcevals[2], sourcevals[3], lerps.x ),
				lerps.y );
}

//================================================================================
//	FilterShadowPCF_NativeATI
//================================================================================
float FilterShadowPCF_NativeATI(sampler Sampler, float ZCompare, float2 ShadowTex, float2 TexSize, float2 OneOverTexSize)
{
	// Determine the lerp amounts           
    float2 pFrac = frac(ShadowTex * TexSize);

	float4 Result = (ZCompare < tex2D( Sampler, ShadowTex ));  

	return lerp(lerp( Result.a, Result.r, pFrac.x ),
				lerp( Result.g, Result.b, pFrac.x ),
				pFrac.y );
}

static const int NUM_POISSON_TAPS = 8;
static const float2 g_Poisson[NUM_POISSON_TAPS] = 
{
    float2( 0.300000f, 0.000000f ),
    float2( 0.527837f,-0.085868f ),
    float2(-0.040088f, 0.536087f ),
    float2(-0.670445f,-0.179949f ),
    float2(-0.419418f,-0.616039f ),
    float2( 0.440453f,-0.639399f ),
    float2(-0.757088f, 0.349334f ),
    float2( 0.574619f, 0.685879f ),
};

#ifdef _XBOX
/*
// Compute the attenuation due to shadowing using 64-tap stratified PCF sampling
float ComputeShadowAttenuationStratified(sampler DepthTex, float3 vShadowCoord, float2 vScreenPos )
{
    // Adjust the LOD for the fetches from the depth texture using aniso filtering 
    // so that it is based on the minimum of the x and y gradients 
    // (instead of the maximum).
    float LOD;
    asm {
        getCompTexLOD2D LOD.x, vShadowCoord.xy, DepthTex, AnisoFilter=max16to1
    };

    const float4 vWeights4 = { 1.0 / 4, 1.0 / 4, 1.0 / 4, 1.0 / 4 };
    const float4 vWeights52 = { 1.0 / 52, 1.0 / 52, 1.0 / 52, 1.0 / 52 };
    
    float Slice = 0.0;
    float TotalAttenuation;

    // Take 4 representative samples, if they are all the same we can skip the rest
    // of the sampling.
    {
        // Fetch our stratified offsets.
        float4 Offset0 = tex3D( OffsetTex, float3( vScreenPos, Slice ) ) * FilterScale;
        Slice += (1.0 / 32.0);
        
        float4 Offset1 = tex3D( OffsetTex, float3( vScreenPos, Slice ) ) * FilterScale;
        Slice += (1.0 / 32.0);

        // Compute offset texture coordintes.
        float2 vShadowCoord1 = vShadowCoord.xy + Offset0.xy;
        float2 vShadowCoord2 = vShadowCoord.xy + Offset0.zw;
        float2 vShadowCoord3 = vShadowCoord.xy + Offset1.xy;
        float2 vShadowCoord4 = vShadowCoord.xy + Offset1.zw;

        float4 Depths;
        
        // Fetch depths
        Depths.x = tex2Dlod( DepthTex, float4( vShadowCoord1.xy, 0.0, LOD ) ).x;
        Depths.y = tex2Dlod( DepthTex, float4( vShadowCoord2.xy, 0.0, LOD ) ).x;
        Depths.z = tex2Dlod( DepthTex, float4( vShadowCoord3.xy, 0.0, LOD ) ).x;
        Depths.w = tex2Dlod( DepthTex, float4( vShadowCoord4.xy, 0.0, LOD ) ).x;

        float4 Attenuation = step( vShadowCoord.z, Depths );
        
        TotalAttenuation = dot( Attenuation, vWeights4 );
    }

    // If all 4 samples are the same we will have exactly 0.0 or 1.0
    if( TotalAttenuation != 0.0 && TotalAttenuation != 1.0 )
    {
        // Readjust total attenuation based on the new number of samples
        TotalAttenuation *= 1.0 / 13.0;
        
        // Fetch the rest of the samples
        for( int i = 1; i < 13; i++ )
        {
            // Fetch our stratified offsets.
            float4 Offset0 = tex3D( OffsetTex, float3( vScreenPos, Slice ) ) * FilterScale;
            Slice += (1.0 / 32.0);

            float4 Offset1 = tex3D( OffsetTex, float3( vScreenPos, Slice ) ) * FilterScale;
            Slice += (1.0 / 32.0);

            // Compute offset texture coordintes.
            float2 vShadowCoord1 = vShadowCoord.xy + Offset0.xy;
            float2 vShadowCoord2 = vShadowCoord.xy + Offset0.zw;
            float2 vShadowCoord3 = vShadowCoord.xy + Offset1.xy;
            float2 vShadowCoord4 = vShadowCoord.xy + Offset1.zw;

            float4 Depths;
            
            // Fetch depths
            Depths.x = tex2Dlod( DepthTex, float4( vShadowCoord1.xy, 0.0, LOD ) ).x;
            Depths.y = tex2Dlod( DepthTex, float4( vShadowCoord2.xy, 0.0, LOD ) ).x;
            Depths.z = tex2Dlod( DepthTex, float4( vShadowCoord3.xy, 0.0, LOD ) ).x;
            Depths.w = tex2Dlod( DepthTex, float4( vShadowCoord4.xy, 0.0, LOD ) ).x;

            float4 Attenuation = step( vShadowCoord.z, Depths );
            
            TotalAttenuation += dot( Attenuation, vWeights52 );
        }
    }
        
    return TotalAttenuation;
}
*/

//================================================================================
//	FilterShadowPCF_NativeXBOX
//================================================================================
float FilterShadowPCF_NativeXBOX(sampler DepthTex, sampler RotationTex, float3 vShadowCoord, float2 vScreenPos, float2 TexSize, float2 OneOverTexSize)
{
#if 0
    // Essentialy random angle for each screen pixel
    float fAngle = (tex2D( RotationTex, vScreenPos*float2(1280,720) ).x * 2.0 - 1.0) * 3.14159;

    float2 FilterScale = OneOverTexSize * 1.5f;
    
    // Rotation and scale
    float4 vRotScale;
    vRotScale.x =  cos(fAngle) * FilterScale.x;
    vRotScale.y =  sin(fAngle) * FilterScale.y;
    vRotScale.z = -sin(fAngle) * FilterScale.x;
    vRotScale.w =  cos(fAngle) * FilterScale.y;

    float2 vShadowCoords[8];
    
    for (int i=0; i<8; i++)
		vShadowCoords[i] = vShadowCoord.xy + (g_Poisson[i].x * vRotScale.xy) + (g_Poisson[i].y * vRotScale.zw);

    float LOD;
    float4 Depths1, Depths2, Depths3;
    asm {
        getCompTexLOD2D LOD.x, vShadowCoord.xy, DepthTex, AnisoFilter=max16to1
        setTexLOD LOD.x

        tfetch2D Depths1.x___, vShadowCoords[0].xy, DepthTex, UseComputedLOD=false, UseRegisterLOD=true
        tfetch2D Depths1._x__, vShadowCoords[1].xy, DepthTex, UseComputedLOD=false, UseRegisterLOD=true
        tfetch2D Depths1.__x_, vShadowCoords[2].xy, DepthTex, UseComputedLOD=false, UseRegisterLOD=true
        tfetch2D Depths1.___x, vShadowCoords[3].xy, DepthTex, UseComputedLOD=false, UseRegisterLOD=true

        tfetch2D Depths2.x___, vShadowCoords[4].xy, DepthTex, UseComputedLOD=false, UseRegisterLOD=true
        tfetch2D Depths2._x__, vShadowCoords[5].xy, DepthTex, UseComputedLOD=false, UseRegisterLOD=true
        tfetch2D Depths2.__x_, vShadowCoords[6].xy, DepthTex, UseComputedLOD=false, UseRegisterLOD=true
        tfetch2D Depths2.___x, vShadowCoords[7].xy, DepthTex, UseComputedLOD=false, UseRegisterLOD=true
    };
    
    float4 Attenuation1 = step( vShadowCoord.z, Depths1 );
    float4 Attenuation2 = step( vShadowCoord.z, Depths2 );
    
    float4 vWeights = { 1.0 / NUM_POISSON_TAPS, 1.0 / NUM_POISSON_TAPS, 
                        1.0 / NUM_POISSON_TAPS, 1.0 / NUM_POISSON_TAPS };
    
    return (dot( Attenuation1, vWeights ) + dot( Attenuation2, vWeights ));
#else

	float3 ShadowTex = vShadowCoord;

    // Fetch the bilinear filter fractions and four samples from the depth texture. The LOD for the 
    // fetches from the depth texture is computed using aniso filtering so that it is based on the 
    // minimum of the x and y gradients (instead of the maximum).  
    float4 Weights;
    float LOD;
    float4 SampledDepth;
    asm
    {
        getCompTexLOD2D LOD.x, vShadowCoord.xy, DepthTex, AnisoFilter=max16to1
        setTexLOD LOD.x

        tfetch2D SampledDepth.x___, ShadowTex.xy, DepthTex, OffsetX = -0.5, OffsetY = -0.5, UseComputedLOD=false, UseRegisterLOD=true
        tfetch2D SampledDepth._x__, ShadowTex.xy, DepthTex, OffsetX =  0.5, OffsetY = -0.5, UseComputedLOD=false, UseRegisterLOD=true
        tfetch2D SampledDepth.__x_, ShadowTex.xy, DepthTex, OffsetX = -0.5, OffsetY =  0.5, UseComputedLOD=false, UseRegisterLOD=true
        tfetch2D SampledDepth.___x, ShadowTex.xy, DepthTex, OffsetX =  0.5, OffsetY =  0.5, UseComputedLOD=false, UseRegisterLOD=true

        getWeights2D Weights, ShadowTex.xy, DepthTex, MagFilter=linear, MinFilter=linear, UseComputedLOD=false, UseRegisterLOD=true
    };

    Weights = float4( (1-Weights.x)*(1-Weights.y), Weights.x*(1-Weights.y), (1-Weights.x)*Weights.y, Weights.x*Weights.y );
        
    float4 Attenuation = step( ShadowTex.z, SampledDepth );
    // float4 Attenuation = step( ZCompare, SampledDepth );
    
    return dot( Attenuation, Weights );
#endif
}
#endif

// Compute the attenuation due to shadowing using 8-tap rotated poisson disc PCF sampling
float FilterShadowPCF_NativeNVIDIA_POISSON(sampler DepthTex, sampler RotationTex, float3 vShadowCoord, float2 vScreenPos, float2 TexSize, float2 OneOverTexSize)
{
    // Essentialy random angle for each screen pixel
    float fAngle = (tex2D( RotationTex, vScreenPos*float2(1280,720) ).x * 2.0 - 1.0) * 3.14159;

    float2 FilterScale = OneOverTexSize * 1.5f;
    
    // Rotation and scale
    float4 vRotScale;
    vRotScale.x =  cos(fAngle) * FilterScale.x;
    vRotScale.y =  sin(fAngle) * FilterScale.y;
    vRotScale.z = -sin(fAngle) * FilterScale.x;
    vRotScale.w =  cos(fAngle) * FilterScale.y;

    float2 vShadowCoords[8];
    
    //for (int i=0; i<8; i++)
    for (int i=0; i<4; i++)
		vShadowCoords[i] = vShadowCoord.xy + (g_Poisson[i].x * vRotScale.xy) + (g_Poisson[i].y * vRotScale.zw);
        
    float Total = 0;

#if 1
	// Do 4 at a time
	for (int j=0; j<1; j++)
	{
	    float4 Depths;
	    
		Depths.x = tex2Dproj( DepthTex, float4(vShadowCoords[0+j*4].xy, vShadowCoord.z, 1)).r;  
		Depths.y = tex2Dproj( DepthTex, float4(vShadowCoords[1+j*4].xy, vShadowCoord.z, 1)).r;  
		Depths.z = tex2Dproj( DepthTex, float4(vShadowCoords[2+j*4].xy, vShadowCoord.z, 1)).r;  
		Depths.w = tex2Dproj( DepthTex, float4(vShadowCoords[3+j*4].xy, vShadowCoord.z, 1)).r;  
		
		float4 Attenuation1 = Depths;
        
		Total += dot( Attenuation1, (float4)(1.0f/4.0f));
	}
#else
	int NumSamples = 2;
	
	for (int j=0; j<NumSamples; j++)
		Total += tex2Dproj( DepthTex, float4(vShadowCoords[j].xy, vShadowCoord.z, 1)).r;  
	
	Total *= (1.0f/NumSamples);
#endif
	
	return Total;
}

//================================================================================
//	FilterShadowPCF_NativeATI_4X4
//================================================================================
float FilterShadowPCF_NativeATI_4X4(sampler Sampler, float ZCompare, float2 ShadowTex, float2 TexSize, float2 OneOverTexSize)//, float2 ddist_duv)
{
    // Code from ATI SDK:
    float4	ShadowMapVals[4];
    float4	ShadowMapWeights[4];
    float2	QuadOffsets[4]={ {-1.0, -1.0}, { 1.0, -1.0}, {-1.0,  1.0}, { 1.0,  1.0} };
                        
    float2 TexOffsets[4];
    
    // Fetch 4 2x2 quads
    for (int i=0; i<4; i++)
    {
	    TexOffsets[i] = (OneOverTexSize * QuadOffsets[i]);
	    ShadowMapVals[i] = tex2D(Sampler, ShadowTex + TexOffsets[i] );
	} 
	    
    float2 pFrac = frac(ShadowTex * TexSize);

    ShadowMapWeights[0] = float4( 1,			1-pFrac.x,	1,			1-pFrac.x );
    ShadowMapWeights[1] = float4( pFrac.x,		1,			pFrac.x,	1 );
    ShadowMapWeights[2] = float4( 1,			1-pFrac.x,	1,			1-pFrac.x);
    ShadowMapWeights[3] = float4( pFrac.x,		1,			pFrac.x,	1 );

    ShadowMapWeights[0] *= float4(1-pFrac.y,	1,			1,			1-pFrac.y  );
    ShadowMapWeights[1] *= float4(1-pFrac.y,	1,			1,			1-pFrac.y  );
    ShadowMapWeights[2] *= float4(1,			pFrac.y,	pFrac.y,	1          );
    ShadowMapWeights[3] *= float4(1,			pFrac.y,	pFrac.y,	1          );

    float PercentInLight = 0;
    
    for (int j=0; j<4; j++)
    {
		float4 InLight = (ZCompare < ShadowMapVals[j]);
		
		PercentInLight += dot(InLight, ShadowMapWeights[j]);
	}
	
    // Sum of weights is 9, since border taps are bilinearly filtered
    return ( (1.0f/9.0f) * PercentInLight);
}

//================================================================================
//	FilterShadowPCF_NativeNVIDIA
//================================================================================
float FilterShadowPCF_NativeNVIDIA(sampler Sampler, float ZCompare, float2 ShadowTex, float2 TexSize, float2 OneOverTexSize)
{
	return tex2Dproj( Sampler, float4(ShadowTex, ZCompare, 1)).r;  
}

//================================================================================
//	FilterShadow
//================================================================================
float FilterShadow(sampler Sampler, sampler RotationTex, float ZCompare, float2 ShadowTex, float2 TexSize, float2 ScreenSpacePos, int KernalSize, int Mode)
{	
	float	Result			= 0.0f;
	float2	OneOverTexSize	= 1.0f/TexSize;
	
#ifdef _XBOX
	if (Mode == SHADOW_FILTER_XBOX)
		return FilterShadowPCF_NativeXBOX(Sampler, RotationTex, float3(ShadowTex,ZCompare), ScreenSpacePos, TexSize, OneOverTexSize);
	
	return 1;
#else
	if (Mode == SHADOW_FILTER_NVIDIA && KernalSize >= 2)
		return FilterShadowPCF_NativeNVIDIA_POISSON(Sampler, RotationTex, float3(ShadowTex,ZCompare), ScreenSpacePos, TexSize, OneOverTexSize);

	if (Mode == SHADOW_FILTER_ATI && KernalSize >= 2)
		return FilterShadowPCF_NativeATI_4X4(Sampler, ZCompare, ShadowTex, TexSize, OneOverTexSize);//, ddist_duv);

	int	Mid = (KernalSize-1)/2;
	
	for (int y=-Mid; y<(KernalSize-Mid); y++)
	{
		float YOfs = (float)y*OneOverTexSize.y;
		
		for (int x=-Mid; x<(KernalSize-Mid); x++)
		{
			float XOfs = (float)x*OneOverTexSize.x;
			
			float2 ShadowTexOfs = ShadowTex + float2(XOfs, YOfs);
		
			if (Mode == SHADOW_FILTER_NORMAL)
				Result += FilterShadowPCF(Sampler, ZCompare, ShadowTexOfs, TexSize, OneOverTexSize);
			else if (Mode == SHADOW_FILTER_ATI)
				Result += FilterShadowPCF_NativeATI(Sampler, ZCompare, ShadowTexOfs, TexSize, OneOverTexSize);
			else if (Mode == SHADOW_FILTER_NVIDIA)
				Result += FilterShadowPCF_NativeNVIDIA(Sampler, ZCompare, ShadowTexOfs, TexSize, OneOverTexSize);
		}
	}
	
	Result /= (KernalSize*KernalSize);
	
	return Result;
#endif
}

//================================================================================
//	HandleVarianceShadow
//================================================================================
half HandleVarianceShadow(int TexIndex, float3 CubePos, float Shift, float Scale, float Bias, bool Clamp, bool bUseOpacity, float Opacity)
{
	half2	ShadowVal	= texCUBE(Sampler[TexIndex], CubePos).xy;
	half	ScaledDist	= (length(CubePos)-Shift) / Scale;		// - Near / (Far-Near)
	half	Shadow		= (ShadowVal.x < (ScaledDist+Bias)) ? 0.0f: 1.0f;
	
#if 0
	// ESM test code (expo shadow maps)
	Shadow = saturate(exp(5.0f*(ShadowVal.x-ScaledDist)));
	//Shadow = saturate(ShadowVal.x-exp(ScaledDist));

	return Shadow;
#endif

	//return Shadow;
		
#if 1
	// Apply variance algo
	half Bias2 = Bias*0.5f;

	half E_x2			= ShadowVal.y;
	half Ex_2			= ShadowVal.x * ShadowVal.x;
	half variance		= min(max(E_x2 - Ex_2, 0) + Bias2, 1);
	half m_d			= (ShadowVal.x - ScaledDist);
	half p_max			= variance / (variance + m_d * m_d);
#else
	half p_max			= Shadow;
#endif
		
#if 1		// This is a hacky fix for the problem variance shadows have with depth complexity causing artifacts
	if (Clamp)
	{
		#define SHADOW_CLAMP		(0.65f)

		Shadow = saturate(Shadow - SHADOW_CLAMP);
		Shadow *= 1.0f/(1.0f-SHADOW_CLAMP);
	}
#endif

#if 1
	if (bUseOpacity)
		Shadow = lerp(1.0f, Shadow, Opacity);
#endif

	return max(Shadow, p_max);
}

#ifdef WITH_TEX_COORDS
//================================================================================
//	GenUV
//================================================================================
float4 GenUV(const PS_INPUT In, int TexIndex)
{
	float4 Tex = In.Tex[TexIndex];
	
	if (TexCoordOps[TexIndex].TransformFlag == FEMU_TF_Count2_Persp)
		Tex = float4(Tex.x / Tex.y, 1.0f, 1.0f, 1.0f);
	else if (TexCoordOps[TexIndex].TransformFlag == FEMU_TF_Count3_Persp)
		Tex = float4(Tex.x / Tex.z, Tex.y / Tex.z, 1.0f, 1.0f);
	else if (TexCoordOps[TexIndex].TransformFlag == FEMU_TF_Count4_Persp)
		Tex = float4(Tex.x / Tex.w, Tex.y / Tex.w, Tex.z / Tex.w, 1.0f);
	
	return Tex;
}

//================================================================================
//	EdgeDetector
//================================================================================
float EdgeDetector(const PS_INPUT In, int TexIndex, const sampler NormalTex, sampler DepthTex, bool bUseNormals, bool bUseDepth, half4 Clips, half4 Weights)
{

	half NormalE	= 1.0f;
	half DepthE		= 1.0f;
	
	if (bUseNormals)
	{
		half3 NormalC = tex2D(NormalTex, In.Tex[TexIndex+0]).xyz*2-1;
		half4 NormalD;
	
		NormalD.x = dot(NormalC, (half3)tex2D(NormalTex, In.Tex[TexIndex+1]).xyz*2-1);
		NormalD.y = dot(NormalC, (half3)tex2D(NormalTex, In.Tex[TexIndex+2]).xyz*2-1);
		NormalD.z = dot(NormalC, (half3)tex2D(NormalTex, In.Tex[TexIndex+3]).xyz*2-1);
		NormalD.w = dot(NormalC, (half3)tex2D(NormalTex, In.Tex[TexIndex+4]).xyz*2-1);
	
		NormalD -= Clips.x;
		NormalD = step(0, NormalD);
	
		NormalE = saturate(dot(NormalD, Weights.x));
	}
	
	if (bUseDepth)
	{
		float4	DepthC = (float4)tex2D(DepthTex, In.Tex[TexIndex+0]).r;
		float4	DepthD;
	
		DepthD.x = tex2D(DepthTex, In.Tex[TexIndex+1]).r + tex2D(DepthTex, In.Tex[TexIndex+2]).r;
		DepthD.y = tex2D(DepthTex, In.Tex[TexIndex+3]).r + tex2D(DepthTex, In.Tex[TexIndex+4]).r;
		DepthD.z = tex2D(DepthTex, In.Tex[TexIndex+5]).r + tex2D(DepthTex, In.Tex[TexIndex+5].zw).r;
		DepthD.w = tex2D(DepthTex, In.Tex[TexIndex+6]).r + tex2D(DepthTex, In.Tex[TexIndex+6].zw).r;
	
		DepthD = abs(DepthC*2 - DepthD) - Clips.y;
		DepthD = step(DepthD, 0);
	
		DepthE = saturate(dot(DepthD, (float4)Weights.y));
	}
		
	return (1-DepthE*NormalE)*Weights.z;
}
#endif

float3 AddNormals(float3 Normal1, float3 Normal2)
{
	// Faster, but not as accurate
	Normal1.x /= max(Normal1.z, 0.0001f);
	Normal1.y /= max(Normal1.z, 0.0001f);
	Normal2.x /= max(Normal2.z, 0.0001f);
	Normal2.y /= max(Normal2.z, 0.0001f);
	
	return normalize(float3(Normal1.x + Normal2.x, Normal1.y + Normal2.y, 1.0f));
}

float4 GetDiffuse(const PS_INPUT In)
{
	#if (bHasVertexColor)
		return In.Diffuse;
	#elif (bVertexLighting)
		return In.Diffuse;
	#else
		return float4(1,1,1,1);
	#endif
}

#define swap(a, b)	if (1)	{ float Temp = a; a = b; b = Temp; }


float ComputeDepthOfField( float Depth, float FocalDist, float FocalRangeMin, float FocalRangeMax, half BlurAmount, half Power )
{
    float Result;
	
	if( Depth < FocalDist )
	    return (1-pow(1-saturate((FocalDist - Depth)*FocalRangeMin),Power))*BlurAmount;
	else
	    return (1-pow(1-saturate((Depth - FocalDist)*FocalRangeMax),Power))*BlurAmount;
}

half4 ComputeOverlayBumpColor( half4 Diffuse, half4 SecondDiffuse, const int SecondCube, half3 SecondCubeDiffuse, half Alpha )
{
    //return Diffuse;
    //return half4(SecondCubeDiffuse, Diffuse.a);
    //return half4( lerp( Diffuse.rgb, SecondCubeDiffuse, SecondDiffuse.a ), Diffuse.a );
    
    half3 Result = lerp(Diffuse.rgb, SecondDiffuse.rgb, SecondDiffuse.a);
    
    //return float4(Result, Diffuse.a);
    
    if( SecondCube != NULL_HANDLE )
        Result = lerp(Result, (Result + SecondCubeDiffuse) * 0.5f, SecondDiffuse.a);
     
    return half4( lerp(Diffuse, Result, Alpha), Diffuse.a );
}

half3 GetSpecExpAndBloomScale( 	int	InNormal, 
								int	InSpecOnly, 
								half2 InBaseCoords,
								int InOverlaySpecOnly,
								int	InOverlayDiffuse,
								int	InOverlayNormal,
								half4		InOverlayConst1,
								half4		InOverlayConst2,
								inout float3x3 TexToCamera,
								inout half SpecScale,
								inout half4 Normal,
								inout half4 OverlayDiffuse,
								inout half4 OverlayNormal,
								inout half	SpecExp,
								inout half BloomScale)
{
	OverlayDiffuse  = tex2D( Sampler[ InOverlayDiffuse ], InBaseCoords * InOverlayConst1.xy );
    OverlayNormal   = SetupNormalSpecEx(InOverlayNormal, InOverlaySpecOnly, InBaseCoords * InOverlayConst1.xy );
    
    Normal          = SetupNormalSpec(InNormal, InSpecOnly);
    	    
    OverlayNormal   = lerp( Normal, OverlayNormal, OverlayDiffuse.a ); // Lerp from regular N to OverlayN based off OverlayDiffuse.a
    
    Normal.xyz      = normalize( lerp( Normal.xyz, normalize(OverlayNormal.xyz), InOverlayConst1.z ));
    Normal.xyz      = mul(Normal.xyz, TexToCamera).xyz;
    Normal.w        = lerp( Normal.w, OverlayNormal.w, InOverlayConst1.z );
    
    half OverlaySpecExp	    = InOverlayConst2.x;
	half OverlayBloomScale  = InOverlayConst2.y;
	half OverlaySpecScale   = InOverlayConst2.z;
	
	half3 spec_exp_bloom_scale;
	
	spec_exp_bloom_scale.x     = lerp(SpecExp,     OverlaySpecExp,     OverlayDiffuse.a);
	spec_exp_bloom_scale.y  = lerp(BloomScale,  OverlayBloomScale,  OverlayDiffuse.a);
	spec_exp_bloom_scale.z   = lerp(SpecScale,   OverlaySpecScale,   OverlayDiffuse.a);
	
	return spec_exp_bloom_scale;
}

float4 GetTex2DProj(sampler2D Sampler, float4 tex_coords)
{
	float4 result;
#ifdef _XBOX
	float2 recip;
	asm 
	{
		rcp recip.x, tex_coords.w
		mul recip.xy, recip.xx, tex_coords.xy
		tfetch2D result, recip.xy, Sampler
	};
#endif	
	return result;
}

float4 GetTex2D(sampler2D Sampler, float4 tex_coords)
{
	float4 result;
#ifdef _XBOX	
	asm 
	{
		tfetch2D result, tex_coords.xy, Sampler
	};
#endif	
	return result;
}


float4 NvStereoToMonoClipPos(float4 InStereoClipPos, int InNvStereoTex)
{
#ifdef WITH_NV_STEREO
	if( InNvStereoTex == NULL_HANDLE )
	{
		return InStereoClipPos;
	}
	
	// stereoParams.x is separation
	// stereoParams.y is convergence
	float2 stereoParams = tex2D(Sampler[InNvStereoTex], float2(1.0f / 16, 0.5)).xy;
	float4 OutMonoClipPos = InStereoClipPos;
	
	// Invert the stereo transform, which is performed automatically at the bottom of the vertex shader.
	// The stereo transform is StereoClipPos.x += (Separation * (StereoClipPos.w - Convergence));
	OutMonoClipPos.x -= (stereoParams.x * (InStereoClipPos.w - stereoParams.y));
	
	return OutMonoClipPos;
#else
	return InStereoClipPos;
#endif
}

float4 NvMonoToStereoClipPos(float4 InMonoClipPos, int InNvStereoTex)
{
#ifdef WITH_NV_STEREO
	if( InNvStereoTex == NULL_HANDLE )
	{
		return InMonoClipPos;
	}
	
	// stereoParams.x is separation
	// stereoParams.y is convergence
	float2 stereoParams = tex2D(Sampler[InNvStereoTex], float2(1.0f / 16, 0.5)).xy;
	float4 OutStereoClipPos = InMonoClipPos;
	
	// Perform the stereo transform for shaders that skipped it. 
	// The stereo transform is StereoClipPos.x += (Separation * (StereoClipPos.w - Convergence));
	OutStereoClipPos.x += (stereoParams.x * (InMonoClipPos.w - stereoParams.y));

	return OutStereoClipPos;
#else
	return InMonoClipPos;
#endif
}

float4 NvFixTexCoord(float4 DeferredTexCoords, int InNvStereoTex)
{
#ifdef WITH_NV_STEREO
	if( InNvStereoTex == NULL_HANDLE )
	{
		return DeferredTexCoords;
	}

	// DeferredTexCoords are stored as (2*clipX, 2*clipY, nonsense, 2*clipW). We need
	// to convert that back to (clipX, clipY, nonsense, clipW) to correct for stereo.
	// This can be done merely by subtracting 0.5*clipW from all components.
	float eyeDepth = DeferredTexCoords.w / 2;
	float4 monoClipSpacePos = DeferredTexCoords - eyeDepth;
	return NvMonoToStereoClipPos(monoClipSpacePos, InNvStereoTex) + eyeDepth;
#else
	return DeferredTexCoords;
#endif
}

float4 NvFixPerspectiveTex(float4 PerspectiveTexCoord, float eyeSpaceDepth, int InNvStereoTex)
{
#ifdef WITH_NV_STEREO
	if( InNvStereoTex == NULL_HANDLE )
	{
		return PerspectiveTexCoord;
	}

	return NvMonoToStereoClipPos(float4(PerspectiveTexCoord.xyz, eyeSpaceDepth / 2), InNvStereoTex);
#else
	return PerspectiveTexCoord;
#endif
}


half4 DeferredLight_GetLightData(float4 tex_coords,
								 float4 tex_coords2,
								 int		InCoords,
								 int		InPos, 
							     int		InNormal,
							     int		InDiffuse,
							     int		InNvStereoTex,
								 out float4	CameraSpacePos,
								 out half3	Diffuse,
								 out half	SpecularPower,
								 out float2 ScreenSpace,
								 out float3	VertToLight,
								 out half3	VertToCamera,
								 out half3	Half
)
{
	int		Index			= InCoords;

	// Ensure that we are sampling G-Buffer from the correct location under stereo
	tex_coords = NvFixTexCoord(tex_coords, InNvStereoTex);
	tex_coords2 = NvMonoToStereoClipPos(tex_coords2, InNvStereoTex);


#ifdef _XBOX

	float4 screen_space;
	float4 recip;
	half4 CameraNormal;
	asm
	{
		// Get ScreenSpace
		rcp recip.x, tex_coords.w
		mul screen_space.xy, recip.xx, tex_coords.xy
		
		tfetch2D CameraSpacePos, screen_space.xy, Sampler[InPos], FetchValidOnly=true
		tfetch2D CameraNormal, screen_space.xy, Sampler[InNormal], FetchValidOnly=true
		tfetch2D Diffuse.xyz, screen_space.xy, Sampler[InDiffuse], FetchValidOnly=true
	};

#else
	// Get camera space pos
	CameraSpacePos	= tex2Dproj(Sampler[InPos], tex_coords);		// Sample camera space position
	half4 CameraNormal	= tex2Dproj(Sampler[InNormal], tex_coords);		// Sample camera space normal
	Diffuse			= tex2Dproj(Sampler[InDiffuse], tex_coords);

#endif	
	
	SpecularPower	= max(CameraSpacePos.g, 0.01f);
	
	// Unpack camera space normal
	CameraNormal.rgb = CameraNormal.rgb*2-1;
	CameraNormal.rgb = normalize((half3)CameraNormal.rgb);

	// Unpack camera space position
	ScreenSpace = (tex_coords2.xy / tex_coords2.w);
	
	CameraSpacePos.z = UNPACK_CAMERA_Z(CameraSpacePos.r);
	CameraSpacePos.xy = ScreenSpace * CameraSpacePos.z;
	CameraSpacePos.x = NvStereoToMonoClipPos(CameraSpacePos.xyzz, InNvStereoTex).x;

	// Do actual math for normalizing (seems faster than LUT's)
	VertToLight		= normalize(Lights[0].Location.xyz - CameraSpacePos.xyz);
	VertToCamera	= normalize(-CameraSpacePos.xyz);
	Half			= normalize(VertToCamera + (half3)VertToLight);
	
	return CameraNormal;
}

half DeferredLight_GetLightSpacePos(int InConst,
								    int InAtten,
								    
								    half4	CameraNormal,
									float4 CameraSpacePos,
									float3	VertToLight,
									out half Atten)
{
	// Transform the camera space position into lightspace so we can sample atten map
	float4 LocalLightPos	= mul(half4(CameraSpacePos.xyz, 1), Lights[0].LocalToLightAtten3D);
	
	half NDotL = dot(CameraNormal.xyz, VertToLight);
	
	half SelfShadow		= (NDotL > 0) ? 1 : 0;
	
	Atten = tex3D(Sampler[InAtten], LocalLightPos).b * Consts[InConst].w * SelfShadow;
	
	return NDotL;
}

void DeferredLight_GetSpotColor(int InFilter, float4 CameraSpacePos,float zNear, inout float4 final_color)
{
	half4 LightSpaceTex = mul(half4(CameraSpacePos.xyz, 1), Lights[0].LocalToFilter);
			
	if (LightSpaceTex.z >= zNear)
		final_color.rgba *= tex2Dproj(Sampler[InFilter], LightSpaceTex).rgbr;
	else
		final_color.rgba = 0.0f;	
}

void DeferredLight_HandleDirShadowMap(int InConst1, 
									  int InConst2, 
									  int InNumSamples, 
									  int ShadowFilterMode, 
									  int InDirShadowMap, 
									  int InRotMap, 
									  int InConst, 
									  float2 ScreenSpace, 
									  float4 CameraSpacePos,
									  inout float4 final_color)
{
	
	// #define SHADOW_END1		(Consts[InConst2].x)
	// #define SHADOW_END2		(Consts[InConst2].y)
	
	if (CameraSpacePos.z < (Consts[InConst2].y))
	{
		float3	Splits		= Consts[InConst1].xyz;
		float3  ZResults	= (Splits < CameraSpacePos.z);
		int		MatrixIndex	= dot(ZResults, 1.0f);	
	
		// SHADOW_MAP
		float3 ShadowScreen = mul(half4(CameraSpacePos.xyz, 1), CameraToShadowMap[MatrixIndex]);
		
		// No need to divide, we know the matrix is ortho
		float2 ShadowProj = ShadowScreen.xy;

		float ScaledDist = (ShadowScreen.z-NearFar[MatrixIndex].x) / NearFar[MatrixIndex].y;
	
		float Shadow = FilterShadow(Sampler[InDirShadowMap], Sampler[InRotMap], ScaledDist-Consts[InConst].x, ShadowProj, NearFar[0].zw, ScreenSpace, InNumSamples, ShadowFilterMode);
	
		float FadeAlpha = max(CameraSpacePos.z-(Consts[InConst2].x),0) / ((Consts[InConst2].y)-(Consts[InConst2].x));
		
		FadeAlpha += (1-Consts[InConst2].z);
		
		Shadow = lerp(Shadow, 1, saturate(FadeAlpha));

		final_color.rgba *= Shadow;		
	}
}


float3 GetCubeSpec(half3 Half, half4 CameraNormal, int InCubeSpec, int InSpecConst)
{
	float3 Reflected = reflect(-Half, CameraNormal.xyz);
	float3 WorldReflected = mul(half4(Reflected.xyz, 1), (half3x3)Lights[0].LocalToFilter).rgb;
	float3 CubeSpec = texCUBE(Sampler[InCubeSpec], WorldReflected).rgbr;
	CubeSpec *= Consts[InSpecConst].xyz;

	return CubeSpec;
}

void LightWater(const int loop_index, 
				const int arg_0, 
				const int arg_1,
				const float3 CameraSpacePos,
				const float3 CameraNormal,
				const half3 VertToCamera,
				const float SpecularExp, 
				const float SpecularScale,
				inout float3 Diffuse,
				inout float3 Specular)
{
	const int		Index			= loop_index*2;
	const half3	LocalLightPos	= mul(half4(CameraSpacePos.xyz, 1), Lights[loop_index].LocalToLightAtten3D);
	const float3	VertToLight		= normalize(Lights[loop_index].Location.xyz - CameraSpacePos.xyz);
	const half3	Half			= normalize(VertToCamera + (half3)VertToLight);

	const half	NDotL			= dot(CameraNormal.xyz, VertToLight);
	const half	SelfShadow		= (NDotL > 0) ? 1 : 0;
	
	// Compute attentuation if this is not a directional light.
	half Atten = SelfShadow;
	if( arg_0 == 0 )
		Atten *= tex3D(Sampler[arg_1], LocalLightPos).b;

	const float3 PreMult = Lights[loop_index].Color.rgb * Atten * 2.0f;
	
	// Diffuse
	Diffuse = saturate(PreMult * NDotL + Diffuse);
	
	// Get specular power
	half	NDotH			= saturate(dot(CameraNormal.xyz, Half));
	NDotH = pow(NDotH, SpecularExp);
	
	// Specular
	Specular = saturate(PreMult * NDotH * SpecularScale + Specular);
}

float ComputeUberDepthOfField
(
  float Depth, 
  float FocalDist, 
  float FocalRangeMin, 
  float FocalRangeMax, 
  float BlurAmount, 
  float BlurPower 
)
{
    float delta;
    if (Depth < FocalDist)
        delta = (FocalDist - Depth) * FocalRangeMin;
    else
        delta = (Depth - FocalDist) * FocalRangeMax;

	return (1-pow(1-saturate(delta), BlurPower)) * BlurAmount;
}

// jmarshall - icecoldduke - cas
float Min3(float x, float y, float z)
{
	return min(x, min(y, z));
}

float Max3(float x, float y, float z)
{
	return max(x, max(y, z));
}


float rcp(float v)
{
	return 1.0 / v;
}

float3 ContastAdaptiveSharpen(const int bufferId, float2 diffuseST, float2 OneOverViewportSize)
{
	float2 texcoord = diffuseST.xy;
	float Sharpness = 1;


	// fetch a 3x3 neighborhood around the pixel 'e',
	//  a b c
	//  d(e)f
	//  g h i
  //  int2 bufferSize = textureSize2D(diffuseImage);
	float pixelX = OneOverViewportSize.x;
	float pixelY = OneOverViewportSize.y;
	
	float3 a = tex2D(Sampler[bufferId], texcoord + float2(-pixelX, -pixelY)).rgb;
	float3 b = tex2D(Sampler[bufferId], texcoord + float2(0.0, -pixelY)).rgb;
	float3 c = tex2D(Sampler[bufferId], texcoord + float2(pixelX, -pixelY)).rgb;
	float3 d = tex2D(Sampler[bufferId], texcoord + float2(-pixelX, 0.0)).rgb;
	float3 e = tex2D(Sampler[bufferId], texcoord).rgb;
	float3 f = tex2D(Sampler[bufferId], texcoord + float2(pixelX, 0.0)).rgb;
	float3 g = tex2D(Sampler[bufferId], texcoord + float2(-pixelX, pixelY)).rgb;
	float3 h = tex2D(Sampler[bufferId], texcoord + float2(0.0, pixelY)).rgb;
	float3 i = tex2D(Sampler[bufferId], texcoord + float2(pixelX, pixelY)).rgb;

	// Soft min and max.
	//  a b c             b
	//  d e f * 0.5  +  d e f * 0.5
	//  g h i             h
	// These are 2.0x bigger (factored out the extra multiply).
	float mnR = Min3(Min3(d.r, e.r, f.r), b.r, h.r);
	float mnG = Min3(Min3(d.g, e.g, f.g), b.g, h.g);
	float mnB = Min3(Min3(d.b, e.b, f.b), b.b, h.b);

	float mnR2 = Min3(Min3(mnR, a.r, c.r), g.r, i.r);
	float mnG2 = Min3(Min3(mnG, a.g, c.g), g.g, i.g);
	float mnB2 = Min3(Min3(mnB, a.b, c.b), g.b, i.b);
	mnR = mnR + mnR2;
	mnG = mnG + mnG2;
	mnB = mnB + mnB2;

	float mxR = Max3(Max3(d.r, e.r, f.r), b.r, h.r);
	float mxG = Max3(Max3(d.g, e.g, f.g), b.g, h.g);
	float mxB = Max3(Max3(d.b, e.b, f.b), b.b, h.b);

	float mxR2 = Max3(Max3(mxR, a.r, c.r), g.r, i.r);
	float mxG2 = Max3(Max3(mxG, a.g, c.g), g.g, i.g);
	float mxB2 = Max3(Max3(mxB, a.b, c.b), g.b, i.b);
	mxR = mxR + mxR2;
	mxG = mxG + mxG2;
	mxB = mxB + mxB2;

	// Smooth minimum distance to signal limit divided by smooth max.
	float rcpMR = rcp(mxR);
	float rcpMG = rcp(mxG);
	float rcpMB = rcp(mxB);

	float ampR = saturate(min(mnR, 2.0 - mxR) * rcpMR);
	float ampG = saturate(min(mnG, 2.0 - mxG) * rcpMG);
	float ampB = saturate(min(mnB, 2.0 - mxB) * rcpMB);

	// Shaping amount of sharpening.
	ampR = sqrt(ampR);
	ampG = sqrt(ampG);
	ampB = sqrt(ampB);

	// Filter shape.
	//  0 w 0
	//  w 1 w
	//  0 w 0  
	float peak = -rcp(lerp(8.0, 5.0, saturate(Sharpness)));

	float wR = ampR * peak;
	float wG = ampG * peak;
	float wB = ampB * peak;

	float rcpWeightR = rcp(1.0 + 4.0 * wR);
	float rcpWeightG = rcp(1.0 + 4.0 * wG);
	float rcpWeightB = rcp(1.0 + 4.0 * wB);

	return float3(saturate((b.r * wR + d.r * wR + f.r * wR + h.r * wR + e.r) * rcpWeightR),
		saturate((b.g * wG + d.g * wG + f.g * wG + h.g * wG + e.g) * rcpWeightG),
		saturate((b.b * wB + d.b * wB + f.b * wB + h.b * wB + e.b) * rcpWeightB));
}

// jmarshall end

// jmarshall - parallax mapping
// https://learnopengl.com/Advanced-Lighting/Parallax-Mapping
float2 GetParralaxOffset(int bumptex, float2 texCoords, float3 viewDir, float height_scale)
{
#if 0
	float height = tex2D(Sampler[bumptex], texCoords).g;
	float2 p = viewDir.xy / viewDir.z * (height * height_scale);
	return texCoords - p;

#else
	// number of depth layers
	const float numLayers = 10;

	// calculate the size of each layer
	float layerDepth = 1.0 / numLayers;

	// depth of current layer
	float currentLayerDepth = 0.0;

	float2 P = viewDir.xy * height_scale;
	float2 deltaTexCoords = P / numLayers;

	float2  currentTexCoords = texCoords;
	float currentDepthMapValue = tex2D(Sampler[bumptex], currentTexCoords).r;

	for(int i = 0; i < 30; i++)
	{
		if (currentLayerDepth >= currentDepthMapValue)
		{
			return currentTexCoords;
		}

		// shift texture coordinates along direction of P
		currentTexCoords -= deltaTexCoords;

		// get depthmap value at current texture coordinates
		currentDepthMapValue = tex2D(Sampler[bumptex], currentTexCoords).r;

		// get depth of next layer
		currentLayerDepth += layerDepth;
	}

	return currentTexCoords;
#endif
}
// jmarshall end