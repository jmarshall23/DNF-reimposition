struct SCreakInfo
{
	var() noexport bool bEnableCreakSounds "Should this hinge do the work required to check for playing creak sounds?";
	var() noexport bool bDebugCreakVelocity "Enabled to log out per-frame velocity of the hinge.";
	var() noexport float CreakTimeMinimumDelay "We must allow this much no-sound-playing time between hinge creak noises.";
	var float NextCreakTime;
	var() noexport float SwingMinimumVolumeVelocity "The minimum velocity we must have over the course of a swing to generate a creak sound. The speed maps to [SwingMinimumVolume].";
	var() noexport float SwingMaximumVolumeVelocity "If we achieve this velocity over the course of a swing, we will play a creak sound at [SwingMaximumVolume].";
	var() noexport float SwingMinimumVolume "The minimum volume we will play a creak sound at if we meet our creak criteria.";
	var() noexport float SwingMaximumVolume "The upper limit of the sound range we will play a creak sound at.";
	var float LastSwingVelocity;
	var float DirectionSpinAmount;
};