struct SSoundFlags
{
	var() noexport bool bNoOverride "Whether this sound can be overridden if another sound on the same actor tries to play on the same channel.";
	var() bool bMenuSound;
	var() bool bNoFilter;
	var() noexport bool bNoOcclude "Whether this sound should be occluded or not.";
	var() noexport bool bNoAIHear "AI-controlled pawns are not able to hear this sound (and thus aren't alerted by them.";
	var() noexport bool bNoScale "Don't scale this sound (radius, pitch, volume).";
	var() noexport bool bSpoken "This sound was spoken. (Spoken sounds have the option to scale differently than non-spoken sounds.";
	var() noexport bool bPlayThroughListener "If set, this sound will played in the sound system by the person who heard it. For best effect, this should be used with the forced location override sound properties to spatialize in the world.";
	var() noexport bool bNoDoppler "If true, this sound will not doppler.";
	var() noexport bool bDialogSound "If true, this sound will scale it's volume by DialogVolume slider instead of SoundVolume slider.";
	var() noexport bool bNoReverb "If true, this sound will not use reverb.";
	var() noexport bool bEnableVis "If true, the visualization filter will be applied for spectral analysis.";
	var() noexport bool bSkipFlangePrevention "If true, flange prevention system will be circumvented, allowing a single sound to be played more than once in a single frame.";
	var() noexport bool bSkipSoundRadiusTest "If true, sound will play even if listener is outside of the sound radius.";
	var() noexport bool bIgnoreTimeDilation "If true, sound pitch will not change based on Level.TimeDilation";
};