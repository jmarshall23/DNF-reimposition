/*******************************************************************************
 * Industrial_Generic_SawHorse_A generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Industrial_Generic_SawHorse_A extends Industrial_Generic
	collapsecategories;

defaultproperties
{
	DestroyedActivities(0)=none
	begin object name=DA_Sound_SawHorse_Destroyed class=DecoActivities_Sound
		SoundNames(0)=Destruct_Wood
	object end
	// Reference: DecoActivities_Sound'Industrial_Generic_SawHorse_A.DA_Sound_SawHorse_Destroyed'
	DestroyedActivities(1)=DA_Sound_SawHorse_Destroyed
	SpawnOnDestroyed(0)=(SpawnClass='Industrial_Generic_SawHorse_A_Gib_A',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0)
	SpawnOnDestroyed(1)=(SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=1.291717E-41,Y=2.802827E-17,Z=0),Z=-10)
	SpawnOnDestroyed(2)=(OffsetVariance=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0)
	SpawnOnDestroyed(3)=(Rotation=(Pitch=8709,Yaw=571080704,Roll=0),Roll=0)
	DestroyedParticleFriendEffects(0)=(bAbsoluteLocation=false,bAbsoluteRotation=false,Scale=0,BoneName=None,Location=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0)
	bTickOnlyWhenPhysicsAwake=true
	DynamicInteractionClassification=0
	PhysicsMaterial='dnMaterial.dnPhysicsMaterial_Wood_Solid'
	PhysicsMassType=2
	Physics=18
	CollisionRadius=36
	CollisionHeight=21
	Mass=55
	StaticMesh='sm_class_decorations.SawHorse.SawHorse'
	VoicePack='SoundConfig.Interactive.VoicePack_Decorations'
}