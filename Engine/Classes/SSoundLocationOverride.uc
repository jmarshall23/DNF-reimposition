struct SSoundLocationOverride
{
	var() noexport bool bMakeRelativeForLocalPlayer "Change the OverrideType to SNDOVERRIDE_Relative if the sound player is a PlayerPawn.";
	var() noexport bool bMakeAbsoluteForActor "Change the OverrideType to SNDOVERRIDE_Absolute and Location3D to the sound actor's current location.";
	var() Object.ESoundLocationOverride OverrideType;
	var() Vector Location3D;
	var() Vector Velocity3D;
};