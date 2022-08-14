/*******************************************************************************
 * Pillars_Destructible_Concrete_3Corners generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Pillars_Destructible_Concrete_3Corners extends Pillars_Destructible
	collapsecategories;

defaultproperties
{
	StartupActivities(0)=DecoActivities_Display'Pillars_Destructible_Concrete.DA_Display_Pilr_Destr_Conc_UnBrkn'
	DestroyedActivities(0)=none
	begin object name=DA_Display_Pilr_Destr_Conc_Brkn_3C class=DecoActivities_Display
		RenderObject='SM_Lvl_Dam.Destroyable.Dam_ConColumn_Brkn3'
	object end
	// Reference: DecoActivities_Display'Pillars_Destructible_Concrete_3Corners.DA_Display_Pilr_Destr_Conc_Brkn_3C'
	DestroyedActivities(1)=DA_Display_Pilr_Destr_Conc_Brkn_3C
	SpawnOnDestroyed(0)=(SpawnClass='Pillars_Destructible_Concrete_Chunk_A',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0)
	SpawnOnDestroyed(1)=(SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=1.291717E-41,Y=2.802779E-17,Z=-18),Z=40)
	SpawnOnDestroyed(2)=(OffsetVariance=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0)
	SpawnOnDestroyed(3)=(Rotation=(Pitch=8709,Yaw=571080704,Roll=0),Roll=0)
	SpawnOnDestroyed(4)=(RotationVariance=(Pitch=8709,Yaw=571080704,Roll=0),Roll=0)
	SpawnOnDestroyed(5)=(BoneName=None,MotionInfo=MotionPrefab'Pillars_Destructible.MP_PC_NoMotion')
	SpawnOnDestroyed(6)=(SpawnClass='Pillars_Destructible_Concrete_Chunk_A',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0)
	SpawnOnDestroyed(7)=(SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=1.291717E-41,Y=2.802795E-17,Z=14),Z=40)
	SpawnOnDestroyed(8)=(OffsetVariance=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0)
	SpawnOnDestroyed(9)=(Rotation=(Pitch=8709,Yaw=571080704,Roll=16384),Roll=0)
	SpawnOnDestroyed(10)=(RotationVariance=(Pitch=8709,Yaw=571080704,Roll=0),Roll=0)
	SpawnOnDestroyed(11)=(BoneName=None,MotionInfo=MotionPrefab'Pillars_Destructible.MP_PC_NoMotion')
	PhysicsMaterial='dnMaterial.dnPhysicsMaterial_Stone'
	PhysicsMassType=1
	StaticMesh='SM_Lvl_Dam.Destroyable.Dam_ConColumn_Brkn3'
}