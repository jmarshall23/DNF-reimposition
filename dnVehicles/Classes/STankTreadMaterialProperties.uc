struct STankTreadMaterialProperties
{
	var() noexport MaterialEx TreadMaterial "Material to use in the TexPanner for this tread.";
	var() noexport int TreadSectionIndex "Section on the mesh for this tread.";
	var() noexport float PanRate "Rate at which this tread's texture would pan for maximum forward.  (Scaled by input given to tread which will be -1.0 to 1.0).";
	var() noexport Rotator PanDirection "Direction to pan the texture.";
};