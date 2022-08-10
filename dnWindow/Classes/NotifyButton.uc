/*******************************************************************************
 * NotifyButton generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class NotifyButton extends UWindowButton;

var NotifyWindow NotifyWindow;
var Color TextColor;
var string Text;
var int Type;
var float LabelWidth;
var float LabelHeight;
var float xOffset;
var float FadeFactor;
var bool bLeftJustify;
var bool bHighlightButton;
var bool bDontSetLabel;
var Texture OtherTexture;
var Texture SelectedTexture;

function Paint(Canvas C, float X, float Y)
{
	local float Wx, Hy;
	local int W, h;
	local Color HUDColor;

	HUDColor.R = 255;
	HUDColor.G = 255;
	HUDColor.B = 255;
	C.DrawColor = HUDColor;
	// End:0x116
	if(__NFUN_148__(MouseIsOver(), bHighlightButton))
	{
		C.DrawColor.R = byte(__NFUN_191__(__NFUN_165__(int(C.DrawColor.R), 100), 0, 255));
		C.DrawColor.G = byte(__NFUN_191__(__NFUN_165__(int(C.DrawColor.G), 100), 0, 255));
		C.DrawColor.B = byte(__NFUN_191__(__NFUN_165__(int(C.DrawColor.B), 100), 0, 255));
		TextColor.R = 255;
		TextColor.G = 255;
		TextColor.B = 0;		
	}
	else
	{
		TextColor.R = 255;
		TextColor.G = 255;
		TextColor.B = 255;
	}
	super.Paint(C, X, Y);
	W = int(__NFUN_196__(WinWidth, float(4)));
	h = W;
	// End:0x19C
	if(__NFUN_150__(__NFUN_170__(W, 256), __NFUN_170__(h, 256)))
	{
		W = 256;
		h = 256;
	}
	// End:0x1B3
	if(__NFUN_204__(LabelWidth, float(0)))
	{
		LabelWidth = WinWidth;
	}
	// End:0x1CA
	if(__NFUN_204__(LabelHeight, float(0)))
	{
		LabelHeight = WinHeight;
	}
	C.DrawColor = TextColor;
	C.DrawColor.R = byte(__NFUN_195__(float(C.DrawColor.R), FadeFactor));
	C.DrawColor.G = byte(__NFUN_195__(float(C.DrawColor.G), FadeFactor));
	C.DrawColor.B = byte(__NFUN_195__(float(C.DrawColor.B), FadeFactor));
	TextSize(C, Text, Wx, Hy);
	// End:0x2C1
	if(bLeftJustify)
	{
		ClipText(C, xOffset, __NFUN_196__(__NFUN_199__(LabelHeight, Hy), float(2)), Text);		
	}
	else
	{
		ClipText(C, __NFUN_196__(__NFUN_199__(LabelWidth, Wx), float(2)), __NFUN_196__(__NFUN_199__(LabelHeight, Hy), float(2)), Text);
	}
	C.DrawColor.R = 255;
	C.DrawColor.G = 255;
	C.DrawColor.B = 255;
	return;
}

function SetTextColor(Color NewColor)
{
	TextColor = NewColor;
	return;
}

function Notify(byte E)
{
	NotifyWindow.Notify(self, E);
	return;
}

defaultproperties
{
	bIgnoreLDoubleClick=false
}