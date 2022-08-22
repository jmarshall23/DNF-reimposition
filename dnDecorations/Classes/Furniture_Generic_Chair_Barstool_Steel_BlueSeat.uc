/*******************************************************************************
 * Furniture_Generic_Chair_Barstool_Steel_BlueSeat generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Furniture_Generic_Chair_Barstool_Steel_BlueSeat extends Furniture_Generic_Chairs
    collapsecategories;

defaultproperties
{
    HealthPrefab=0
    PhysicsMaterial='dnMaterial.dnPhysicsMaterial_Metal_Hollow'
    PhysicsMassType=1
    PhysicsSoundOverrides(0)=(SoundType=0,OtherMaterialTypes=none,OtherMassTypes=none,Sounds=('a_impact.KarmaMetal.BarStool_01','a_impact.KarmaMetal.BarStool_02','a_impact.KarmaMetal.BarStool_03','a_impact.KarmaMetal.BarStool_04'),SoundInfo=(InputRange=(Min=130,Max=1300),OutputPitchRange=(Min=0.75,Max=1),OutputVolumeRange=(Min=0.4,Max=0.8)),bDisableSoundInWater=true)
    PhysicsSoundOverrides(1)=(SoundType=1,OtherMaterialTypes=none,OtherMassTypes=none,Sounds=('a_impact.KarmaMetal.BarStool_Roll_01'),SoundInfo=(InputRange=(Min=1,Max=40),OutputPitchRange=(Min=1,Max=1),OutputVolumeRange=(Min=0.4,Max=1)),bDisableSoundInWater=true)
    Physics=18
    CollisionRadius=10
    CollisionHeight=20
    Mass=20
    StaticMesh='sm_class_decorations.Chairs.Stool_Steel'
}