struct SCharacterSoundInfo
{
	var() noexport bool bAllowAnimRepeats "Only used in conjunction with AnimControllerEntries.  See bAllowRepeats on SSoundInfo for a description.";
	var() noexport name GroupName "Unique ID that identifies this CharacterVoicePack entry. This is what is you call for when you want to play a sound.";
	var() noexport name AffiliationName "ID to apply to this CharacterVoicePack entry that will associate it with other entries when doing ReplayThrottle checks. Allows you to have 3 stages of 'Gasp!', but throttle them all together.";
	var() noexport array<name> AnimControllerEntries "Entry in the character AnimationController used instead of SoundInfo if valid. Primarily for Dialog, where the anim controls the sound, but could be used for anything. For non-dynamic throttling, entry must match the literal animation name.";
	var() noexport SSoundInfo SoundInfo "The actual sound in the entry.";
	var() noexport float ReplayThrottle "Amount of time that must pass before this sound or it's affiliates can be played again. Setting to any negative value throttles by the duration of the sound played + the absolute value of the variable. -1.5 = duration of sound + 1.5 seconds.";
	var array<name> UsedAnimControllerEntries;
};