struct OverlayBumpShaderInfo
{
	var() noexport BumpShader Shader "Overlay BumpShader.";
	var() MaterialEx Cube;
	var() noexport Vector UVScale "xy are uv scale; z is overall (programmatic) weight for effect.";
};