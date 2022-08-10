struct SAIInventoryInfo
{
	var() noexport Engine.BaseAI.EAIMount m_eMountType "To mount or not to mount.  Optional.  If not set, default for item type will be used.";
	var() noexport name m_fnMountBone "Bone this item mounts to.  Optional.  If not set, default for item type will be used.";
	var() noexport Vector m_vMountOffset "Offset from mount bone.  Optional.  If not set, default for item type will be used.";
	var() noexport Rotator m_rMountRotation "Rotation offset from mount bone.  Optional.  If not set, default for item type will be used.";
	var() noexport float m_fDrawScale "DrawScale of the attachment. Less than or equal to 0.0 is treated the same as 1.0";
	var() noexport name m_fnEquippedAnim "Animation to play when equipped.";
};