struct SFriendInfo
{
	var() noexport SRequestingParticleInfo RequestingParticleInfo "Information applied when a specific particle requests the new particle, as opposed to just a system.";
	var() noexport SoftParticleSystem.EParticleVolumeResponse VolumeResponse "Controls what types of volumes particles can spawn in.  This is a bit of an optimization because it checks before the particles are spawned and uses cached information instead of doing a lookup.";
	var() noexport bool bFireAndForget "If this is true, the particle will be spawned by its controller system, but from then on it will no longer have any knowledge of its controller's movements or location.";
	var() noexport float SpawnChance "Percentage chance that this friend info will successfully execute. Value from 0 to 1.";
	var() noexport int SpawnCount "Each time a particle requests a friend to join the party, how many of them to request.";
	var() noexport int SpawnCountVariance "How many the SpawnCount can vary by.";
	var() noexport class<SoftParticleSystem> FriendClass "The class to use as this friend generator.";
	var() noexport float FriendDelay "Time in seconds before this friend can go.";
	var() noexport float FriendDuration "Time in seconds after this friend has started before it can't go anymore.";
	var() noexport bool bUseParticleTime "If true, FriendDelay and FriendDuration will be matched against the particle's life time instead of the system.";
	var SoftParticleSystem FriendActor;
};