struct SRelayConditions
{
	var() noexport bool bEnabled "Initial state of this condition.";
	var bool bEnabled_Orig;
	var() noexport array<SConditionMod> ConditionModifiers "List of things that are able to modify this condition.";
};