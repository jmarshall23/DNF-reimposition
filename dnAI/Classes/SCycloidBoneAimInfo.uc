struct SCycloidBoneAimInfo
{
	var() name BoneName;
	var() Vector BoneDir;
	var() array<Engine.BaseAI.EAIOp> EnabledOps;
	var() bool bDebug;
};