struct SAudioMixerAutoDuckRule
{
	var() noexport name id "Used as OverrideID when ducking.  Must be set or the auto duck will not function.";
	var bool bDucking;
	var() noexport array<name> TestGroups "List of MixerGroups to check for sounds within.  As long as there is at least 1 sound active in 1 of the TestGroups, the auto duck is active.";
	var() noexport array<SAudioMixerGroupAutoDuck> DuckGroups "List of MixerGroups to automatically duck.. and information about how to duck them.";
};