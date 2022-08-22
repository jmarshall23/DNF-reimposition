/*******************************************************************************
 * Settings_Bathroom_Broom_Small generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Settings_Bathroom_Broom_Small extends Settings_Bathroom
    collapsecategories;

defaultproperties
{
    bSurviveDeath=true
    DestroyedActivities(0)=none
    DestroyedActivities(1)='dnGame.DecoActivityDeclarations.DA_Sound_Destroyed_Wood_Small'
    begin object name=DA_Display_Settings_Bathroom_Broom_Small_Brkn class=DecoActivities_Display
        RenderObject='sm_class_decorations.broom.BroomBrkn_cd'
    object end
    // Reference: DecoActivities_Display'Settings_Bathroom_Broom_Small.DA_Display_Settings_Bathroom_Broom_Small_Brkn'
    DestroyedActivities(2)=DA_Display_Settings_Bathroom_Broom_Small_Brkn
    SpawnOnDestroyedSimple(0)='dnParticles.dnDebris_Wood1'
    SpawnOnDestroyedSimple(1)='dnParticles.dnDebris_Smoke'
    SpawnOnDestroyed(0)=(SpawnClass='Settings_Bathroom_Broom_Small_Gibs',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=1,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=0,Y=0,Z=0),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=none)
    bTickOnlyWhenPhysicsAwake=true
    PhysicsMaterial='dnMaterial.dnPhysicsMaterial_Wood_Solid'
    PhysicsMassType=1
    Physics=18
    CollisionRadius=7.2
    CollisionHeight=33.4
    Mass=15
    StaticMesh='sm_class_decorations.broom.Broom_cd'
}