/*******************************************************************************
 * dnControl_Chair_TalkShow generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnControl_Chair_TalkShow extends dnControl_Chair
	collapsecategories;

defaultproperties
{
	States(0)=(StateName=Useable,OutEvents=none,Transitions=((ControlEvent=3,CustomName=None,NewState=AttachUserLERP)),UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0),Velocity3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0))
	States(1)=(Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
	States(2)=(MySoundName=None,SubAnims=none)
	States(3)=(StateName=AttachUserLERP,OutEvents=none,Transitions=((ControlEvent=5,CustomName=None,NewState=AttachUserAnim)),UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0),Velocity3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0))
	States(4)=(Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
	States(5)=(MySoundName=None,SubAnims=none)
	UsableExits(0)=(bEnabled=true,EnterInfo=(LocationOffset=(X=1.291717E-41,Y=2.802848E-17,Z=0),Z=-23),RotationOffset=(Pitch=8709,Yaw=571080704,Roll=0),Roll=0)
}