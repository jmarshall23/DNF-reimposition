/*******************************************************************************
 * UDukeSceneControllerKeySetup generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeSceneControllerKeySetup extends UWindowScene;

var UDukeControllerBinderControl KeyBinder;
var UDukeScrollingWindow ScrollWindow;
var UDukeMessageBox ConfirmDefaults;
var localized string ConfirmDefaultsText;
var localized string ConfirmDefaultsTitle;
var bool bNeedProfileSave;

function Created()
{
	super.Created();
	ScrollWindow = UDukeScrollingWindow(CreateWindow(class'UDukeScrollingWindow',,,,, self));
	KeyBinder = UDukeControllerBinderControl(ScrollWindow.CreateSubWindow(class'UDukeControllerBinderControl', 1, 1, 1, 1, self));
	KeyBinder.WinScaleY = WinScaleY;
	KeyBinder.TTFontScale = TTFontScale;
	KeyBinder.Register(self);
	ConfirmDefaults = UDukeMessageBox(CreateWindow(class'UDukeMessageBox',,,,, self));
	ConfirmDefaults.SetupMessageBox(ConfirmDefaultsTitle, ConfirmDefaultsText, class'DukeDialogBoxManager'.default.YesStr, class'DukeDialogBoxManager'.default.NoStr);
	ConfirmDefaults.HideWindow();
	KeyButtons[2].ShowWindow();
	FirstControlToFocus = KeyBinder;
	return;
}

function Paint(Canvas C, float X, float Y)
{
	ChildInFocus = KeyBinder;
	super.Paint(C, X, Y);
	C.DrawColor = class'UWindowScene'.default.WhiteColor;
	KeyBinder.WinScaleY = WinScaleY;
	KeyBinder.TTFontScale = TTFontScale;
	KeyBinder.WinWidth = float(ButtonWidth);
	KeyBinder.WinHeight = __NFUN_195__(KeyBinder.KeyHeight, float(KeyBinder.LastKeyBind));
	ScrollWindow.WinWidth = float(ButtonWidth);
	ScrollWindow.WinLeft = float(ButtonLeft);
	ScrollWindow.WinTop = float(ControlStart);
	ScrollWindow.WinHeight = __NFUN_195__(300, WinScaleY);
	ScrollWindow.DesiredClientHeight = KeyBinder.WinHeight;
	return;
}

function OnNavForward()
{
	bNeedProfileSave = false;
	KeyBinder.LoadExistingKeys();
	super.OnNavForward();
	return;
}

function SaveConfigs()
{
	GetPlayerOwner().ConsoleCommand("LoadSpecialKeys");
	GetPlayerOwner().__NFUN_368__();
	// End:0x53
	if(bNeedProfileSave)
	{
		GetPlayerOwner().XBoxSaveProfile();
		bNeedProfileSave = false;
	}
	super(UWindowWindow).SaveConfigs();
	return;
}

function NavigateBack()
{
	SaveConfigs();
	super.NavigateBack();
	return;
}

function bool CheckMousePassThrough(float X, float Y)
{
	return __NFUN_150__(KeyBinder.bPolling, super.CheckMousePassThrough(X, Y));
	return;
}

function WindowEvent(UWindow.UWindowWindow.WinMessage msg, Canvas C, float X, float Y, int Key)
{
	// End:0x7A
	if(KeyBinder.bPolling)
	{
		// End:0x4E
		if(__NFUN_173__(int(msg), int(10)))
		{
			Paint(C, X, Y);
			PaintClients(C, X, Y);			
		}
		else
		{
			KeyBinder.WindowEvent(msg, C, X, Y, Key);
		}		
	}
	else
	{
		// End:0xC8
		if(__NFUN_173__(int(msg), int(7)))
		{
			// End:0xC8
			if(__NFUN_150__(__NFUN_173__(Key, KeyButtons[2].XBoxInputKey), __NFUN_173__(Key, KeyButtons[2].PCInputKey)))
			{
				ResetToDefaults();
			}
		}
		super.WindowEvent(msg, C, X, Y, Key);
	}
	return;
}

function DukeMessageBoxDone(UWindowWindow W, int iResult)
{
	// End:0x40
	if(__NFUN_339__(W, ConfirmDefaults))
	{
		// End:0x40
		if(__NFUN_170__(iResult, 0))
		{
			class'Input'.static.__NFUN_372__();
			KeyBinder.LoadExistingKeys();
			bNeedProfileSave = true;
		}
	}
	super(UWindowWindow).DukeMessageBoxDone(W, iResult);
	return;
}

function ResetToDefaults()
{
	// End:0x15
	if(KeyBinder.bPolling)
	{
		return;
	}
	// End:0x35
	if(__NFUN_145__(ConfirmDefaults.WindowIsVisible()))
	{
		ShowModal(ConfirmDefaults);
	}
	return;
}

function NotifyFromControl(UWindowDialogControl C, byte E)
{
	super.NotifyFromControl(C, E);
	// End:0x36
	if(__NFUN_173__(int(E), 2))
	{
		// End:0x36
		if(__NFUN_339__(C, KeyButtons[2]))
		{
			ResetToDefaults();
		}
	}
	return;
}

defaultproperties
{
	ConfirmDefaultsText="<?int?dnWindow.UDukeSceneControllerKeySetup.ConfirmDefaultsText?>"
	ConfirmDefaultsTitle="<?int?dnWindow.UDukeSceneControllerKeySetup.ConfirmDefaultsTitle?>"
	TitleText="<?int?dnWindow.UDukeSceneControllerKeySetup.TitleText?>"
}