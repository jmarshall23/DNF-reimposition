/*******************************************************************************
 * UDukeScenePostGameRewards generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeScenePostGameRewards extends UDukeScenePostGameBase;

const MaxEntries = 8;

var int NumEntries;
var localized string Title;
var Texture UnlockedImage;
var Region UnlockedImageRegion;
var Texture FillTexture;
var Region FillRegion;
var float OriginalFillTopEdge;
var float OriginalFillWidth;
var float OriginalFillHeight;
var Color BorderColor;
var bool bRunCountdown;
var bool IsTravelling;
var localized string BabeUnlockedPre;
var localized string BabeUnlockedPost;
var localized string ChallengeCompletePre;
var localized string ChallengeCompletePost;
var localized string YouHaveReachedLevelPre;
var localized string YouHaveReachedLevelPost;
var int Page;
var float BabeCentre;
var float BabeWidth;
var float BabeHeight;
var float SwitchTimer;
var float cSwitchTime;
var localized string ViewResults;
var SSoundInfo CountdownSoundInfo;

function Created()
{
	super(UWindowScene).Created();
	KeyButtons[0].HideWindow();
	KeyButtons[1].ShowWindow();
	KeyButtons[3].ShowWindow();
	KeyButtons[3].PCButton = class'UDukeKeyBinderControl'.default.LocalizedKeyName[32];
	KeyButtons[3].SetText(ViewResults);
	KeyButtons[1].SetText(__NFUN_356__("UDukeSceneMainMenu", "QuitTitle", "dnWindow"));
	return;
}

function SetBackgroundBoundries(Canvas C)
{
	borderwidth = 5;
	FillWidth = __NFUN_195__(OriginalFillWidth, WinScaleX);
	FillHeight = __NFUN_195__(OriginalFillHeight, WinScaleY);
	FillTopEdge = __NFUN_195__(OriginalFillTopEdge, WinScaleY);
	return;
}

function Paint(Canvas C, float X, float Y)
{
	local float XL, YL, XL1, XL2;
	local int i;
	local dnDeathmatchGameReplicationInfo GRI;
	local float TeamScoreSize;
	local int iTeam;
	local float ScoreSpacing;
	local string WinString, S;
	local int WinningPlayerIndex;
	local bool bTied;
	local float ChallengeRangeCenter, ChallengeRangeTop, ChallengeY;
	local Texture babeTexture;

	super.Paint(C, X, Y);
	babeTexture = none;
	C.Font = C.TallFont;
	C.DrawColor = WhiteColor;
	DrawStretchedTextureSegment(C, __NFUN_196__(__NFUN_199__(WinWidth, FillWidth), float(2)), FillTopEdge, FillWidth, FillHeight, float(FillRegion.X), float(FillRegion.Y), float(FillRegion.W), float(FillRegion.h), FillTexture, 0.5);
	C.DrawColor = BorderColor;
	DrawStretchedTexture(C, __NFUN_199__(__NFUN_196__(__NFUN_199__(WinWidth, FillWidth), float(2)), borderwidth), __NFUN_199__(FillTopEdge, borderwidth), __NFUN_198__(FillWidth, borderwidth), borderwidth, class'WhiteTexture');
	DrawStretchedTexture(C, __NFUN_199__(__NFUN_196__(__NFUN_199__(WinWidth, FillWidth), float(2)), borderwidth), FillTopEdge, borderwidth, __NFUN_198__(FillHeight, borderwidth), class'WhiteTexture');
	DrawStretchedTexture(C, __NFUN_196__(__NFUN_198__(WinWidth, FillWidth), float(2)), __NFUN_199__(FillTopEdge, borderwidth), borderwidth, __NFUN_198__(FillHeight, borderwidth), class'WhiteTexture');
	DrawStretchedTexture(C, __NFUN_196__(__NFUN_199__(WinWidth, FillWidth), float(2)), __NFUN_198__(FillTopEdge, FillHeight), __NFUN_198__(FillWidth, borderwidth), borderwidth, class'WhiteTexture');
	C.DrawColor = WhiteColor;
	// End:0x2AC
	if(__NFUN_170__(MPGameReplicationInfo(GetPlayerOwner().GameReplicationInfo).EORCountTime, 0))
	{
		S = __NFUN_302__(CountDownStr, string(int(__NFUN_198__(float(MPGameReplicationInfo(GetPlayerOwner().GameReplicationInfo).EORCountTime), 0.999))));
		TextSize(C, S, XL, YL, TTFontScale, TTFontScale);
		ClipText(C, __NFUN_199__(__NFUN_198__(__NFUN_196__(__NFUN_199__(WinWidth, FillWidth), float(2)), FillWidth), XL), __NFUN_198__(__NFUN_198__(__NFUN_198__(FillTopEdge, FillHeight), borderwidth), float(10)), S,, TTFontScale, TTFontScale);
	}
	TextSize(C, Title, XL, YL, 1.2, 1.2);
	ClipText(C, __NFUN_196__(__NFUN_199__(WinWidth, XL), 2), __NFUN_198__(FillTopEdge, YL), Title,, 1.2, 1.2);
	ChallengeRangeTop = __NFUN_198__(FillTopEdge, YL);
	ChallengeRangeCenter = __NFUN_198__(ChallengeRangeTop, __NFUN_196__(__NFUN_199__(__NFUN_198__(FillTopEdge, FillHeight), ChallengeRangeTop), float(2)));
	TextSize(C, "testing", XL, YL);
	ChallengeY = __NFUN_198__(__NFUN_199__(ChallengeRangeCenter, __NFUN_195__(__NFUN_195__(0.5, float(__NFUN_188__(NumEntries, 8))), YL)), __NFUN_195__(0.5, YL));
	// End:0x41F
	if(__NFUN_148__(DukeMultiPlayer(GetPlayerOwner()).bLeveledUp, __NFUN_173__(Page, 0)))
	{
		__NFUN_210__(ChallengeY, __NFUN_195__(YL, 0.5));
		S = "";
		TextSize(C, S, XL, YL);
		ClipText(C, __NFUN_196__(__NFUN_199__(WinWidth, XL), float(2)), ChallengeY, S);
		__NFUN_209__(ChallengeY, YL);
	}
	i = __NFUN_162__(Page, 8);
	J0x42E:

	// End:0x4CE [Loop If]
	if(__NFUN_148__(__NFUN_169__(i, NumEntries), __NFUN_169__(i, __NFUN_165__(__NFUN_162__(Page, 8), 8))))
	{
		// End:0x45D
		if(false)
		{			
		}
		else
		{
			S = __NFUN_302__(__NFUN_302__(ChallengeCompletePre, S), ChallengeCompletePost);
			TextSize(C, S, XL, YL);
			ClipText(C, __NFUN_196__(__NFUN_199__(WinWidth, XL), float(2)), ChallengeY, S);
		}
		__NFUN_209__(ChallengeY, YL);
		__NFUN_182__(i);
		// [Loop Continue]
		goto J0x42E;
	}
	// End:0x56E
	if(__NFUN_340__(babeTexture, none))
	{
		DrawStretchedTexture(C, __NFUN_199__(__NFUN_195__(WinWidth, BabeCentre), __NFUN_196__(__NFUN_195__(float(babeTexture.USize), BabeWidth), float(2))), __NFUN_196__(__NFUN_199__(WinHeight, __NFUN_195__(float(babeTexture.VSize), BabeHeight)), float(2)), __NFUN_195__(float(babeTexture.USize), BabeWidth), __NFUN_195__(float(babeTexture.VSize), BabeHeight), babeTexture, 1,,,, true);
	}
	return;
}

function NotifyFromControl(UWindowDialogControl C, byte E)
{
	super(UWindowScene).NotifyFromControl(C, E);
	// End:0x40
	if(__NFUN_148__(__NFUN_170__(string(KeyButtons), 0), __NFUN_340__(C, KeyButtons[1])))
	{
		super(UWindowScene).NotifyFromControl(C, E);
	}
	// End:0xC4
	if(__NFUN_148__(__NFUN_173__(int(E), 2), KeyButtons[0].WindowIsVisible()))
	{
		__NFUN_355__(__NFUN_303__(string(self), "Doing GamerCard stuff"));
		UDukeRootWindow(Root).AgentOnline.ShowGamerCard(UDukeScoreboardEntry(C).GetPRI().RoomMemberID);		
	}
	else
	{
		// End:0x120
		if(__NFUN_150__(__NFUN_173__(int(E), 19), __NFUN_148__(__NFUN_173__(int(E), 2), __NFUN_339__(C, KeyButtons[1]))))
		{
			DukeConsole(Root.Console).DialogMgr.ShowDialogBox(19, self);
		}
	}
	return;
}

function WindowEvent(UWindow.UWindowWindow.WinMessage msg, Canvas C, float X, float Y, int Key)
{
	// End:0xA3
	if(__NFUN_173__(int(msg), int(7)))
	{
		// End:0xA3
		if(__NFUN_150__(__NFUN_150__(__NFUN_173__(Key, int(Root.Console.27)), __NFUN_173__(Key, int(Root.Console.205))), __NFUN_173__(Key, int(Root.Console.211))))
		{
			DukeConsole(Root.Console).DialogMgr.ShowDialogBox(19, self);
			return;
		}
	}
	super(UWindowScene).WindowEvent(msg, C, X, Y, Key);
	return;
}

function DukeSuperMessageBoxDone(int Result, Engine.Object.EConsole_Dialog id)
{
	__NFUN_355__(__NFUN_303__(__NFUN_303__(__NFUN_303__(__NFUN_303__(__NFUN_303__(string(self), "::DukeSuperMessageBoxDone("), string(Result)), ", "), string(__NFUN_365__(class'EConsole_Dialog', int(id)))), ")"));
	// End:0xC9
	if(__NFUN_148__(__NFUN_173__(Result, 1), __NFUN_173__(int(id), int(19))))
	{
		// End:0xAB
		if(UDukeRootWindow(Root).AgentOnline.IsInGame())
		{
			UDukeRootWindow(Root).AgentOnline.LeaveGame();			
		}
		else
		{			
			GetPlayerOwner().ConsoleCommand("DISCONNECT");
		}
	}
	return;
}

function OnNavForward()
{
	local float savedVolume;
	local MPGameReplicationInfo GRI;

	NumEntries = 0;
	// End:0x32
	if(__NFUN_174__(NumEntries, 0))
	{
		savedVolume = CountdownSoundInfo.Volume;
		CountdownSoundInfo.Volume = 0;
	}
	super(UWindowScene).OnNavForward();
	// End:0x53
	if(__NFUN_174__(NumEntries, 0))
	{
		CountdownSoundInfo.Volume = savedVolume;
	}
	bRunCountdown = true;
	GRI = MPGameReplicationInfo(GetPlayerOwner().GameReplicationInfo);
	// End:0xCB
	if(__NFUN_340__(GRI, none))
	{
		GRI.StartEORCountDown(class'MPGameReplicationInfo'.default.EORCountDownTime);
		GRI.__EORComplete__Delegate = LoadNextLevel;
		GRI.__EORBeep__Delegate = EORBeep;
	}
	UDukeRootWindow(Root).AgentOnline.SetTeamGame(false);
	// End:0x101
	if(__NFUN_173__(NumEntries, 0))
	{
		NavigateForward(class'UDukeSceneMultiPlayerPostGameLobby');
	}
	return;
}

function NavigateForward(class<UWindowScene> SceneClass)
{
	bRunCountdown = false;
	Page = 0;
	super(UWindowScene).NavigateForward(SceneClass);
	return;
}

function OnNavBack()
{
	bRunCountdown = true;
	Page = 0;
	return;
}

function Tick(float Delta)
{
	local MPGameReplicationInfo GRI;

	super(UWindowScene).Tick(Delta);
	// End:0x5E
	if(__NFUN_170__(NumEntries, 8))
	{
		__NFUN_209__(SwitchTimer, Delta);
		// End:0x5E
		if(__NFUN_201__(SwitchTimer, cSwitchTime))
		{
			SwitchTimer = 0;
			__NFUN_184__(Page);
			// End:0x5E
			if(__NFUN_170__(__NFUN_162__(Page, 8), NumEntries))
			{
				Page = 0;
			}
		}
	}
	return;
}

function EORBeep()
{
	GetPlayerOwner().PlaySoundInfo(0, CountdownSoundInfo);
	return;
}

function KeyDown(int Key, float X, float Y)
{
	super(UWindowWindow).KeyDown(Key, X, Y);
	switch(Key)
	{
		// End:0x23
		case int(32):
		// End:0x37
		case int(213):
			NavigateForward(class'UDukeSceneMultiPlayerPostGameLobby');
			// End:0x3A
			break;
		// End:0xFFFF
		default:
			break;
	}
	return;
}

function GetLogoLocation(Canvas C, out float X, out float Y, out float W, out float h)
{
	super.GetLogoLocation(C, X, Y, W, h);
	W = __NFUN_195__(339, WinScaleY);
	h = __NFUN_195__(90, WinScaleY);
	return;
}

defaultproperties
{
	Title="<?int?dnWindow.UDukeScenePostGameRewards.Title?>"
	FillTexture='Menu.Menu.Backdrop'
	FillRegion=(X=360,Y=88,W=2,h=2)
	OriginalFillTopEdge=170
	OriginalFillWidth=1010
	OriginalFillHeight=380
	BorderColor=(B=36,G=1,R=255,A=37)
	BabeUnlockedPre="<?int?dnWindow.UDukeScenePostGameRewards.BabeUnlockedPre?>"
	BabeUnlockedPost="<?int?dnWindow.UDukeScenePostGameRewards.BabeUnlockedPost?>"
	ChallengeCompletePre="<?int?dnWindow.UDukeScenePostGameRewards.ChallengeCompletePre?>"
	ChallengeCompletePost="<?int?dnWindow.UDukeScenePostGameRewards.ChallengeCompletePost?>"
	YouHaveReachedLevelPre="<?int?dnWindow.UDukeScenePostGameRewards.YouHaveReachedLevelPre?>"
	YouHaveReachedLevelPost="<?int?dnWindow.UDukeScenePostGameRewards.YouHaveReachedLevelPost?>"
	BabeCentre=0.15
	BabeWidth=1
	BabeHeight=1
	cSwitchTime=2
	ViewResults="<?int?dnWindow.UDukeScenePostGameRewards.ViewResults?>"
	CountdownSoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=/* Array type was not detected. */,Y[97]=/* Unknown default property type! */,Y=0,VolumePrefab=0,Slots=/* Array type was not detected. */,Y=/* Unknown default property type! */,Volume=0.8,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=true,bNoFilter=true,bNoOcclude=true,bNoAIHear=true,bNoScale=true,bSpoken=false,bPlayThroughListener=false,bNoDoppler=true,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=true),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=1,Location3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0),Velocity3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0)
}