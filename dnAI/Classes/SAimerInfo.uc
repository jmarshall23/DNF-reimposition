struct SAimerInfo
{
	var AIActor MyOwner;
	var name NotifyStateFuncName;
	var name NotifyLostFuncName;
	var name NotifyThresholdFuncName;
	var Engine.BaseAI.EAIAim CurrentState;
	var array<SAimerTargetInfo> TargetStack;
	var float AngleToTarget;
	var float DeltaAngleToTarget;
	var bool SolutionClamped;
	var bool UseWeaponAimFromPos;
};