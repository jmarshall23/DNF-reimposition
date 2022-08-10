/*******************************************************************************
 * UDukeConsoleEditControl generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeConsoleEditControl extends UWindowEditControl;

function Created()
{
	super.Created();
	EditBox.bNoShrinkFont = true;
	return;
}

function Paint(Canvas C, float X, float Y)
{
	LookAndFeel.DrawFullBorder(self, C, 1);
	return;
}

function BeforePaint(Canvas C, float X, float Y)
{
	local float tW, tH;

	super.BeforePaint(C, X, Y);
	C.Font = Root.GetFont(Font, C);
	// End:0x6B
	if(__NFUN_308__(Text, ""))
	{
		TextSize(C, "TESTy", tW, tH);		
	}
	else
	{
		TextSize(C, Text, tW, tH);
	}
	switch(Align)
	{
		// End:0xB6
		case 0:
			EditAreaDrawX = __NFUN_198__(__NFUN_199__(WinWidth, EditBoxWidth), float(1));
			TextX = 2;
			// End:0x114
			break;
		// End:0xDB
		case 1:
			EditAreaDrawX = 0;
			TextX = __NFUN_199__(WinWidth, tW);
			// End:0x114
			break;
		// End:0x111
		case 2:
			EditAreaDrawX = __NFUN_196__(__NFUN_199__(WinWidth, EditBoxWidth), float(2));
			TextX = __NFUN_196__(__NFUN_199__(WinWidth, tW), float(2));
			// End:0x114
			break;
		// End:0xFFFF
		default:
			break;
	}
	WinHeight = __NFUN_198__(tH, float(2));
	TextY = __NFUN_196__(__NFUN_199__(WinHeight, tH), float(2));
	EditBox.WinLeft = EditAreaDrawX;
	EditBox.WinTop = 0;
	EditBox.WinWidth = WinWidth;
	EditBox.WinHeight = WinHeight;
	EditBox.TextY = __NFUN_196__(__NFUN_199__(EditBox.WinHeight, tH), float(2));
	EditBox.bTextYSet = true;
	return;
}
