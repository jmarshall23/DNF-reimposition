/*******************************************************************************
 * Settings_Workout_SpeedBag_Bag generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Settings_Workout_SpeedBag_Bag extends Settings_Workout_PunchKick_EgoBooster
    collapsecategories;

function KarmaSetConstraintProperties(KConstraint ConstraintActor)
{
    local KAngularJointLimit AngularLimit;
    local KAngularMotorAffector AngularMotor;

    // End:0x26
    if(__NFUN_340__(Owner, none))
    {
        ConstraintActor.KConstraintActor2 = KarmaActor(Owner);
    }
    AngularLimit = KAngularJointLimit(ConstraintActor);
    // End:0x55
    if(__NFUN_340__(AngularLimit, none))
    {
        AngularLimit.__NFUN_1106__(13288);        
    }
    else
    {
        AngularMotor = KAngularMotorAffector(ConstraintActor);
        // End:0x95
        if(__NFUN_340__(AngularMotor, none))
        {
            AngularMotor.__NFUN_1110__(0);
            AngularMotor.__NFUN_1111__(1000);
        }
    }
    return;
}

defaultproperties
{
    bGivePermanentEgoAward=true
    PermanentEgoAwardID=19
    DecoActivities_Default(0)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(MeleeDamage),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Sound'Settings_Workout_SpeedBag_Bag.DA_Sound_Settings_Workout_SpeedBag_Impact_Melee'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    AutoConstraints(0)=(bConstraintDisabledOnDeath=false,bConstraintOnDeath=false,BoneName=None,ConstraintMounting=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=0,Y=0,Z=12),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),OtherConstraintActor=none,OtherConstraintBone=None,ConstraintClass='Engine.KBSJoint',ConstraintActor=none)
    AutoConstraints(1)=(bConstraintDisabledOnDeath=false,bConstraintOnDeath=false,BoneName=None,ConstraintMounting=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=0,Y=0,Z=12),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=16384,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),OtherConstraintActor=none,OtherConstraintBone=None,ConstraintClass='Engine.KAngularJointLimit',ConstraintActor=none)
    AutoConstraints(2)=(bConstraintDisabledOnDeath=false,bConstraintOnDeath=false,BoneName=None,ConstraintMounting=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=0,Y=0,Z=12),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=16384,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),OtherConstraintActor=none,OtherConstraintBone=None,ConstraintClass='Engine.KAngularMotorAffector',ConstraintActor=none)
    HealthPrefab=0
    bDrawUsePhrase=false
    bTickOnlyWhenPhysicsAwake=true
    PhysicsMaterial='dnMaterial.dnPhysicsMaterial_Rubber'
    PhysicsMassType=1
    KLinearDamping=0.8
    Physics=18
    CollisionRadius=8
    CollisionHeight=13
    Mass=10
    StaticMesh='sm_class_decorations.PunchingBag.SpeedBag_1'
}