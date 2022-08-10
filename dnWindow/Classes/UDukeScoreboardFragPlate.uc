/*******************************************************************************
 * UDukeScoreboardFragPlate generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeScoreboardFragPlate extends UWindowWindow;

struct FragType
{
	var int Frags;
	var class<DamageType> DamageType;
};

var PlayerReplicationInfo PRI;
var float UpdateTime;
var FragType OrderedFrags[32];

function ShowWindow()
{
	SortFrags();
	super.ShowWindow();
	return;
}

function SortFrags()
{
	local FragType TempFrag;
	local int i, j, Max;

	// End:0x0E
	if(__NFUN_339__(PRI, none))
	{
		return;
	}
	i = 0;
	J0x15:

	// End:0xBB [Loop If]
	if(__NFUN_169__(i, 32))
	{
		// End:0x8D
		if(__NFUN_340__(PRI.FragTypes[i], none))
		{
			OrderedFrags[i].Frags = int(PRI.Frags[i]);
			OrderedFrags[i].DamageType = PRI.FragTypes[i];
			// [Explicit Continue]
			goto J0xB1;
		}
		OrderedFrags[i].Frags = 0;
		OrderedFrags[i].DamageType = none;
		J0xB1:

		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x15;
	}
	i = 0;
	J0xC2:

	// End:0x170 [Loop If]
	if(__NFUN_169__(i, 31))
	{
		Max = i;
		j = __NFUN_165__(i, 1);
		J0xE7:

		// End:0x12D [Loop If]
		if(__NFUN_169__(j, 32))
		{
			// End:0x123
			if(__NFUN_170__(OrderedFrags[j].Frags, OrderedFrags[Max].Frags))
			{
				Max = j;
			}
			__NFUN_184__(j);
			// [Loop Continue]
			goto J0xE7;
		}
		TempFrag = OrderedFrags[Max];
		OrderedFrags[Max] = OrderedFrags[i];
		OrderedFrags[i] = TempFrag;
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0xC2;
	}
	return;
}

function Paint(Canvas C, float X, float Y)
{
	local int i;
	local float XL, YL, LeftBorder, TopBorder, xOffset, YOffset;

	// End:0x0E
	if(__NFUN_339__(PRI, none))
	{
		return;
	}
	// End:0x73
	if(__NFUN_201__(Root.GetPlayerOwner().Level.TimeSeconds, UpdateTime))
	{
		SortFrags();
		UpdateTime = __NFUN_198__(Root.GetPlayerOwner().Level.TimeSeconds, 0.5);
	}
	C.DrawColor = Root.WhiteColor;
	LookAndFeel.Bevel_DrawSimpleBevel(self, C, 10, 10, int(__NFUN_199__(WinWidth, float(20))), int(__NFUN_199__(WinHeight, float(20))), 0.8);
	xOffset = 5;
	YOffset = 5;
	C.Font = C.BlockFontSmall;
	C.Style = 1;
	C.bCenter = false;
	C.__NFUN_1238__("TEST", XL, YL);
	LeftBorder = 10;
	TopBorder = 5;
	i = 0;
	J0x15A:

	// End:0x251 [Loop If]
	if(__NFUN_169__(i, 32))
	{
		// End:0x247
		if(__NFUN_340__(OrderedFrags[i].DamageType, none))
		{
			C.__NFUN_1250__(__NFUN_198__(xOffset, LeftBorder), __NFUN_198__(YOffset, TopBorder));
			C.__NFUN_1232__(OrderedFrags[i].DamageType.default.DamageName);
			C.__NFUN_1238__(string(OrderedFrags[i].Frags), XL, YL);
			C.__NFUN_1250__(__NFUN_199__(__NFUN_199__(WinWidth, XL), LeftBorder), __NFUN_198__(YOffset, TopBorder));
			C.__NFUN_1232__(string(OrderedFrags[i].Frags));
			__NFUN_209__(YOffset, YL);
		}
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x15A;
	}
	super.Paint(C, X, Y);
	return;
}

defaultproperties
{
	UpdateTime=0.5
}