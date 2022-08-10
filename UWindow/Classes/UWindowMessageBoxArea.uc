/*******************************************************************************
 * UWindowMessageBoxArea generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UWindowMessageBoxArea extends UWindowWindow;

var string Message;

function float GetHeight(Canvas C)
{
	local float tW, tH, h;
	local int l;
	local float OldWinHeight;

	OldWinHeight = WinHeight;
	WinHeight = 1000;
	C.Font = C.BlockFont;
	TextSize(C, "A", tW, tH);
	l = WrapClipText(C, 0, 0, Message,,, true);
	h = __NFUN_195__(tH, float(l));
	WinHeight = OldWinHeight;
	return h;
	return;
}

function Paint(Canvas C, float X, float Y)
{
	C.Font = C.BlockFont;
	C.DrawColor = LookAndFeel.GetTextColor(self);
	WrapClipText(C, 0, 0, Message);
	C.DrawColor.R = 255;
	C.DrawColor.G = 255;
	C.DrawColor.B = 255;
	return;
}
