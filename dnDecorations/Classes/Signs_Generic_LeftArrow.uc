/*******************************************************************************
 * Signs_Generic_LeftArrow generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Signs_Generic_LeftArrow extends Signs_Generic
	collapsecategories;

defaultproperties
{
	DestroyedActivities(0)=none
	DestroyedActivities(1)=DecoActivities_Sound'Signs_Generic.DA_Sound_Signs_Wooded_Destroyed'
	HealthPrefab=5
	Health=50
	SpawnOnDestroyed(0)=(SpawnClass='Signs_Generic_WoodenSign_Gibs',RenderObject='SM_Lvl_Desert.signs.desert_sign_gib_1',DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0)
	SpawnOnDestroyed(1)=(SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=1.291717E-41,Y=2.80262E-17,Z=0),Z=-19)
	SpawnOnDestroyed(2)=(OffsetVariance=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0)
	SpawnOnDestroyed(3)=(Rotation=(Pitch=8709,Yaw=571080704,Roll=0),Roll=0)
	SpawnOnDestroyed(4)=(RotationVariance=(Pitch=8709,Yaw=571080704,Roll=0),Roll=0)
	DestroyedParticleFriendEffects(0)=(bAbsoluteLocation=false,bAbsoluteRotation=false,Scale=0,BoneName=None,Location=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0)
	CollisionRadius=56
	CollisionHeight=76
	StaticMesh='SM_Lvl_Desert.signs.desert_sign_02'
}