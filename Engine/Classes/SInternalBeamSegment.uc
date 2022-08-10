struct SInternalBeamSegment
{
	var Actor Actor1;
	var Actor Actor2;
	var name Actor1Bone;
	var name Actor2Bone;
	var Vector Location1;
	var Vector Location2;
	var Color Color;
	var float Lifetime;
	var float RemainingLifetime;
	var float CreatedTime;
	var int PrevSegment;
	var int NextSegment;
};