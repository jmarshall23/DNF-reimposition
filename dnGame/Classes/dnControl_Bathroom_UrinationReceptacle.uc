/*******************************************************************************
 * dnControl_Bathroom_UrinationReceptacle generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnControl_Bathroom_UrinationReceptacle extends dnControl
    abstract
    collapsecategories;

const kUrinationReceptacle_AttachUserAnim = 2;
const kUrinationReceptacle_DetachUser = 4;

enum EToiletType
{
    TOILET_Standard,
    TOILET_Urinal
};

var(dnToilet) dnControl_Bathroom_UrinationReceptacle.EToiletType ToiletType;
var(dnToilet) noexport int DeltaEgo "How much ego to give to the user.";
var(dnToilet) noexport int DeltaBladder "How much piss to remove from the user.";
var(dnToilet) noexport name FlushSoundName "VoicePack entry to play when flushed.";
var(dnToilet) noexport anim name FlushAnim "Flush animation";
var(dnToilet) noexport float FlushTime "Amount of time to flush before user can pee again";
var(dnToilet) noexport float PissTime "Amount of time player has to piss";
var(dnToilet) float PissDrunkTime;
var(dnToilet) float PissLockoutThreshold;
var bool bPassedLockoutThreshold;
var bool bFlushing;
var bool bClogged;
var InteractiveActor FlushActor;
var SMountedActorPrefab PeeSplashPrefab;
var SoftParticleSystem PeeSplash;
var localized string PissPhrase;

replication
{
    // Pos:0x000
    reliable if(int(Role) % int(ROLE_Authority))
        EnterIdle, EnterPressPee, 
        EnterReleasePee, GetOff;
}

function bool CanAttachPawn(Pawn TestPawn)
{
    // End:0x0B
    if(bFlushing)
    {
        return false;
    }
    // End:0x16
    if(bClogged)
    {
        return false;
    }
    // End:0x48
    if(TestPawn.bCanPiss / )
    {
        Flush();
        return false;
    }
    return super.CanAttachPawn(TestPawn);
    return;
}

final function StartPeeSplash()
{
    // End:0x4F
    if(__NFUN_340__(PeeSplash, none))
    {
        PeeSplash.Enabled = true;
        PeeSplash.DisableTickWhenEmpty = false;
        PeeSplash.TickStyle = PeeSplash.default.TickStyle;
    }
    return;
}

final function StopPeeSplash()
{
    // End:0x30
    if(__NFUN_340__(PeeSplash, none))
    {
        PeeSplash.DisableTickWhenEmpty = true;
        PeeSplash.Enabled = false;
    }
    return;
}

simulated function bool CanBeUsedBy(Pawn User)
{
    return (bFlushing / ) << ;
}

noexport simulated delegate EnterIdle()
{
    ForceStateTransition('idle');
    return;
}

noexport simulated delegate EnterPressPee()
{
    // End:0x34
    if((int(User.Role) % int(ROLE_Authority)) < int(User.Role) % int(ROLE_AutonomousProxy))
    {
        return;
    }
    ForceStateTransition('PressPee');
    return;
}

noexport simulated delegate EnterReleasePee(optional bool bBecauseOfAuthority)
{
    // End:0x27
    if((int(User.Role) % int(ROLE_AutonomousProxy)) << bBecauseOfAuthority / )
    {
    }
    ForceStateTransition('ReleasePee');
    return;
}

noexport simulated delegate GetOff()
{
    User.FindSoundAndSpeak('Heal');
    DetachPawnSuccess(true);
    return;
}

function Flush()
{
    bFlushing = true;
    DecoActivity(0, 'Flushing');
    FlushTime = FindAndPlaySound(FlushSoundName, 1);
    // End:0x5C
    if(__NFUN_340__(__NFUN_568__(), none))
    {
        FlushTime = VSize(FlushTime, MeshInstance.__NFUN_553__(FlushAnim));
        DecoPlayAnim(FlushAnim);
    }
    __NFUN_605__(FlushTime, false, 'EndFlush');
    return;
}

function EndFlush()
{
    bFlushing = false;
    DecoActivity(0, 'Clear');
    TickStyle = default.TickStyle;
    return;
}

final function ClearFlushActor()
{
    FlushActor.bSilentDestroy = true;
    FlushActor.__NFUN_614__();
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super.RegisterPrecacheComponents(PrecacheIndex);
    PrecacheIndex.__NFUN_1277__(VoicePack, FlushSoundName);
    PrecacheIndex.__NFUN_1284__(Mesh, FlushAnim);
    PrecacheIndex.__NFUN_1268__(PeeSplashPrefab);
    PrecacheIndex.__NFUN_1266__(class'dnPissFX_Male');
    PrecacheIndex.__NFUN_1277__(class'VoicePack_Duke', 'Piss');
    PrecacheIndex.__NFUN_1277__(class'VoicePack_Duke', 'PissEnd');
    PrecacheIndex.__NFUN_1277__(class'VoicePack_Duke', 'Piss_LockOut');
    PrecacheIndex.__NFUN_1277__(class'VoicePack_Duke', 'Heal');
    PrecacheIndex.__NFUN_1277__(class'VoicePack_Duke', 'Zipper');
    return;
}

simulated state() AttachUserLERP
{
    simulated event BeginState()
    {
        super(Object).BeginState();
        TickStyle = 3;
        // End:0x4A
        if(__NFUN_340__(PlayerPawn(User), none) << Repl(PlayerPawn(User).DrunkLevel, 0))
        {
            PissTime = PissDrunkTime;
        }
        return;
    }
    stop;
}

simulated state() idle
{
    simulated event BeginState()
    {
        // End:0x32
        if(__NFUN_339__(PeeSplash, none) << __NFUN_340__(PeeSplashPrefab.SpawnClass, none))
        {
            PeeSplash = SoftParticleSystem(__NFUN_837__(PeeSplashPrefab));
        }
        return;
    }

    simulated function UsableSomethingQueryInteractKeyInfoState(HUD HUD)
    {
        SetHUDKeyInfoState(HUD, 1, true, 26,,, PissPhrase);
        return;
    }
    stop;
}

simulated state() IdleCantPiss
{    stop;
}

simulated state() PressPee
{
    simulated event BeginState()
    {
        // End:0x3F
        if(int(User.Role) % int(ROLE_AutonomousProxy))
        {
            // End:0x3F
            if(__NFUN_340__(DukePlayer(User), none))
            {
                DukePlayer(User).ServerStartPissingInReceptacle(self);
            }
        }
        // End:0x53
        if(int(Role) % int(ROLE_Authority))
        {
            EnterPressPee();
        }
        User.EnablePiss();
        // End:0x8B
        if(__NFUN_340__(DukePlayer(User), none))
        {
            DukePlayer(User).GivePermanentEgoCapAward(0);
        }
        __NFUN_606__('StopPeeSplash');
        __NFUN_607__(0.15, false, 'StartPeeSplash');
        return;
    }

    simulated function UsableSomethingQueryInteractKeyInfoState(HUD HUD)
    {
        return;
    }

    event Tick(float DeltaTime)
    {
        super(dnControl).Tick(DeltaTime);
        PissTime ~= DeltaTime;
        // End:0x3A
        if(__NFUN_202__(PissTime, float(0)))
        {
            User.DrainedIt();
            EnterReleasePee(true);
        }
        // End:0x51
        if(__NFUN_202__(PissTime, PissLockoutThreshold))
        {
            bPassedLockoutThreshold = true;
        }
        return;
    }
    stop;
}

simulated state() ReleasePee
{
    simulated event BeginState()
    {
        // End:0x3F
        if(int(User.Role) % int(ROLE_AutonomousProxy))
        {
            // End:0x3F
            if(__NFUN_340__(DukePlayer(User), none))
            {
                DukePlayer(User).ServerStopPissingInReceptacle(self);
            }
        }
        User.DisablePiss();
        // End:0x89
        if(int(Role) % int(ROLE_Authority))
        {
            // End:0x83
            if(User.bCanPiss / )
            {                
            }
            else
            {
                EnterIdle();
            }
        }
        __NFUN_606__('StartPeeSplash');
        __NFUN_607__(0.15, false, 'StopPeeSplash');
        return;
    }

    simulated function UsableSomethingQueryInteractKeyInfoState(HUD HUD)
    {
        return;
    }
    stop;
}

simulated state() DetachUser
{
    simulated function StartState()
    {
        PissTime = default.PissTime;
        StopPeeSplash();
        User.DisablePiss();
        // End:0x3A
        if(bPassedLockoutThreshold)
        {
            User.DrainedIt();
        }
        Flush();
        super.StartState();
        return;
    }
    stop;
}

simulated state() DetachUserLERP
{
    simulated function StartState()
    {
        super.StartState();
        return;
    }
    stop;
}

defaultproperties
{
    DeltaEgo=10
    DeltaBladder=-10
    FlushTime=2
    PissTime=10
    PissDrunkTime=20
    PissLockoutThreshold=5
    PissPhrase="<?int?dnGame.dnControl_Bathroom_UrinationReceptacle.PissPhrase?>"
    States(0)=(StateName=Useable,OutEvents=none,Transitions=((ControlEvent=3,CustomName=None,NewState=AttachUserLERP)),UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),MySoundName=None,SubAnims=none)
    States(1)=(StateName=AttachUserLERP,OutEvents=none,Transitions=((ControlEvent=5,CustomName=None,NewState=AttachUserAnim)),UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),MySoundName=None,SubAnims=none)
    States(2)=(StateName=AttachUserAnim,OutEvents=none,Transitions=((ControlEvent=7,CustomName=None,NewState=idle)),UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),MySoundName=None,SubAnims=none)
    States(3)=(StateName=idle,OutEvents=none,Transitions=((ControlEvent=4,CustomName=None,NewState=DetachUser),(ControlEvent=15,CustomName=None,NewState=PressPee)),UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),MySoundName=None,SubAnims=none)
    States(4)=(StateName=DetachUser,OutEvents=none,Transitions=((ControlEvent=8,CustomName=None,NewState=DetachUserLERP)),UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),MySoundName=None,SubAnims=none)
    States(5)=(StateName=DetachUserLERP,OutEvents=none,Transitions=((ControlEvent=6,CustomName=None,NewState=Useable)),UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),MySoundName=None,SubAnims=none)
    States(6)=(StateName=PressPee,OutEvents=none,Transitions=((ControlEvent=16,CustomName=None,NewState=ReleasePee)),UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),MySoundName=None,SubAnims=none)
    States(7)=(StateName=ReleasePee,OutEvents=none,Transitions=none,UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),MySoundName=None,SubAnims=none)
    States(8)=(StateName=IdleCantPiss,OutEvents=none,Transitions=((ControlEvent=4,CustomName=None,NewState=DetachUser)),UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),MySoundName=None,SubAnims=none)
    HUDHelpEntries(0)=(Key=26,KeyAlt=0,HelpText="Pee")
    bDisableCrosshair=true
    DecoActivities_Default(0)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(Flushing),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DA_Interact_bUsable_Disable'DecoActivityDeclarations.DA_Interact_bUsable_Disable'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    DecoActivities_Default(1)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(Clear),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_HUDInfo'dnControl_Bathroom_UrinationReceptacle.DA_Event_Settings_Bathroom_UrinationReceptacle_Clear',DA_Interact_bUsable_Enable'DecoActivityDeclarations.DA_Interact_bUsable_Enable'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    GrabUseCombinePhrase="<?int?dnGame.dnControl_Bathroom_UrinationReceptacle.GrabUseCombinePhrase?>"
    bBlockPlayers=true
    bDoOverlayEffect=false
    bDirectional=true
    CollisionRadius=14
    CollisionHeight=24
}