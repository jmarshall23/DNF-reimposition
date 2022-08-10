/*******************************************************************************
 * UDukeSceneMultiPlayerPreGameLobby generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeSceneMultiPlayerPreGameLobby extends UWindowScene;

var UDukeMenuButton StartGameButton;
var localized string StartGameText;
var UDukeMenuButton RestartGameButton;
var localized string RestartGameText;
var UDukeMenuButton NewGameButton;
var localized string NewGameText;
var UDukeMenuButton DisconnectButton;
var localized string DisconnectText;
var localized string FragGoal;
var localized string TeamGoal;
var localized string TimeLimit;
var localized string RoundTimeLimit;
var UDukeLobbyPlayerList PlayerList;
var Color GoldColor;

function Created()
{
	StartGameButton = UDukeMenuButton(CreateWindow(class'UDukeMenuButton', 1, 1, 1, 1));
	StartGameButton.SetText(StartGameText);
	StartGameButton.Register(self);
	RestartGameButton = UDukeMenuButton(CreateWindow(class'UDukeMenuButton', 1, 1, 1, 1));
	RestartGameButton.SetText(RestartGameText);
	RestartGameButton.Register(self);
	NewGameButton = UDukeMenuButton(CreateWindow(class'UDukeMenuButton', 1, 1, 1, 1));
	NewGameButton.SetText(NewGameText);
	NewGameButton.Register(self);
	DisconnectButton = UDukeMenuButton(CreateWindow(class'UDukeMenuButton', 1, 1, 1, 1));
	DisconnectButton.SetText(DisconnectText);
	DisconnectButton.Register(self);
	PlayerList = UDukeLobbyPlayerList(CreateWindow(class'UDukeLobbyPlayerList', 1, 1, 1, 1));
	PlayerList.Register(self);
	FirstControlToFocus = StartGameButton;
	StartGameButton.NavDown = NewGameButton;
	NewGameButton.NavDown = RestartGameButton;
	RestartGameButton.NavDown = DisconnectButton;
	DisconnectButton.NavDown = StartGameButton;
	StartGameButton.NavUp = DisconnectButton;
	NewGameButton.NavUp = StartGameButton;
	RestartGameButton.NavUp = NewGameButton;
	DisconnectButton.NavUp = RestartGameButton;
	PlayerList.NavLeft = StartGameButton;
	StartGameButton.NavRight = PlayerList;
	RestartGameButton.NavRight = PlayerList;
	DisconnectButton.NavRight = PlayerList;
	NewGameButton.NavRight = PlayerList;
	super.Created();
	return;
}

function SetupButtons(Canvas C, out float YOffset)
{
	StartGameButton.HideWindow();
	RestartGameButton.HideWindow();
	NewGameButton.HideWindow();
	// End:0x212
	if(__NFUN_173__(int(GetPlayerOwner().Level.NetMode), int(NM_ListenServer)))
	{
		// End:0x105
		if(__NFUN_145__(GetPlayerOwner().Level.Game.MatchStarted()))
		{
			StartGameButton.ShowWindow();
			StartGameButton.WinLeft = float(ButtonLeft);
			StartGameButton.WinTop = YOffset;
			StartGameButton.WinWidth = float(ButtonWidth);
			StartGameButton.WinHeight = float(ButtonHeight);
			__NFUN_209__(YOffset, __NFUN_198__(StartGameButton.WinHeight, float(ControlBuffer)));			
		}
		else
		{
			RestartGameButton.ShowWindow();
			RestartGameButton.WinLeft = float(ButtonLeft);
			RestartGameButton.WinTop = YOffset;
			RestartGameButton.WinWidth = float(ButtonWidth);
			RestartGameButton.WinHeight = float(ButtonHeight);
			__NFUN_209__(YOffset, __NFUN_198__(RestartGameButton.WinHeight, float(ControlBuffer)));
			NewGameButton.ShowWindow();
			NewGameButton.WinLeft = float(ButtonLeft);
			NewGameButton.WinTop = YOffset;
			NewGameButton.WinWidth = float(ButtonWidth);
			NewGameButton.WinHeight = float(ButtonHeight);
			__NFUN_209__(YOffset, __NFUN_198__(NewGameButton.WinHeight, float(ControlBuffer)));
		}		
	}
	else
	{
		PlayerList.NavLeft = DisconnectButton;
	}
	DisconnectButton.WinLeft = float(ButtonLeft);
	DisconnectButton.WinTop = YOffset;
	DisconnectButton.WinWidth = float(ButtonWidth);
	DisconnectButton.WinHeight = float(ButtonHeight);
	__NFUN_209__(YOffset, __NFUN_198__(DisconnectButton.WinHeight, float(ControlBuffer)));
	return;
}

function Paint(Canvas C, float MouseX, float MouseY)
{
	local Font OldFont;
	local float XL, YL, xOffset, YOffset, Padding;

	local string TimeString;
	local DukePlayer P;
	local dnDeathmatchGameReplicationInfo GRI;
	local string S;

	super.Paint(C, MouseX, MouseY);
	GRI = dnDeathmatchGameReplicationInfo(GetPlayerOwner().GameReplicationInfo);
	// End:0x3E
	if(__NFUN_339__(GRI, none))
	{
		return;
	}
	P = DukePlayer(GetPlayerOwner());
	// End:0x5D
	if(__NFUN_339__(P, none))
	{
		return;
	}
	ControlStart = int(__NFUN_195__(float(75), WinScaleY));
	ButtonLeft = int(__NFUN_195__(float(75), WinScaleY));
	YOffset = float(ControlStart);
	OldFont = C.Font;
	C.Font = C.BlockFont;
	C.DrawColor = WhiteColor;
	Padding = 0;
	S = GRI.ServerName;
	TextSize(C, S, XL, YL, class'UWindowScene'.default.TTFontScale, class'UWindowScene'.default.TTFontScale);
	xOffset = __NFUN_198__(float(ButtonLeft), __NFUN_195__(float(20), WinScaleY));
	__NFUN_209__(YOffset, YL);
	ClipText(C, xOffset, YOffset, S, false, class'UWindowScene'.default.TTFontScale, class'UWindowScene'.default.TTFontScale);
	__NFUN_209__(YOffset, __NFUN_198__(YL, Padding));
	S = "";
	// End:0x1C8
	if(__NFUN_340__(GRI, none))
	{
		S = __NFUN_319__(GRI.GameName);
	}
	TextSize(C, S, XL, YL, class'UWindowScene'.default.TTFontScale, class'UWindowScene'.default.TTFontScale);
	ClipText(C, xOffset, YOffset, S, false, class'UWindowScene'.default.TTFontScale, class'UWindowScene'.default.TTFontScale);
	__NFUN_209__(YOffset, __NFUN_198__(YL, Padding));
	S = P.Level.Title;
	TextSize(C, S, XL, YL, class'UWindowScene'.default.TTFontScale, class'UWindowScene'.default.TTFontScale);
	ClipText(C, xOffset, YOffset, S, false, class'UWindowScene'.default.TTFontScale, class'UWindowScene'.default.TTFontScale);
	__NFUN_209__(YOffset, __NFUN_198__(YL, Padding));
	S = "";
	// End:0x32D
	if(__NFUN_170__(GRI.GoalTeamScore, 0))
	{
		S = __NFUN_303__(TeamGoal, string(GRI.GoalTeamScore));		
	}
	else
	{
		// End:0x360
		if(__NFUN_170__(GRI.FragLimit, 0))
		{
			S = __NFUN_303__(FragGoal, string(GRI.FragLimit));
		}
	}
	// End:0x3D4
	if(__NFUN_170__(GRI.RoundTimeLimit, 0))
	{
		TimeString = GetTime(GRI.RoundTimeLimit);
		// End:0x3B3
		if(__NFUN_308__(S, ""))
		{
			S = __NFUN_303__(RoundTimeLimit, TimeString);			
		}
		else
		{
			S = __NFUN_303__(__NFUN_303__(__NFUN_303__(S, "/"), RoundTimeLimit), TimeString);
		}
	}
	// End:0x453
	if(__NFUN_170__(GRI.TimeLimit, 0))
	{
		// End:0x41F
		if(__NFUN_308__(S, ""))
		{
			S = __NFUN_302__(__NFUN_303__(TimeLimit, string(GRI.TimeLimit)), ":00");			
		}
		else
		{
			S = __NFUN_302__(__NFUN_303__(__NFUN_303__(__NFUN_303__(S, "/"), TimeLimit), string(GRI.TimeLimit)), ":00");
		}
	}
	// End:0x4E4
	if(__NFUN_309__(S, ""))
	{
		TextSize(C, S, XL, YL, class'UWindowScene'.default.TTFontScale, class'UWindowScene'.default.TTFontScale);
		ClipText(C, xOffset, YOffset, S, false, class'UWindowScene'.default.TTFontScale, class'UWindowScene'.default.TTFontScale);
		__NFUN_209__(YOffset, __NFUN_198__(YL, Padding));
	}
	S = "";
	// End:0x523
	if(__NFUN_170__(GRI.NumPlayers, 0))
	{
		S = __NFUN_303__(string(GRI.NumPlayers), "PLAYERS");
	}
	// End:0x5A0
	if(__NFUN_170__(GRI.NumSpectators, 0))
	{
		// End:0x56D
		if(__NFUN_308__(S, ""))
		{
			S = __NFUN_303__(string(GRI.NumSpectators), "Spectators");			
		}
		else
		{
			S = __NFUN_303__(__NFUN_303__(__NFUN_303__(S, "/"), string(GRI.NumSpectators)), "Spectators");
		}
	}
	// End:0x658
	if(__NFUN_170__(__NFUN_166__(GRI.MinPlayers, GRI.NumPlayers), 0))
	{
		// End:0x610
		if(__NFUN_308__(S, ""))
		{
			S = __NFUN_303__(string(__NFUN_166__(GRI.MinPlayers, GRI.NumPlayers)), "Players needed");			
		}
		else
		{
			S = __NFUN_303__(__NFUN_303__(__NFUN_303__(S, "/"), string(__NFUN_166__(GRI.MinPlayers, GRI.NumPlayers))), "Players needed");
		}
	}
	// End:0x6E9
	if(__NFUN_309__(S, ""))
	{
		TextSize(C, S, XL, YL, class'UWindowScene'.default.TTFontScale, class'UWindowScene'.default.TTFontScale);
		ClipText(C, xOffset, YOffset, S, false, class'UWindowScene'.default.TTFontScale, class'UWindowScene'.default.TTFontScale);
		__NFUN_209__(YOffset, __NFUN_198__(YL, Padding));
	}
	S = "";
	// End:0x7A1
	if(__NFUN_309__(GRI.GameEndedComments, ""))
	{
		S = GRI.GameEndedComments;
		TextSize(C, S, XL, YL, class'UWindowScene'.default.TTFontScale, class'UWindowScene'.default.TTFontScale);
		ClipText(C, xOffset, YOffset, S, false, class'UWindowScene'.default.TTFontScale, class'UWindowScene'.default.TTFontScale);
		__NFUN_209__(YOffset, __NFUN_198__(YL, Padding));
	}
	SetupButtons(C, YOffset);
	PlayerList.WinLeft = __NFUN_198__(float(__NFUN_165__(ButtonLeft, ButtonWidth)), __NFUN_195__(float(25), WinScaleY));
	PlayerList.WinWidth = __NFUN_199__(__NFUN_199__(WinWidth, float(ButtonLeft)), PlayerList.WinLeft);
	PlayerList.WinTop = float(ControlStart);
	PlayerList.WinHeight = __NFUN_195__(640, WinScaleY);
	C.Font = OldFont;
	return;
}

function DrawPlayersList(Canvas C, float Padding)
{
	local float xOffset, YOffset;
	local string S;
	local float XL, YL;
	local int i;
	local dnDeathmatchGameReplicationInfo GRI;

	S = "TEST";
	TextSize(C, S, XL, YL, class'UWindowScene'.default.TTFontScale, class'UWindowScene'.default.TTFontScale);
	xOffset = float(__NFUN_165__(__NFUN_165__(ButtonLeft, ButtonWidth), 25));
	YOffset = float(ControlStart);
	LookAndFeel.Bevel_DrawSimpleBevel(self, C, int(xOffset), int(YOffset), int(__NFUN_199__(__NFUN_199__(WinWidth, xOffset), float(ButtonLeft))), int(__NFUN_195__(float(17), __NFUN_198__(YL, Padding))), 1);
	GRI = dnDeathmatchGameReplicationInfo(GetPlayerOwner().GameReplicationInfo);
	// End:0xDE
	if(__NFUN_339__(GRI, none))
	{
		return;
	}
	// End:0x309
	if(__NFUN_170__(GRI.NumPlayers, 0))
	{
		i = 0;
		J0xFA:

		// End:0x309 [Loop If]
		if(__NFUN_169__(i, string(GRI.PRIArray)))
		{
			S = GRI.PRIArray[i].PlayerName;
			// End:0x221
			if(GRI.bTeamGame)
			{
				// End:0x221
				if(__NFUN_174__(int(GRI.PRIArray[i].Team), 255))
				{
					S = __NFUN_303__(__NFUN_303__(__NFUN_317__(GRI.PRIArray[i].TeamName, 1), "-"), S);
					C.DrawColor = UDukeLookAndFeel(LookAndFeel).TeamColor[int(GRI.PRIArray[i].Team)];
					DrawStretchedTexture(C, xOffset, YOffset, __NFUN_199__(WinWidth, __NFUN_195__(xOffset, 2)), YL, class'WhiteTexture');
				}
			}
			// End:0x25E
			if(__NFUN_145__(GRI.PRIArray[i].IsSpectating()))
			{
				C.DrawColor = WhiteColor;				
			}
			else
			{
				C.DrawColor = GoldColor;
				S = __NFUN_303__(S, "- SPECTATOR");
			}
			TextSize(C, S, XL, YL, class'UWindowScene'.default.TTFontScale, class'UWindowScene'.default.TTFontScale);
			ClipText(C, xOffset, YOffset, S, false, class'UWindowScene'.default.TTFontScale, class'UWindowScene'.default.TTFontScale);
			__NFUN_184__(i);
			// [Loop Continue]
			goto J0xFA;
		}
	}
	return;
}

function NotifyFromControl(UWindowDialogControl C, byte E)
{
	super.NotifyFromControl(C, E);
	switch(E)
	{
		// End:0x18C
		case 2:
			switch(C)
			{
				// End:0xE0
				case DisconnectButton:
					// End:0x9A
					if(UDukeRootWindow(Root).AgentOnline.IsInGame())
					{
						DukeConsole(Root.Console).DialogMgr.ShowWaitingForResponseDialog();
						UDukeRootWindow(Root).AgentOnline.LeaveGame();						
					}
					else
					{						
						GetPlayerOwner().ConsoleCommand("DISCONNECT");
					}
					GetPlayerOwner().Player.Console.HideLobby();
					// End:0x189
					break;
				// End:0x13F
				case StartGameButton:
					// End:0x112
					if(__NFUN_148__(__NFUN_401__(), false))
					{
						GetPlayerOwner().Level.XboxStartMatch();						
					}
					else
					{
						dnDeathmatchGame(GetPlayerOwner().Level.Game).StartMatch();
					}
					// End:0x189
					break;
				// End:0x170
				case RestartGameButton:
					GetPlayerOwner().Level.ServerTravel("?Restart", false);
					// End:0x189
					break;
				// End:0x186
				case NewGameButton:
					NavigateForward(class'UDukeSceneMultiplayerCreate');
					// End:0x189
					break;
				// End:0xFFFF
				default:
					break;
			}
			// End:0x18F
			break;
		// End:0xFFFF
		default:
			break;
	}
	return;
}

function string TwoDigitString(int Num)
{
	// End:0x1C
	if(__NFUN_169__(Num, 10))
	{
		return __NFUN_302__("0", string(Num));		
	}
	else
	{
		return string(Num);
	}
	return;
}

simulated function string GetTime(int ElapsedTime)
{
	local string S;
	local int seconds, Minutes, Hours;

	seconds = ElapsedTime;
	Minutes = __NFUN_163__(seconds, 60);
	Hours = __NFUN_163__(Minutes, 60);
	seconds = __NFUN_166__(seconds, __NFUN_162__(Minutes, 60));
	Minutes = __NFUN_166__(Minutes, __NFUN_162__(Hours, 60));
	// End:0x9C
	if(__NFUN_170__(Hours, 0))
	{
		S = __NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(TwoDigitString(Hours), ":"), TwoDigitString(Minutes)), ":"), TwoDigitString(seconds));		
	}
	else
	{
		S = __NFUN_302__(__NFUN_302__(TwoDigitString(Minutes), ":"), TwoDigitString(seconds));
	}
	return S;
	return;
}

defaultproperties
{
	StartGameText="<?int?dnWindow.UDukeSceneMultiPlayerPreGameLobby.StartGameText?>"
	RestartGameText="<?int?dnWindow.UDukeSceneMultiPlayerPreGameLobby.RestartGameText?>"
	NewGameText="<?int?dnWindow.UDukeSceneMultiPlayerPreGameLobby.NewGameText?>"
	DisconnectText="<?int?dnWindow.UDukeSceneMultiPlayerPreGameLobby.DisconnectText?>"
	FragGoal="<?int?dnWindow.UDukeSceneMultiPlayerPreGameLobby.FragGoal?>"
	TeamGoal="<?int?dnWindow.UDukeSceneMultiPlayerPreGameLobby.TeamGoal?>"
	TimeLimit="<?int?dnWindow.UDukeSceneMultiPlayerPreGameLobby.TimeLimit?>"
	RoundTimeLimit="<?int?dnWindow.UDukeSceneMultiPlayerPreGameLobby.RoundTimeLimit?>"
	GoldColor=(B=36,G=1,R=255,A=37)
	bNoLogo=true
	bSuppressSoundOnNavForward=true
}