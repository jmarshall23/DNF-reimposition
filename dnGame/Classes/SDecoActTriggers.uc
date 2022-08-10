struct SDecoActTriggers
{
	var() noexport name ActivityTag "Tag you want to call to force the specified activities to fire.";
	var() noexport array<name> ActivityIDs "List of DecoActivities you want to fire off when this trigger occurs.";
	var() noexport array<dnDecoration.EDecoActivityID> ActivityIDPrefabs "List of prefab DecoActivities you want to fire off when this trigger occurs.";
	var int SpecialEventID;
};