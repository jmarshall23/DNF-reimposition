/*******************************************************************************
 * UDukeSceneExtras generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeSceneExtras extends UDukeSceneTemplate;

function ButtonClicked(UDukeMenuButton Button, string Command)
{
	local class<UWindowScene> SceneClass;
	local class<UDukeMessageBox> MessageBoxClass;
	local UDukeMessageBox MessageBox;

	SceneClass = class<UWindowScene>(__NFUN_366__(Command, class'Class'));
	// End:0x32
	if(__NFUN_340__(SceneClass, none))
	{
		NavigateForward(SceneClass);		
	}
	else
	{
		MessageBoxClass = class<UDukeMessageBox>(__NFUN_366__(Command, class'Class'));
		// End:0xDA
		if(__NFUN_340__(MessageBoxClass, none))
		{
			MessageBox = UDukeMessageBox(CreateWindow(MessageBoxClass,,,,, self));
			MessageBox.SetupMessageBox(__NFUN_303__(Command, "Title"), __NFUN_303__(Command, "Message"), class'DukeDialogBoxManager'.default.YesStr, class'DukeDialogBoxManager'.default.NoStr);
			MessageBox.HideWindow();
			ShowModal(MessageBox);
		}
	}
	return;
}

function bool ShouldShowMenuItem(int Index)
{
	// End:0x44
	if(__NFUN_308__(Entries[Index].Command, "dnWindow.UDukeEnterBonusCodeMB"))
	{
		return class'ChallengeInfo'.static.__NFUN_1170__();
	}
	// End:0xC7
	if(__NFUN_340__(DukePlayer(GetPlayerOwner()), none))
	{
		// End:0xAB
		if(__NFUN_148__(__NFUN_308__(Entries[Index].Command, "dnWindow.UDukeSceneExtraSettings"), DukePlayer(GetPlayerOwner()).HasEnteredPreorderBonusBigHeadCode()))
		{
			return true;
		}
		// End:0xC7
		if(DukePlayer(GetPlayerOwner()).HasFullGameCompletion(0))
		{
			return true;
		}
	}
	return false;
	return;
}

function UpdateLockedItems()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x68 [Loop If]
	if(__NFUN_169__(i, string(Entries)))
	{
		// End:0x43
		if(ShouldShowMenuItem(i))
		{
			Entries[i].Button.ShowWindow();
			// [Explicit Continue]
			goto J0x5E;
		}
		Entries[i].Button.HideWindow();
		J0x5E:

		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x07;
	}
	return;
}

function OnNavForward()
{
	local int i;

	UpdateLockedItems();
	super(UWindowScene).OnNavForward();
	i = 0;
	J0x13:

	// End:0x89 [Loop If]
	if(__NFUN_169__(i, string(Entries)))
	{
		// End:0x7F
		if(ShouldShowMenuItem(i))
		{
			Entries[i].Button.ParentWindow.ChildInFocus = Entries[i].Button;
			LastFocus = Entries[i].Button;
			// [Explicit Break]
			goto J0x89;
		}
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x13;
	}
	J0x89:

	return;
}