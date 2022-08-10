struct SPTransientSound
{
	var() noexport bool bIgnoreVelocity "If this is true, then the sound will NOT take the velocity of the particle at playtime and apply it to itself.";
	var() noexport SoftParticleSystem.EPSoundType ParticleSoundType "Defines when you want this sound to occur";
	var() noexport SSoundInfo ParticleSound "The actual sound you want played and all the associated properties.";
};