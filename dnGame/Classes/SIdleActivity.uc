struct SIdleActivity
{
	var() noexport SAnimInfo IdleAnimInfo "IdleAnimation designated for this specific Idle sequence.";
	var() noexport array<export DecoActivities> IdleElements "List of extra activities to happen on this specific Idle element.";
};