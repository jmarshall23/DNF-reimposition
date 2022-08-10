struct SFreeMove
{
	var Engine.BaseAI.EAIFreeMoveMode Mode;
	var float MinDotToTarget;
	var float MaxDotToTarget;
	var float ExitTime;
	var Vector FreeMoveTarget;
	var float FreeMoveVelocity;
	var float FreeMoveMaxVelocity;
	var float StoppingRate;
	var float StoppingRestitution;
	var Vector startLocation;
};