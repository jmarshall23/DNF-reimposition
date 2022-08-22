/*******************************************************************************
 * Industrial_Generic_Toolbox generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Industrial_Generic_Toolbox extends Industrial_Generic
    collapsecategories;

defaultproperties
{
    HealthPrefab=0
    SpawnOnDestroyed(0)=(SpawnClass='Industrial_Generic_Toolbox_Gibs_NoKarma',RenderObject='sm_class_decorations.ToolBox_Gibs.ToolBox_Gib_01',DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=4.414978,Y=17.04916,Z=-17.38285),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=none)
    SpawnOnDestroyed(1)=(SpawnClass='Industrial_Generic_Toolbox_Gibs_NoKarma',RenderObject='sm_class_decorations.ToolBox_Gibs.ToolBox_Gib_01',DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=3.473572,Y=-15.26488,Z=-18.33512),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=-32768,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=none)
    SpawnOnDestroyed(2)=(SpawnClass='Industrial_Generic_Toolbox_Gibs',RenderObject='sm_class_decorations.ToolBox_Gibs.ToolBox_Gib_02',DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=3.981719,Y=0.409678,Z=-16.29624),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=none)
    SpawnOnDestroyed(3)=(SpawnClass='Industrial_Generic_Toolbox_Gibs',RenderObject='sm_class_decorations.ToolBox_Gibs.ToolBox_Gib_03',DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=5.308167,Y=0.413341,Z=-0.299263),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=none)
    SpawnOnDestroyed(4)=(SpawnClass='Industrial_Generic_Toolbox_Gibs_NoKarma',RenderObject='sm_class_decorations.ToolBox_Gibs.ToolBox_Gib_04',DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=-9.13994,Y=9.073401,Z=-22.29424),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=none)
    SpawnOnDestroyed(5)=(SpawnClass='Industrial_Generic_Toolbox_Gibs',RenderObject='sm_class_decorations.ToolBox_Gibs.ToolBox_Gib_05',DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=-2.222912,Y=0.985881,Z=-14.29018),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=none)
    begin object name=MP_Toolbox_Gibs class=MotionPrefab
        VelocityRelativeType=3
        Velocity=(X=200,Y=0,Z=275)
        VelocityVariance=(X=150,Y=0,Z=100)
        RotationRate=(Pitch=745600,Yaw=0,Roll=657890)
        RotationRateVariance=(Pitch=680000,Yaw=0,Roll=580000)
    object end
    // Reference: MotionPrefab'Industrial_Generic_Toolbox.MP_Toolbox_Gibs'
    DefaultMotionPrefab=MP_Toolbox_Gibs
    bIgnorePawnAirCushion=true
    bTickOnlyWhenPhysicsAwake=true
    DynamicInteractionClassification=0
    PhysicsMaterial='dnMaterial.dnPhysicsMaterial_Metal_Hollow'
    PhysicsMassType=1
    Physics=18
    CollisionRadius=19.8
    CollisionHeight=41.8
    Mass=75
    DrawType=2
    DrawScale=1.1
    Mesh='c_generic.ToolBox'
}