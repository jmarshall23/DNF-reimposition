struct SVehicleGearSounds
{
	var() noexport bool bStopOnFootOff "Set this to true if you want to stop the upshift/downshift sound when playing one of the footoff sounds.";
	var() noexport Object.EStopSoundRule StopOnFootOffRule "Stop sound rule to use for stopping sounds when bStopOnFootOff is true.";
	var() noexport name UpshiftLoopName "VoicePack entry to play when we up shift into this gear.";
	var() noexport name DownshiftLoopName "VoicePack entry to play when we down shift into this gear.";
	var() noexport name FootOffSlowName "VoicePack entry to play when we release the gas during the low-end of the gear.";
	var() noexport name FootOffFastName "VoicePack entry to play when we release the gas during the high-end of the gear.";
};