struct SGlobalHeightFog
{
	var() noexport Color Color "Color to use for height fog.";
	var() noexport float Top "Dist from origin for top of height fog plane.";
	var() noexport float DistToFullDensity "Distance at which fog is full density.";
	var() noexport float DepthToFullDensity "Depth at which fog is full density.";
};