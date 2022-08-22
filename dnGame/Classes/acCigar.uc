/*******************************************************************************
 * acCigar generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class acCigar extends dnAnimationControllerEx_Weapon;

defaultproperties
{
    Animations(0)=(AnimationName=CigarActivate,AnimationChannel=(ChannelName=Base,ChannelLink=0,bLinkedToBlock=false),AnimSequence=a_activate,AnimStartingFrame=0,AnimRate=0,AnimRateVariance=0,AnimTween=0,AnimDefaultBlendAlpha=0,AnimEarlyEndTime=0,bLoopAnim=false,bInterrupt=false,bNoRemoveAnim=false,bBatchAnim=false,bAdjustStart=false,AnimBlendInInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimBlendOutInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimStart_FunctionCallName=None,AnimEnd_NextAnimStateName=None,AnimEnd_FunctionCallName=WeaponCallback_Activated,AnimEnd_Event=None,GroupCrossfadeOverride=0,bForceCrossfade=false,bIs3DGrid=false,AnimGridLink=0)
    Animations(1)=(AnimationName=CigarDeactivate,AnimationChannel=(ChannelName=Base,ChannelLink=0,bLinkedToBlock=false),AnimSequence=XSpecial_AnimEnd,AnimStartingFrame=0,AnimRate=0,AnimRateVariance=0,AnimTween=0,AnimDefaultBlendAlpha=0,AnimEarlyEndTime=0,bLoopAnim=false,bInterrupt=false,bNoRemoveAnim=false,bBatchAnim=false,bAdjustStart=false,AnimBlendInInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimBlendOutInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimStart_FunctionCallName=None,AnimEnd_NextAnimStateName=None,AnimEnd_FunctionCallName=WeaponCallback_Deactivated,AnimEnd_Event=None,GroupCrossfadeOverride=0,bForceCrossfade=false,bIs3DGrid=false,AnimGridLink=0)
    AnimationGrids(0)=(AnimationGridName=SmokeGrid,AnimationChannel=(ChannelName=Base,ChannelLink=0,bLinkedToBlock=false),AnimGridSequence=a_smokegrid,bIs3DGrid=false,AnimationLink=0)
}