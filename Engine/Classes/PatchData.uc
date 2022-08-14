/*******************************************************************************
 * PatchData generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class PatchData extends Object
	native;

cpptext
{
// Stripped
}

enum EPaintData
{
	PAINTDATA_HeightMap,
	PAINTDATA_LODMap,
	PAINTDATA_VisMap,
	PAINTDATA_EdgeDir
};

struct SFoliage
{
	var float X;
	var float Y;
	var float FX;
	var float FY;
	var float FZ;
	var Vector Normal;
	var float Size;
	var int Type;
};

struct SPaintData
{
	var int Width;
	var int Height;
	var array<byte> Data;
};

struct SFoliageGrid
{
	var bool bFinal;
	var array<SFoliage> Foliage;
};

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

var byte TerrainLOD;
var byte TerrainEditGrid;
var() noexport float MaxError "Max distance mesh can be off curve before further tessellation.";
var() noexport float MaxEdgeLength "Max edge length before further tessellation.";
var float MaxErrorPhysicsScale;
var float MaxEdgeLengthPhysicsScale;
var() noexport array<SPatchSurface> Surfaces "Array of Patch Surfaces.";
var array<Vector> Vertices;
var Box BBox;
var StaticMesh StaticMesh;
var transient int NumSelected;
var bool bStaticMeshDirty;
var bool bBoxDirty;
var bool bRealtimeFoliagePainting;
var bool bFoliageRandomSize;
var array<SFoliageDef> FoliageDefs;
var int CurrentFoliage;
var Color CurrentFoliageColor1;
var Color CurrentFoliageColor2;
var byte CurrentFoliagePaintMode;
var bool bTerrainPatch;
var bool bForcePatchContinuity;
var transient int UserData;

defaultproperties
{
	TerrainLOD=5
	TerrainEditGrid=8
	MaxError=8
	MaxEdgeLength=1024
	MaxErrorPhysicsScale=1
	MaxEdgeLengthPhysicsScale=1
	bStaticMeshDirty=true
	bBoxDirty=true
	bForcePatchContinuity=true
}