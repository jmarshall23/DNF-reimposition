/*******************************************************************************
 * UDukeDesktopWindow generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeDesktopWindow extends UDukeDesktopWindowBase
	config;

const MF_MainMenu = 1;
const MF_MultiplayerMenu = 2;
const MF_All = 3;
const FullSizeTextureWidth = 1024;
const FullSizeTextureHeight = 768;

enum EDukeStartupState
{
	DSS_None,
	DSS_Legal,
	DSS_Dice,
	DSS_3DR,
	DSS_Triptych,
	DSS_Attract,
	DSS_Done,
	DSS_Exiting
};

var globalconfig string ThemePackage;
var globalconfig bool ThemeColorizable;
var globalconfig bool ThemeTranslucentIcons;
var SmackerTexture WindowOpenSmack;
var float LastClipX;
var float WinScaleX;
var float WinScaleY;
var int MenuMode;
var UDukeDesktopWindow.EDukeStartupState DukeStartupState;
var BinkTexture BinkMovie;
var MaterialEx FilmGrainMaterial;
var bool bLastHasFocus;

function Created()
{
	bAlwaysBehind = true;
	WinScaleX = __NFUN_196__(WinWidth, 1024);
	WinScaleY = __NFUN_196__(WinHeight, 768);
	LoadArt();
	DukeConsole(Root.Console).Desktop = self;
	return;
}

function Texture LoadTexture(string TextureName)
{
	return none;
	return;
}

function SmackerTexture LoadSmack(string SmackName)
{
	return none;
	return;
}

function LoadArt()
{
	WindowOpenSmack = LoadSmack("menuopen");
	SetCursor(Root.NormalCursor);
	LookAndFeel.Active = LoadTexture("menu_windowbc");
	LookAndFeel.Active2 = LoadTexture("menu_window2bc");
	LookAndFeel.Active3 = LoadTexture("menu_window3bc");
	LookAndFeel.Glow = LoadTexture("menu_window_glowbc");
	LookAndFeel.Glow3 = LoadTexture("menu_window_glow3bc");
	return;
}

function ActivateWindow(int Depth, bool bTransientNoDeactivate)
{
	// End:0x1E
	if(__NFUN_340__(Root.FindChildWindow(class'UWindowFramedWindow'), none))
	{
		return;
	}
	super(UWindowWindow).ActivateWindow(Depth, bTransientNoDeactivate);
	return;
}

function Paint(Canvas C, float MouseX, float MouseY)
{
	local float Ratio, XL, YL;

	// End:0x52
	if(__NFUN_206__(C.ClipX, LastClipX))
	{
		LastClipX = C.ClipX;
		ResolutionChanged(C.ClipX, C.ClipY);
	}
	// End:0xC1
	if(__NFUN_174__(int(DukeStartupState), int(6)))
	{
		// End:0xC1
		if(__NFUN_148__(__NFUN_148__(__NFUN_340__(Root, none), __NFUN_340__(Root.Console, none)), __NFUN_145__(Root.Console.bShowConsole)))
		{
			Root.Console.bDontDrawMouse = true;
		}
	}
	// End:0x212
	if(__NFUN_150__(__NFUN_340__(BinkMovie, none), __NFUN_173__(int(DukeStartupState), int(7))))
	{
		C.__NFUN_1250__(0, 0);
		C.__NFUN_1234__(class'BlackTexture', WinWidth, WinHeight, 0, 0, 1, 1);
		// End:0x212
		if(__NFUN_340__(BinkMovie, none))
		{
			Ratio = __NFUN_196__(float(BinkMovie.__NFUN_1191__()), float(BinkMovie.__NFUN_1192__()));
			XL = WinWidth;
			YL = __NFUN_196__(XL, Ratio);
			// End:0x19D
			if(__NFUN_201__(YL, WinHeight))
			{
				YL = WinHeight;
				XL = __NFUN_195__(YL, Ratio);
			}
			C.__NFUN_1250__(__NFUN_195__(0.5, __NFUN_199__(WinWidth, XL)), __NFUN_195__(0.5, __NFUN_199__(WinHeight, YL)));
			C.__NFUN_1234__(BinkMovie, XL, YL, 0, 0, float(BinkMovie.__NFUN_1191__()), float(BinkMovie.__NFUN_1192__()));
		}
	}
	// End:0x26E
	if(__NFUN_340__(FilmGrainMaterial, none))
	{
		C.__NFUN_1250__(0, 0);
		C.__NFUN_1234__(FilmGrainMaterial, WinWidth, WinHeight, 0, 0, WinWidth, WinHeight,,,,, 1);
	}
	return;
}

function Tick(float Delta)
{
	local UDukeRootWindow DukeRoot;
	local bool bHasFocus;

	bHasFocus = Root.Console.Viewport.__NFUN_507__();
	// End:0x12B
	if(__NFUN_340__(BinkMovie, none))
	{
		// End:0x8E
		if(__NFUN_401__())
		{
			BinkMovie.SetVolume(float(GetPlayerOwner().ConsoleCommand("get ini:Engine.Engine.AudioDevice SoundVolume")));			
		}
		else
		{
			// End:0x12B
			if(__NFUN_145__(__NFUN_414__()))
			{
				// End:0x100
				if(__NFUN_148__(bHasFocus, __NFUN_145__(bLastHasFocus)))
				{
					BinkMovie.SetVolume(float(GetPlayerOwner().ConsoleCommand("get ini:Engine.Engine.AudioDevice SoundVolume")));					
				}
				else
				{
					// End:0x12B
					if(__NFUN_148__(__NFUN_145__(bHasFocus), bLastHasFocus))
					{
						BinkMovie.SetVolume(0);
					}
				}
			}
		}
	}
	bLastHasFocus = bHasFocus;
	// End:0x15F
	if(__NFUN_150__(__NFUN_339__(BinkMovie, none), BinkMovie.IsFinalFrame()))
	{
		GotoNextStartupState();
	}
	WinScaleX = __NFUN_196__(WinWidth, 1024);
	WinScaleY = __NFUN_196__(WinHeight, 768);
	return;
}

final simulated function BeginStartupSequence()
{
	// End:0x11
	if(__NFUN_401__())
	{
		DukeStartupState = 4;		
	}
	else
	{
		// End:0x22
		if(__NFUN_402__())
		{
			DukeStartupState = 2;			
		}
		else
		{
			DukeStartupState = 0;
		}
	}
	return;
}

final simulated function bool IsStartupComplete()
{
	return __NFUN_173__(int(DukeStartupState), int(6));
	return;
}

final simulated function StartAttractVideo()
{
	DukeStartupState = 4;
	Root.Console.bDontDrawMouse = true;
	Root.DontCloseOnEscape = true;
	Root.bAllowConsole = false;
	GotoNextStartupState();
	return;
}

final simulated function StopBinks(bool bAllowMenuTransition)
{
	// End:0x22
	if(__NFUN_340__(BinkMovie, none))
	{
		DukeStartupState = 5;
		GotoNextStartupState(__NFUN_145__(bAllowMenuTransition));
	}
	return;
}

function bool ShouldDisplayESRBMessage()
{
	return __NFUN_150__(__NFUN_308__(__NFUN_418__(), "US"), __NFUN_308__(__NFUN_418__(), "CA"));
	return;
}

final simulated function GotoNextStartupState(optional bool bDoNotChangeMenu)
{
	// End:0x25
	if(__NFUN_340__(BinkMovie, none))
	{
		class'BinkTexture'.static.__NFUN_1220__(BinkMovie);
		BinkMovie = none;
	}
	switch(DukeStartupState)
	{
		// End:0x97
		case 0:
			DukeStartupState = 2;
			Root.Console.bDontDrawMouse = true;
			Root.DontCloseOnEscape = true;
			Root.bAllowConsole = false;
			BinkMovie = class'BinkTexture'.static.__NFUN_1219__("Legal");
			// End:0x162
			break;
		// End:0xC6
		case 2:
			DukeStartupState = 4;
			BinkMovie = class'BinkTexture'.static.__NFUN_1219__("Dice_Intro");
			// End:0x162
			break;
		// End:0xF2
		case 4:
			DukeStartupState = 5;
			BinkMovie = class'BinkTexture'.static.__NFUN_1219__("Attract");
			// End:0x162
			break;
		// End:0x15F
		case 5:
			DukeStartupState = 6;
			Root.Console.bDontDrawMouse = false;
			Root.DontCloseOnEscape = false;
			Root.bAllowConsole = true;
			// End:0x15C
			if(__NFUN_145__(bDoNotChangeMenu))
			{
				Root.ShowUWindowSystem(1);
			}
			// End:0x162
			break;
		// End:0xFFFF
		default:
			break;
	}
	// End:0x256
	if(__NFUN_340__(BinkMovie, none))
	{
		// End:0x1C9
		if(__NFUN_414__())
		{
			BinkMovie.SetVolume(float(GetPlayerOwner().ConsoleCommand("get ini:Engine.Engine.AudioDevice SoundVolume")), true);			
		}
		else
		{
			// End:0x241
			if(Root.Console.Viewport.__NFUN_507__())
			{
				BinkMovie.SetVolume(float(GetPlayerOwner().ConsoleCommand("get ini:Engine.Engine.AudioDevice SoundVolume")));				
			}
			else
			{
				BinkMovie.SetVolume(0);
			}
		}
	}
	return;
}

defaultproperties
{
	ThemePackage="mtheme_cobaltblue"
	ThemeTranslucentIcons=true
	MenuMode=1
	DukeStartupState=6
	FilmGrainMaterial='dt_effects.PostProcessing.FilmGrain_fb'
}