/*******************************************************************************
 * Biology_Generic_HiveWebbing_C generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Biology_Generic_HiveWebbing_C extends Biology_Generic_HiveWebbing
    collapsecategories;

defaultproperties
{
    DestroyedActivities(0)=none
    DestroyedActivities(1)=DecoActivities_Sound'Biology_Generic_HiveWebbing.DA_Sound_HiveWebbing_Destroyed'
    begin object name=DA_Display_HiveWebC_Destroyed class=DecoActivities_Display
        RenderObject='sm_geo_decorations.alien.HiveB_webbing_Ends'
    object end
    // Reference: DecoActivities_Display'Biology_Generic_HiveWebbing_C.DA_Display_HiveWebC_Destroyed'
    DestroyedActivities(2)=DA_Display_HiveWebC_Destroyed
    SpawnOnDestroyed(0)=(SpawnClass='Biology_Generic_HiveWebbing_Gib_J',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=0.176,Y=-50.189,Z=7.643),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=none)
    SpawnOnDestroyed(1)=(SpawnClass='Biology_Generic_HiveWebbing_Gib_K',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=-0.001,Y=0.016,Z=0.007),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=none)
    SpawnOnDestroyed(2)=(SpawnClass='Biology_Generic_HiveWebbing_Gib_L',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=0.16,Y=38.555,Z=13.151),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=none)
    SpawnOnDestroyed(3)=(SpawnClass='Biology_Generic_HiveWebbing_Gib_M',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=0.171,Y=43.727,Z=1.797),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=none)
    SpawnOnDestroyed(4)=(SpawnClass='Biology_Generic_HiveWebbing_Gib_N',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=0.578,Y=43.325,Z=-15.85),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=none)
    DestroyedParticleFriendEffects(0)=(bAbsoluteLocation=false,bAbsoluteRotation=false,Scale=0,BoneName=None,Location=(X=0,Y=-45,Z=3),Rotation=(Pitch=0,Yaw=0,Roll=0),Effect='p_Decorations.Hive.Hive_WebbingBreak_Spawner')
    DestroyedParticleFriendEffects(1)=(bAbsoluteLocation=false,bAbsoluteRotation=false,Scale=0,BoneName=None,Location=(X=0,Y=45,Z=-3),Rotation=(Pitch=0,Yaw=0,Roll=0),Effect='p_Decorations.Hive.Hive_WebbingBreak_Spawner')
    StaticMesh='sm_geo_decorations.alien.HiveB_webbing_Breakable'
}