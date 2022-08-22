/*******************************************************************************
 * Pillars_Destructible_Marble_3Corners generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Pillars_Destructible_Marble_3Corners extends Pillars_Destructible
    collapsecategories;

defaultproperties
{
    StartupActivities(0)=DecoActivities_Display'Pillars_Destructible.DA_Display_Pilr_Destr_Marb_UnBroken'
    DestroyedActivities(0)=none
    begin object name=DA_Display_Pilr_Destr_Marb_3C class=DecoActivities_Display
        RenderObject='sm_lvl_ladykiller.Pillars.LKcas_SqareCol_BRKN3'
    object end
    // Reference: DecoActivities_Display'Pillars_Destructible_Marble_3Corners.DA_Display_Pilr_Destr_Marb_3C'
    DestroyedActivities(1)=DA_Display_Pilr_Destr_Marb_3C
    SpawnOnDestroyed(0)=(SpawnClass='Pillars_Destructible_Marble_Chunk_A',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=12,Y=-12,Z=54),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=MotionPrefab'Pillars_Destructible.MP_PC_NoMotion')
    SpawnOnDestroyed(1)=(SpawnClass='Pillars_Destructible_Marble_Chunk_A',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=12,Y=12,Z=54),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=16384,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=MotionPrefab'Pillars_Destructible.MP_PC_NoMotion')
    SpawnOnDestroyed(2)=(SpawnClass='Pillars_Destructible_Marble_Chunk_A',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=-12,Y=12,Z=54),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=32768,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=MotionPrefab'Pillars_Destructible.MP_PC_NoMotion')
    SpawnOnDestroyed(3)=(SpawnClass='Pillars_Destructible_Marble_Chunk_B',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=12,Y=-12,Z=92),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=MotionPrefab'Pillars_Destructible.MP_PC_NoMotion')
    SpawnOnDestroyed(4)=(SpawnClass='Pillars_Destructible_Marble_Chunk_B',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=12,Y=12,Z=92),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=16384,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=MotionPrefab'Pillars_Destructible.MP_PC_NoMotion')
    SpawnOnDestroyed(5)=(SpawnClass='Pillars_Destructible_Marble_Chunk_B',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=-12,Y=12,Z=92),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=32768,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=MotionPrefab'Pillars_Destructible.MP_PC_NoMotion')
    SpawnOnDestroyed(6)=(SpawnClass='Pillars_Destructible_Marble_Chunk_C',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=12,Y=-12,Z=128),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=MotionPrefab'Pillars_Destructible.MP_PC_NoMotion')
    SpawnOnDestroyed(7)=(SpawnClass='Pillars_Destructible_Marble_Chunk_C',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=12,Y=12,Z=128),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=16384,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=MotionPrefab'Pillars_Destructible.MP_PC_NoMotion')
    SpawnOnDestroyed(8)=(SpawnClass='Pillars_Destructible_Marble_Chunk_C',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=-12,Y=12,Z=128),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=32768,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=MotionPrefab'Pillars_Destructible.MP_PC_NoMotion')
    SpawnOnDestroyed(9)=(SpawnClass='Pillars_Destructible_Marble_Chunk_D',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=12,Y=-12,Z=170),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=MotionPrefab'Pillars_Destructible.MP_PC_NoMotion')
    SpawnOnDestroyed(10)=(SpawnClass='Pillars_Destructible_Marble_Chunk_D',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=12,Y=12,Z=170),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=16384,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=MotionPrefab'Pillars_Destructible.MP_PC_NoMotion')
    SpawnOnDestroyed(11)=(SpawnClass='Pillars_Destructible_Marble_Chunk_D',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=-12,Y=12,Z=170),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=32768,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=MotionPrefab'Pillars_Destructible.MP_PC_NoMotion')
    StaticMesh='sm_lvl_ladykiller.Pillars.LKcas_SqareCol_BRKN3'
}