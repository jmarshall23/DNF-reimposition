struct SFootstepCategoryEffect
{
	var() noexport byte InfoIndex "This used to indicate what index to derive our information from. Allows you to point to a 'default' effect instead of having to copy the same information each time.";
	var() noexport bool bEffectCrouched "Whether to play a footstep effects when crouching. Footprints will always spawn though. Allows for a mild level of sneaking.";
	var() noexport class<FootPrint> Footprints[6] "Class to spawn to create a footprint. Check Material.uc for what each index is used for.";
	var() noexport SSoundInfo SoundInfo "Sounds to play when material is walked upon.";
	var() noexport class<dnStepFX_Spawners> Effect "Effect to spawn for each footstep taken. Think dirt puffs and water splashes.";
};