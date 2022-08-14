/*******************************************************************************
 * Electronics_Generic_CashRegister generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Electronics_Generic_CashRegister extends Electronics_Generic
	collapsecategories;

defaultproperties
{
	DecoActivities_Default(0)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=none,ActivityID=(28,3),ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=('dnGame.DecoActivityDeclarations.DAR_Anim_NoneAllowed'),ActivityElements=(DecoActivities_Sound'Electronics_Generic_CashRegister.DA_Sound_Elec_Gen_CashReg_Closing',DecoActivities_Animation'Electronics_Generic_CashRegister.DA_Anim_Elec_Gen_CashReg_Closing','dnGame.DecoActivityDeclarations.DA_HUD_UsePhrase_Open'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0)),(ActivityRules=('dnGame.DecoActivityDeclarations.DAR_Anim_NoneAllowed'),ActivityElements=(DecoActivities_Sound'Electronics_Generic_CashRegister.DA_Sound_Elec_Gen_CashReg_Opening',DecoActivities_Animation'Electronics_Generic_CashRegister.DA_Anim_Elec_Gen_CashReg_Opening','dnGame.DecoActivityDeclarations.DA_HUD_UsePhrase_Close'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
	bSurviveDeath=true
	DestroyedActivities(0)=none
	DestroyedActivities(1)=DecoActivities_Sound'Electronics_Generic.DA_Sound_Destroyed_Electronic'
	DestroyedActivities(2)='dnGame.DecoActivityDeclarations.DA_Interact_bUsable_Disable'
	DestroyedActivities(3)='dnGame.DecoActivityDeclarations.DA_HUD_bDrawUsePhrase_Disable'
	DestroyedActivities(4)='dnGame.DecoActivityDeclarations.DA_Physics_PHYS_Karma_Set'
	bUseDecoAnim=false
	bForceUsePhrase=true
	bUsable=true
	DynamicInteractionClassification=7
	PhysicsMaterial='dnMaterial.dnPhysicsMaterial_Metal_Hollow'
	PhysicsMassType=1
	Physics=9
	bDumbMesh=false
	CollisionRadius=12
	CollisionHeight=5.9
	Mass=25
	DrawType=2
	Mesh='c_generic.CashRegister'
}