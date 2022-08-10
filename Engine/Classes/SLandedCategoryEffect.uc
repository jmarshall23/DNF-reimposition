struct SLandedCategoryEffect
{
	var() noexport byte InfoIndex "This used to indicate what index to derive our information from. Allows you to point to a 'default' effect instead of having to copy the same information each time.";
	var() noexport SSoundInfo SoundInfo "Played when someone lands on the surface.";
	var() noexport class<dnLandedFX_Spawners> Effect "Effect to spawn when landing on the surface.";
};