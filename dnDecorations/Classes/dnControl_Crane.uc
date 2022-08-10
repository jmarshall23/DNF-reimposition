/*******************************************************************************
 * dnControl_Crane generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnControl_Crane extends dnControl
	collapsecategories;

k2call simulated function StartControl()
{
	return;
}

k2call simulated function StopControl()
{
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super.RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1277__(VoicePack, 'CraneControl_LeverDown');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'CraneControl_LeverUp');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'CraneControl_PressButton');
	return;
}

state CraneReleaseStateBase
{
	k2call simulated function Release()
	{
		FindAndPlaySound('CraneControl_LeverDown', 1);
		return;
	}

	simulated function UsableSomethingQueryInteractKeyInfoState(HUD HUD)
	{
		SetHUDKeyInfoState(HUD, 2, true, 7);
		SetHUDKeyInfoState(HUD, 3, true, 8);
		SetHUDKeyInfoState(HUD, 0, true, 9);
		SetHUDKeyInfoState(HUD, 1, true, 10);
		SetHUDKeyInfoState(HUD, 6, true, 26);
		return;
	}
	stop;
}

state CraneSmoothReleaseStateBase
{
	simulated function UsableSomethingQueryInteractKeyInfoState(HUD HUD)
	{
		SetHUDKeyInfoState(HUD, 2, true, 7);
		SetHUDKeyInfoState(HUD, 3, true, 8);
		SetHUDKeyInfoState(HUD, 0, true, 9);
		SetHUDKeyInfoState(HUD, 1, true, 10);
		SetHUDKeyInfoState(HUD, 6, true, 26);
		return;
	}
	stop;
}

state CranePressStateBase
{
	k2call simulated function Press()
	{
		FindAndPlaySound('CraneControl_LeverUp', 1);
		return;
	}
	stop;
}

state() idle
{
	simulated function UsableSomethingQueryInteractKeyInfoState(HUD HUD)
	{
		SetHUDKeyInfoState(HUD, 2, true, 7);
		SetHUDKeyInfoState(HUD, 3, true, 8);
		SetHUDKeyInfoState(HUD, 0, true, 9);
		SetHUDKeyInfoState(HUD, 1, true, 10);
		SetHUDKeyInfoState(HUD, 6, true, 26);
		return;
	}
	stop;
}

state() PressUp extends CranePressStateBase
{
	simulated function UsableSomethingQueryInteractKeyInfoState(HUD HUD)
	{
		return;
	}
	stop;
}

state() HoldUp
{
	simulated function UsableSomethingQueryInteractKeyInfoState(HUD HUD)
	{
		super(dnUsableSomething).UsableSomethingQueryInteractKeyInfoState(HUD);
		return;
	}
	stop;
}

state() ReleaseUp extends CraneReleaseStateBase
{	stop;
}

state() SmoothReleaseUp extends CraneSmoothReleaseStateBase
{	stop;
}

state() PressDown extends CranePressStateBase
{
	simulated function UsableSomethingQueryInteractKeyInfoState(HUD HUD)
	{
		return;
	}
	stop;
}

state() HoldDown
{
	simulated function UsableSomethingQueryInteractKeyInfoState(HUD HUD)
	{
		return;
	}
	stop;
}

state() ReleaseDown extends CraneReleaseStateBase
{	stop;
}

state() SmoothReleaseDown extends CraneSmoothReleaseStateBase
{	stop;
}

state() PressLeft extends CranePressStateBase
{
	simulated function UsableSomethingQueryInteractKeyInfoState(HUD HUD)
	{
		return;
	}
	stop;
}

state() HoldLeft
{
	simulated function UsableSomethingQueryInteractKeyInfoState(HUD HUD)
	{
		return;
	}
	stop;
}

state() ReleaseLeft extends CraneReleaseStateBase
{	stop;
}

state() SmoothReleaseLeft extends CraneSmoothReleaseStateBase
{	stop;
}

state() PressRight extends CranePressStateBase
{
	simulated function UsableSomethingQueryInteractKeyInfoState(HUD HUD)
	{
		return;
	}
	stop;
}

state() HoldRight
{
	simulated function UsableSomethingQueryInteractKeyInfoState(HUD HUD)
	{
		return;
	}
	stop;
}

state() ReleaseRight extends CraneReleaseStateBase
{	stop;
}

state() SmoothReleaseRight extends CraneSmoothReleaseStateBase
{	stop;
}

state() PressButton
{
	k2call simulated function Press()
	{
		FindAndPlaySound('CraneControl_PressButton', 1);
		return;
	}

	simulated function UsableSomethingQueryInteractKeyInfoState(HUD HUD)
	{
		return;
	}
	stop;
}

defaultproperties
{
	States=/* Array type was not detected. */
}