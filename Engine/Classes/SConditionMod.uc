struct SConditionMod
{
	var() noexport Triggers.EKillTriggerType ConditionStyle "Method to use for modifying this condition when ConditionTag is called.";
	var() noexport name ConditionTag "This is the tag you call to modify this condition.";
	var int SpecialEventID;
};