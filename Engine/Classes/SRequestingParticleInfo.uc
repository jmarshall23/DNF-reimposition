struct SRequestingParticleInfo
{
	var() noexport bool bMatchLocation "When true, the spawned particle will match the location of the particle that requested it after being spawned.";
	var() noexport bool bMatchRotation "When true, the spawned particle will match the rotation of the particle that requested it after being spawned.";
	var() noexport bool bMatchScale "When true, the spawned particle will match the scale of the particle that requested it after being spawned.";
	var() noexport bool bRelativeVelocity "When true, the spawned particle will adjust it's velocity based on the difference of the requesting particle's rotation and it's own rotation.";
	var() noexport bool bRelativeAcceleration "Same as velocity, but for acceleration.";
	var() noexport bool bInheritVelocity "When true, the spawned particle will adjust it's velocity based on the requesting particle's velocity.";
	var() noexport bool bInheritAcceleration "When true, the spawned particle will adjust it's acceleration based on the requesting particle's acceleration.";
};