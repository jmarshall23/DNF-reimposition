struct SSceneInfo
{
	var() Vector Shadows;
	var() Vector MidTones;
	var() Vector Highlights;
	var() float Desaturation;
	var() float BloomScale;
	var() float HDRMiddleGray;
	var() float HDRMinScale;
	var() float HDRMaxScale;
	var() float HDRClip;
	var() float AmbientOcclusionSpeed;
	var() float AmbientOcclusionStrength;
	var() float AmbientOcclusionRadius;
	var() float StarBloomScale;
	var() float StarAngle;
	var() float StarLength1;
	var() float StarLength2;
	var() noexport float StarBlur "Blurs when >= 1.0.  No blur when < 1.0";
	var() noexport int StarSamples "Valid input 1-4 samples";
	var() noexport float StarBloomMinIntensity "Minimum bloom intensity required to do star blooms";
	var() noexport float StarBloomFullIntensity "Bloom intensity where star blooms will be at full intensity";
	var() float PixelMotionBlurScale;
	var() float PixelMotionBlurFar;
	var() float PixelMotionBlurMaxVelocityNear;
	var() float PixelMotionBlurMaxVelocityFar;
};