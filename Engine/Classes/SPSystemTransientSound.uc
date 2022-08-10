struct SPSystemTransientSound
{
	var() noexport bool bPlayRelative "If this is true, then the sound will not be overriden at playtime to be positioned in the world where the system is and stay there... it will instead move with the system wherever it goes.";
	var() noexport bool bIgnoreVelocity "If this is true, then the sound will NOT take the velocity of the system at playtime and apply it to itself.";
	var() noexport SoftParticleSystem.EPSystemSoundType SystemSoundType "Defines when you want this sound to occur during System actions.";
	var() noexport SSoundInfo SystemSound "The actual sound you want played and all the associated properties.";
};