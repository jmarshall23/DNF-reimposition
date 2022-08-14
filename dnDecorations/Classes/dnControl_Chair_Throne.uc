/*******************************************************************************
 * dnControl_Chair_Throne generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnControl_Chair_Throne extends dnControl_Chair
	collapsecategories;

var() noexport name CrackNucklesTag "Trigger this tag to have actor crack his nuckles if he is idling in this char.";
var bool bForceAttachCompleteHack;
var localized string StandUpPrompt;

event PostBeginPlay()
{
	super(dnUsableSomething).PostBeginPlay();
	__NFUN_718__('CrackNuckles', CrackNucklesTag);
	return;
}

function TriggerFunc_CrackNuckles()
{
	ControlEvent(0, 'ForceNuckleCrack');
	return;
}

simulated function AttachPawnSuccess(Pawn Attachee, optional bool bForced)
{
	bForceAttachCompleteHack = bForced;
	super(dnControl).AttachPawnSuccess(Attachee, bForced);
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super.RegisterPrecacheComponents(PrecacheIndex);
	// End:0x60
	if(__NFUN_342__(CrackNucklesTag, 'None'))
	{
		PrecacheIndex.__NFUN_1277__(class'VoicePack_Duke', 'KnuckleCrack_01');
		PrecacheIndex.__NFUN_1277__(class'VoicePack_Duke', 'KnuckleCrack_02');
		PrecacheIndex.__NFUN_1277__(class'VoicePack_Duke', 'KnuckleCrack_03');
	}
	return;
}

state() idle
{
	simulated event BeginState()
	{
		local Actor StoredMountParent;

		super(Object).BeginState();
		// End:0x9F
		if(__NFUN_148__(bForceAttachCompleteHack, __NFUN_340__(InternalControlRemapper, none)))
		{
			StoredMountParent = InternalControlRemapper.MountParent;
			InternalControlRemapper.DestroyOnDismount = false;
			InternalControlRemapper.__NFUN_631__();
			InternalControlRemapper.MountOrigin = __NFUN_232__(1.5, 0, -41);
			InternalControlRemapper.MountAngles = __NFUN_265__(0, 0, 0);
			InternalControlRemapper.__NFUN_635__(StoredMountParent, false, false, false, false, false);
		}
		return;
	}

	simulated function UsableSomethingQueryInteractKeyInfoState(HUD HUD)
	{
		super(dnUsableSomething).UsableSomethingQueryInteractKeyInfoState(HUD);
		// End:0x2B
		if(bUsable)
		{
			SetHUDKeyInfoState(HUD, 1, true, 1,,, StandUpPrompt);
		}
		return;
	}
	stop;
}

state() CrackNuckles
{	stop;
}

defaultproperties
{
	States(0)=(StateName=Useable,OutEvents=none,Transitions=((ControlEvent=3,CustomName=None,NewState=AttachUserLERP)),UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0),Velocity3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0))
	States(1)=(Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
	States(2)=(MySoundName=None,SubAnims=none)
	States(3)=(StateName=AttachUserLERP,OutEvents=none,Transitions=((ControlEvent=5,CustomName=None,NewState=AttachUserAnim)),UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0),Velocity3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0))
	States(4)=(Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
	States(5)=(MySoundName=None,SubAnims=none)
	States(6)=(StateName=AttachUserAnim,OutEvents=none,Transitions=((ControlEvent=7,CustomName=None,NewState=idle)),UserAnimName=NormalChair_Sit,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0),Velocity3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0))
	InterpolationInTime=0.3
	InterpolationOutTime=0.3
	HUDHelpEntries(0)=(Key=1,KeyAlt=0,HelpText="Get Up")
	UserMountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=true,bDontScaleByDrawScale=true,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=true,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=1.291717E-41,Y=2.802855E-17,Z=0),Z=-41)
	HeadAimMinOffset=(Pitch=-327671291,Yaw=571146239,Roll=-10000)
	HeadAimMaxOffset=(Pitch=131080709,Yaw=571080704,Roll=10000)
	bTraceShootable=true
	bBlockActors=true
	bBlockPlayers=true
	bBlockKarma=true
	bDirectional=true
	bStepUpAble=false
	CollisionRadius=30
	CollisionHeight=41.09
	DrawType=8
	StaticMesh='sm_class_decorations.DecoInteractive.DukeThrone'
}