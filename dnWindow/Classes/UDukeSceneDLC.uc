/*******************************************************************************
 * UDukeSceneDLC generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeSceneDLC extends UDukeSceneTemplate;

var UDukeMenuNewDLCButton DLCButton;
var localized string DLCText;
var localized string DLCHelp;
var localized string NewDLCText;
var localized string NewDLCHelp;
var localized string DLCDisabledHelp;
var OnlineAgent OnlineAgent;
var UWindowDialogControl DefferedUWindowDialogControl;
var OnlineAgentListener AgentListener;

function Created()
{
	local int i;

	super.Created();
	OnlineAgent = OnlineAgent(class'Engine'.static.__NFUN_503__());
	AgentListener = new (none) class'OnlineAgentListener';
	AgentListener.__OnDLCRescanComplete__Delegate = OnDLCRescanComplete;
	OnlineAgent.RegisterListener(AgentListener);
	DLCButton = UDukeMenuNewDLCButton(ScrollWindow.CreateSubWindow(class'UDukeMenuNewDLCButton',,,,, self));
	DLCButton.bOwnSelectionIcon = false;
	DLCButton.NormalText = DLCText;
	DLCButton.NewDLCText = NewDLCText;
	DLCButton.NormalHelp = DLCHelp;
	DLCButton.NewDLCHelp = NewDLCHelp;
	DLCButton.DisabledHelp = DLCDisabledHelp;
	DLCButton.Register(self);
	// End:0x15A
	if(__NFUN_148__(__NFUN_402__(), __NFUN_400__()))
	{		
		__NFUN_311__(DLCButton.NormalText, "*");		
		__NFUN_312__(DLCButton.DisabledHelp, "  *FINAL + REAL XMB ONLY!");
	}
	i = Entries.Add(1);
	Entries[i].Button = DLCButton;
	SetupNavigation();
	return;
}

function ButtonClicked(UDukeMenuButton Button, string Command)
{
	local Object Class;
	local class<UWindowScene> SceneClass;

	// End:0x9A
	if(__NFUN_339__(Button, DLCButton))
	{
		// End:0x52
		if(DLCButton.GreyedOut())
		{
			DukeConsole(Root.Console).DialogMgr.ShowDialogBox(52, self);			
		}
		else
		{
			// End:0x87
			if(__NFUN_402__())
			{
				DukeConsole(Root.Console).DialogMgr.ShowDialogBox(69, self);				
			}
			else
			{
				OnlineAgent.ShowStore();
			}
		}		
	}
	else
	{
		Class = __NFUN_366__(Command, class'Class');
		// End:0xBB
		if(__NFUN_339__(Class, none))
		{
			return;
		}
		SceneClass = class<UWindowScene>(Class);
		// End:0xE2
		if(__NFUN_340__(SceneClass, none))
		{
			NavigateForward(SceneClass);
		}
	}
	return;
}

function DukeSuperMessageBoxDone(int Result, Engine.Object.EConsole_Dialog id)
{
	// End:0x24
	if(__NFUN_173__(int(id), int(69)))
	{
		// End:0x24
		if(__NFUN_173__(Result, 1))
		{
			DefferedUWindowDialogControl = DLCButton;
		}
	}
	return;
}

function NotifyRemovingFromScenesList()
{
	OnlineAgent.UnregisterListener(AgentListener);
	return;
}

function Tick(float Delta)
{
	local UDukeRootWindow.EOnlinePermissionCheck OnlinePermissionCheck;

	super(UWindowScene).Tick(Delta);
	// End:0x96
	if(__NFUN_402__())
	{
		// End:0x96
		if(__NFUN_339__(DefferedUWindowDialogControl, DLCButton))
		{
			OnlinePermissionCheck = UDukeRootWindow(Root).TickOnlinePermissionCheck(false, true);
			// End:0x6C
			if(__NFUN_173__(int(OnlinePermissionCheck), int(0)))
			{
				// End:0x6C
				if(__NFUN_339__(DefferedUWindowDialogControl, DLCButton))
				{
					OnlineAgent.ShowStore();
				}
			}
			// End:0x96
			if(__NFUN_174__(int(OnlinePermissionCheck), int(2)))
			{
				DefferedUWindowDialogControl = none;
				UDukeRootWindow(Root).ResetOnlinePermissionCheck();
			}
		}
	}
	// End:0x102
	if(__NFUN_339__(class'Engine'.default.NetworkDevice, class'AgentNetDriver'))
	{
		// End:0xF2
		if(__NFUN_150__(__NFUN_148__(__NFUN_145__(__NFUN_402__()), __NFUN_145__(OnlineAgent.IsSignedIn())), __NFUN_148__(__NFUN_402__(), __NFUN_400__())))
		{
			DLCButton.GreyOut();			
		}
		else
		{
			DLCButton.Ungrey();
		}
	}
	return;
}

function OnNavReturn()
{
	OnlineAgent.CheckForNewDLC();
	super(UWindowScene).OnNavReturn();
	return;
}

function OnNavForward()
{
	AgentListener.__OnNewDLCCheckComplete__Delegate = OnNewDLCCheckComplete;
	AgentListener.__OnNewDLCInstalled__Delegate = OnNewDLCInstalled;
	OnlineAgent.CheckForNewDLC();
	OnlineAgent.RegisterListener(AgentListener);
	super(UWindowScene).OnNavForward();
	// End:0x98
	if(OnlineAgent.IsDLCCorrupt())
	{
		DukeConsole(UDukeRootWindow(Root).Console).DialogMgr.ShowDialogBox(62);
	}
	ShowNewDlcInstalledNotification();
	return;
}

function ShowNewDlcInstalledNotification()
{
	local bool IsValid;
	local int OutValue;

	IsValid = __NFUN_375__("UI", "DlcNotificationsSeen", OutValue, "User.ini");
	// End:0xC7
	if(__NFUN_148__(IsValid, OnlineAgent.HasInstalledNewDlc(OutValue)))
	{
		DukeConsole(Root.Console).DialogMgr.ShowDialogBox(66, self);
		__NFUN_380__("UI", "DlcNotificationsSeen", OnlineAgent.GetInstalledDlcMask(), "User.ini");
		GetPlayerOwner().__NFUN_368__();
	}
	return;
}

function OnDLCRescanComplete()
{
	ShowNewDlcInstalledNotification();
	return;
}

function OnNewDLCCheckComplete(bool in_bNewDLCAvailable)
{
	DLCButton.bNewDLCAvailable = in_bNewDLCAvailable;
	return;
}

function OnNewDLCInstalled()
{
	OnlineAgent.CheckForNewDLC();
	return;
}

defaultproperties
{
	DLCText="<?int?dnWindow.UDukeSceneDLC.DLCText?>"
	DLCHelp="<?int?dnWindow.UDukeSceneDLC.DLCHelp?>"
	NewDLCText="<?int?dnWindow.UDukeSceneDLC.NewDLCText?>"
	NewDLCHelp="<?int?dnWindow.UDukeSceneDLC.NewDLCHelp?>"
	DLCDisabledHelp="<?int?dnWindow.UDukeSceneDLC.DLCDisabledHelp?>"
	TitleText="<?int?dnWindow.UDukeSceneDLC.TitleText?>"
}