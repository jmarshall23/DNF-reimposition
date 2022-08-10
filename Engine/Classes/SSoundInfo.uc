struct SSoundInfo
{
	var() noexport bool bAllowRepeats "If this is false, all sounds in the Sounds array will play before repeating a single one.";
	var() noexport bool bPlayAsAmbient "If this is true, the Slots array will be ignored and the sound will be played using AmbientSound.";
	var() noexport name MixerGroupOverride "If not None, will be used at the Mixer group for sounds played from this SSoundInfo.  If None, will use SoundFX or Ambience depending on the state of bPlayAsAmbient.";
	var() Sound SimpleSingleSound;
	var() noexport array<Sound> Sounds "List of sounds to play.";
	var() noexport byte SlotPriority "Higher priority will override lower priority sounds on this slot.";
	var() noexport Object.ESoundVolumePrefab VolumePrefab "Prefab volume group to use for this SoundInfo.  If SOUNDVOLUME_None, will use Volume & VolumeVariance.";
	var() noexport array<Object.ESoundSlot> Slots "Slots to choose from to play the sound in. Defeats the purpose if you have two slots that are the same.";
	var() noexport float Volume "Volume to play the sound at. (0.0 uses TransientSoundVolume. Value from 0-1).";
	var() noexport float VolumeVariance "Amount to vary the volume by.";
	var() noexport float InnerRadius "Radius where sound whill start falling off. (0.0 uses TransientSoundInnerRadius).";
	var() noexport float InnerRadiusVariance "Amount to vary the inner radius by.";
	var() noexport float Radius "Radius to play the sound in. Specifies world units. (0.0 uses TransientSoundRadius).";
	var() noexport float RadiusVariance "Amount to vary the radius by.";
	var() noexport float Pitch "Pitch to play the sound at. (0.0 uses TransientSoundPitch. 1.0 is default. <1.0 lowers pitch, >1.0 raises pitch.";
	var() noexport float PitchVariance "Amount to vary the pitch by.";
	var() SSoundFlags Flags;
	var() noexport SSoundLocationOverride SoundLocationOverride "Override spatialization of this sound?";
	var() noexport int Offset "Offset in bytes at which to start playback.";
	var() noexport float Delay "Time in seconds to delay before starting the sound.";
	var int SlotIndex;
	var int ForcedIndex;
	var() noexport SSoundFadeInfo SoundFadeInfo "How to fade this sound.";
	var() name SoundEndCallback;
	var array<Sound> PlayedSounds;
	var() noexport array<SSoundFilter> Filters "Filters to apply to this sound.";
};