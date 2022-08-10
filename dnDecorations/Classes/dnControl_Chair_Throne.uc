/*******************************************************************************
 * dnControl_Chair_Throne generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnControl_Chair_Throne extends dnControl_Chair
	collapsecategories;

var() noexport name CrackNucklesTag "Trigger this tag to have actor crack his nuckles if he is idling in this char.";
var bool bForceAttachCompleteHack;
var localized string StandUpPrompt;

event PostBeginPlay()
{
	super(dnUsableSomething).PostBeginPlay();
	__NFUN_718__('CrackNuckles', CrackNucklesTag);
	return;
}

function TriggerFunc_CrackNuckles()
{
	ControlEvent(0, 'ForceNuckleCrack');
	return;
}

simulated function AttachPawnSuccess(Pawn Attachee, optional bool bForced)
{
	bForceAttachCompleteHack = bForced;
	super(dnControl).AttachPawnSuccess(Attachee, bForced);
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super.RegisterPrecacheComponents(PrecacheIndex);
	// End:0x60
	if(__NFUN_342__(CrackNucklesTag, 'None'))
	{
		PrecacheIndex.__NFUN_1277__(class'VoicePack_Duke', 'KnuckleCrack_01');
		PrecacheIndex.__NFUN_1277__(class'VoicePack_Duke', 'KnuckleCrack_02');
		PrecacheIndex.__NFUN_1277__(class'VoicePack_Duke', 'KnuckleCrack_03');
	}
	return;
}

state() idle
{
	simulated event BeginState()
	{
		local Actor StoredMountParent;

		super(Object).BeginState();
		// End:0x9F
		if(__NFUN_148__(bForceAttachCompleteHack, __NFUN_340__(InternalControlRemapper, none)))
		{
			StoredMountParent = InternalControlRemapper.MountParent;
			InternalControlRemapper.DestroyOnDismount = false;
			InternalControlRemapper.__NFUN_631__();
			InternalControlRemapper.MountOrigin = __NFUN_232__(1.5, 0, -41);
			InternalControlRemapper.MountAngles = __NFUN_265__(0, 0, 0);
			InternalControlRemapper.__NFUN_635__(StoredMountParent, false, false, false, false, false);
		}
		return;
	}

	simulated function UsableSomethingQueryInteractKeyInfoState(HUD HUD)
	{
		super(dnUsableSomething).UsableSomethingQueryInteractKeyInfoState(HUD);
		// End:0x2B
		if(bUsable)
		{
			SetHUDKeyInfoState(HUD, 1, true, 1,,, StandUpPrompt);
		}
		return;
	}
	stop;
}

state() CrackNuckles
{	stop;
}