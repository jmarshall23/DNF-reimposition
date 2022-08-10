struct SGotoPreset
{
	var Engine.BaseAI.EAITargetType TargetType;
	var Actor TargetActor;
	var Vector TargetPos;
	var Actor RefActor;
	var Engine.BaseAI.EAIOffsetType OffsetType;
	var float Range;
	var float Bearing;
	var float Height;
	var float ClipTolerance;
	var Engine.BaseAI.EAIFocus Focus;
	var Actor FocusActor;
	var int MaxSteps;
	var bool bDebug;
};