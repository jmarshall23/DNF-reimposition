struct SSpawnActorPrefab
{
	var() noexport class<Actor> SpawnClass "Class of actor to spawn.";
	var() noexport Object RenderObject "If this is not None, SetRenderObject will be called on the SpawnClass when spawned.";
	var() noexport float DrawScale "Set the drawScale of the spawned Actor";
	var() noexport float DrawScaleVariance "If something other than 0, the DrawScale will be varied by this amount";
	var() noexport Vector DrawScale3D "Set the DrawScale3D of the spawned Actor";
	var() noexport float SpawnChance "Percentage chance to spawn. 0.0 is converted to 1.0 at startup.";
	var() noexport int SpawnCopies "Number of times to spawn this type of actor. 0 is converted to 1 at startup.";
	var() noexport int SpawnCopiesVariance "Amount to vary the number of copies generated.";
	var() noexport bool bIgnorePawnAirCushion "If true the class spawned will be forced to ignore any pawn's air cloud.  If false, the class will use its default behavior.";
	var() noexport bool bDontScaleByDrawScale "If the actor size and offsets should be adjusted by the Drawscale of the parent.";
	var() noexport bool bScaleByDrawScaleNonDefault "If true, this will scale the drawscale by the absolute DrawScale/3D of the parent, not the amount that the parent is drawscaled relative to *its* default. Requires bScaleByDrawScale to bet set.";
	var() noexport bool bNoCollision "Turn off all collision.";
	var() noexport bool bFindSpot "If this is false, the spawned actor will NOT try to find a valid spot before spawning.  This is the default behavior";
	var() noexport bool bIgnoreParentRotation "Take the parent's rotation into account when setting rotation.";
	var() noexport bool bTakeParentCollisionSize "Take the collision size of actor spawning us.";
	var() noexport bool bTakeParentMounting "Copies mount information of parent to this actor.";
	var() noexport bool bTakeParentActorColors "Copies the actor color of parent to this actor.";
	var() noexport bool bTakeParentSkins "Copies the skins of the parent to this actor.";
	var() noexport Vector Offset "Amount to offset from the center of parent.";
	var() noexport Vector OffsetVariance "Amount to vary to offset from the center of the parent.";
	var() noexport Rotator Rotation "Initial rotation to give to this actor.";
	var() noexport Rotator RotationVariance "Amount to vary the initial rotation.";
	var() noexport name BoneName "If not None, Actor will be spawned relative to this bone.";
	var() noexport MotionPrefab MotionInfo "Information on the motion to apply to the actor(s) that are spawned.  If None, will be set to DefaultMotionPrefab on Actor.";
};