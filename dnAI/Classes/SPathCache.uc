struct SPathCache
{
	var bool Valid;
	var int Count;
	var Vector TargetPos;
	var Actor RefActor;
	var float ClipTolerance;
	var Vector NextPathPos;
	var int FinalDest;
	var Engine.BaseAI.EAIPathResult Result;
};