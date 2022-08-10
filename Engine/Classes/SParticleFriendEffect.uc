struct SParticleFriendEffect
{
	var() noexport bool bAbsoluteLocation "Is the location variable an absolute location in the world?";
	var() noexport bool bAbsoluteRotation "Is the rotation variable an absolute rotation in the world?";
	var() noexport float Scale "How much to scale the effect by, 0.0 will be set to 1.0.";
	var() noexport name BoneName "Bone to make effect relative to.";
	var() noexport Vector Location "Location of the effect.";
	var() noexport Rotator Rotation "Rotation of the effect.";
	var() noexport class<dnFriendFX_Spawners> Effect "FriendFX Spawner class to execute.";
};