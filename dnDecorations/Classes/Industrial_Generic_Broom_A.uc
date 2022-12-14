/*******************************************************************************
 * Industrial_Generic_Broom_A generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Industrial_Generic_Broom_A extends Industrial_Generic
    collapsecategories;

defaultproperties
{
    HealthPrefab=0
    bTickOnlyWhenPhysicsAwake=true
    PhysicsMaterial='dnMaterial.dnPhysicsMaterial_Wood_Solid'
    PhysicsSoundOverrides(0)=(SoundType=0,OtherMaterialTypes=none,OtherMassTypes=none,Sounds=('a_impact.SpecialCase.BroomStick_01','a_impact.SpecialCase.BroomStick_02','a_impact.SpecialCase.BroomStick_03','a_impact.SpecialCase.BroomStick_04'),SoundInfo=(InputRange=(Min=32,Max=1280),OutputPitchRange=(Min=1,Max=2),OutputVolumeRange=(Min=0.4,Max=0.8)),bDisableSoundInWater=true)
    Physics=18
    CollisionRadius=10
    CollisionHeight=33.75
    Mass=10
    StaticMesh='sm_class_decorations.PushBroom.PushBroom_1'
}