/*******************************************************************************
 * Workman generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Workman extends Male
	config
	collapsecategories;

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super.RegisterPrecacheComponents(PrecacheIndex);
	// End:0xDF
	if(__NFUN_310__(PrecacheIndex.MapName, "Map22"))
	{
		PrecacheIndex.__NFUN_1277__(class'VoicePack_EDF1', 'CPR_Breath');
		PrecacheIndex.__NFUN_1277__(class'VoicePack_EDF1', 'CPR_Inhale');
		PrecacheIndex.__NFUN_1277__(class'VoicePack_EDF1', 'CPR_Push');
		PrecacheIndex.__NFUN_1277__(class'VoicePack_EDF1', 'ST_Getup_FootScrape');
		PrecacheIndex.__NFUN_1277__(class'VoicePack_EDF1', 'ST_Getup_Hand');
		PrecacheIndex.__NFUN_1277__(class'VoicePack_EDF1', 'ST_Getup_StandShift');
		PrecacheIndex.__NFUN_1277__(class'VoicePack_President', 'Sound_Screams');
		PrecacheIndex.__NFUN_1277__(class'VoicePack_President', 'Sound_Death');
	}
	return;
}

defaultproperties
{
	HasLookTargetEvaluator=true
	LookTargetEvalInfo=(MyOwner=none,EvalInterval=0.5,Suspended=false,bSuspendedWithNoTarget=false,Evaluator=2,ForceUpdate=false,MustBePawn=false,MustBeSighted=false,MustBeReachable=false,CanTargetProjectiles=false,CanAvoidTargetableProjectiles=false,LastTarget=none,LastTargetEndTime=0)
	DisableAimGrids=true
	AutoRegisterIKClasses=/* Array type was not detected. */
}