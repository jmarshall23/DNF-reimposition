struct SPStopSound
{
	var() noexport SoftParticleSystem.EPSoundType ParticleSoundType "Defines when you want these SoundSlots to be stopped during Particle actions.";
	var() noexport array<Object.ESoundSlot> ParticleSoundSlots "The actual SoundSlots you want stopped.";
};