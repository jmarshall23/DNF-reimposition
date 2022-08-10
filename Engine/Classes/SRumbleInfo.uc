struct SRumbleInfo
{
	var() name RumbleName;
	var() float RumbleDuration;
	var() noexport float RumbleLeftMagnitude "Low frequency motor intensity. 0 - 1";
	var() noexport float RumbleRightMagnitude "High frequency motor intensity. 0 - 1";
	var() deprecated Actor FalloffActor;
	var() float FalloffDistance;
};