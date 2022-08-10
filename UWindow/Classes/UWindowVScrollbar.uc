/*******************************************************************************
 * UWindowVScrollbar generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UWindowVScrollbar extends UWindowWindow
	dependson(UWindowRootWindow);

var UWindowSBUpButton UpButton;
var UWindowSBDownButton DownButton;
var bool bDisabled;
var float MinPos;
var float MaxPos;
var float MaxVisible;
var float pos;
var float ThumbStart;
var float ThumbHeight;
var float NextClickTime;
var float DragY;
var bool bDragging;
var float ScrollAmount;
var bool bFramedWindow;
var bool bInBevel;
var Texture DrawTexture;
var Texture FillTexture;
var Region ThumbRegion;

function Show(float P)
{
	// End:0x0E
	if(__NFUN_200__(P, float(0)))
	{
		return;
	}
	// End:0x26
	if(__NFUN_201__(P, __NFUN_198__(MaxPos, MaxVisible)))
	{
		return;
	}
	J0x26:

	// End:0x4B [Loop If]
	if(__NFUN_200__(P, pos))
	{
		// End:0x48
		if(__NFUN_145__(Scroll(-1)))
		{
			// [Explicit Break]
			goto J0x4B;
		}
		// [Loop Continue]
		goto J0x26;
	}
	J0x4B:

	// End:0x7B [Loop If]
	if(__NFUN_201__(__NFUN_199__(P, pos), __NFUN_199__(MaxVisible, float(1))))
	{
		// End:0x78
		if(__NFUN_145__(Scroll(1)))
		{
			// [Explicit Break]
			goto J0x7B;
		}
		// [Loop Continue]
		goto J0x4B;
	}
	J0x7B:

	return;
}

function bool Scroll(float Delta)
{
	local float OldPos;

	OldPos = pos;
	pos = __NFUN_198__(pos, Delta);
	CheckRange();
	return __NFUN_204__(pos, __NFUN_198__(OldPos, Delta));
	return;
}

function SetRange(float NewMinPos, float NewMaxPos, float NewMaxVisible, optional float NewScrollAmount)
{
	// End:0x17
	if(__NFUN_204__(NewScrollAmount, float(0)))
	{
		NewScrollAmount = 1;
	}
	ScrollAmount = NewScrollAmount;
	MaxPos = __NFUN_199__(NewMaxPos, NewMaxVisible);
	MaxVisible = NewMaxVisible;
	CheckRange();
	return;
}

function CheckRange()
{
	local float IndicatorHeight, MoveHeight, Test1, Test2, ThumbY, ThumbHeight;

	local int Denom;

	// End:0x17
	if(bFramedWindow)
	{
		IndicatorHeight = 0;		
	}
	else
	{
		IndicatorHeight = 0;
	}
	// End:0x3F
	if(__NFUN_200__(pos, MinPos))
	{
		pos = MinPos;		
	}
	else
	{
		// End:0x59
		if(__NFUN_201__(pos, MaxPos))
		{
			pos = MaxPos;
		}
	}
	bDisabled = __NFUN_202__(MaxPos, MinPos);
	// End:0x83
	if(bDisabled)
	{
		pos = 0;		
	}
	else
	{
		LookAndFeel.SB_VSetSize(self, ThumbY, ThumbHeight);
	}
	return;
}

function Created()
{
	super.Created();
	return;
}

function BeforePaint(Canvas C, float X, float Y)
{
	CheckRange();
	return;
}

function Paint(Canvas C, float X, float Y)
{
	local float ArrowBuffer;

	ArrowBuffer = 0;
	C.Style = 5;
	DrawStretchedTexture(C, 0, ArrowBuffer, WinWidth, __NFUN_199__(WinHeight, __NFUN_195__(ArrowBuffer, float(2))), FillTexture, 1);
	DrawStretchedTextureSegment(C, 0, ThumbStart, WinWidth, ThumbHeight, float(ThumbRegion.X), float(ThumbRegion.Y), float(ThumbRegion.W), float(ThumbRegion.h), DrawTexture, 1);
	super.Paint(C, X, Y);
	return;
}

function LMouseDown(float X, float Y)
{
	super.LMouseDown(X, Y);
	// End:0x1B
	if(bDisabled)
	{
		return;
	}
	// End:0x5A
	if(__NFUN_200__(Y, ThumbStart))
	{
		Scroll(__NFUN_194__(__NFUN_199__(MaxVisible, float(1))));
		NextClickTime = __NFUN_198__(GetLevel().TimeSeconds, 0.5);
		return;
	}
	// End:0x9E
	if(__NFUN_201__(Y, __NFUN_198__(ThumbStart, ThumbHeight)))
	{
		Scroll(__NFUN_199__(MaxVisible, float(1)));
		NextClickTime = __NFUN_198__(GetLevel().TimeSeconds, 0.5);
		return;
	}
	// End:0xF1
	if(__NFUN_148__(__NFUN_203__(Y, ThumbStart), __NFUN_202__(Y, __NFUN_198__(ThumbStart, ThumbHeight))))
	{
		DragY = __NFUN_199__(Y, ThumbStart);
		bDragging = true;
		Root.CaptureMouse();
		return;
	}
	return;
}

function Tick(float Delta)
{
	local bool bUp, bDown;
	local float X, Y;

	// End:0x0B
	if(bDragging)
	{
		return;
	}
	bUp = false;
	bDown = false;
	// End:0x61
	if(bMouseDown)
	{
		GetMouseXY(X, Y);
		bUp = __NFUN_200__(Y, ThumbStart);
		bDown = __NFUN_201__(Y, __NFUN_198__(ThumbStart, ThumbHeight));
	}
	// End:0xCD
	if(__NFUN_148__(__NFUN_148__(__NFUN_148__(bMouseDown, __NFUN_201__(NextClickTime, float(0))), __NFUN_200__(NextClickTime, GetLevel().TimeSeconds)), bUp))
	{
		Scroll(__NFUN_194__(__NFUN_199__(MaxVisible, float(1))));
		NextClickTime = __NFUN_198__(GetLevel().TimeSeconds, 0.1);
	}
	// End:0x137
	if(__NFUN_148__(__NFUN_148__(__NFUN_148__(bMouseDown, __NFUN_201__(NextClickTime, float(0))), __NFUN_200__(NextClickTime, GetLevel().TimeSeconds)), bDown))
	{
		Scroll(__NFUN_199__(MaxVisible, float(1)));
		NextClickTime = __NFUN_198__(GetLevel().TimeSeconds, 0.1);
	}
	// End:0x167
	if(__NFUN_150__(__NFUN_145__(bMouseDown), __NFUN_148__(__NFUN_145__(bUp), __NFUN_145__(bDown))))
	{
		NextClickTime = 0;
	}
	return;
}

function MouseMove(float X, float Y)
{
	// End:0x8E
	if(__NFUN_148__(__NFUN_148__(bDragging, bMouseDown), __NFUN_145__(bDisabled)))
	{
		J0x21:

		// End:0x56 [Loop If]
		if(__NFUN_148__(__NFUN_200__(Y, __NFUN_198__(ThumbStart, DragY)), __NFUN_201__(pos, MinPos)))
		{
			Scroll(-1);
			// [Loop Continue]
			goto J0x21;
		}
		J0x56:

		// End:0x8B [Loop If]
		if(__NFUN_148__(__NFUN_201__(Y, __NFUN_198__(ThumbStart, DragY)), __NFUN_200__(pos, MaxPos)))
		{
			Scroll(1);
			// [Loop Continue]
			goto J0x56;
		}		
	}
	else
	{
		bDragging = false;
	}
	return;
}

defaultproperties
{
	DrawTexture='Menu.MP.mp_generalassets'
	FillTexture='Menu.MP.scroll_bg'
	ThumbRegion=(X=21,Y=387,W=22,h=80)
}