struct SSoundFadeInfo
{
	var() noexport float FadeInDuration "Time in seconds that this sound should take to fade in to desired Volume.";
	var() noexport float FadeOutStartTime "Time in seconds at which this sound should start fading out to 0.0 volume.";
	var() noexport float FadeOutDuration "Time in seconds that it should take for this sound to fade out to 0.0 volume.";
	var() deprecated name FadeInEndCallback;
	var() deprecated name FadeOutEndCallback;
};