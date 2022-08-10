/*******************************************************************************
 * UDukeInGamePulldownTeamsMenu generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeInGamePulldownTeamsMenu extends UWindowPulldownMenu;

var UWindowPulldownMenuItem Options[8];

function Created()
{
	local int i, NumTeams;
	local class<dnDeathmatchGame_TeamDM> V;

	super.Created();
	// End:0x4D
	if(__NFUN_340__(GetPlayerOwner().GameReplicationInfo, none))
	{
		V = class<dnDeathmatchGame_TeamDM>(__NFUN_366__(GetPlayerOwner().GameReplicationInfo.GameClass, class'Class'));		
	}
	else
	{
		return;
	}
	NumTeams = __NFUN_188__(8, V.default.MaxTeams);
	i = 0;
	J0x6F:

	// End:0xCB [Loop If]
	if(__NFUN_169__(i, NumTeams))
	{
		Options[i] = AddMenuItem(V.default.TeamNames[i], none);
		Options[i].Index = i;
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x6F;
	}
	return;
}

function ExecuteItem(UWindowPulldownMenuItem Item)
{
	GetPlayerOwner().ChangeTeam(Item.Index);
	super.ExecuteItem(Item);
	return;
}

function CloseUp(bool bByParent)
{
	super.CloseUp(bByParent);
	HideWindow();
	return;
}

function ShowWindow()
{
	Selected = none;
	super.ShowWindow();
	return;
}
