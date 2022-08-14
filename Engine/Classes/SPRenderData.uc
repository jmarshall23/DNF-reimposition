struct SPRenderData
{
	var float SortKey;
	var int SpawnNumber;
	var Vector Velocity;
	var float Rotation;
	var Rotator Rotation3d;
	var Vector Location;
	var Vector PreviousLocation;
	var float CurTextureScaleX;
	var float CurTextureScaleY;
	var float MidTextureScaleX;
	var float MidTextureScaleY;
	var float Alpha;
	var float DrawScale;
	var float Lifetime;
	var float RemainingLifetime;
	var float RotationInitial;
	var Rotator RotationInitial3d;
	var PointRegion Region;
	var MaterialEx Texture;
	var const editconst transient nontrans pointer TexAnimController;
};