struct AdditionalSpawnStruct
{
	var() noexport class<Actor> SpawnClass "Class to spawn.";
	var() noexport bool TakeParentTag "Spawned actor will take the tagname of it's parent.";
	var() noexport bool Mount "Mount actor to myself.";
	var() noexport Vector MountOrigin "Origin if not on top of.";
	var() noexport Rotator MountAngles "Angles if not on top of.";
	var() noexport Object.EMountType MountType "How to mount the actor to myself.";
	var() noexport name AppendToTag "Append to the tag, dammit!";
	var() noexport Rotator SpawnRotation "Range of rotation to give to this actor.";
	var() noexport Rotator SpawnRotationVariance "The spawn rotation will vary by this amount.";
	var() noexport bool SpawnRotationNotRelative "The spawn rotation is not relative to this actor.";
	var() noexport float SpawnSpeed "Gives the spawned actor a velocity of this magnitude in the direction of it's rotation.";
	var() noexport float SpawnSpeedVariance "This amount times a random number from -1 to 1 will be added to the speed.";
	var() noexport bool DestroyOnDeath "Destroy this spawned actor when this particle system dies.";
	var() noexport float SpawnDelay "Delay this additional spawn by this much";
	var() noexport int MaxConcurrentSpawns "Maximum number of these guys that can exist at once.  0 means no limit.";
	var array<Actor> SpawnedActors;
};