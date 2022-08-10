struct SAIPerformanceInfo
{
	var() array<float> TickTime;
	var float TickTimeLastFrame;
	var float PathTimeLastFrame;
	var float ProcAimTimeLastFrame;
	var bool SetLocation;
	var bool ExecuteDecisionTree;
	var int Cycles;
	var float Path_PreStaticPath;
	var float Path_PostStaticPath;
	var float Path_GenerateStaticPath;
	var float Path_FinalizeNextPathPos;
};