struct SViewShakeInfo
{
	var() noexport bool bNoLerp "If bNoLerp is true, then the view will snap to the new place, otherwise it will smoothly transition between them.";
	var() noexport bool bToggleSign "When true, this shake will always pick a negative value after picking a positive for the last update.. and vice versa.";
	var() noexport Object.EViewShakeStyle Style "Style of this shake.";
	var() noexport Object.EViewShakeFunction Function "Function for picking shake offset.";
	var() noexport deprecated Actor FalloffActor "Actor defining location for falloff calculations.";
	var() noexport float FalloffDistance "Max distance from FalloffActor for this shake to be noticeable.";
	var() noexport float ShakeDuration "Total time for this shake to exist.  Less than 0 means infinite.";
	var() noexport float ShakeFrequency "Amount of time between shake updates.";
	var() noexport int ShakeMagnitude "Maximum offset along desired rotation axis for this shake." "Values under 6000 recommended.";
	var() noexport int ShakeFullMagnitude "True maximum offset along desired rotation.  ShakeMagnitude will interpolate to this over time if ShakeFullMagnitudeTime is greater than zero.";
	var() noexport float ShakeFullMagnitudeTime "Time it takes for ShakeMagnitude to interpolate to ShakeFullMagnitude.";
	var() noexport name ShakeName "Friendly identifier for later lookup.";
};