struct SPathInfo
{
	var float TotalDist;
	var bool bWait;
	var bool bAvoiding;
	var bool bPushPointOntoNavFail;
	var bool bNavFloodAP;
	var bool bNavFloodAPCacheMiss;
	var bool bPathCacheMiss;
	var bool bPathCacheHit;
	var bool bActorWasInValidArea;
	var bool bIsDynamicPathing;
	var bool bDebugPath;
	var bool bWasClippedMove;
	var bool bFailedInDynamicPathing;
	var int PathCacheID;
	var Vector TargetExtent;
	var int Cycles;
	var float PreStaticPath;
	var float PostStaticPath;
	var float GenerateStaticPath;
	var float FinalizeNextPathPos;
	var float AvoidDynamicObstacles;
	var float CalculateStartAndEndAreas;
	var int PathCacheHitCnt;
	var int PathCacheMissCnt;
};