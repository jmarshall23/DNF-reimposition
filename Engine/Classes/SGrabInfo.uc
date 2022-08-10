struct SGrabInfo
{
	var() noexport bool bCanDuckWhileHeld "Whether the pawn holding us can duck while carrying us.";
	var() noexport name MountItemOverride "Special case override of the MountMeshItem we want to be mounted to, instead of the one the Pawn picking us up specifies. If the bone doesn't exist, falls back to the Pawn specified one.";
	var() noexport Vector MountOrigin "Positional offset from MountMeshItem for mounting this Actor.";
	var() noexport Rotator MountAngles "Rotational offset from MountMeshItem for mounting this Actor.";
	var() noexport name GrabAnimName "Animation to play on this InteractiveActor when it is grabbed. Type LeaveAsIs_ if you wish the InteractiveActor to simply be left in whatever position it was found in.";
	var() noexport name CarrierAnimName "Animation to play on the pawn that is carrying us.";
	var() noexport name CarrierMountPose "Animation to play on the pawn to position the carried item mount.";
	var() noexport name GrabSoundName "VoicePack entry to play when this Actor is grabbed.";
	var() noexport name ThrowSoundName "VoicePack entry to play when this Actor is thrown.";
	var SSoundInfo GrabSoundInfo;
	var SSoundInfo ThrowSoundInfo;
};