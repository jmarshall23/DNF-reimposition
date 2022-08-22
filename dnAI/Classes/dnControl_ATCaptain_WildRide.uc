/*******************************************************************************
 * dnControl_ATCaptain_WildRide generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnControl_ATCaptain_WildRide extends dnControl_TapPowered
    collapsecategories;

var() noexport deprecated name InitialFlightPointTag "InterpolationPoint to teleport to and start flying around.";
var() noexport deprecated name FinishEvent "Event to be fired when final punch is delivered and finish state begins.";
var name GridAnimName;
var Vector ATSpawnLocationOffset;
var Rotator ATSpawnRotationOffset;
var float ATPunchDamage;
var AssaultTrooper_Captain AT;
var float Stage1PunchDelay;
var float Stage2FailTimer;
var int FailPunches;
var int RequiredPunches;
var int NumATPunches;
var int NumPunches;
var localized string PunchText;
var Pawn AttachPawn;
var() SRumbleInfo ActiveRumble;
var() SRumbleInfo IdleRumble;

final function SpawnTrooper()
{
    // End:0x0E
    if(__NFUN_340__(AT, none))
    {
        return;
    }
    AT = __NFUN_615__(class'AssaultTrooper_Captain_WildRide', self,, Locs(Location, __NFUN_263__(ATSpawnLocationOffset, Rotation)), __NFUN_269__(ATSpawnRotationOffset, Rotation), false, true);
    // End:0x4F
    if(__NFUN_339__(AT, none))
    {
        return;
    }
    AT.StartTeleportOverlayEffects();
    AT.EndTeleportOverlayEffects();
    AT.NotifyTeleportEnd();
    AT.SetAnimSync(1, 1, 1, 1, 2);
    AT.bAutoStartWeaponTargetEval = false;
    AT.bAutoStartLookTargetEval = false;
    AT.bAutoStartDecisionTree = false;
    AT.CanProcFire = false;
    AT.AIDisableIK();
    AT.TickStyle = 3;
    AT.__NFUN_642__(9);
    AT.StoreCollision();
    AT.__NFUN_621__(,,, false);
    return;
}

final function ReleaseControlOfTrooper()
{
    // End:0x0E
    if(__NFUN_339__(AT, none))
    {
        return;
    }
    AT.TickStyle = AT.default.TickStyle;
    AT.RestoreCollision();
    AT.__NFUN_642__(AT.default.Physics);
    AT.SuspendWeaponTargetEvaluation(false);
    AT.SuspendLookTargetEvaluation(false);
    AT.SetExecutive(2);
    AT.JetStop();
    AT = none;
    return;
}

final simulated function AttemptAttach()
{
    // End:0x17
    if(__NFUN_340__(AttachPawn, none))
    {
        AttachPawnSuccess(AttachPawn);
    }
    return;
}

simulated function AttachPawnSuccess(Pawn Attachee, optional bool bForced)
{
    // End:0x2B
    if((UsableSomethingCanBeUsedBy(Attachee)) / )
    {
        __NFUN_607__(1, false, 'AttemptAttach');
        return;
    }
    __NFUN_645__(__NFUN_239__(Attachee.Location, WarnInternal(0, 0, Attachee.CollisionHeight)));
    __NFUN_652__(Attachee.Rotation);
    // End:0x85
    if(__NFUN_340__(InternalControlRemapper, none))
    {
        InternalControlRemapper.__NFUN_630__();
    }
    SpawnTrooper();
    super(dnControl).AttachPawnSuccess(Attachee, bForced);
    User.TickBefore = AT;
    return;
}

simulated function PlayUserAnim()
{
    super(dnControl).PlayUserAnim();
    // End:0x71
    if((__NFUN_342__(States[CurrentStateIndex].UserAnimName, 'None') << __NFUN_340__(AT, none)) << __NFUN_340__(AT.AnimationController, none))
    {
        AT.AnimationController.SetAnimState(States[CurrentStateIndex].UserAnimName);
    }
    return;
}

simulated function HandleDecoAnimEvent(EventInfo EventParms)
{
    super(InteractiveActor).HandleDecoAnimEvent(EventParms);
    // End:0x33
    if(__NFUN_310__(EventParms.EventString, "BeginTeleport"))
    {
        BeginTeleport();        
    }
    else
    {
        // End:0x56
        if(__NFUN_310__(EventParms.EventString, "Teleport"))
        {
            DoTeleport();            
        }
        else
        {
            // End:0x7A
            if(__NFUN_310__(EventParms.EventString, "DamagePlayer"))
            {
                DamagePlayer();
            }
        }
    }
    return;
}

simulated function BeginTeleport()
{
    // End:0x66
    if(__NFUN_340__(AT, none))
    {
        AT.NotifyTeleportStart();
        AT.StartTeleportOverlayEffects();
        AT.StartTeleportOverlayEffectsOnActor(User);
        AT.__NFUN_635__(self, false, false, true, false, false);
        AT.bNoFailMountedMovement = true;
    }
    return;
}

simulated function DoTeleport()
{
    local SScreenFlash PurpleFlash;

    // End:0x93
    if(__NFUN_340__(PlayerUser, none) << __NFUN_340__(PlayerUser.MyHUD, none))
    {
        PurpleFlash.ColorStart = NewColorBytes(192, 0, 192, 255);
        PurpleFlash.ColorEnd = PurpleFlash.ColorStart;
        PurpleFlash.ColorEnd.A = 0;
        PurpleFlash.Lifetime = 0.5;
        PlayerUser.MyHUD.AddScreenFlash(PurpleFlash);
    }
    // End:0xE4
    if(__NFUN_340__(AT, none))
    {
        AT.JetStart();
        AT.EndTeleportOverlayEffects();
        AT.EndTeleportOverlayEffectsOnActor(User);
        AT.NotifyTeleportEnd();
    }
    AttachToPath(InitialFlightPointTag, true);
    return;
}

simulated function DamagePlayer()
{
    local float TotalHealth, DamageAmount;

    // End:0xBB
    if(__NFUN_340__(User, none))
    {
        DamageAmount = ATPunchDamage;
        TotalHealth = User.Health *= User.Ego;
        // End:0x65
        if(DamageAmount != TotalHealth)
        {
            DamageAmount = VSize(0, Round(TotalHealth, 1));
        }
        User.TakeDamage(AT, DamageAmount, User.Location, Caps(float(-1), Vector(User.Rotation)), class'MeleeDamage',, AT.Location);
    }
    return;
}

simulated function ATPunchTimer()
{
    ControlEvent(, 'ATPunch');
    return;
}

simulated function FailTimer()
{
    ControlEvent(, 'Fail');
    return;
}

final simulated function SelfDestructFunc()
{
    __NFUN_614__();
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super.RegisterPrecacheComponents(PrecacheIndex);
    PrecacheIndex.__NFUN_1266__(class'AssaultTrooper_Captain_WildRide');
    PrecacheIndex.__NFUN_1266__(class'dnScreenSplatter_Blood');
    PrecacheIndex.__NFUN_1279__(class'MeleeDamage');
    PrecacheIndex.__NFUN_1281__(GridAnimName);
    PrecacheIndex.__NFUN_1277__(class'VoicePack_Duke', 'Falling_Flail');
    PrecacheIndex.__NFUN_1277__(class'VoicePack_Duke', 'KnockDown_VOC');
    PrecacheIndex.__NFUN_1277__(class'VoicePack_Duke', 'Rage_VOC');
    PrecacheIndex.__NFUN_1277__(class'VoicePack_Duke', 'ST_Getup_Pat_01');
    PrecacheIndex.__NFUN_1277__(class'VoicePack_Duke', 'ST_Getup_Pat_02');
    PrecacheIndex.__NFUN_1277__(class'VoicePack_Duke', 'ST_Getup_Scuff');
    PrecacheIndex.__NFUN_1277__(class'VoicePack_Duke', 'ST_Getup_StandShift');
    return;
}

state() AttachUserAnim
{
    event BeginState()
    {
        super(Object).BeginState();
        PlayerPawn(User).AddRumble(ActiveRumble);
        PlayerPawn(User).AddRumble(IdleRumble);
        return;
    }
    stop;
}

state() idle
{
    simulated event BeginState()
    {
        super(Object).BeginState();
        RestoreDefaults();
        __NFUN_607__(Stage1PunchDelay, false, 'ATPunchTimer');
        PlayerPawn(User).AddRumble(IdleRumble);
        return;
    }

    function FullyLifted()
    {
        super(dnControl_TapPowered).FullyLifted();
        __NFUN_608__('ATPunch');
        ControlEvent(, 'Success');
        return;
    }

    function UpdateUserLift()
    {
        super(dnControl_TapPowered).UpdateUserLift();
        User.AnimationController.SetAnimGridState(GridAnimName, UserLiftVal);
        // End:0x72
        if(__NFUN_340__(AT, none) << __NFUN_340__(AT.AnimationController, none))
        {
            AT.AnimationController.SetAnimGridState(GridAnimName, UserLiftVal);
        }
        return;
    }
    stop;
}

state FailBaseState
{
    simulated event BeginState()
    {
        super(Object).BeginState();
        __NFUN_642__(0);
        return;
    }

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

state() Stage1_ATPunch
{
    simulated function AnimCallback_UserAnimEnd()
    {
        super(dnControl).AnimCallback_UserAnimEnd();
        // End:0x2B
        NumATPunches += ;
        {
            ControlEvent(, 'Fail');            
        }
        else
        {
            ControlEvent(, 'idle');
        }
        return;
    }
    stop;
}

state() Stage1_Success
{
    simulated event BeginState()
    {
        super(Object).BeginState();
        ActiveRumble.RumbleLeftMagnitude = 0.6;
        ActiveRumble.RumbleRightMagnitude = 0.4;
        PlayerPawn(User).AddRumble(ActiveRumble);
        return;
    }

    simulated event EndState()
    {
        super(Object).EndState();
        __NFUN_607__(Stage2FailTimer, false, 'FailTimer');
        return;
    }
    stop;
}

state() Stage1_Fail extends FailBaseState
{    stop;
}

state() Stage2_Idle
{
    simulated event BeginState()
    {
        super(Object).BeginState();
        // End:0x21
        if(NumPunches / RequiredPunches)
        {
            ControlEvent(, 'Success');
        }
        PlayerPawn(User).AddRumble(IdleRumble);
        return;
    }

    simulated function UsableSomethingQueryInteractKeyInfoState(HUD HUD)
    {
        SetHUDKeyInfoState(HUD, 1, true, 26, false, true, PunchText);
        return;
    }
    stop;
}

state() Stage2_Punch
{
    simulated event BeginState()
    {
        super(Object).BeginState();
        // End:0x1F
        if((NumPunches *= ) / )
        {
        }
        ActiveRumble.RumbleLeftMagnitude = 0.5;
        ActiveRumble.RumbleRightMagnitude = 0.9;
        PlayerPawn(User).AddRumble(ActiveRumble);
        return;
    }

    simulated function InteractUser(Pawn User)
    {
        local dnScreenSplatters BloodSplatter;
        local PlayerPawn PUser;

        super(InteractiveActor).InteractUser(User);
        // End:0x34
        if((NumPunches % 1) << __NFUN_340__(AT, none))
        {
            AT.KnockOffHelmet();
        }
        // End:0xF1
        if(NumPunches / RequiredPunches)
        {
            // End:0x5F
            if(__NFUN_340__(AT, none))
            {
                AT.KnockOffHead();
            }
            PUser = PlayerPawn(User);
            // End:0xE0
            if(__NFUN_340__(PUser, none))
            {
                BloodSplatter = dnScreenSplatters(FindStaticActor(class'dnScreenSplatter_Blood'));
                // End:0xE0
                if(__NFUN_340__(BloodSplatter, none))
                {
                    BloodSplatter.__NFUN_645__(Locs(PUser.CalcedViewLocation, Vector(PUser.CalcedViewRotation)));
                    BloodSplatter.AttachEffectTo(PUser);
                }
            }
            GlobalTrigger(FinishEvent, User, self);
        }
        return;
    }
    stop;
}

state() Stage2_Success
{
    event BeginState()
    {
        super(Object).BeginState();
        ActiveRumble.RumbleLeftMagnitude = 0.3;
        ActiveRumble.RumbleRightMagnitude = 0.6;
        PlayerPawn(User).AddRumble(ActiveRumble);
        return;
    }
    stop;
}

state() Stage2_Fail extends FailBaseState
{    stop;
}

state() Finish
{
    event BeginState()
    {
        RandomizeFinishRumble();
        return;
    }

    function RandomizeFinishRumble()
    {

        /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
            
        */
        /*@Error*/;
    }

    function Tick(float Delta)
    {

        /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
            
        */
        /*@Error*/;
    }
    stop;
}

state() DetachUser
{
    event BeginState()
    {
        super(Object).BeginState();
        AnimCallback_UserDetached();
        return;
    }
    stop;
}

state() SelfDestruct
{
    simulated event BeginState()
    {
        super(Object).BeginState();
        ReleaseControlOfTrooper();
        __NFUN_607__(1, false, 'SelfDestructFunc');
        return;
    }
    stop;
}

defaultproperties
{
    GridAnimName=ATWildRide_Stage1_Grid
    ATSpawnLocationOffset=(X=29.292,Y=0,Z=45)
    ATSpawnRotationOffset=(Pitch=0,Yaw=32768,Roll=0)
    ATPunchDamage=30
    Stage1PunchDelay=2
    Stage2FailTimer=5
    FailPunches=3
    RequiredPunches=5
    PunchText="<?int?dnAI.dnControl_ATCaptain_WildRide.PunchText?>"
    ActiveRumble=(RumbleName=WildRideActiveRumble,RumbleDuration=0.3,RumbleLeftMagnitude=0.4,RumbleRightMagnitude=0.7,FalloffActor=none,FalloffDistance=0)
    IdleRumble=(RumbleName=WildRideIdleRumble,RumbleDuration=10,RumbleLeftMagnitude=0.2,RumbleRightMagnitude=0.1,FalloffActor=none,FalloffDistance=0)
    bForceDrop=false
    StartTapInterval=0.5
    EndTapInterval=0.3
    RateOfGain=0.1
    RateOfLoss=0.2
    States(0)=(StateName=Useable,OutEvents=none,Transitions=((ControlEvent=3,CustomName=None,NewState=AttachUserLERP)),UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),MySoundName=None,SubAnims=none)
    States(1)=(StateName=AttachUserLERP,OutEvents=none,Transitions=((ControlEvent=5,CustomName=None,NewState=AttachUserAnim)),UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),MySoundName=None,SubAnims=none)
    States(2)=(StateName=AttachUserAnim,OutEvents=none,Transitions=((ControlEvent=7,CustomName=None,NewState=idle)),UserAnimName=ATWildRide_Activate,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),MySoundName=None,SubAnims=none)
    States(3)=(StateName=idle,OutEvents=none,Transitions=((ControlEvent=0,CustomName=Success,NewState=Stage1_Success),(ControlEvent=0,CustomName=ATPunch,NewState=Stage1_ATPunch)),UserAnimName=ATWildRide_Stage1_Idle,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),MySoundName=None,SubAnims=none)
    States(4)=(StateName=DetachUser,OutEvents=none,Transitions=((ControlEvent=8,CustomName=None,NewState=DetachUserLERP)),UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),MySoundName=None,SubAnims=none)
    States(5)=(StateName=DetachUserLERP,OutEvents=none,Transitions=((ControlEvent=6,CustomName=None,NewState=SelfDestruct)),UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),MySoundName=None,SubAnims=none)
    States(6)=(StateName=FadeToRest,OutEvents=none,Transitions=((ControlEvent=0,CustomName=ProceedWithDetach,NewState=DetachUser)),UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),MySoundName=None,SubAnims=none)
    States(7)=(StateName=Stage1_ATPunch,OutEvents=none,Transitions=((ControlEvent=0,CustomName=idle,NewState=idle),(ControlEvent=0,CustomName=Fail,NewState=Stage1_Fail)),UserAnimName=ATWildRide_Stage1_ATPunch,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),MySoundName=None,SubAnims=none)
    States(8)=(StateName=Stage1_Success,OutEvents=none,Transitions=((ControlEvent=9,CustomName=None,NewState=Stage2_Idle)),UserAnimName=ATWildRide_Stage1_Success,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),MySoundName=None,SubAnims=none)
    States(9)=(StateName=Stage1_Fail,OutEvents=none,Transitions=((ControlEvent=4,CustomName=None,NewState=DetachUser)),UserAnimName=ATWildRide_Stage1_Fail,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),MySoundName=None,SubAnims=none)
    States(10)=(StateName=Stage2_Idle,OutEvents=none,Transitions=((ControlEvent=14,CustomName=None,NewState=Stage2_Punch),(ControlEvent=0,CustomName=Success,NewState=Stage2_Success),(ControlEvent=0,CustomName=Fail,NewState=Stage2_Fail)),UserAnimName=ATWildRide_Stage2_Idle,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),MySoundName=None,SubAnims=none)
    States(11)=(StateName=Stage2_Punch,OutEvents=none,Transitions=((ControlEvent=9,CustomName=None,NewState=Stage2_Idle)),UserAnimName=ATWildRide_Stage2_Punch,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),MySoundName=None,SubAnims=none)
    States(12)=(StateName=Stage2_Success,OutEvents=none,Transitions=((ControlEvent=9,CustomName=None,NewState=Finish)),UserAnimName=ATWildRide_Stage2_Success,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),MySoundName=None,SubAnims=none)
    States(13)=(StateName=Stage2_Fail,OutEvents=none,Transitions=((ControlEvent=4,CustomName=None,NewState=DetachUser)),UserAnimName=ATWildRide_Stage2_Fail,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),MySoundName=None,SubAnims=none)
    States(14)=(StateName=Finish,OutEvents=none,Transitions=((ControlEvent=4,CustomName=None,NewState=DetachUser)),UserAnimName=ATWildRide_Finish,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),MySoundName=None,SubAnims=none)
    PassedDamageScale=1
    PassedPhysicsDamageScale=1
    ForceAttachStateName=AttachUserLERP
    PawnLostStateName=SelfDestruct
    bUseHomePose=false
    InterpolationInTime=0.15
    InterpolationOutTime=0.3
    bDetachOnDamage=false
    HeadAimMinOffset=(Pitch=0,Yaw=0,Roll=0)
    HeadAimMaxOffset=(Pitch=0,Yaw=0,Roll=0)
    bInternalUseDetach=false
    bLookWhenHidden=true
    bForceUsePhrase=true
    bTraceUsable=false
    bHidden=true
    bCollideActors=false
    bCollideWorld=false
    CollisionRadius=1
    CollisionHeight=1
}