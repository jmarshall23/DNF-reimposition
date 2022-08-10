/*******************************************************************************
 * UDukeCustomItemContainer generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeCustomItemContainer extends UWindowDialogControl;

var bool bSelected;
var string Title;
var float ObjAlpha;
var float textOffset;
var Color BkgColor;
var float borderwidth;
var float TitleXPct;
var float TitleYPct;
var Engine.Object.EChallengeCustomizeCategory Category;
var Texture CurrentImage;

function FindSelectedItem()
{
	local int i;
	local array<int> ItemArray;
	local int Idx;

	// End:0x16
	if(__NFUN_173__(int(Category), int(4)))
	{
		FindSelectedItemShirts();
		return;
	}
	CurrentImage = none;
	DukeMultiPlayer(GetPlayerOwner()).PlayerProgress.GetChallengeIDFromStorage(ItemArray, Category);
	__NFUN_355__(__NFUN_303__(__NFUN_303__(string(self), "::FindSelectedItem:ItemArray.Length:"), string(string(ItemArray))));
	i = 0;
	J0x86:

	// End:0x186 [Loop If]
	if(__NFUN_169__(i, string(ItemArray)))
	{
		// End:0x17C
		if(__NFUN_173__(int(DukeMultiPlayer(GetPlayerOwner()).PlayerProgress.GetChallengeStatus(ItemArray[i])), int(3)))
		{
			Idx = class'ChallengeInfo'.static.__NFUN_1169__(ItemArray[i]);
			// End:0x175
			if(__NFUN_309__(class'ChallengeInfo'.default.ChallengesArray[Idx].image, ""))
			{
				CurrentImage = Texture(__NFUN_366__(class'ChallengeInfo'.default.ChallengesArray[Idx].image, class'Texture'));
				__NFUN_355__(__NFUN_303__(__NFUN_303__(string(self), "::FindSelectedItem::"), class'ChallengeInfo'.default.ChallengesArray[Idx].image));
				// [Explicit Continue]
				goto J0x17C;
			}
			CurrentImage = none;
		}
		J0x17C:

		__NFUN_182__(i);
		// [Loop Continue]
		goto J0x86;
	}
	return;
}

function FindSelectedItemShirts()
{
	local int i;
	local array<int> ItemArray;
	local int Idx;

	CurrentImage = none;
	DukeMultiPlayer(GetPlayerOwner()).PlayerProgress.GetChallengeIDFromStorage(ItemArray, 4);
	i = 0;
	J0x35:

	// End:0x146 [Loop If]
	if(__NFUN_169__(i, string(ItemArray)))
	{
		// End:0x13C
		if(__NFUN_173__(int(DukeMultiPlayer(GetPlayerOwner()).PlayerProgress.GetChallengeStatus(ItemArray[i])), int(3)))
		{
			Idx = class'ChallengeInfo'.static.__NFUN_1169__(ItemArray[i]);
			// End:0x135
			if(__NFUN_309__(class'ChallengeInfo'.default.ChallengesArray[Idx].image, ""))
			{
				CurrentImage = Texture(__NFUN_366__(class'ChallengeInfo'.default.ChallengesArray[Idx].image, class'Texture'));
				__NFUN_355__(__NFUN_303__(__NFUN_303__(string(self), "::FindSelectedItemShirts(CCC_Shirt)::"), class'ChallengeInfo'.default.ChallengesArray[Idx].image));
				// [Explicit Continue]
				goto J0x13C;
			}
			CurrentImage = none;
		}
		J0x13C:

		__NFUN_182__(i);
		// [Loop Continue]
		goto J0x35;
	}
	// End:0x295
	if(__NFUN_339__(CurrentImage, none))
	{
		DukeMultiPlayer(GetPlayerOwner()).PlayerProgress.GetChallengeIDFromStorage(ItemArray, 5);
		i = 0;
		J0x180:

		// End:0x295 [Loop If]
		if(__NFUN_169__(i, string(ItemArray)))
		{
			// End:0x28B
			if(__NFUN_173__(int(DukeMultiPlayer(GetPlayerOwner()).PlayerProgress.GetChallengeStatus(ItemArray[i])), int(3)))
			{
				Idx = class'ChallengeInfo'.static.__NFUN_1169__(ItemArray[i]);
				// End:0x284
				if(__NFUN_309__(class'ChallengeInfo'.default.ChallengesArray[Idx].image, ""))
				{
					CurrentImage = Texture(__NFUN_366__(class'ChallengeInfo'.default.ChallengesArray[Idx].image, class'Texture'));
					__NFUN_355__(__NFUN_303__(__NFUN_303__(string(self), "::FindSelectedItemShirts(CCC_ShirtLogo)::"), class'ChallengeInfo'.default.ChallengesArray[Idx].image));
					// [Explicit Continue]
					goto J0x28B;
				}
				CurrentImage = none;
			}
			J0x28B:

			__NFUN_182__(i);
			// [Loop Continue]
			goto J0x180;
		}
	}
	return;
}

function Paint(Canvas C, float X, float Y)
{
	local float ImageSize, txtoffsetX, textscale, XL, YL, TextXL,
		TextYL;

	local int Lines;

	super(UWindowWindow).Paint(C, X, Y);
	C.Font = C.TallFont;
	// End:0x58
	if(__NFUN_339__(ParentWindow.ChildInFocus, self))
	{
		textscale = 1.2;		
	}
	else
	{
		textscale = 1;
	}
	TextSize(C, Title, TextXL, TextYL, __NFUN_195__(class'UWindowScene'.default.TTFontScale, textscale), __NFUN_195__(class'UWindowScene'.default.TTFontScale, textscale));
	TextSize(C, Title, XL, YL, __NFUN_195__(class'UWindowScene'.default.TTFontScale, 1.2), __NFUN_195__(class'UWindowScene'.default.TTFontScale, 1.2));
	txtoffsetX = __NFUN_195__(textOffset, class'UWindowScene'.default.WinScaleX);
	UWindowScene(ParentWindow).DrawBackgroundBox(C, __NFUN_198__(XL, textOffset), 0, __NFUN_199__(__NFUN_199__(WinWidth, borderwidth), XL), WinHeight);
	// End:0x186
	if(__NFUN_339__(ParentWindow.ChildInFocus, self))
	{
		C.DrawColor = class'UWindowScene'.default.OrangeColor;		
	}
	else
	{
		C.DrawColor = class'UWindowScene'.default.GreyColor;
	}
	ImageSize = __NFUN_195__(WinHeight, 0.9);
	// End:0x2EE
	if(__NFUN_340__(CurrentImage, none))
	{
		C.DrawColor = WhiteColor;
		// End:0x274
		if(__NFUN_150__(__NFUN_173__(int(Category), int(4)), __NFUN_173__(int(Category), int(5))))
		{
			ImageSize = __NFUN_199__(WinHeight, __NFUN_195__(borderwidth, float(3)));
			DrawStretchedTexture(C, __NFUN_198__(__NFUN_198__(__NFUN_199__(__NFUN_196__(__NFUN_199__(WinWidth, __NFUN_198__(XL, textOffset)), 2), __NFUN_196__(ImageSize, 2)), XL), textOffset), __NFUN_195__(borderwidth, 1.5), ImageSize, ImageSize, CurrentImage, ObjAlpha,,, true);			
		}
		else
		{
			DrawStretchedTextureSegment(C, __NFUN_198__(__NFUN_198__(__NFUN_199__(__NFUN_196__(__NFUN_199__(WinWidth, __NFUN_198__(XL, textOffset)), 2), __NFUN_196__(ImageSize, 2)), XL), textOffset), __NFUN_195__(WinHeight, 0.05), ImageSize, ImageSize, 0, 0, 128, 128, CurrentImage, ObjAlpha,,,,, true);
		}
	}
	// End:0x326
	if(__NFUN_339__(ParentWindow.ChildInFocus, self))
	{
		C.DrawColor = class'UWindowScene'.default.OrangeColor;		
	}
	else
	{
		C.DrawColor = class'UWindowScene'.default.GreyColor;
	}
	ClipText(C, 0, __NFUN_199__(__NFUN_195__(TitleYPct, WinHeight), __NFUN_196__(TextYL, 2)), Title,, __NFUN_195__(class'UWindowScene'.default.TTFontScale, textscale), __NFUN_195__(class'UWindowScene'.default.TTFontScale, textscale), 1, 2);
	return;
}

function Click(float X, float Y)
{
	Notify(2);
	return;
}

function KeyDown(int Key, float X, float Y)
{
	super.KeyDown(Key, X, Y);
	switch(Key)
	{
		// End:0x23
		case int(13):
		// End:0x3C
		case int(210):
			Click(X, Y);
			// End:0x3F
			break;
		// End:0xFFFF
		default:
			break;
	}
	return;
}

defaultproperties
{
	ObjAlpha=0.7
	textOffset=10
	borderwidth=4
	TitleYPct=0.5
}