struct SPathingHistory
{
	var Vector Location;
	var Rotator Rotation;
	var Vector Destination;
	var Vector NextPosition;
	var int FinalDest;
	var float Time;
	var Engine.BaseAI.EAIPathResult Result;
	var bool bActorWasInValidArea;
	var SPathInfo PathInfo;
};