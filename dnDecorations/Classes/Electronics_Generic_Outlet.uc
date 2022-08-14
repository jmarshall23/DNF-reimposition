/*******************************************************************************
 * Electronics_Generic_Outlet generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Electronics_Generic_Outlet extends Electronics_Generic
	abstract
	collapsecategories;

var() noexport float DamageAmount "How much to hurt the user by.";

simulated event Used(Actor Other, Pawn EventInstigator)
{
	super(dnDecoration).Used(Other, EventInstigator);
	// End:0x74
	if(__NFUN_340__(EventInstigator, none))
	{
		EventInstigator.HandQuickAction('HandQuickAction_Switch_FingerPush');
		EventInstigator.TakeDamage(none, DamageAmount, __NFUN_232__(0, 0, 0), __NFUN_232__(0, 0, 0), class'ElectricalDamage',, Location);
	}
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super(dnDecoration).RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1281__('HandQuickAction_Switch_FingerPush');
	PrecacheIndex.__NFUN_1279__(class'ElectricalDamage');
	return;
}

defaultproperties
{
	DamageAmount=1
	DecoActivities_Default(0)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=none,ActivityID=(3),ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Spawn'Electronics_Generic_Outlet.DA_Spawn_Electronics_Generic_Outlet_Used',DecoActivities_Sound'Electronics_Generic_Outlet.DA_Sound_Electronics_Generic_Outlet_Used'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
	DecoActivities_Default(1)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=none,ActivityID=(34),ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=('dnGame.DecoActivityDeclarations.DA_Interact_bUsable_Disable'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
	DecoActivities_Default(2)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=none,ActivityID=(33),ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=('dnGame.DecoActivityDeclarations.DA_Interact_bUsable_Enable'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
	HealthPrefab=0
	bUsable=true
	bBlockActors=false
	bBlockPlayers=false
	bBlockKarma=false
	bCastStencilShadows=false
	bDirectional=true
	bCollideWorld=false
	CollisionRadius=3
	CollisionHeight=4
	StaticMesh='sm_class_decorations.Electronics.electricaloutlet_2_LO'
}