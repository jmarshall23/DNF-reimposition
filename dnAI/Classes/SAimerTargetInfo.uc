struct SAimerTargetInfo
{
	var Engine.BaseAI.EAITargetType TargetType;
	var Actor TargetActor;
	var name TargetBoneName;
	var Vector TargetPos;
	var Engine.BaseAI.EAITarget TargetID;
	var float TargetExpiryTime;
	var string TargetInfID;
	var float ThresholdAngle;
	var float TrackRate;
	var bool RemoveIfBeyondConstraints;
	var name UpdatePosFuncName;
};