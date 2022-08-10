/*******************************************************************************
 * UDukePageWindow generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukePageWindow extends UWindowPageWindow;

var bool bBuildDefaultButtons;
var UWindowSmallButton ResetButton;
var localized string ResetText;
var UWindowSmallButton CloseButton;
var localized string CloseText;

function SelectedThisTab(UDukeTabControl tabSelected)
{
	return;
}

function Created()
{
	super(UWindowWindow).Created();
	return;
}

function Paint(Canvas C, float X, float Y)
{
	super(UWindowDialogClientWindow).Paint(C, X, Y);
	return;
}

function NotifyFromControl(UWindowDialogControl C, byte E)
{
	local UWindowFramedWindow FramedParent;

	super(UWindowWindow).NotifyFromControl(C, E);
	// End:0x4A
	if(__NFUN_173__(int(E), 2))
	{
		switch(C)
		{
			// End:0x36
			case CloseButton:
				ClosePressed();
				// End:0x4A
				break;
			// End:0x47
			case ResetButton:
				ResetPressed();
				// End:0x4A
				break;
			// End:0xFFFF
			default:
				break;
		}
	}
	else
	{
		// End:0xC6
		if(__NFUN_340__(ParentWindow, none))
		{
			FramedParent = UWindowFramedWindow(ParentWindow);
			// End:0xC6
			if(__NFUN_148__(__NFUN_339__(FramedParent, none), __NFUN_340__(ParentWindow.ParentWindow, none)))
			{
				FramedParent = UWindowFramedWindow(ParentWindow.ParentWindow);
				// End:0xC6
				if(__NFUN_339__(FramedParent, none))
				{
					FramedParent = UWindowFramedWindow(GetParent(class'UWindowFramedWindow'));
				}
			}
		}
		// End:0xD4
		if(__NFUN_339__(FramedParent, none))
		{
			return;
		}
		// End:0x100
		if(__NFUN_173__(int(E), 8))
		{
			FramedParent.StatusBarText = C.HelpText;
		}
		// End:0x141
		if(__NFUN_148__(__NFUN_173__(int(E), 13), C.MouseIsOver()))
		{
			FramedParent.StatusBarText = C.HelpText;
		}
		// End:0x160
		if(__NFUN_173__(int(E), 9))
		{
			FramedParent.StatusBarText = "";
		}
		return;
	}
}

function ClosePressed()
{
	Close();
	return;
}

function ResetPressed()
{
	return;
}

defaultproperties
{
	bBuildDefaultButtons=true
	ResetText="<?int?dnWindow.UDukePageWindow.ResetText?>"
	CloseText="<?int?dnWindow.UDukePageWindow.CloseText?>"
}