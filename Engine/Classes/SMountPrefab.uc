struct SMountPrefab
{
	var() noexport bool bDontActuallyMount "This will do all MountOnSpawnActivity except the mounting aspects (Set the tags, scale by drawscale, etc). MountOrigin and MountAngle will be used as offsets for the initial spawning location instead.";
	var() noexport bool bHideable "Allows the actor's bHidden flag to be toggled when the parent actor is triggered.";
	var() noexport bool bIndependentRotation "This actor doesn't follow the parent's rotation.";
	var() noexport bool bIndependentLocation "This actor doesn't follow the parent's location.";
	var() noexport bool bMatchParentLocation "If true, then match our parent's current location.";
	var() noexport bool bMatchParentRotation "If true, then match our parent's current rotation.";
	var() noexport bool bSurviveDismount "If actors can live through a dismount.";
	var() noexport bool bDontScaleByDrawScale "If the actor size should be adjusted by the Drawscale of the parent.";
	var() noexport bool bScaleByDrawScaleNonDefault "If true, this will scale the drawscale by the absolute DrawScale/3D of the parent, not the amount that the parent is drawscaled relative to *its* default. Requires bScaleByDrawScale to bet set.";
	var() noexport bool bTransformDrawScale3DChange "If true, the DrawScale3D of the parent will be transformed to this actor's rotation before applying.  Use at your own risk!!  This can cause weird skewing errors!!";
	var() noexport bool bTakeParentTag "Take the tag of the parent as its own.";
	var() noexport bool bTransferToCorpse "Only used when MountParent is a pawn.  Should this mounted actor be transfered to the Corpse?";
	var() noexport bool bDontSetOwner "When true, this Actor Owner will not be changed on Mount, otherwise we will set Owner to be MountParent.";
	var() noexport deprecated name MountParentTag "Tag of the parent to mount to. Usually used by an actor mounted on spawn.";
	var() noexport float DrawScaleOverride "If non zero, we'll use this at the mounted actors draw scale.";
	var() noexport name AppendToTag "If not none, additional name to append to object's current tag.";
	var() noexport name ForceTag "Force actor to have this tag.";
	var() noexport name ForceEvent "Force actor to have this event.";
	var() noexport name MountMeshItem "Item to mount to on the parent.";
	var() noexport Vector MountOrigin "Mount origin offset from our initial location.";
	var() noexport Vector MountOriginVariance "Amount to vary the origin offset by.";
	var() noexport Rotator MountAngles "Mount angles offset from our original rotation.";
	var() noexport Rotator MountAnglesVariance "Amount to vary the mount angles by.";
	var() noexport Object.EMountType MountType "Method of mounting to the parent.";
	var() noexport Object.EPhysics DismountPhysics "Physics to use when dismounted.";
};