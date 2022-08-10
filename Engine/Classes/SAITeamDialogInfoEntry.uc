struct SAITeamDialogInfoEntry
{
	var() noexport name SoundName "VoicePack entry to play for this team dialog entry.";
	var() noexport float MinInterval "Frequency of sound.";
	var float Gate;
};