/*******************************************************************************
 * dnControl_DukeStatueControl generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnControl_DukeStatueControl extends dnControl
	collapsecategories;

final animevent function ButtonPressed()
{
	FindAndPlaySound('DukeControl_Button', 1);
	return;
}

final animevent function ButtonReleased()
{
	FindAndPlaySound('DukeControl_Button', 1);
	return;
}

simulated function CREvent_KeyChange(ControlRemapperEx CR, Pawn InputActor, Engine.Actor.EControlRemapperKeyType KeyType, Engine.Actor.EControlRemapperEventType EventType)
{
	// End:0x3F
	if(PlayerUser.__NFUN_994__())
	{
		// End:0x29
		if(__NFUN_173__(int(KeyType), int(8)))
		{
			KeyType = 9;			
		}
		else
		{
			// End:0x3F
			if(__NFUN_173__(int(KeyType), int(9)))
			{
				KeyType = 8;
			}
		}
	}
	super.CREvent_KeyChange(CR, InputActor, KeyType, EventType);
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super.RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1277__(VoicePack, 'DukeControl_Button');
	return;
}

state() idle
{
	simulated function UsableSomethingQueryInteractKeyInfoState(HUD HUD)
	{
		SetHUDKeyInfoState(HUD, 2, true, 7);
		SetHUDKeyInfoState(HUD, 3, true, 8);
		SetHUDKeyInfoState(HUD, 0, true, 9);
		SetHUDKeyInfoState(HUD, 1, true, 10);
		// End:0x87
		if(__NFUN_149__(PlayerPawn(User).__NFUN_994__(), Level.__NFUN_1164__()))
		{
			SetHUDKeyInfoState(HUD, 7, true, 26);
			SetHUDKeyInfoState(HUD, 5, true, 27);			
		}
		else
		{
			SetHUDKeyInfoState(HUD, 5, true, 26);
			SetHUDKeyInfoState(HUD, 7, true, 27);
		}
		return;
	}
	stop;
}

state StopBaseState
{
	simulated function UsableSomethingQueryInteractKeyInfoState(HUD HUD)
	{
		SetHUDKeyInfoState(HUD, 2, true, 7);
		SetHUDKeyInfoState(HUD, 3, true, 8);
		SetHUDKeyInfoState(HUD, 0, true, 9);
		SetHUDKeyInfoState(HUD, 1, true, 10);
		// End:0x87
		if(__NFUN_149__(PlayerPawn(User).__NFUN_994__(), Level.__NFUN_1164__()))
		{
			SetHUDKeyInfoState(HUD, 7, true, 26);
			SetHUDKeyInfoState(HUD, 5, true, 27);			
		}
		else
		{
			SetHUDKeyInfoState(HUD, 5, true, 26);
			SetHUDKeyInfoState(HUD, 7, true, 27);
		}
		return;
	}
	stop;
}

state SpinRightBase
{
	simulated function UsableSomethingQueryInteractKeyInfoState(HUD HUD)
	{
		return;
	}
	stop;
}

state SpinRightStart extends SpinRightBase
{	stop;
}

state() SpinRight extends SpinRightBase
{	stop;
}

state SpinRightEarlyStop extends SpinRightBase
{	stop;
}

state SpinRightStop extends StopBaseState
{	stop;
}

state SpinLeftBase
{
	simulated function UsableSomethingQueryInteractKeyInfoState(HUD HUD)
	{
		return;
	}
	stop;
}

state SpinLeftStart extends SpinLeftBase
{	stop;
}

state() SpinLeft extends SpinLeftBase
{	stop;
}

state SpinLeftEarlyStop extends SpinLeftBase
{	stop;
}

state SpinLeftStop extends StopBaseState
{	stop;
}

state ArmUpBase
{
	simulated function UsableSomethingQueryInteractKeyInfoState(HUD HUD)
	{
		return;
	}
	stop;
}

state ArmUpStart extends ArmUpBase
{	stop;
}

state() ArmUp extends ArmUpBase
{	stop;
}

state ArmUpEarlyStop extends ArmUpBase
{	stop;
}

state ArmUpStop extends StopBaseState
{	stop;
}

state ArmDownBase
{
	simulated function UsableSomethingQueryInteractKeyInfoState(HUD HUD)
	{
		return;
	}
	stop;
}

state ArmDownStart extends ArmDownBase
{	stop;
}

state() ArmDown extends ArmDownBase
{	stop;
}

state ArmDownEarlyStop extends ArmDownBase
{	stop;
}

state ArmDownStop extends StopBaseState
{	stop;
}

state() Speak
{
	simulated function UsableSomethingQueryInteractKeyInfoState(HUD HUD)
	{
		return;
	}
	stop;
}

state() AlienAttack
{
	simulated function UsableSomethingQueryInteractKeyInfoState(HUD HUD)
	{
		return;
	}
	stop;
}

defaultproperties
{
	States(0)=(StateName=Useable,OutEvents=none,Transitions=((ControlEvent=3,CustomName=None,NewState=AttachUserLERP)),UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0),Velocity3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0))
	States(1)=(Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
	States(2)=(MySoundName=None,SubAnims=none)
	States(3)=(StateName=AttachUserLERP,OutEvents=none,Transitions=((ControlEvent=5,CustomName=None,NewState=AttachUserAnim)),UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0),Velocity3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0))
	States(4)=(Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
	States(5)=(MySoundName=None,SubAnims=none)
	States(6)=(StateName=AttachUserAnim,OutEvents=none,Transitions=((ControlEvent=7,CustomName=None,NewState=idle)),UserAnimName=DukeStatue_Activate,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=Activate,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0),Velocity3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0))
	States(7)=(Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
	States(8)=(MySoundName=None,SubAnims=none)
	States(9)=(StateName=DetachUser,OutEvents=none,Transitions=((ControlEvent=8,CustomName=None,NewState=DetachUserLERP)),UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=Deactivate,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0),Velocity3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0))
	States(10)=(Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
	States(11)=(MySoundName=None,SubAnims=none)
	States(12)=(StateName=DetachUserLERP,OutEvents=none,Transitions=((ControlEvent=6,CustomName=None,NewState=Useable)),UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0),Velocity3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0))
	States(13)=(Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
	States(14)=(MySoundName=None,SubAnims=none)
	States(15)=(StateName=idle,OutEvents=none,Transitions=((ControlEvent=4,CustomName=None,NewState=DetachUser),(ControlEvent=30,CustomName=None,NewState=SpinRightStart),(ControlEvent=27,CustomName=None,NewState=SpinLeftStart),(ControlEvent=21,CustomName=None,NewState=ArmUpStart),(ControlEvent=24,CustomName=None,NewState=ArmDownStart),(ControlEvent=15,CustomName=None,NewState=Speak),(ControlEvent=18,CustomName=None,NewState=AlienAttack)),UserAnimName=DukeStatue_Idle,UserSoundName=None,MyAnim=(Flags=(bLoop=true,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=idle,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0),Velocity3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0))
	States(16)=(Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
	States(17)=(MySoundName=None,SubAnims=none)
	States(18)=(StateName=SpinRightStart,OutEvents=none,Transitions=((ControlEvent=9,CustomName=None,NewState=SpinRight),(ControlEvent=31,CustomName=None,NewState=SpinRightEarlyStop)),UserAnimName=DukeStatue_SpinRightStart,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=spinright_start,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0),Velocity3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0))
	States(19)=(Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
	States(20)=(MySoundName=None,SubAnims=none)
	States(21)=(StateName=SpinRightEarlyStop,OutEvents=none,Transitions=((ControlEvent=9,CustomName=None,NewState=SpinRightStop)),UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0),Velocity3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0))
	States(22)=(Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
	States(23)=(MySoundName=None,SubAnims=none)
	bUseHomePose=false
	InterpolationInTime=0.3
	InterpolationOutTime=0.3
	HUDHelpEntries(0)=(Key=7,KeyAlt=8,HelpText="Spin Left/Right")
	HUDHelpEntries(1)=(Key=9,KeyAlt=10,HelpText="Raise/Lower Arm")
	HUDHelpEntries(2)=(Key=26,KeyAlt=0,HelpText="Speak")
	UsableExits(0)=(bEnabled=true,EnterInfo=(LocationOffset=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0),RotationOffset=(Pitch=8709,Yaw=571080704,Roll=0),Roll=0)
	UserMountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=true,bDontScaleByDrawScale=true,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=true,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=1.291717E-41,Y=2.802821E-17,Z=0),Z=-36)
	bBlockPlayers=true
	bBlockKarma=true
	bDirectional=true
	CollisionHeight=36
	Mesh='c_generic.DukeStatueControls'
}