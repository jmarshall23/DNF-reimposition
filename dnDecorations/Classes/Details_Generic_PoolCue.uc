/*******************************************************************************
 * Details_Generic_PoolCue generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Details_Generic_PoolCue extends Details_Generic
	collapsecategories;

defaultproperties
{
	HealthPrefab=0
	bTickOnlyWhenPhysicsAwake=true
	PhysicsMaterial='dnMaterial.dnPhysicsMaterial_Wood_Solid'
	PhysicsSoundOverrides(0)=(SoundType=0,OtherMaterialTypes=none,OtherMassTypes=none,Sounds=('a_impact.SpecialCase.PoolStick_01','a_impact.SpecialCase.PoolStick_02','a_impact.SpecialCase.PoolStick_03','a_impact.SpecialCase.PoolStick_04'),SoundInfo=(InputRange=(Min=800,Max=1280),OutputPitchRange=(Min=0.75,Max=1),OutputVolumeRange=(Min=0.4,Max=0.8)),bDisableSoundInWater=true)
	PhysicsSoundOverrides(1)=(SoundType=1,OtherMaterialTypes=none,OtherMassTypes=none,Sounds=('a_impact.SpecialCase.PoolStick_Roll_01'),SoundInfo=(InputRange=(Min=8,Max=40),OutputPitchRange=(Min=0.95,Max=1),OutputVolumeRange=(Min=0.5,Max=1)),bDisableSoundInWater=true)
	PhysicsSoundOverrides(2)=(SoundType=2,OtherMaterialTypes=none,OtherMassTypes=none,Sounds=('a_impact.SpecialCase.PoolStick_Slide_01'),SoundInfo=(InputRange=(Min=400,Max=500),OutputPitchRange=(Min=0.75,Max=1),OutputVolumeRange=(Min=0.5,Max=0.75)),bDisableSoundInWater=true)
	Physics=18
	bBlockPlayers=false
	CollisionRadius=1
	CollisionHeight=32
	Mass=15
	StaticMesh='sm_class_decorations.PoolTable.PoolCue'
}