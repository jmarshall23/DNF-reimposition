/*******************************************************************************
 * dnControl_Chair generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnControl_Chair extends dnControl
	collapsecategories;

var() noexport name SitSoundName "VoicePack entry to play as user sits down.";
var() noexport name StandSoundName "VoicePack entry to play as user stands up.";
var() noexport float MaxDeviation "DOT Product of chair's 'up' vector and the positive z-axis cannot be smaller than this number.";

function PostVerifySelf()
{
	super.PostVerifySelf();
	Texture = none;
	return;
}

function bool ValidRotationForUse()
{
	local Vector MyUpDir;

	MyUpDir = __NFUN_263__(__NFUN_232__(0, 0, 1), Rotation);
	// End:0x46
	if(__NFUN_203__(__NFUN_244__(MyUpDir, __NFUN_232__(0, 0, 1)), MaxDeviation))
	{
		return true;		
	}
	else
	{
		return false;
	}
	return;
}

function bool ShouldMimicOwner()
{
	// End:0x14
	if(ValidRotationForUse())
	{
		bMimicOwner = false;		
	}
	else
	{
		bMimicOwner = true;
	}
	return super(InteractiveActor).ShouldMimicOwner();
	return;
}

simulated function bool CanBeUsedBy(Pawn User)
{
	// End:0x14
	if(ShouldMimicOwner())
	{
		bPassUseToOwner = true;		
	}
	else
	{
		bPassUseToOwner = false;
	}
	return super(dnUsableSomething).CanBeUsedBy(User);
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super.RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1277__(VoicePack, SitSoundName);
	PrecacheIndex.__NFUN_1277__(VoicePack, StandSoundName);
	return;
}

state() AttachUserAnim
{
	simulated event BeginState()
	{
		super(Object).BeginState();
		FindAndPlaySound(SitSoundName, 1);
		return;
	}
	stop;
}

state() DetachUser
{
	simulated event BeginState()
	{
		super(Object).BeginState();
		FindAndPlaySound(StandSoundName, 1);
		return;
	}
	stop;
}

defaultproperties
{
	SitSoundName=DukeThrone_Activate
	StandSoundName=DukeThrone_Deactivate
	MaxDeviation=0.9
	States(0)=(StateName=Useable,OutEvents=none,Transitions=((ControlEvent=3,CustomName=None,NewState=AttachUserLERP)),UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0),Velocity3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0))
	States(1)=(Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
	States(2)=(MySoundName=None,SubAnims=none)
	States(3)=(StateName=AttachUserLERP,OutEvents=none,Transitions=((ControlEvent=5,CustomName=None,NewState=AttachUserAnim)),UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0),Velocity3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0))
	States(4)=(Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
	States(5)=(MySoundName=None,SubAnims=none)
	bUseHomePose=false
	UsableExits(0)=(bEnabled=true,EnterInfo=(LocationOffset=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0),RotationOffset=(Pitch=8741,Yaw=572915712,Roll=0),Roll=0)
	UserMountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=true,bDontScaleByDrawScale=true,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=true,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=1.292418E-41,Y=2.954644E-17,Z=0),Z=-41)
	bDisableCrosshair=true
	bForceUsePhrase=true
	UsePhrase="<?int?dnGame.dnControl_Chair.UsePhrase?>"
	bTraceShootable=false
	bBlockActors=false
	bCollideWorld=false
	CollisionRadius=15
	DrawType=1
}