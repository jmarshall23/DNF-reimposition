struct SDecoDamageIgnoreRules
{
	var() class<Pawn> QualifierInstigatorType;
	var() Engine.LevelInfo.ENetMode QualifierNetMode;
	var() noexport float MinDistanceFromLocalPlayer "Only take damage if the local player pawn is within min/max distance from me";
	var() noexport float MaxDistanceFromLocalPlayer "Only take damage if the local player pawn is within min/max distance from me";
};