/*******************************************************************************
 * Plants_Generic_JoshuaTree_C generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Plants_Generic_JoshuaTree_C extends Plants_Generic_JoshuaTree
	collapsecategories;

defaultproperties
{
	SpawnOnDestroyed(0)=(SpawnClass='Plants_Generic_JoshuaTree_Gib_A',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0)
	SpawnOnDestroyed(1)=(SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=1.291717E-41,Y=2.797242E-17,Z=-40),Z=76)
	SpawnOnDestroyed(2)=(OffsetVariance=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0)
	DestroyedParticleFriendEffects(0)=(bAbsoluteLocation=false,bAbsoluteRotation=false,Scale=0,BoneName=None,Location=(X=1.291717E-41,Y=2.797242E-17,Z=-40),Z=74)
	DestroyedParticleFriendEffects(1)=(Rotation=(Pitch=8709,Yaw=571080704,Roll=0),Roll=0)
	DestroyedParticleFriendEffects(2)=(Effect='p_Decorations.JoshuaTree.JoshuaTree_Carhit_Spawner')
	DestroyedParticleFriendEffects(3)=(bAbsoluteLocation=false,bAbsoluteRotation=false,Scale=0,BoneName=None,Location=(X=1.291717E-41,Y=2.813505E-17,Z=32),Z=44)
	CollisionRadius=80
	CollisionHeight=120
	StaticMesh='sm_geo_decorations.desert.joshua_tree_3'
}