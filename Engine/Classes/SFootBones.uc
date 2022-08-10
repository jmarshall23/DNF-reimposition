struct SFootBones
{
	var() noexport bool bRightSide "If this is true, then the foot decal will be flipped to indicate being on the opposite side of the creature. (All decals are created for left feet.)";
	var() noexport name BoneName "Actual name of the bone.";
	var() noexport name BoneID "Identifier the artist uses to force this specified bone to do an effect.";
	var() noexport Rotator BoneRotOffset "This is the rotation offset needed to get the corrected forward rotation for the foot bone.";
};