/*******************************************************************************
 * Barrels_Generic_Explosive01_NoGibs generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Barrels_Generic_Explosive01_NoGibs extends Barrels_Generic_Unstable
    collapsecategories;

defaultproperties
{
    DelayedExplosionTime=3.5
    bExplodeOnNextHit=true
    DecoActivities_Default(0)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=none,ActivityID=(1,18),ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=('dnGame.DecoActivityDeclarations.DA_Health_Damage_100'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    DecoActivities_Default(1)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(DelayedExplosionTimerStarted),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Interaction'Barrels_Generic_Explosive01_NoGibs.DA_Interact_Barrel_Explosive_SetAvoidRange'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    DecoActivities_Default(2)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=none,ActivityID=(21),ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=('dnGame.DecoActivityDeclarations.DA_Camera_Explosion_Shake_Generic'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    DestroyedActivities(0)=none
    begin object name=DA_Sound_Barrel_Explosive_Explode class=DecoActivities_Sound
        SoundNames(0)=Barrel_Explode
    object end
    // Reference: DecoActivities_Sound'Barrels_Generic_Explosive01_NoGibs.DA_Sound_Barrel_Explosive_Explode'
    DestroyedActivities(1)=DA_Sound_Barrel_Explosive_Explode
    DestroyedActivities(2)='dnGame.DecoActivityDeclarations.DA_RadiusDamage_Standard'
    DestroyedParticleFriendEffects(0)=(bAbsoluteLocation=false,bAbsoluteRotation=false,Scale=0,BoneName=None,Location=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),Effect='p_Decorations.BarrelExplosion.Barrel_Explosion_Spawner')
    StaticMesh='sm_class_decorations.Barrels.Barrel_Generic'
    Skins(0)='smt_skins.Barrels.Barrel_Explosive_bs'
}