/*******************************************************************************
 * dnAnimationControllerEx_Shotgun generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnAnimationControllerEx_Shotgun extends dnAnimationControllerEx_Weapon;

defaultproperties
{
	Animations(0)=(AnimationName=Activate,AnimationChannel=(ChannelName=Base,ChannelLink=0,bLinkedToBlock=false),AnimSequence=shotgun_activate,AnimStartingFrame=0,AnimRate=1.2,AnimRateVariance=0,AnimTween=0,AnimDefaultBlendAlpha=0,AnimEarlyEndTime=0,bLoopAnim=false,bInterrupt=false,bNoRemoveAnim=false,bBatchAnim=false,bAdjustStart=false,AnimBlendInInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimBlendOutInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimStart_FunctionCallName=None,AnimEnd_NextAnimStateName=None,AnimEnd_FunctionCallName=WeaponCallback_Activated,AnimEnd_Event=None,GroupCrossfadeOverride=0,bForceCrossfade=false,bIs3DGrid=false,AnimGridLink=0)
	Animations(1)=(AnimationName=Deactivate,AnimationChannel=(ChannelName=Base,ChannelLink=0,bLinkedToBlock=false),AnimSequence=shotgun_deactivate,AnimStartingFrame=0,AnimRate=1.2,AnimRateVariance=0,AnimTween=0,AnimDefaultBlendAlpha=0,AnimEarlyEndTime=0,bLoopAnim=false,bInterrupt=false,bNoRemoveAnim=false,bBatchAnim=false,bAdjustStart=false,AnimBlendInInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimBlendOutInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimStart_FunctionCallName=None,AnimEnd_NextAnimStateName=None,AnimEnd_FunctionCallName=WeaponCallback_Deactivated,AnimEnd_Event=None,GroupCrossfadeOverride=0,bForceCrossfade=false,bIs3DGrid=false,AnimGridLink=0)
	Animations(2)=(AnimationName=Fire,AnimationChannel=(ChannelName=Base,ChannelLink=0,bLinkedToBlock=false),AnimSequence=shotgun_fire,AnimStartingFrame=0,AnimRate=0,AnimRateVariance=0,AnimTween=0,AnimDefaultBlendAlpha=0,AnimEarlyEndTime=0,bLoopAnim=false,bInterrupt=true,bNoRemoveAnim=false,bBatchAnim=false,bAdjustStart=false,AnimBlendInInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimBlendOutInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimStart_FunctionCallName=None,AnimEnd_NextAnimStateName=None,AnimEnd_FunctionCallName=WeaponCallback_MaybeDoneFiring,AnimEnd_Event=None,GroupCrossfadeOverride=0,bForceCrossfade=false,bIs3DGrid=false,AnimGridLink=0)
	Animations(3)=(AnimationName=idle,AnimationChannel=(ChannelName=Base,ChannelLink=0,bLinkedToBlock=false),AnimSequence=shotgun_idle,AnimStartingFrame=0,AnimRate=0,AnimRateVariance=0,AnimTween=0,AnimDefaultBlendAlpha=0,AnimEarlyEndTime=0,bLoopAnim=true,bInterrupt=false,bNoRemoveAnim=false,bBatchAnim=false,bAdjustStart=false,AnimBlendInInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimBlendOutInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimStart_FunctionCallName=None,AnimEnd_NextAnimStateName=None,AnimEnd_FunctionCallName=None,AnimEnd_Event=None,GroupCrossfadeOverride=0,bForceCrossfade=false,bIs3DGrid=false,AnimGridLink=0)
	Animations(4)=(AnimationName=ReloadStart,AnimationChannel=(ChannelName=Base,ChannelLink=0,bLinkedToBlock=false),AnimSequence=shotgun_reload_start,AnimStartingFrame=0,AnimRate=0,AnimRateVariance=0,AnimTween=0,AnimDefaultBlendAlpha=0,AnimEarlyEndTime=0,bLoopAnim=false,bInterrupt=false,bNoRemoveAnim=false,bBatchAnim=false,bAdjustStart=false,AnimBlendInInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimBlendOutInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimStart_FunctionCallName=None,AnimEnd_NextAnimStateName=None,AnimEnd_FunctionCallName=WeaponCallback_MaybeDoneReloading,AnimEnd_Event=None,GroupCrossfadeOverride=0,bForceCrossfade=false,bIs3DGrid=false,AnimGridLink=0)
	Animations(5)=(AnimationName=Reload,AnimationChannel=(ChannelName=Base,ChannelLink=0,bLinkedToBlock=false),AnimSequence=shotgun_reload,AnimStartingFrame=0,AnimRate=0,AnimRateVariance=0,AnimTween=0,AnimDefaultBlendAlpha=0,AnimEarlyEndTime=0,bLoopAnim=false,bInterrupt=false,bNoRemoveAnim=false,bBatchAnim=false,bAdjustStart=false,AnimBlendInInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimBlendOutInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimStart_FunctionCallName=None,AnimEnd_NextAnimStateName=None,AnimEnd_FunctionCallName=WeaponCallback_MaybeDoneReloading,AnimEnd_Event=None,GroupCrossfadeOverride=0,bForceCrossfade=false,bIs3DGrid=false,AnimGridLink=0)
	Animations(6)=(AnimationName=ReloadStop,AnimationChannel=(ChannelName=Base,ChannelLink=0,bLinkedToBlock=false),AnimSequence=shotgun_reload_stop,AnimStartingFrame=0,AnimRate=0,AnimRateVariance=0,AnimTween=0,AnimDefaultBlendAlpha=0,AnimEarlyEndTime=0,bLoopAnim=false,bInterrupt=false,bNoRemoveAnim=false,bBatchAnim=false,bAdjustStart=false,AnimBlendInInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimBlendOutInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimStart_FunctionCallName=None,AnimEnd_NextAnimStateName=None,AnimEnd_FunctionCallName=WeaponCallback_DefinitelyDoneReloading,AnimEnd_Event=None,GroupCrossfadeOverride=0,bForceCrossfade=false,bIs3DGrid=false,AnimGridLink=0)
	Animations(7)=(AnimationName=Melee0,AnimationChannel=(ChannelName=Base,ChannelLink=0,bLinkedToBlock=false),AnimSequence=shotgun_melee,AnimStartingFrame=0,AnimRate=0,AnimRateVariance=0,AnimTween=0,AnimDefaultBlendAlpha=0,AnimEarlyEndTime=0,bLoopAnim=false,bInterrupt=false,bNoRemoveAnim=false,bBatchAnim=false,bAdjustStart=false,AnimBlendInInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimBlendOutInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimStart_FunctionCallName=None,AnimEnd_NextAnimStateName=None,AnimEnd_FunctionCallName=WeaponCallback_MeleeComplete,AnimEnd_Event=None,GroupCrossfadeOverride=0,bForceCrossfade=false,bIs3DGrid=false,AnimGridLink=0)
}