struct SMatLayer
{
	var() MaterialEx Material;
	var() Texture AlphaMap;
	var() float UScale;
	var() float VScale;
	var() float UShift;
	var() float VShift;
	var() bool bUseBaseMapping;
	var() bool bUseBaseMappingAlpha;
	var() LayerMaterial.EPUVMode BaseUVMode;
	var() LayerMaterial.EPUVMode AlphaUVMode;
};