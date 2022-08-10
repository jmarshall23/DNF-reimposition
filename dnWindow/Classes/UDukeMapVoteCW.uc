/*******************************************************************************
 * UDukeMapVoteCW generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeMapVoteCW extends UDukePageWindow;

var UDukeVoteCW myParent;
var UWindowSmallButton VoteButton;
var localized string VoteText;
var localized string VoteHelp;
var UWindowLabelControl GameLabel;
var UWindowComboControl GameCombo;
var localized string GameText;
var localized string GameHelp;
var string Games[256];
var int MaxGames;
var UWindowLabelControl MapLabel;
var UWindowComboControl MapCombo;
var localized string MapText;
var localized string MapHelp;
var Texture CurrentMapSShot;
var Texture NoScreenshot;
var string MapTitle;
var string MapAuthor;
var string IdealPlayerCount;
var localized string IdealPlayerMessage;
var bool bInitialized;

function Created()
{
	local int i, j, Selection;
	local class<GameInfo> TempClass;
	local string tempgame, NextGame, TempGames;

	myParent = UDukeVoteCW(GetParent(class'UDukeVoteCW'));
	// End:0x58
	if(__NFUN_339__(myParent, none))
	{
		__NFUN_355__("Error: UDukeMapVoteCW without UDukeVoteCW parent.");
	}
	GameLabel = UWindowLabelControl(CreateControl(class'UWindowLabelControl', 1, 1, 1, 1));
	GameLabel.SetText(GameText);
	GameLabel.SetFont(6);
	GameLabel.Align = 1;
	GameCombo = UWindowComboControl(CreateControl(class'UWindowComboControl', 1, 1, 1, 1));
	GameCombo.SetHelpText(GameHelp);
	GameCombo.SetFont(6);
	GameCombo.SetEditable(false);
	GameCombo.Align = 1;
	NextGame = GetPlayerOwner().__NFUN_763__("GameInfo", 0);
	J0x14E:

	// End:0x199 [Loop If]
	if(__NFUN_309__(NextGame, ""))
	{
		TempGames[i] = NextGame;
		__NFUN_184__(i);
		NextGame = GetPlayerOwner().__NFUN_763__("GameInfo", i);
		// [Loop Continue]
		goto J0x14E;
	}
	i = 0;
	J0x1A0:

	// End:0x225 [Loop If]
	if(__NFUN_169__(i, 256))
	{
		// End:0x21B
		if(__NFUN_309__(TempGames[i], ""))
		{
			Games[MaxGames] = TempGames[i];
			TempClass = class<GameInfo>(__NFUN_366__(Games[MaxGames], class'Class'));
			GameCombo.AddItem(TempClass.default.GameName);
			__NFUN_184__(MaxGames);
		}
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x1A0;
	}
	GameCombo.SetSelectedIndex(0);
	MapLabel = UWindowLabelControl(CreateControl(class'UWindowLabelControl', 1, 1, 1, 1));
	MapLabel.SetText(MapText);
	MapLabel.SetFont(6);
	MapLabel.Align = 1;
	MapCombo = UWindowComboControl(CreateControl(class'UWindowComboControl', 1, 1, 1, 1));
	MapCombo.SetHelpText(MapHelp);
	MapCombo.SetFont(6);
	MapCombo.SetEditable(false);
	MapCombo.Align = 1;
	VoteButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 1, 1, 1, 1));
	VoteButton.SetText(VoteText);
	VoteButton.SetHelpText(VoteHelp);
	VoteButton.SetFont(6);
	myParent.GameType = Games[0];
	myParent.GameClass = class<GameInfo>(__NFUN_366__(myParent.GameType, class'Class'));
	super.Created();
	bInitialized = true;
	IterateMaps();
	MapCombo.SetSelectedIndex(0);
	return;
}

function BeforePaint(Canvas C, float X, float Y)
{
	local int CenterWidth, CColLeft, CColRight;

	super(UWindowWindow).BeforePaint(C, X, Y);
	// End:0x22
	if(__NFUN_173__(ResizeFrames, 0))
	{
		return;
	}
	__NFUN_185__(ResizeFrames);
	CenterWidth = __NFUN_162__(int(__NFUN_196__(WinWidth, float(4))), 3);
	CColLeft = 450;
	CColRight = 457;
	GameCombo.SetSize(150, GameCombo.WinHeight);
	GameCombo.WinLeft = float(__NFUN_166__(CColRight, 80));
	GameCombo.WinTop = __NFUN_196__(__NFUN_199__(WinHeight, float(192)), float(2));
	GameLabel.AutoSize(C);
	GameLabel.WinLeft = __NFUN_199__(__NFUN_199__(float(CColLeft), GameLabel.WinWidth), float(80));
	GameLabel.WinTop = __NFUN_198__(GameCombo.WinTop, float(8));
	MapCombo.SetSize(150, MapCombo.WinHeight);
	MapCombo.WinLeft = float(__NFUN_166__(CColRight, 80));
	MapCombo.WinTop = __NFUN_198__(__NFUN_198__(GameCombo.WinTop, GameCombo.WinHeight), float(2));
	MapLabel.AutoSize(C);
	MapLabel.WinLeft = __NFUN_199__(__NFUN_199__(float(CColLeft), MapLabel.WinWidth), float(80));
	MapLabel.WinTop = __NFUN_198__(MapCombo.WinTop, float(8));
	VoteButton.AutoSize(C);
	VoteButton.WinLeft = __NFUN_196__(__NFUN_199__(WinWidth, VoteButton.WinWidth), float(2));
	VoteButton.WinTop = __NFUN_199__(__NFUN_199__(WinHeight, VoteButton.WinHeight), float(10));
	return;
}

function IterateMaps()
{
	local string FirstMap, NextMap, TestMap;

	FirstMap = GetPlayerOwner().__NFUN_760__(myParent.GameClass.default.MapPrefix, "", 0);
	MapCombo.Clear();
	NextMap = FirstMap;
	J0x4B:

	// End:0xC7 [Loop If]
	if(__NFUN_145__(__NFUN_310__(FirstMap, TestMap)))
	{
		MapCombo.AddItem(__NFUN_317__(NextMap, __NFUN_166__(__NFUN_314__(NextMap), 4)), NextMap);
		NextMap = GetPlayerOwner().__NFUN_760__(myParent.GameClass.default.MapPrefix, NextMap, 1);
		TestMap = NextMap;
		// [Loop Continue]
		goto J0x4B;
	}
	MapCombo.Sort();
	return;
}

function Paint(Canvas C, float X, float Y)
{
	super.Paint(C, X, Y);
	LookAndFeel.Bevel_DrawSimpleBevel(self, C, 10, __NFUN_163__(int(__NFUN_199__(WinHeight, float(192))), 2), 256, 192, 1);
	C.DrawColor = WhiteColor;
	C.Style = 1;
	ClipText(C, 10, __NFUN_196__(__NFUN_198__(__NFUN_198__(WinHeight, float(192)), float(15)), float(2)), MapTitle);
	// End:0xD5
	if(__NFUN_340__(CurrentMapSShot, none))
	{
		DrawStretchedTexture(C, 10, __NFUN_196__(__NFUN_199__(WinHeight, float(192)), float(2)), 256, 192, CurrentMapSShot, 1);
	}
	return;
}

function MapChanged()
{
	local LevelSummary l;
	local string MapName;

	// End:0x0D
	if(__NFUN_145__(bInitialized))
	{
		return;
	}
	myParent.Map = MapCombo.GetValue2();
	MapName = MapCombo.GetValue();
	CurrentMapSShot = Texture(__NFUN_366__(__NFUN_302__(MapName, ".Screenshot"), class'Texture'));
	// End:0x82
	if(__NFUN_339__(CurrentMapSShot, none))
	{
		CurrentMapSShot = NoScreenshot;
	}
	l = LevelSummary(__NFUN_366__(__NFUN_302__(MapName, ".LevelSummary"), class'LevelSummary'));
	// End:0xFA
	if(__NFUN_340__(l, none))
	{
		MapTitle = l.Title;
		MapAuthor = l.Author;
		IdealPlayerCount = l.IdealPlayerCount;		
	}
	else
	{
		MapTitle = "";
		MapAuthor = "";
		IdealPlayerCount = "";
	}
	return;
}

function GameChanged()
{
	local int CurrentGame, i;

	// End:0x0D
	if(__NFUN_145__(bInitialized))
	{
		return;
	}
	CurrentGame = GameCombo.GetSelectedIndex();
	myParent.GameType = Games[CurrentGame];
	myParent.GameClass = class<GameInfo>(__NFUN_366__(myParent.GameType, class'Class'));
	// End:0x100
	if(__NFUN_339__(myParent.GameClass, none))
	{
		__NFUN_185__(MaxGames);
		// End:0xD7
		if(__NFUN_170__(MaxGames, CurrentGame))
		{
			i = CurrentGame;
			J0xA1:

			// End:0xD4 [Loop If]
			if(__NFUN_169__(i, MaxGames))
			{
				Games[i] = Games[__NFUN_165__(i, 1)];
				__NFUN_184__(i);
				// [Loop Continue]
				goto J0xA1;
			}			
		}
		else
		{
			// End:0xE9
			if(__NFUN_170__(CurrentGame, 0))
			{
				__NFUN_185__(CurrentGame);
			}
		}
		GameCombo.SetSelectedIndex(CurrentGame);
		return;
	}
	// End:0x123
	if(__NFUN_340__(MapCombo, none))
	{
		IterateMaps();
		MapCombo.SetSelectedIndex(0);
	}
	myParent.GameChanged();
	return;
}

function NotifyFromControl(UWindowDialogControl C, byte E)
{
	super.NotifyFromControl(C, E);
	// End:0x1D
	if(__NFUN_145__(bInitialized))
	{
		return;
	}
	switch(E)
	{
		// End:0x5A
		case 1:
			switch(C)
			{
				// End:0x43
				case GameCombo:
					GameChanged();
					// End:0x57
					break;
				// End:0x54
				case MapCombo:
					MapChanged();
					// End:0x57
					break;
				// End:0xFFFF
				default:
					break;
			}
			goto J0xAF;
		// End:0xAC
		case 2:
			switch(C)
			{
				// End:0xA9
				case VoteButton:
					GetPlayerOwner().ServerCallVote("map", myParent.Map, myParent.GameType);
					// End:0xAC
					break;
					// End:0xAC
					break;
				// End:0xFFFF
				default:
					break;
			}
		// End:0xFFFF
		default:
			J0xAF:

			return;
			break;
	}
}

defaultproperties
{
	VoteText="<?int?dnWindow.UDukeMapVoteCW.VoteText?>"
	VoteHelp="<?int?dnWindow.UDukeMapVoteCW.VoteHelp?>"
	GameText="<?int?dnWindow.UDukeMapVoteCW.GameText?>"
	GameHelp="<?int?dnWindow.UDukeMapVoteCW.GameHelp?>"
	MapText="<?int?dnWindow.UDukeMapVoteCW.MapText?>"
	MapHelp="<?int?dnWindow.UDukeMapVoteCW.MapHelp?>"
	NoScreenshot='dt_hud.Screenshots.noscreenavailable'
}