/*******************************************************************************
 * Boxes_Generic_Cardboard_Brown_A generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Boxes_Generic_Cardboard_Brown_A extends Boxes_Generic
    collapsecategories;

defaultproperties
{
    DestroyedActivities(0)=none
    begin object name=DA_Sound_Boxes_Cardboard_Brown_A_Brkn class=DecoActivities_Sound
        SoundNames(0)=Cardboard_Explode
    object end
    // Reference: DecoActivities_Sound'Boxes_Generic_Cardboard_Brown_A.DA_Sound_Boxes_Cardboard_Brown_A_Brkn'
    DestroyedActivities(1)=DA_Sound_Boxes_Cardboard_Brown_A_Brkn
    DestroyedActivities(2)=DecoActivities_Interaction'Boxes_Generic.DA_Interaction_Boxes_Generic_Brkn'
    DestroyedActivities(3)='dnGame.DecoActivityDeclarations.DA_Interact_bGrabbable_Disable'
    begin object name=DA_Display_Boxes_Cardboard_Brown_A_Brkn class=DecoActivities_Display
        RenderObject='sm_class_decorations.Boxes.BoxCardboardBrownABrkn_cd'
    object end
    // Reference: DecoActivities_Display'Boxes_Generic_Cardboard_Brown_A.DA_Display_Boxes_Cardboard_Brown_A_Brkn'
    DestroyedActivities(4)=DA_Display_Boxes_Cardboard_Brown_A_Brkn
    begin object name=DA_Physics_Boxes_Cardboard_Brown_A_Brkn class=DecoActivities_Physics
        Mass=14
    object end
    // Reference: DecoActivities_Physics'Boxes_Generic_Cardboard_Brown_A.DA_Physics_Boxes_Cardboard_Brown_A_Brkn'
    DestroyedActivities(5)=DA_Physics_Boxes_Cardboard_Brown_A_Brkn
    DamageThreshold=5
    SpawnOnDestroyedSimple(0)='dnParticles.dnDebris_Smoke'
    DynamicInteractionClassification=7
    CollisionRadius=20
    CollisionHeight=10
    Mass=20
    StaticMesh='sm_class_decorations.Boxes.BoxCardboardBrownA_cd'
}