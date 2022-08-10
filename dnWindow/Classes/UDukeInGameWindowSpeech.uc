/*******************************************************************************
 * UDukeInGameWindowSpeech generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeInGameWindowSpeech extends UDukeInGameWindow;

var int OptionOffset;
var int MinOptions;
var int OtherOffset[32];

function Created()
{
	local int i, j, W, h;
	local float XMod, YMod;
	local Color TextColor;

	return;
	return;
}

function BeforePaint(Canvas C, float X, float Y)
{
	local int W, h;
	local float XWidth, YHeight, XMod, YMod, XPos, YPos,
		YOffset, BottomTop, XL, YL;

	local Color TextColor;
	local int i;

	super(UWindowWindow).BeforePaint(C, X, Y);
	W = int(__NFUN_196__(Root.WinWidth, float(4)));
	h = W;
	// End:0x69
	if(__NFUN_150__(__NFUN_170__(W, 256), __NFUN_170__(h, 256)))
	{
		W = 256;
		h = 256;
	}
	XMod = __NFUN_195__(4, float(W));
	YMod = __NFUN_195__(3, float(h));
	XWidth = __NFUN_195__(__NFUN_196__(256, 960), XMod);
	YHeight = __NFUN_195__(__NFUN_196__(32, 720), YMod);
	TopButton.SetSize(XWidth, YHeight);
	TopButton.WinTop = 0;
	// End:0x110
	if(__NFUN_170__(OptionOffset, 0))
	{
		TopButton.bDisabled = false;		
	}
	else
	{
		TopButton.bDisabled = true;
	}
	i = 0;
	J0x129:

	// End:0x158 [Loop If]
	if(__NFUN_169__(i, OptionOffset))
	{
		OptionButtons[i].HideWindow();
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x129;
	}
	i = OptionOffset;
	J0x163:

	// End:0x23F [Loop If]
	if(__NFUN_169__(i, __NFUN_165__(MinOptions, OptionOffset)))
	{
		OptionButtons[i].ShowWindow();
		OptionButtons[i].SetSize(XWidth, YHeight);
		OptionButtons[i].bHighlightButton = true;
		OptionButtons[i].WinLeft = 0;
		OptionButtons[i].WinTop = __NFUN_195__(__NFUN_195__(__NFUN_196__(32, 720), YMod), float(__NFUN_166__(__NFUN_165__(i, 1), OptionOffset)));
		OptionButtons[i].bLeaveOnscreen = true;
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x163;
	}
	i = __NFUN_165__(MinOptions, OptionOffset);
	J0x251:

	// End:0x280 [Loop If]
	if(__NFUN_169__(i, NumOptions))
	{
		OptionButtons[i].HideWindow();
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x251;
	}
	BottomButton.SetSize(XWidth, YHeight);
	BottomButton.WinTop = __NFUN_195__(__NFUN_195__(__NFUN_196__(32, 720), YMod), float(__NFUN_165__(MinOptions, 1)));
	// End:0x2F3
	if(__NFUN_170__(NumOptions, __NFUN_165__(MinOptions, OptionOffset)))
	{
		BottomButton.bDisabled = false;		
	}
	else
	{
		BottomButton.bDisabled = true;
	}
	return;
}

function Paint(Canvas C, float X, float Y)
{
	local int i;

	super(UWindowWindow).Paint(C, X, Y);
	i = 0;
	J0x1C:

	// End:0x55 [Loop If]
	if(__NFUN_169__(i, NumOptions))
	{
		OptionButtons[i].FadeFactor = __NFUN_196__(FadeFactor, float(100));
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x1C;
	}
	return;
}

event bool KeyEvent(byte Key, byte Action, float Delta)
{
	local byte B;

	// End:0x2C
	if(__NFUN_173__(int(currentkey), int(Key)))
	{
		// End:0x2A
		if(__NFUN_173__(int(Action), 3))
		{
			currentkey = byte(-1);
		}
		return false;
	}
	// End:0x53
	if(__NFUN_173__(int(Key), 38))
	{
		currentkey = Key;
		Notify(TopButton, 2);
		return true;
	}
	// End:0x7A
	if(__NFUN_173__(int(Key), 40))
	{
		currentkey = Key;
		Notify(BottomButton, 2);
		return true;
	}
	B = byte(__NFUN_166__(int(Key), 48));
	// End:0xA2
	if(__NFUN_173__(int(B), 0))
	{
		B = 9;		
	}
	else
	{
		__NFUN_154__(B, byte(1));
	}
	// End:0xEE
	if(__NFUN_148__(__NFUN_172__(int(B), 0), __NFUN_169__(int(B), 10)))
	{
		currentkey = Key;
		Notify(OptionButtons[__NFUN_165__(int(B), OptionOffset)], 2);
		return true;
	}
	return false;
	return;
}

function Notify(UWindowWindow B, byte E)
{
	local int i;

	switch(E)
	{
		// End:0x0D
		case 11:
		// End:0x110
		case 2:
			i = 0;
			J0x19:

			// End:0xA9 [Loop If]
			if(__NFUN_169__(i, NumOptions))
			{
				// End:0x9F
				if(__NFUN_339__(B, OptionButtons[i]))
				{
					// End:0x79
					if(__NFUN_173__(CurrentType, 4))
					{
						Root.GetPlayerOwner().Speech(CurrentType, OtherOffset[i], 0);
						// [Explicit Continue]
						goto J0x9F;
					}
					Root.GetPlayerOwner().Speech(CurrentType, i, 0);
				}
				J0x9F:

				__NFUN_184__(i);
				// [Loop Continue]
				goto J0x19;
			}
			// End:0xD7
			if(__NFUN_339__(B, TopButton))
			{
				// End:0xD7
				if(__NFUN_170__(NumOptions, 8))
				{
					// End:0xD7
					if(__NFUN_170__(OptionOffset, 0))
					{
						__NFUN_185__(OptionOffset);
					}
				}
			}
			// End:0x10D
			if(__NFUN_339__(B, BottomButton))
			{
				// End:0x10D
				if(__NFUN_170__(NumOptions, 8))
				{
					// End:0x10D
					if(__NFUN_170__(__NFUN_166__(NumOptions, OptionOffset), 8))
					{
						__NFUN_184__(OptionOffset);
					}
				}
			}
			// End:0x113
			break;
		// End:0xFFFF
		default:
			break;
	}
	return;
}

defaultproperties
{
	WindowTitle="<?int?dnWindow.UDukeInGameWindowSpeech.WindowTitle?>"
}