struct SPSystemAmbientSound
{
	var() noexport SoftParticleSystem.EPSystemSoundType SystemSoundType "Defines when you want this ambient sound to occur during System actions.";
	var() noexport SAmbientSoundInfo SystemSound "The actual ambient sound you want played and all the associated properties.";
};