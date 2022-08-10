/*******************************************************************************
 * Electronics_Generic_Computer_Monitor generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Electronics_Generic_Computer_Monitor extends Electronics_Generic_Computer
	abstract
	collapsecategories
	dependson(DecoGlass_Monitor_FlatScreen);

enum EMonitorState
{
	MONITOR_On,
	MONITOR_Off,
	MONITOR_Disabled
};

var() noexport MaterialEx TexPowerOff "Texture to use for when the computer is currently off.";
var() noexport array<MaterialEx> ScreenTextures "List of textures to flip between.";
var int CurrentImage;
var Electronics_Generic_Computer_Monitor.EMonitorState MonitorState;
var Electronics_Generic_Computer_CPU CPU;
var DecoGlass_Monitor_FlatScreen GlassActor;
var MaterialEx CurrentScreen;
var bool bInitiallyUsable;
var bool bCanSwitch;

function PostVerifySelf()
{
	super(dnDecoration).PostVerifySelf();
	bInitiallyUsable = bUsable;
	GlassActor = DecoGlass_Monitor_FlatScreen(FindMountedActor('Glass'));
	// End:0x5D
	if(__NFUN_340__(GlassActor, none))
	{
		GlassActor.MonitorActor = self;
		GlassActor.bUsable = bInitiallyUsable;
	}
	return;
}

event PostBeginPlay()
{
	TriggerFunc_PowerOn();
	super(dnDecoration).PostBeginPlay();
	return;
}

final function SetCPU(Electronics_Generic_Computer_CPU NewCPU)
{
	CPU = NewCPU;
	return;
}

event Used(Actor Other, Pawn EventInstigator)
{
	super(dnDecoration).Used(Other, EventInstigator);
	switch(MonitorState)
	{
		// End:0x26
		case 0:
			TriggerFunc_PowerOff();
			// End:0x3F
			break;
		// End:0x34
		case 1:
			TriggerFunc_PowerOn();
			// End:0x3F
			break;
		// End:0x3C
		case 2:
			// End:0x3F
			break;
		// End:0xFFFF
		default:
			break;
	}
	return;
}

function ForcePowerOn()
{
	super(Electronics_Generic).ForcePowerOn();
	MonitorState = 0;
	SetUsePhrase(UsePhrase);
	RefreshScreen();
	bUsable = bInitiallyUsable;
	return;
}

function ForcePowerOff()
{
	super(Electronics_Generic).ForcePowerOff();
	MonitorState = 1;
	SetScreen(TexPowerOff);
	SetUsePhrase(UsePhrase);
	return;
}

function PowerDisabled()
{
	bDrawUsePhrase = false;
	MonitorState = 2;
	DecoActivity(0, 'PowerDisabled');
	SetScreen(TexPowerOff);
	// End:0x44
	if(__NFUN_340__(GlassActor, none))
	{
		GlassActor.Disabled();
	}
	return;
}

final function BLITScreen(MaterialEx NewDisplay)
{
	CurrentScreen = NewDisplay;
	// End:0x1F
	if(__NFUN_173__(int(MonitorState), int(0)))
	{
		RefreshScreen();
	}
	return;
}

function RefreshScreen()
{
	// End:0x17
	if(__NFUN_339__(CurrentScreen, none))
	{
		CurrentScreen = TexPowerOff;
	}
	SetScreen(CurrentScreen);
	return;
}

function SetScreen(MaterialEx screen)
{
	// End:0x1F
	if(__NFUN_340__(GlassActor, none))
	{
		GlassActor.__NFUN_741__(0, screen);
	}
	return;
}

function SwitchScreens()
{
	// End:0x18
	if(__NFUN_150__(__NFUN_145__(bCanSwitch), DecorationIsDead()))
	{
		return;
	}
	__NFUN_182__(CurrentImage);
	// End:0x36
	if(__NFUN_172__(CurrentImage, string(ScreenTextures)))
	{
		CurrentImage = 0;
	}
	SetScreen(ScreenTextures[CurrentImage]);
	Level.__NFUN_1161__().FindSoundAndSpeak('PornComment');
	// End:0x9C
	if(__NFUN_340__(DukePlayer(Level.__NFUN_1161__()), none))
	{
		DukePlayer(Level.__NFUN_1161__()).GivePermanentEgoCapAward(25);
	}
	bCanSwitch = false;
	__NFUN_607__(3.5, false, 'CanSwitch');
	return;
}

function CanSwitch()
{
	bCanSwitch = true;
	return;
}

function SetUsePhrase(string newPhrase)
{
	// End:0x21
	if(__NFUN_340__(GlassActor, none))
	{
		GlassActor.UsePhrase = newPhrase;
	}
	return;
}

final function GlassDamaged()
{
	CriticalDamage();
	return;
}

function Destroyed()
{
	bDrawUsePhrase = true;
	// End:0x24
	if(__NFUN_340__(GlassActor, none))
	{
		GlassActor.CrackSelf();
	}
	// End:0x40
	if(__NFUN_340__(CPU, none))
	{
		CPU.Display_Destroyed();
	}
	super(dnDecoration).Destroyed();
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	local int i;

	super(dnDecoration).RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1269__(TexPowerOff);
	i = __NFUN_166__(string(ScreenTextures), 1);
	J0x2C:

	// End:0x59 [Loop If]
	if(__NFUN_172__(i, 0))
	{
		PrecacheIndex.__NFUN_1269__(ScreenTextures[i]);
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0x2C;
	}
	PrecacheIndex.__NFUN_1277__(class'DukePlayer'.default.VoicePack, 'PornComment');
	return;
}

defaultproperties
{
	TexPowerOff='dt_editor.Surface.blackRC'
	ScreenTextures(0)='Electronics_Generic'
	ScreenTextures(1)='dt_signs.ScreenSaver.Screensaver1_bs'
	ScreenTextures(2)='dt_signs.ScreenSaver.Screensaver2_bs'
	ScreenTextures(3)='dt_signs.ScreenSaver.Screensaver3_bs'
	ScreenTextures(4)='Settings_LadyKiller_DestructibleDukeBustStatue_Gib_A'
	ScreenTextures(5)='dnGame.DecoActivityDeclarations'
	ScreenTextures(6)=ObjectProperty'dnControl_NutAndBolt.TurnLeft3.EndState.NewNut'
	dnGame=/* Array type was not detected. */
	bInitialized=false
	CurrentIndex=0
	NextPerformTime=0
	NextPerformTime_Failure=0
}