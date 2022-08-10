struct SVisEffect
{
	var() noexport Range Frequency "Range to use as input for this effect.  Values between 0.0 and 1.0 are valid.";
	var() noexport Range Intensity "Range of intensities we care about.  When intensity is below Min, color will be black.  When intensity is above Max, it will be clamped at Max.";
	var() noexport array<SVisActorColorOutput> OutputActors "Array of actor to modify Actor color on.";
	var() noexport deprecated array<LightEx> OutputLights "Array of LightEx to modify.";
};