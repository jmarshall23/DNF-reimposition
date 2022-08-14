/*******************************************************************************
 * acKid generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class acKid extends AIAnimationControllerEx;

defaultproperties
{
	HeadAimerContraints=(MinViewPitchOffset=-8000,MaxViewPitchOffset=12000,IgnoreThresholdPitch=65535,MinViewYawOffset=-8192,MaxViewYawOffset=8192,IgnoreThresholdYaw=65535,SmerpOn=0.15,SmerpOff=0.1,Acceleration=0.1,AccelerationReset=0.1,Velocity=5000,VelocityReset=2500)
	Animations(0)=(AnimationName=InstantDecoAttach,AnimationChannel=(ChannelName=Bottom,ChannelLink=0,bLinkedToBlock=false),AnimSequence=XSpecial_AnimEnd,AnimStartingFrame=0,AnimRate=0,AnimRateVariance=0,AnimTween=0,AnimDefaultBlendAlpha=0,AnimEarlyEndTime=0,bLoopAnim=false,bInterrupt=false,bNoRemoveAnim=false,bBatchAnim=false,bAdjustStart=false,AnimBlendInInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimBlendOutInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimStart_FunctionCallName=None,AnimEnd_NextAnimStateName=None,AnimEnd_FunctionCallName=AnimCallback_AttachedToDecoration,AnimEnd_Event=None,GroupCrossfadeOverride=0,bForceCrossfade=false,bIs3DGrid=false,AnimGridLink=0)
	Animations(1)=(AnimationName=AnimClear_ShootRefPose,AnimationChannel=(ChannelName=Weapon_Ref,ChannelLink=0,bLinkedToBlock=false),AnimSequence=XSpecial_Clear,AnimStartingFrame=0,AnimRate=0,AnimRateVariance=0,AnimTween=0,AnimDefaultBlendAlpha=0,AnimEarlyEndTime=0,bLoopAnim=false,bInterrupt=false,bNoRemoveAnim=false,bBatchAnim=false,bAdjustStart=false,AnimBlendInInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimBlendOutInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimStart_FunctionCallName=None,AnimEnd_NextAnimStateName=None,AnimEnd_FunctionCallName=None,AnimEnd_Event=None,GroupCrossfadeOverride=0,bForceCrossfade=false,bIs3DGrid=false,AnimGridLink=0)
	Animations(2)=(AnimationName=AnimClear_ShootIdle,AnimationChannel=(ChannelName=Weapon_Anim,ChannelLink=0,bLinkedToBlock=false),AnimSequence=XSpecial_Clear,AnimStartingFrame=0,AnimRate=0,AnimRateVariance=0,AnimTween=0,AnimDefaultBlendAlpha=0,AnimEarlyEndTime=0,bLoopAnim=false,bInterrupt=false,bNoRemoveAnim=false,bBatchAnim=false,bAdjustStart=false,AnimBlendInInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimBlendOutInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimStart_FunctionCallName=None,AnimEnd_NextAnimStateName=None,AnimEnd_FunctionCallName=None,AnimEnd_Event=None,GroupCrossfadeOverride=0,bForceCrossfade=false,bIs3DGrid=false,AnimGridLink=0)
	Animations(3)=(AnimationName=Anim_Script,AnimationChannel=(ChannelName=Bottom,ChannelLink=0,bLinkedToBlock=false),AnimSequence=a_idle01,AnimStartingFrame=0,AnimRate=1,AnimRateVariance=0,AnimTween=0,AnimDefaultBlendAlpha=0,AnimEarlyEndTime=0.2,bLoopAnim=false,bInterrupt=true,bNoRemoveAnim=false,bBatchAnim=false,bAdjustStart=true,AnimBlendInInfo=(BlendTotalTime=0.2,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimBlendOutInfo=(BlendTotalTime=0.2,StartingBlendAlpha=1,EndingBlendAlpha=0),AnimStart_FunctionCallName=None,AnimEnd_NextAnimStateName=None,AnimEnd_FunctionCallName=None,AnimEnd_Event=None,GroupCrossfadeOverride=0,bForceCrossfade=false,bIs3DGrid=false,AnimGridLink=0)
	Animations(4)=(AnimationName=Anim_DeathScript,AnimationChannel=(ChannelName=Bottom,ChannelLink=0,bLinkedToBlock=false),AnimSequence=a_idle01,AnimStartingFrame=0,AnimRate=1,AnimRateVariance=0,AnimTween=0,AnimDefaultBlendAlpha=0,AnimEarlyEndTime=0,bLoopAnim=false,bInterrupt=true,bNoRemoveAnim=false,bBatchAnim=false,bAdjustStart=true,AnimBlendInInfo=(BlendTotalTime=0.2,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimBlendOutInfo=(BlendTotalTime=0,StartingBlendAlpha=1,EndingBlendAlpha=0),AnimStart_FunctionCallName=None,AnimEnd_NextAnimStateName=None,AnimEnd_FunctionCallName=None,AnimEnd_Event=None,GroupCrossfadeOverride=0,bForceCrossfade=false,bIs3DGrid=false,AnimGridLink=0)
	Animations(5)=(AnimationName=Anim_Invalid,AnimationChannel=(ChannelName=Bottom,ChannelLink=0,bLinkedToBlock=false),AnimSequence=a_invalid,AnimStartingFrame=0,AnimRate=1,AnimRateVariance=0,AnimTween=0,AnimDefaultBlendAlpha=0,AnimEarlyEndTime=0,bLoopAnim=true,bInterrupt=true,bNoRemoveAnim=false,bBatchAnim=false,bAdjustStart=false,AnimBlendInInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimBlendOutInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimStart_FunctionCallName=None,AnimEnd_NextAnimStateName=None,AnimEnd_FunctionCallName=None,AnimEnd_Event=None,GroupCrossfadeOverride=0,bForceCrossfade=false,bIs3DGrid=false,AnimGridLink=0)
	Animations(6)=(AnimationName=Anim_EyesClear,AnimationChannel=(ChannelName=Eyes,ChannelLink=0,bLinkedToBlock=false),AnimSequence=XSpecial_Clear,AnimStartingFrame=0,AnimRate=0,AnimRateVariance=0,AnimTween=0,AnimDefaultBlendAlpha=0,AnimEarlyEndTime=0,bLoopAnim=false,bInterrupt=false,bNoRemoveAnim=false,bBatchAnim=false,bAdjustStart=false,AnimBlendInInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimBlendOutInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimStart_FunctionCallName=None,AnimEnd_NextAnimStateName=None,AnimEnd_FunctionCallName=None,AnimEnd_Event=None,GroupCrossfadeOverride=0,bForceCrossfade=false,bIs3DGrid=false,AnimGridLink=0)
	Animations(7)=(AnimationName=Anim_EyesBlink1,AnimationChannel=(ChannelName=Eyes,ChannelLink=0,bLinkedToBlock=false),AnimSequence=s_eyes_blink,AnimStartingFrame=0,AnimRate=0,AnimRateVariance=0,AnimTween=0,AnimDefaultBlendAlpha=0,AnimEarlyEndTime=0,bLoopAnim=false,bInterrupt=true,bNoRemoveAnim=false,bBatchAnim=false,bAdjustStart=false,AnimBlendInInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimBlendOutInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimStart_FunctionCallName=None,AnimEnd_NextAnimStateName=Anim_EyesClear,AnimEnd_FunctionCallName=None,AnimEnd_Event=None,GroupCrossfadeOverride=0,bForceCrossfade=false,bIs3DGrid=false,AnimGridLink=0)
	Animations(8)=(AnimationName=Anim_IdleA,AnimationChannel=(ChannelName=Bottom,ChannelLink=0,bLinkedToBlock=false),AnimSequence=a_normal_idle01,AnimStartingFrame=0,AnimRate=1,AnimRateVariance=0,AnimTween=0,AnimDefaultBlendAlpha=0,AnimEarlyEndTime=0,bLoopAnim=true,bInterrupt=true,bNoRemoveAnim=false,bBatchAnim=false,bAdjustStart=false,AnimBlendInInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimBlendOutInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimStart_FunctionCallName=None,AnimEnd_NextAnimStateName=None,AnimEnd_FunctionCallName=None,AnimEnd_Event=None,GroupCrossfadeOverride=0,bForceCrossfade=false,bIs3DGrid=false,AnimGridLink=0)
	Animations(9)=(AnimationName=Anim_IdleB,AnimationChannel=(ChannelName=Bottom,ChannelLink=0,bLinkedToBlock=false),AnimSequence=a_normal_idle02,AnimStartingFrame=0,AnimRate=1,AnimRateVariance=0,AnimTween=0,AnimDefaultBlendAlpha=0,AnimEarlyEndTime=0,bLoopAnim=true,bInterrupt=true,bNoRemoveAnim=false,bBatchAnim=false,bAdjustStart=false,AnimBlendInInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimBlendOutInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimStart_FunctionCallName=None,AnimEnd_NextAnimStateName=None,AnimEnd_FunctionCallName=None,AnimEnd_Event=None,GroupCrossfadeOverride=0,bForceCrossfade=false,bIs3DGrid=false,AnimGridLink=0)
	Animations(10)=(AnimationName=Anim_Walk,AnimationChannel=(ChannelName=Bottom,ChannelLink=0,bLinkedToBlock=false),AnimSequence=a_normal_walk,AnimStartingFrame=0,AnimRate=1,AnimRateVariance=0,AnimTween=0,AnimDefaultBlendAlpha=0,AnimEarlyEndTime=0,bLoopAnim=true,bInterrupt=false,bNoRemoveAnim=false,bBatchAnim=false,bAdjustStart=false,AnimBlendInInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimBlendOutInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimStart_FunctionCallName=None,AnimEnd_NextAnimStateName=None,AnimEnd_FunctionCallName=None,AnimEnd_Event=None,GroupCrossfadeOverride=0,bForceCrossfade=false,bIs3DGrid=false,AnimGridLink=0)
	Animations(11)=(AnimationName=Anim_Run,AnimationChannel=(ChannelName=Bottom,ChannelLink=0,bLinkedToBlock=false),AnimSequence=a_normal_run,AnimStartingFrame=0,AnimRate=1,AnimRateVariance=0,AnimTween=0,AnimDefaultBlendAlpha=0,AnimEarlyEndTime=0,bLoopAnim=true,bInterrupt=false,bNoRemoveAnim=false,bBatchAnim=false,bAdjustStart=false,AnimBlendInInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimBlendOutInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimStart_FunctionCallName=None,AnimEnd_NextAnimStateName=None,AnimEnd_FunctionCallName=None,AnimEnd_Event=None,GroupCrossfadeOverride=0,bForceCrossfade=false,bIs3DGrid=false,AnimGridLink=0)
	AnimationBlocks(0)=(AnimationBlockName=Anim_Idle,AnimationNames=(Anim_IdleA,Anim_IdleB))
}