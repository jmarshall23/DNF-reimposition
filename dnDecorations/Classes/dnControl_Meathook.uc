/*******************************************************************************
 * dnControl_Meathook generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnControl_Meathook extends dnControl
	collapsecategories;

state() idle
{
	simulated function UsableSomethingQueryInteractKeyInfoState(HUD HUD)
	{
		SetHUDKeyInfoState(HUD, 2, true, 7);
		SetHUDKeyInfoState(HUD, 3, true, 8);
		return;
	}
	stop;
}

state() TurnRight
{
	simulated function UsableSomethingQueryInteractKeyInfoState(HUD HUD)
	{
		return;
	}
	stop;
}

state() TurnLeft
{
	simulated function UsableSomethingQueryInteractKeyInfoState(HUD HUD)
	{
		return;
	}
	stop;
}
