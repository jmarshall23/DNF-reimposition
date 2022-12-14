/*******************************************************************************
 * Industrial_Rooftop_AirConditioner_B generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Industrial_Rooftop_AirConditioner_B extends Industrial_Generic
    collapsecategories;

event Destroyed()
{
    RemoveMountedActorListActors(false, false);
    super(dnDecoration).Destroyed();
    return;
}

defaultproperties
{
    begin object name=DA_Sound_Industrial_Rooftop_AirConditioner_B_Amb class=DecoActivities_Sound
        SoundNames(0)=Rooftop_AC
    object end
    // Reference: DecoActivities_Sound'Industrial_Rooftop_AirConditioner_B.DA_Sound_Industrial_Rooftop_AirConditioner_B_Amb'
    StartupActivities(0)=DA_Sound_Industrial_Rooftop_AirConditioner_B_Amb
    bSurviveDeath=true
    DestroyedActivities(0)=none
    begin object name=DA_Sound_Industrial_Rooftop_AirConditioner_B_Brkn class=DecoActivities_Sound
        SoundNames(0)=IndMetal_Destruct
        bClearAmbientSound=true
    object end
    // Reference: DecoActivities_Sound'Industrial_Rooftop_AirConditioner_B.DA_Sound_Industrial_Rooftop_AirConditioner_B_Brkn'
    DestroyedActivities(1)=DA_Sound_Industrial_Rooftop_AirConditioner_B_Brkn
    begin object name=DA_Display_Rooftop_AirConditioner_B_Brkn class=DecoActivities_Display
        RenderObject='sm_geo_decorations.AirConditioners.acunit2_brkn'
    object end
    // Reference: DecoActivities_Display'Industrial_Rooftop_AirConditioner_B.DA_Display_Rooftop_AirConditioner_B_Brkn'
    DestroyedActivities(2)=DA_Display_Rooftop_AirConditioner_B_Brkn
    SpawnOnDestroyed(0)=(SpawnClass='Industrial_Rooftop_AirConditioner_B_Gib_A',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=-1,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=62,Y=101.1,Z=63.7),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=MotionPrefab'Industrial_Rooftop_AirConditioner_B.MP_Rooftop_AirConditioner_B_Gibs')
    SpawnOnDestroyed(1)=(SpawnClass='Industrial_Rooftop_AirConditioner_B_Gib_A',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=58,Y=-106.9,Z=63.7),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=MotionPrefab'Industrial_Rooftop_AirConditioner_B.MP_Rooftop_AirConditioner_B_Gibs')
    SpawnOnDestroyed(2)=(SpawnClass='Industrial_Rooftop_AirConditioner_B_Gib_A',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=-1,Z=-1),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=60,Y=103.1,Z=-38.3),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=MotionPrefab'Industrial_Rooftop_AirConditioner_B.MP_Rooftop_AirConditioner_B_Gibs')
    SpawnOnDestroyed(3)=(SpawnClass='Industrial_Rooftop_AirConditioner_B_Gib_A',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=-1,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=-64,Y=-106.9,Z=63.7),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=MotionPrefab'Industrial_Rooftop_AirConditioner_B.MP_Rooftop_AirConditioner_B_Gibs')
    SpawnOnDestroyed(4)=(SpawnClass='Industrial_Rooftop_AirConditioner_B_Gib_A',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=-1,Y=-1,Z=-1),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=-60,Y=105.1,Z=-38.3),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=MotionPrefab'Industrial_Rooftop_AirConditioner_B.MP_Rooftop_AirConditioner_B_Gibs')
    SpawnOnDestroyed(5)=(SpawnClass='Industrial_Rooftop_AirConditioner_B_Gib_B',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=2,Y=-48.9,Z=45.7),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=16384,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=MotionPrefab'Industrial_Rooftop_AirConditioner_B.MP_Rooftop_AirConditioner_B_Gibs')
    SpawnOnDestroyed(6)=(SpawnClass='Industrial_Rooftop_AirConditioner_B_Gib_B',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=-1),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=2,Y=45.1,Z=-22.3),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=16384,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=MotionPrefab'Industrial_Rooftop_AirConditioner_B.MP_Rooftop_AirConditioner_B_Gibs')
    SpawnOnDestroyed(7)=(SpawnClass='Industrial_Rooftop_AirConditioner_B_Gib_B',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=-72,Y=-2.9,Z=47.7),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=32768,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=MotionPrefab'Industrial_Rooftop_AirConditioner_B.MP_Rooftop_AirConditioner_B_Gibs')
    SpawnOnDestroyed(8)=(SpawnClass='Industrial_Rooftop_AirConditioner_B_Gib_C',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=-74,Y=-136.9,Z=21.7),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=MotionPrefab'Industrial_Rooftop_AirConditioner_B.MP_Rooftop_AirConditioner_B_Gibs')
    SpawnOnDestroyed(9)=(SpawnClass='Industrial_Rooftop_AirConditioner_B_Gib_C',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=-1,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=-66,Y=135.1,Z=41.7),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=MotionPrefab'Industrial_Rooftop_AirConditioner_B.MP_Rooftop_AirConditioner_B_Gibs')
    DestroyedParticleFriendEffects(0)=(bAbsoluteLocation=false,bAbsoluteRotation=false,Scale=0,BoneName=None,Location=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),Effect='p_MapEvents.Map02_RoofTop_Decorations.RoofTop_ACUnit_Spawner')
    CollisionRadius=170
    CollisionHeight=74
    StaticMesh='sm_geo_decorations.AirConditioners.ACunit2'
}