struct SAnimX
{
	var name AnimName;
	var bool UseExactAnimName;
	var int RefId;
	var Engine.BaseAI.EAITargetType TargetType;
	var Actor TargetActor;
	var Vector TargetFacePos;
	var Vector TargetSyncPos;
	var AIActor TargetSyncActor;
	var float FaceThreshold;
	var float ExitTime;
	var bool FullAnim;
	var bool Sync;
	var bool SyncActor;
	var name SyncWaitAnimName;
	var bool FinishAlone;
	var bool MustFinish;
	var int Mode;
	var int TurnDir;
	var bool bExitOnLand;
	var bool bSucceedOnFail;
};