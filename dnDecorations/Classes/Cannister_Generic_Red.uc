/*******************************************************************************
 * Cannister_Generic_Red generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Cannister_Generic_Red extends Barrels_Generic_Unstable
	collapsecategories;

defaultproperties
{
	DelayedExplosionTime=1.5
	DecoActivities_Default(0)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=none,ActivityID=(1,18),ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=('dnGame.DecoActivityDeclarations.DA_Health_Damage_100'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
	DecoActivities_Default(1)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=none,ActivityID=(0),ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=none,bDisabled=false)
	DecoActivities_Default(2)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=none,ActivityID=(21),ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=('dnGame.DecoActivityDeclarations.DA_Camera_Explosion_Shake_Generic'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
	DestroyedActivities(0)=none
	begin object name=DA_Sound_Cannister_Red_Explode class=DecoActivities_Sound
		SoundNames(0)=Barrel_Explode
	object end
	// Reference: DecoActivities_Sound'Cannister_Generic_Red.DA_Sound_Cannister_Red_Explode'
	DestroyedActivities(1)=DA_Sound_Cannister_Red_Explode
	DestroyedActivities(2)='dnGame.DecoActivityDeclarations.DA_RadiusDamage_Standard'
	GrabInfo=(bCanDuckWhileHeld=false,MountItemOverride=mount_handright,MountOrigin=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0)
	DestroyedParticleFriendEffects(0)=(bAbsoluteLocation=false,bAbsoluteRotation=false,Scale=0,BoneName=None,Location=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0)
	StaticMesh='sm_class_decorations.Gas_Cannisters.Gas_Cannister_Red'
}