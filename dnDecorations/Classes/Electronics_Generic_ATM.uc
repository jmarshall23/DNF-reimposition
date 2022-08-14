/*******************************************************************************
 * Electronics_Generic_ATM generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Electronics_Generic_ATM extends Electronics_Generic
	collapsecategories;

const CashSpitterName = 'CASH_SPITTER';

var() noexport float TimeBeforeBoot "Time in seconds that ATM will wait before booting.. after the effects of an EMP blast have worn off";
var() noexport int UsesBeforeCatMessage "Number of times this has to be used before displaying 'stray cat' easter egg message.";
var SoftParticleSystem CashSpitter;
var bool bBooting;
var int EasterEggCounter;

event PostVerifySelf()
{
	super(dnDecoration).PostVerifySelf();
	CashSpitter = SoftParticleSystem(FindMountedActor('CASH_SPITTER'));
	return;
}

function HitByEMP(optional float Duration, optional Pawn Instigator)
{
	super.HitByEMP(Duration, Instigator);
	bPoweredBeforeEMP = true;
	return;
}

function ForcePowerOn()
{
	super.ForcePowerOn();
	bBooting = true;
	__NFUN_607__(TimeBeforeBoot, false, 'PlayBootSound');
	return;
}

final function PlayBootSound()
{
	FindAndPlaySound('ATM_BootUp', 1);
	bBooting = false;
	return;
}

simulated function bool CanBeUsedBy(Pawn User)
{
	// End:0x2D
	if(__NFUN_148__(__NFUN_148__(super(InteractiveActor).CanBeUsedBy(User), __NFUN_145__(bEMPulsed)), __NFUN_145__(bBooting)))
	{
		return true;		
	}
	else
	{
		return false;
	}
	return;
}

event Used(Actor Other, Pawn EventInstigator)
{
	super(dnDecoration).Used(Other, EventInstigator);
	// End:0x29
	if(__NFUN_340__(CashSpitter, none))
	{
		CashSpitter.__NFUN_1055__();
	}
	FindAndPlaySound('ATM_Error', 1);
	DecoActivity(0, 'ActivateATM');
	__NFUN_184__(EasterEggCounter);
	// End:0x66
	if(__NFUN_173__(EasterEggCounter, UsesBeforeCatMessage))
	{
		DecoActivity(0, 'ShowKitty');
	}
	return;
}

function StopSpitting()
{
	// End:0x19
	if(__NFUN_340__(CashSpitter, none))
	{
		CashSpitter.__NFUN_1054__();
	}
	DecoActivity(0, 'ResetATM');
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super(dnDecoration).RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1277__(VoicePack, 'ATM_BootUp');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'ATM_Error');
	return;
}

defaultproperties
{
	TimeBeforeBoot=0.5
	UsesBeforeCatMessage=2
	DecoActivities_Default(0)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(ActivateATM),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Display'Electronics_Generic_ATM.DA_Display_Elec_Gen_ATM_OutOfOrder','dnGame.DecoActivityDeclarations.DA_HUD_bDrawUsePhrase_Disable','dnGame.DecoActivityDeclarations.DA_Interact_bUsable_Disable',DecoActivities_Events'Electronics_Generic_ATM.DA_Events_Elec_Gen_ATM_Activate'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
	DecoActivities_Default(1)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(ResetATM),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Display'Electronics_Generic_ATM.DA_Display_Elec_Gen_ATM_Normal','dnGame.DecoActivityDeclarations.DA_HUD_bDrawUsePhrase_Enable','dnGame.DecoActivityDeclarations.DA_Interact_bUsable_Enable'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
	DecoActivities_Default(2)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(ShowKitty),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Display'Electronics_Generic_ATM.DA_Display_Elec_Gen_ATM_Kitty'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
	HealthPrefab=0
	bUsable=true
	ShrunkUseStyle=2
	CollisionRadius=14
	CollisionHeight=37
	StaticMesh='sm_class_decorations.Electronics.EZCASH'
}