struct STargetEvalInfo
{
	var AIActor MyOwner;
	var transient float EvalGate;
	var float EvalInterval;
	var bool Suspended;
	var bool bSuspendedWithNoTarget;
	var Engine.BaseAI.EAITargetEval Evaluator;
	var bool ForceUpdate;
	var bool MustBePawn;
	var bool MustBeSighted;
	var bool MustBeReachable;
	var bool CanTargetProjectiles;
	var bool CanAvoidTargetableProjectiles;
	var Actor LastTarget;
	var float LastTargetEndTime;
};