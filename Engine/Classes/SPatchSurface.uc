struct SPatchSurface
{
	var int Version;
	var() noexport float MaxError "Max dist mesh can be off curve before further tessellation.  0 will use PatchActor default.";
	var() noexport float MaxEdgeLength "Max edge length before further tessellation.  0 will use PatchActor default.";
	var float MaxErrorPhysicsScale;
	var float MaxEdgeLengthPhysicsScale;
	var MaterialEx Material;
	var int Width;
	var int Height;
	var array<int> Indices;
	var array<Vector> UVInfo;
	var LayerMaterial LayerMaterial;
	var bool bSmoothGroup1;
	var bool bSmoothGroup2;
	var bool bSmoothGroup3;
	var bool bSmoothGroup4;
	var SFoliageGrid FoliageGrid[64];
	var SPaintData PaintData[4];
	var transient nontrans PatchActor SelectedOwner;
};