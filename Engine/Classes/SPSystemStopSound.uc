struct SPSystemStopSound
{
	var() noexport SoftParticleSystem.EPSystemSoundType SystemSoundType "Defines when you want these SoundSlots to be stopped during System actions.";
	var() noexport array<Object.ESoundSlot> SystemSoundSlots "The actual SoundSlots you want stopped.";
};