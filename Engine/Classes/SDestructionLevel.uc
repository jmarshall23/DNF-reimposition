struct SDestructionLevel
{
	var() noexport float HealthReq "Required health to use this destruction level.";
	var() noexport Object NewRenderObject "New render object to use. Ignored if set to None.";
	var() noexport array<SUpdateMaterialEx> NewSkins "List of skin updates.";
	var() noexport name Event "Event to trigger when we reach this level.";
	var() noexport array< class<Actor> > SpawnAtLevelSimple "For when you don't need all the complexity of SpawnAtLevel to spawn.";
	var() noexport array<SSpawnActorPrefab> SpawnAtLevel "Spawn an actor when we reach this level with lots of specific stuff optional.";
	var() name DestructSound;
};