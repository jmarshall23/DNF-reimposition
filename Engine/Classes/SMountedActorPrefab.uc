struct SMountedActorPrefab
{
	var() noexport bool bSkipVerifySelf "Tell this actor not to verify itself upon spawning.";
	var() noexport class<Actor> SpawnClass "Class of the actor to mount. If this is blank, then just mount itself instead. Will require a MountParentTag to succeed.";
	var() noexport float SpawnChance "Percentage of chance that this actor will spawn. 0.0 is converted to 1.0 at startup. Anything less than 0.0 results in 0% chance.";
	var() noexport SMountPrefab MountPrefab "Settings for how this actor should be mounted.";
	var() noexport Object RenderObject "If this is not None, SetRenderObject will be called on the SpawnClass when spawned.";
	var() noexport float DrawScale "Set the drawScale of the spawned Actor";
};