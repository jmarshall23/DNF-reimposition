/*******************************************************************************
 * dnControl_Panel_AccessPad generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnControl_Panel_AccessPad extends dnControl
	collapsecategories;

const ReadyStartFrame = 1;
const ScanningStartFrame = 1;
const ScanningEndFrame = 51;
const SuccessStartFrame = 52;
const SuccessEndFrame = 74;
const FailureStartFrame = 75;
const FailureEndFrame = 94;

enum EDisplayMode
{
	DISPLAYMODE_Off,
	DISPLAYMODE_Ready,
	DISPLAYMODE_Scanning,
	DISPLAYMODE_Success,
	DISPLAYMODE_Failure
};

var() noexport name AcceptedEvent "Event to trigger when the user is accepted.";
var() noexport name RejectedEvent "Event to trigger when the user is rejected.";
var() noexport bool PlayerCanUse "Set to true if the player is allowed to succeed when using the pad.";
var() name SE_EnablePlayerAccess;
var() name SE_DisablePlayerAccess;
var() name SE_TogglePlayerAccess;
var() noexport name SE_ForcePlayerAccess "Force access. As if the player had used it. Note still depends on SE_EnablePlayerAccess SE_DisablePlayerAccess";
var private dnControl_Panel_AccessPad.EDisplayMode DisplayMode;
var private int DisplaySurfaceID;
var private Texture PowerOffTexture;
var private MaterialEx ReadyMaterial;
var private SmackerTexture ReadySmacker;
var private MaterialEx ScanningMaterial;
var private SmackerTexture ScanningSmacker;
var private int ResultEndFrame;

event PreBeginPlay()
{
	__NFUN_718__('EnablePlayerAccess', SE_EnablePlayerAccess);
	__NFUN_718__('DisablePlayerAccess', SE_DisablePlayerAccess);
	__NFUN_718__('TogglePlayerAccess', SE_TogglePlayerAccess);
	__NFUN_718__('ForcePlayerAccess', SE_ForcePlayerAccess);
	super(dnUsableSomething).PreBeginPlay();
	return;
}

event PostBeginPlay()
{
	super(dnUsableSomething).PostBeginPlay();
	return;
}

event Tick(float DeltaTime)
{
	super.Tick(DeltaTime);
	switch(DisplayMode)
	{
		// End:0x1B
		case 0:
			// End:0x62
			break;
		// End:0x23
		case 1:
			// End:0x62
			break;
		// End:0x36
		case 2:
			Tick_Scanning(DeltaTime);
			// End:0x62
			break;
		// End:0x49
		case 3:
			Tick_Result(DeltaTime);
			// End:0x62
			break;
		// End:0x5C
		case 4:
			Tick_Result(DeltaTime);
			// End:0x62
			break;
		// End:0xFFFF
		default:
			// End:0x62
			break;
			break;
	}
	return;
}

function Tick_Scanning(float DeltaTime)
{
	local int CurrentFrame;

	CurrentFrame = ScanningSmacker.GetFrame();
	// End:0x3C
	if(__NFUN_148__(__NFUN_172__(CurrentFrame, 51), __NFUN_169__(CurrentFrame, 94)))
	{
		ResolveAccessAttempt(PlayerCanUse);
	}
	return;
}

function Tick_Result(float DeltaTime)
{
	local int CurrentFrame;

	CurrentFrame = ScanningSmacker.GetFrame();
	// End:0x2B
	if(__NFUN_172__(CurrentFrame, ResultEndFrame))
	{
		Reset();
	}
	return;
}

function SetPower(bool bOff)
{
	super.SetPower(bOff);
	// End:0x20
	if(bOff)
	{
		SetPanelDisplayMode(0);		
	}
	else
	{
		SetUseable(true);
		SetPanelDisplayMode(1);
	}
	return;
}

function SetPanelDisplayMode(dnControl_Panel_AccessPad.EDisplayMode NewDisplayMode)
{
	// End:0xA7
	if(__NFUN_174__(int(NewDisplayMode), int(DisplayMode)))
	{
		switch(DisplayMode)
		{
			// End:0x43
			case 1:
				ReadySmacker.SetFrame(1);
				ReadySmacker.SetPause(true);
				// End:0xA7
				break;
			// End:0x6D
			case 3:
				ScanningSmacker.SetFrame(1);
				ScanningSmacker.SetPause(true);
				// End:0xA7
				break;
			// End:0x97
			case 4:
				ScanningSmacker.SetFrame(1);
				ScanningSmacker.SetPause(true);
				// End:0xA7
				break;
			// End:0x9C
			case 0:
			// End:0xA1
			case 2:
			// End:0xFFFF
			default:
				// End:0xA7
				break;
				break;
		}
	}
	DisplayMode = NewDisplayMode;
	switch(DisplayMode)
	{
		// End:0xD6
		case 0:
			SetUseable(false);
			__NFUN_741__(DisplaySurfaceID, PowerOffTexture);
			// End:0x19C
			break;
		// End:0x114
		case 1:
			__NFUN_741__(DisplaySurfaceID, ReadyMaterial);
			ReadySmacker.SetFrame(1);
			ReadySmacker.SetPause(false);
			SetUseable(true);
			// End:0x19C
			break;
		// End:0x152
		case 2:
			__NFUN_741__(DisplaySurfaceID, ScanningMaterial);
			ScanningSmacker.SetFrame(1);
			ScanningSmacker.SetPause(false);
			SetUseable(false);
			// End:0x19C
			break;
		// End:0x174
		case 3:
			ScanningSmacker.SetFrame(52);
			ResultEndFrame = 74;
			// End:0x19C
			break;
		// End:0x196
		case 4:
			ScanningSmacker.SetFrame(75);
			ResultEndFrame = 94;
			// End:0x19C
			break;
		// End:0xFFFF
		default:
			// End:0x19C
			break;
			break;
	}
	return;
}

function Reset()
{
	SetPanelDisplayMode(1);
	return;
}

function BeginAccessAttempt()
{
	SetPanelDisplayMode(2);
	return;
}

function ResolveAccessAttempt(bool bAccepted)
{
	// End:0x31
	if(bAccepted)
	{
		GlobalTrigger(AcceptedEvent, User);
		FindAndPlaySound('AccessPad_Accepted', 1);
		SetPanelDisplayMode(3);		
	}
	else
	{
		GlobalTrigger(RejectedEvent, User);
		FindAndPlaySound('AccessPad_Rejected', 1);
		SetPanelDisplayMode(4);
	}
	return;
}

function TriggerFunc_EnablePlayerAccess()
{
	PlayerCanUse = true;
	return;
}

function TriggerFunc_DisablePlayerAccess()
{
	PlayerCanUse = false;
	return;
}

function TriggerFunc_TogglePlayerAccess()
{
	PlayerCanUse = __NFUN_145__(PlayerCanUse);
	return;
}

function TriggerFunc_ForcePlayerAccess()
{
	SetPanelDisplayMode(2);
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super.RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1269__(PowerOffTexture);
	PrecacheIndex.__NFUN_1269__(ReadyMaterial);
	PrecacheIndex.__NFUN_1269__(ReadySmacker);
	PrecacheIndex.__NFUN_1269__(ScanningMaterial);
	PrecacheIndex.__NFUN_1269__(ScanningSmacker);
	PrecacheIndex.__NFUN_1277__(VoicePack, 'AccessPad_Accepted');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'AccessPad_Rejected');
	return;
}

state idle
{
	simulated function AnimCallback_UserPressed()
	{
		global.AnimCallback_UserPressed();
		BeginAccessAttempt();
		return;
	}

	simulated function AnimCallback_UserReleased()
	{
		global.AnimCallback_UserReleased();
		DetachPawnSuccess(false);
		// End:0x2F
		if(__NFUN_150__(__NFUN_145__(bUseHomePose), __NFUN_174__(ActiveUsableExit, -1)))
		{
			AnimCallback_UserDetached();
		}
		return;
	}
	stop;
}

defaultproperties
{
	PlayerCanUse=true
	SE_ForcePlayerAccess=foo
	ReadyMaterial='mt_skins2.puzzlescreens.accesspad2bc_screensaver'
	ReadySmacker='smk1.s_hscansaver'
	ScanningMaterial='mt_skins2.puzzlescreens.puzzlescreen2bc_main'
	ScanningSmacker='smk1.s_hscan1'
	States(0)=(StateName=Useable,OutEvents=none,Transitions=((ControlEvent=3,CustomName=None,NewState=AttachUserLERP)),UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0),Velocity3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0))
	States(1)=(Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
	States(2)=(MySoundName=None,SubAnims=none)
	States(3)=(StateName=AttachUserLERP,OutEvents=none,Transitions=((ControlEvent=5,CustomName=None,NewState=idle)),UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0),Velocity3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0))
	bUseHomePose=false
	InterpolationInTime=0.3
	InterpolationOutTime=0.3
	UsableExits(0)=(bEnabled=true,EnterInfo=(LocationOffset=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0),RotationOffset=(Pitch=8709,Yaw=571080704,Roll=0),Roll=0)
	UserMountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=true,bDontScaleByDrawScale=true,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=true,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=1.291717E-41,Y=2.802832E-17,Z=0),Z=-66)
	PlacementZOffset=66
	CollisionRadius=8
	CollisionHeight=12
	Mesh='c_generic.puzzlescreen'
}