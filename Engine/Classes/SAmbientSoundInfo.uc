struct SAmbientSoundInfo
{
	var() noexport bool bNoScale "Don't scale this sound (radius, pitch, volume)";
	var() noexport name MixerGroupOverride "If not None, will be used as the Mixer group for ambient sounds played from this SAmbientSoundInfo.  If None, will use Ambience as the mixer group.";
	var() noexport array<Sound> AmbientSounds "Ambient sound to use when this activity occurs.";
	var() noexport int InnerRadius "Radius where the Ambient Sound will start falling off.";
	var() noexport int InnerRadiusVariance "Amount to vary inner radius by.";
	var() noexport int Radius "Radius to apply to the Ambient Sound. Specifies world units. Left as 0, will use current actor settings.";
	var() noexport int RadiusVariance "Amount to vary the radius by.";
	var() noexport Object.ESoundVolumePrefab VolumePrefab "Used in place of Volume/VolumeVariance when not set to SOUNDVOLUME_None";
	var() noexport byte Volume "Volume to play the Ambient Sound at. 128 is default. Left as 0, will use current actor settings.";
	var() noexport byte VolumeVariance "Amount to vary the volume by.";
	var() noexport byte Pitch "Pitch to play the Ambient Sound at. 64 is default. Left as 0, will use current actor settings.";
	var() noexport byte PitchVariance "Amount to vary the Pitch by.";
	var() noexport Object.EBitModifier SoundNoOccludeModifier "How to modify the SoundNoOcclude flag.";
	var() noexport Object.EBitModifier SoundNoDopplerModifier "How to modify the SoundNoDoppler flag.";
};