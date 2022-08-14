/*******************************************************************************
 * Furniture_Generic_Table_Folding_A generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Furniture_Generic_Table_Folding_A extends Furniture_Generic_Tables
	collapsecategories;

defaultproperties
{
	SpawnOnDestroyed(0)=(SpawnClass='Furniture_Generic_Table_Folding_A_Gib_A',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0)
	SpawnOnDestroyed(1)=(SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=true,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=1.291717E-41,Y=2.797242E-17,Z=24),Z=16)
	SpawnOnDestroyed(2)=(OffsetVariance=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0)
	SpawnOnDestroyed(3)=(Rotation=(Pitch=8709,Yaw=571080704,Roll=0),Roll=0)
	SpawnOnDestroyed(4)=(RotationVariance=(Pitch=8709,Yaw=571080704,Roll=0),Roll=0)
	SpawnOnDestroyed(5)=(BoneName=None,MotionInfo=none)
	begin object name=Table_Gibs_Motion class=MotionPrefab
		bUseParentVelocity=false
		bUseParentRotationRate=false
		VelocityRelativeType=3
		Velocity=(X=1.291717E-41,Y=2.802856E-17,Z=0)
		VelocityVariance=(X=1.291717E-41,Y=2.802885E-17,Z=80)
		RotationRate=(Pitch=-56827,Yaw=571080704,Roll=0)
		RotationRateVariance=(Pitch=-1006624251,Yaw=571080713,Roll=0)
	object end
	// Reference: MotionPrefab'Furniture_Generic_Table_Folding_A.Table_Gibs_Motion'
	DefaultMotionPrefab=Table_Gibs_Motion
	bIgnoreSelfDamage=true
	PhysicsMaterial='dnMaterial.dnPhysicsMaterial_Wood_Solid'
	PhysicsMassType=2
	PhysicsSoundOverrides(0)=(SoundType=0,OtherMaterialTypes=none,OtherMassTypes=none,Sounds=('a_impact.KarmaMetal.FoldingTable_01','a_impact.KarmaMetal.FoldingTable_02','a_impact.KarmaMetal.FoldingTable_03','a_impact.KarmaMetal.FoldingTable_04'),SoundInfo=(InputRange=(Min=128,Max=1280),OutputPitchRange=(Min=0.8,Max=1),OutputVolumeRange=(Min=0.4,Max=1)),bDisableSoundInWater=true)
	PhysicsSoundOverrides(1)=(SoundType=2,OtherMaterialTypes=none,OtherMassTypes=none,Sounds=('a_impact.KarmaMetal.FoldingTable_Slide_01'),SoundInfo=(InputRange=(Min=16,Max=1250),OutputPitchRange=(Min=0.75,Max=1),OutputVolumeRange=(Min=0.4,Max=0.8)),bDisableSoundInWater=false)
	Physics=18
	CollisionRadius=46
	CollisionHeight=19.1
	Mass=35
	StaticMesh='sm_class_decorations.Tables.FoldingTable'
}