/*******************************************************************************
 * dnControl_AlienQueen_FinishingMove generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnControl_AlienQueen_FinishingMove extends dnControl_TapPowered
	collapsecategories;

var AlienQueen AlienQueen;
var name GridName;

simulated function PostVerifySelf()
{
	super.PostVerifySelf();
	AlienQueen = AlienQueen(Owner);
	return;
}

simulated function AttachPawnSuccess(Pawn Attachee, optional bool bForced)
{
	super(dnControl).AttachPawnSuccess(Attachee, bForced);
	User.TickBefore = AlienQueen;
	// End:0x4C
	if(__NFUN_340__(AlienQueen, none))
	{
		AlienQueen.FadeOverlayEffect(0, 1);
	}
	return;
}

simulated function PlayUserAnim()
{
	super(dnControl).PlayUserAnim();
	// End:0x71
	if(__NFUN_148__(__NFUN_148__(__NFUN_342__(States[CurrentStateIndex].UserAnimName, 'None'), __NFUN_340__(AlienQueen, none)), __NFUN_340__(AlienQueen.AnimationController, none)))
	{
		AlienQueen.AnimationController.SetAnimState(States[CurrentStateIndex].UserAnimName);
	}
	return;
}

simulated function FailTimer()
{
	ControlEvent(, 'Fail');
	return;
}

simulated event Actor GetIKActor(name LimbID)
{
	return AlienQueen;
	return;
}

simulated event bool UsableSomething_AIShouldIgnoreUser()
{
	return true;
	return;
}

final simulated function SelfDestruct()
{
	__NFUN_614__();
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super.RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1281__(GridName);
	PrecacheIndex.__NFUN_1277__(VoicePack, 'STR_Motion_Generic');
	return;
}

state() idle
{
	event BeginState()
	{
		__NFUN_607__(5, false, 'FailTimer');
		FindAndPlaySound('STR_Motion_Generic');
		FindAndFadeSound('STR_Motion_Generic', 0, 0.1, 1);
		super(Object).BeginState();
		return;
	}

	event EndState()
	{
		__NFUN_608__('FailTimer');
		FindAndFadeSound('STR_Motion_Generic', 3, 0, 1);
		super(Object).EndState();
		return;
	}

	function FullyLifted()
	{
		super(dnControl_TapPowered).FullyLifted();
		ControlEvent(, 'Finish');
		return;
	}

	function UpdateUserLift()
	{
		super(dnControl_TapPowered).UpdateUserLift();
		FindAndFadeSound('STR_Motion_Generic', 0.03, __NFUN_225__(0.1, __NFUN_195__(0.5, __NFUN_198__(UserLiftVal, 1))), 1);
		// End:0xAE
		if(__NFUN_342__(GridName, 'None'))
		{
			User.AnimationController.SetAnimGridState(GridName, UserLiftVal);
			// End:0xAE
			if(__NFUN_148__(__NFUN_340__(AlienQueen, none), __NFUN_340__(AlienQueen.AnimationController, none)))
			{
				AlienQueen.AnimationController.SetAnimGridState(GridName, UserLiftVal);
			}
		}
		return;
	}
	stop;
}

state() Fail
{
	simulated function AnimCallback_UserAnimEnd()
	{
		global.AnimCallback_UserAnimEnd();
		// End:0x23
		if(__NFUN_340__(User, none))
		{
			User.TickBefore = none;
		}
		DetachPawnSuccess(false);
		AnimCallback_UserDetached();
		return;
	}
	stop;
}

state() Finish
{
	simulated event BeginState()
	{
		super(Object).BeginState();
		// End:0x2D
		if(__NFUN_340__(AlienQueen, none))
		{
			GlobalTrigger(AlienQueen.StrengthTapCompleteEvent, User, self);
		}
		return;
	}

	simulated function AnimCallback_UserAnimEnd()
	{
		InternalControlRemapper.bCanOffsetView = true;
		return;
	}
	stop;
}

state() complete
{
	event BeginState()
	{
		super(Object).BeginState();
		__NFUN_607__(1, false, 'SelfDestruct');
		return;
	}
	stop;
}

defaultproperties
{
	GridName=AlienQueen_FinishingMove_Grid
	bForceDrop=false
	RateOfGain=0.1
	States(0)=(StateName=Useable,OutEvents=none,Transitions=((ControlEvent=3,CustomName=None,NewState=AttachUserLERP)),UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=1.298303E-41,Y=3.773024E-17,Z=0),Z=0),Velocity3D=(X=1.298303E-41,Y=3.773024E-17,Z=0),Z=0))
	States(1)=(Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
	States(2)=(MySoundName=None,SubAnims=none)
	States(3)=(StateName=AttachUserLERP,OutEvents=none,Transitions=((ControlEvent=5,CustomName=None,NewState=AttachUserAnim)),UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=1.298303E-41,Y=3.773024E-17,Z=0),Z=0),Velocity3D=(X=1.298303E-41,Y=3.773024E-17,Z=0),Z=0))
	States(4)=(Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
	States(5)=(MySoundName=None,SubAnims=none)
	States(6)=(StateName=AttachUserAnim,OutEvents=none,Transitions=((ControlEvent=7,CustomName=None,NewState=idle)),UserAnimName=AlienQueen_FinishingMove_Activate,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=1.298303E-41,Y=3.773024E-17,Z=0),Z=0),Velocity3D=(X=1.298303E-41,Y=3.773024E-17,Z=0),Z=0))
	States(7)=(Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
	States(8)=(MySoundName=None,SubAnims=none)
	States(9)=(StateName=idle,OutEvents=none,Transitions=((ControlEvent=0,CustomName=Fail,NewState=Fail),(ControlEvent=0,CustomName=Finish,NewState=Finish)),UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=1.298303E-41,Y=3.773024E-17,Z=0),Z=0),Velocity3D=(X=1.298303E-41,Y=3.773024E-17,Z=0),Z=0))
	PassedDamageScale=1
	PassedPhysicsDamageScale=1
	ForceAttachStateName=AttachUserLERP
	bUseHomePose=false
	InterpolationInTime=0.3
	InterpolationOutTime=0.3
	UserMountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=true,bDontScaleByDrawScale=true,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=true,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=-6.323712E-34,Y=3.778827E-17,Z=0),Z=77.037)
	bDetachOnDamage=false
	HeadAimMinOffset=(Pitch=-268426702,Yaw=574619647,Roll=-4096)
	HeadAimMaxOffset=(Pitch=268444210,Yaw=574554112,Roll=4096)
	bManipulateViewOnAttach=false
	bManipulateViewOnIdle=false
	bManipulateViewOnDetach=false
	bInternalUseDetach=false
	bLookWhenHidden=true
	bForceUsePhrase=true
	UsePhrase="<?int?dnAI.dnControl_AlienQueen_FinishingMove.UsePhrase?>"
	bHidden=true
	bCollideActors=false
	bCollideWorld=false
	CollisionRadius=1
	CollisionHeight=1
	VoicePack='SoundConfig.Players.VoicePack_Duke'
}