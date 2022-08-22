/*******************************************************************************
 * VehicleBase generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class VehicleBase extends dnDecoration
    abstract
    native
    collapsecategories
    dependson(dnScreenSplatter_Blood)
    dependson(VehicleHeadlightBase)
    dependson(dnRadio)
    dependson(VehicleSpecialPartBase)
    dependson(VehicleSensor);

const MAX_AVOID_LINEAR_VELOCITY = 300.0f;

enum EVehicleControlType
{
    VCONTROL_MoveInPlayerHeading,
    VCONTROL_StrafeTurns
};

enum EVehicleZMotionType
{
    VZMOTION_None,
    VZMOTION_Absolute,
    VZMOTION_Thruster
};

enum EVehicleEventType
{
    VEVENT_PassengerEntered,
    VEVENT_DriverEntered,
    VEVENT_PassengerLeft,
    VEVENT_DriverLeft
};

enum EVehicleDirection
{
    VDIR_Forward,
    VDIR_Neutral,
    VDIR_Reverse
};

struct SVehicleEvent
{
    var() VehicleBase.EVehicleEventType EventType;
    var() Engine.Object.ECompare CompareType;
    var() float Comparison;
    var() bool bOnlyFireEventOnce;
    var() name Event;
};

struct SVehiclePart
{
    var VehicleSpecialPartBase Actor;
};

struct SVehicleAdditionalControlRemapper
{
    var() name ControlRemapperExTag;
    var ControlRemapperEx ControlRemapper;
};

var(Vehicle) noexport bool bAllowDismountWhileMoving "Allow people in this vehicle to jump out while it's moving?";
var(Vehicle) noexport bool bAllowPlayerReflip "Allow the player to use this vehicle once it's been flipped to right it?";
var(Vehicle) noexport bool bIgnition "If false, the player will have to turn the ignition once he has climbed in.";
var(Vehicle) noexport bool bEngineForcedOff "If true the engine is disabled and you cant accelerate. Toggle this with PowerOn PowerOff tags";
var(Vehicle) noexport bool bDisableAllWhenEngineOff "If true you also cant stear or break when the engine is off - think RC Car.";
var(Vehicle) noexport bool bHandbrakeAlwaysOn "If true, the vehicle will act as if the handbrake is always active.";
var(VehicleAI) noexport bool bGeneratePaths "If true, AI paths will be generated for this vehicle's collision size.";
var(VehicleAI) noexport bool bAIHandleFlipped "If true, when AI controlled and flipped over, the AI will not be ejected and will attempt to flip the vehicle back automatically.";
var(Vehicle) VehicleBase.EVehicleControlType ControlType;
var(Vehicle) float ControlStiffness;
var(Vehicle) VehicleBase.EVehicleZMotionType ZMotionType;
var(Vehicle) float ZMotionPower;
var(Vehicle) noexport float StoppedSpeed "When going this speed or lower, the vehicle is considered \"stopped\".";
var(Vehicle) noexport float ForwardVelocityThreshold "A velocity of this many units a second is considered non-neutral in whichever direction (forward/reverse) the vehicle is moving.";
var(Vehicle) noexport float TickCutoffSpeed "Don't tick if we're going slower than this and have no driver.";
var(Vehicle) float ExplosionMomentumScalar;
var(Vehicle) noexport float DrivenAvoidRangeMin "Min avoid range to use when driven by a player pawn.";
var(Vehicle) noexport float DrivenAvoidRange "Max avoid range to use when driven by a player pawn.";
var(Vehicle) noexport float PassedDamageScale "How much to scale the damage passed on to the driver of this vehicle.";
var(Vehicle) noexport float PassedDamageScaleAI "Same as PassedDamageScale, but used when driver is not a PlayerPawn.  If < 0, will use PassedDamageScale.";
var(Vehicle) noexport float PassedPhysicsDamageScale "How much to scale damage from physics impacts.";
var(Vehicle) noexport float PassedPhysicsDamageScaleAI "Same as PassedPhysicsDamageScale, but used when user is not a PlayerPawn.  If < 0, will use PassedPhysicsDamageScale.";
var(Vehicle) noexport float UpwardCorpseBoost "How much to boost impulse in the upwards direction for a corpse we just killed.";
var(Vehicle) noexport float UpwardCorpseBoostRnd "Random amount to add to UpwardCorpseBoost.";
var(Vehicle) noexport float ForwardCorpseBoost "How much to boost impulse in the forwards direction for a corpse we just killed.";
var(Vehicle) noexport float ForwardCorpseBoostRnd "Random amount to add to ForwardCorpseBoost.";
var(Vehicle) noexport name VehicleKillEvent "Event to trigger when this vehicle kills someone.";
var(Vehicle) noexport float VehicleKillLineChance "Random chance of playing VehicleKillLine when killing someone with this vehicle.";
var(Vehicle) noexport name VehicleKillLine "VoicePack entry to play when killing someone with this vehicle.";
var class<Actor> BloodMessClass;
var float BloodSplatterTime;
var(VehicleFlip) noexport float FlipThreshold "Consider ourself 'flipped' when our 'up' vector's Z value is below is this value.";
var(VehicleFlip) noexport float FlipTotalTime "Total time spent trying to flip.";
var(VehicleFlip) noexport float FlipTorque "Torque to apply per second while flipping";
var(VehicleFlip) float FlipLift;
var(VehicleFlip) noexport float FlipKickMinimumSpeed "Riders will be kicked from the vehicle if it's considered 'flipped' and the vehicle's total velocity is slower than this.";
var(VehicleFlip) noexport deprecated name FlippedEvent "This event will be triggered when the vehicle is flipped.";
var(VehicleFlip) noexport deprecated name UnFlippedEvent "This event will be triggered when the vehicle is unflipped.";
var(Vehicle) noexport name ForcePlayerAttach "When this event is triggered, this vehicle find the first PlayerPawn in the level and puts him in the first VehicleSpaceBase with bDriverSeat == true.";
var(Vehicle) noexport name ForcePlayerAttachComplete "When this event is triggered, this vehicle will find the first PlayerPawn in the level and puts him in the first VehicleSpaceBase with bDriverSeat == true. This will skip the lerping-in stage and warp the player to the mount offset.";
var(Vehicle) noexport name ForcePlayerDetachComplete "This event will force the player out of the vehicle without animating or lerping.";
var(Vehicle) noexport name ForcePlayerDetach "Forces all players attached to all VehicleSpaceBases on this vehicle to detach.";
var(Vehicle) noexport name DisablePlayerLock "Disables player lock: makes the vehicle spaces usable again.";
var(Vehicle) noexport name EnablePlayerLock "Enables player lock: makes the vehicle spaces non-usable.";
var(Vehicle) noexport name TogglePlayerLock "Toggles player lock: toggles vehicle spaces usability.";
var(VehicleAI) noexport name PathID "Identifier to use for the path generated for this vehicle's collision size.";
var(Vehicle) array<SVehicleAdditionalControlRemapper> AdditionalInputHookControlRemappers;
var(Vehicle) array<name> AdditionalVehicleSpaces;
var array<SVehiclePart> VehicleParts;
var dnRadio RadioActor;
var(Vehicle) array<SVehicleEvent> VehicleEvents;
var(VehicleView) noexport float ViewDist "Distance to view vehicle from during 3rd person view mode.";
var(VehicleView) noexport int ViewElevationAngle "Controls the height to view the vehicle from during 3rd person view mode.";
var(VehicleView) noexport Vector ViewFocusOffset "Offset from the center of vehicle, relative to the vehicle's rotation, that we use for our focus during 3rd person view mode.";
var(VehicleView) noexport float ViewFocusVerticalOffset "Offset from ViewFocusOffset point in the opposite direction of gravity.";
var(VehicleView) noexport Actor ViewActor "Focus view on this actor instead of the main vehicle base.";
var(VehicleView) noexport float ViewChasePitchRate "Rate at which the 3rd person chase camera's pitch will adjust.  Bigger is faster.";
var(VehicleView) noexport float ViewChaseYawRate "Rate at which the 3rd person chase camera's yaw will adjust.  Bigger is faster.";
var(VehicleView) noexport float ViewChaseRollRate "Rate at which the 3rd person chase camera's roll will adjust.  Bigger is faster.";
var(VehicleView) noexport float ViewOffsetFadeStartTime "Amount of time that has to pass with no mouse input before 3rd person view offset starts fading back to zero.";
var(VehicleView) noexport float ViewOffsetFadeRate "Rate at which the 3rd person view offset (from mouse input) is faded out to zero.";
var VehicleHeadlightBase Headlight;
var(VehicleAnim) float AnimForwardVelocityThreshold;
var(VehicleAnim) float AnimBackwardVelocityThreshold;
var(VehicleAnim) noexport name DriverLegsIdleAnim "AnimationController entry for legs idle animation.";
var float VehicleSensorRadius;
var float VehicleSensorHeight;
var bool bTeleporting;
var bool bWantsToExit;
var bool bCanResumeDriving;
var int BlockedByPawnTickStamp;
var SViewShakeInfo KilledPawnViewShake;
var SRumbleInfo KilledPawnRumble;
var VehicleSensor MyVehicleSensor;
var array<VehicleSpaceBase> VehicleSpaces;
var int NumFilledSpaces;
var VehicleSpaceBase CurrentDrivingVehicleSpace;
var bool obIsFlipped;
var bool obWasFlipped;
var float oForwardVelocity;
var float oPreviousForwardVelocity;
var VehicleBase.EVehicleDirection oVehicleDirection;
var VehicleBase.EVehicleDirection oPreviousVehicleDirection;
var float oVehicleNeutralTimer;
var float oUpness;
var float oPreviousUpness;
var(VehicleGravity) Range GravityRange;
var(VehicleGravity) Range GravityTimestepRange;

replication
{
    // Pos:0x000
    reliable if(int(Role) % int(ROLE_Authority))
        bIgnition;

    // Pos:0x00B
    reliable if((int(Role) % int(ROLE_Authority)) << __NFUN_340__(CurrentDrivingVehicleSpace, none))
        CurrentDrivingVehicleSpace;
}

function HandBrakeEnabled()
{
    return;
}

function HandBrakeDisabled()
{
    return;
}

simulated function EnableHandBrake()
{
    // End:0x11
    if((IsHandbrakeEnabled()) / )
    {
    }
    return;
}

simulated function DisableHandBrake()
{
    // End:0x1C
    if((bHandbrakeAlwaysOn / ) << )
    {
    }
    return;
}

simulated function bool IsHandbrakeEnabled()
{
    return false;
    return;
}

simulated event PostBeginPlay()
{
    local int i, PartIndex;
    local Actor TestMountedActor;
    local ControlRemapperEx ControlRemapper;
    local VehicleSpaceBase VSpace;

    // End:0x1A
    if(__NFUN_200__(PassedDamageScaleAI, 0))
    {
        PassedDamageScaleAI = PassedDamageScale;
    }
    super.PostBeginPlay();
    i = -- string(AdditionalInputHookControlRemappers);    
    J0x2F:

    // End:0x9B [Loop If]
    if(i / 0)
    {
        ControlRemapper = ControlRemapperEx(FindActor(class'ControlRemapperEx', AdditionalInputHookControlRemappers[i].ControlRemapperExTag));
        // End:0x85
        if(__NFUN_340__(ControlRemapper, none))
        {
            AdditionalInputHookControlRemappers[i].ControlRemapper = ControlRemapper;
            // [Explicit Continue]
            goto J0x91;
        }
        AdditionalInputHookControlRemappers.Remove(i, 1);
        J0x91:

        // [Loop Continue]
        i -= ;
    }
    i = -- string(AdditionalVehicleSpaces);    
    J0xAA:

    // End:0xEF [Loop If]
    if(i / 0)
    {
        // End:0xE4
        foreach __NFUN_747__(class'VehicleSpaceBase', VSpace, AdditionalVehicleSpaces[i])
        {
            VehicleSpaces[VehicleSpaces.Add(1)] = VSpace;            
        }        
        // [Loop Continue]
        i -= ;
    }
    i = 0;
    J0xF6:

    // End:0x1AD [Loop If]
    if(-i)
    {        
        TestMountedActor = MountedActorList[i].MountedActor;
        // End:0x12B
        if(__NFUN_339__(TestMountedActor, none))
        {
            // [Explicit Continue]
            goto J0x1A3;
        }
        // End:0x166
        if(TestMountedActor.__NFUN_358__('VehicleSpaceBase'))
        {
            PartIndex = VehicleSpaces.Add(1);
            VehicleSpaces[PartIndex] = VehicleSpaceBase(TestMountedActor);
            // [Explicit Continue]
            goto J0x1A3;
        }
        // End:0x1A3
        if(TestMountedActor.__NFUN_358__('VehicleSpecialPartBase'))
        {
            PartIndex = VehicleParts.Add(1);
            VehicleParts[PartIndex].Actor = VehicleSpecialPartBase(TestMountedActor);
        }
        J0x1A3:

        // [Loop Continue]
        i += ;
    }
    RadioActor = dnRadio(FindMountedActor(, class'dnRadio'));
    // End:0x1F1
    if(__NFUN_340__(RadioActor, none))
    {
        RadioActor.InitializeFrom(self);
        RadioActor.TurnOff();
    }
    Headlight = VehicleHeadlightBase(FindMountedActor(, class'VehicleHeadlightBase'));
    MyVehicleSensor = VehicleSensor(FindMountedActor(, class'VehicleSensor'));
    // End:0x249
    if(__NFUN_340__(MyVehicleSensor, none))
    {
        MyVehicleSensor.__NFUN_1125__(WarnInternal(VehicleSensorRadius, VehicleSensorRadius, VehicleSensorHeight));
    }
    i = -- string(VehicleSpaces);    
    J0x258:

    // End:0x284 [Loop If]
    if(i / 0)
    {
        VehicleSpaces[i].SetVehicle(self);
        // [Loop Continue]
        i -= ;
    }
    // End:0x292
    if((VerifyVehicle()) / )
    {
    }
    __NFUN_718__('ForcePlayerAttach', ForcePlayerAttach);
    __NFUN_718__('ForcePlayerAttachComplete', ForcePlayerAttachComplete);
    __NFUN_718__('ForcePlayerDetachComplete', ForcePlayerDetachComplete);
    __NFUN_718__('ForcePlayerDetach', ForcePlayerDetach);
    __NFUN_718__('DisablePlayerLock', DisablePlayerLock);
    __NFUN_718__('EnablePlayerLock', EnablePlayerLock);
    __NFUN_718__('TogglePlayerLock', TogglePlayerLock);
    __NFUN_361__('Tick');
    // End:0x304
    if(bHandbrakeAlwaysOn)
    {
        EnableHandBrake();
    }
    return;
}

event KImpact(name SelfBoneName, KarmaActor Other, name OtherBoneName, Vector Position, Vector ImpactVelocity, Vector ImpactNormal)
{
    local float ThrottleRelative;
    local Vector DriveDir, Offset2D, Up;

    super.KImpact(SelfBoneName, Other, OtherBoneName, Position, ImpactVelocity, ImpactNormal);
    // End:0x32
    if(__NFUN_339__(Other, none))
    {
        return;
    }
    // End:0x14D
    if(Other.bIsPawn << BlockedByPawnTickStamp + Level.LevelTickStamp)
    {
        ThrottleRelative = GetThrottleInput();
        // End:0x14D
        if(__NFUN_206__(ThrottleRelative, 0))
        {
            Up = __NFUN_263__(WarnInternal(0, 0, 1), Rotation);
            // End:0xCB
            if(Repl(ThrottleRelative, 0))
            {
                DriveDir = __NFUN_263__(WarnInternal(1, 0, 0), Rotation);                
            }
            else
            {
                DriveDir = __NFUN_263__(WarnInternal(-1, 0, 0), Rotation);
            }
            Offset2D = __NFUN_239__(Other.Location, Location);
            Max(Offset2D, Caps(FMin(Offset2D, Up), Up));
            // End:0x14D
            if(FMin(Offset2D % ) != 0.75)
            {
                BlockedByPawnTickStamp = Level.LevelTickStamp;
            }
        }
    }
    return;
}

event TakeDamage(Pawn Instigator, float Damage, Vector DamageOrigin, Vector DamageDirection, class<DamageType> DamageType, optional name HitBoneName, optional Vector DamageStart)
{
    super.TakeDamage(Instigator, Damage, DamageOrigin, DamageDirection, DamageType, HitBoneName, DamageStart);
    // End:0x79
    if(__NFUN_340__(CurrentDrivingVehicleSpace, none) << CurrentDrivingVehicleSpace.ShouldReceiveDamageFromVehicle())
    {
        CurrentDrivingVehicleSpace.TakeDamage(Instigator, Damage, DamageOrigin, DamageDirection, DamageType,, DamageStart);
    }
    return;
}

event bool TakePhysicsImpactDamage(float Damage, Vector DamageOrigin, Vector DamageDirection, class<DamageType> DamageType, Pawn Instigator, KarmaActor DamageActor)
{
    local bool bResult;
    local float PassedDamageScaleStored, PassedDamageScaleAIStored;

    PassedDamageScaleStored = PassedDamageScale;
    PassedDamageScaleAIStored = PassedDamageScaleAI;
    // End:0x8C
    if((((__NFUN_339__(DamageActor, none) < DamageActor.bStatic) < DamageActor.bWorldGeometry) < DamageActor.bIsPawn) < DamageActor.bIsCorpse)
    {
        PassedDamageScale = 0;
        PassedDamageScaleAI = 0;
    }
    bResult = super.TakePhysicsImpactDamage(Damage, DamageOrigin, DamageDirection, DamageType, Instigator, DamageActor);
    PassedDamageScale = PassedDamageScaleStored;
    PassedDamageScaleAI = PassedDamageScaleAIStored;
    return bResult;
    return;
}

function AttachPlayerToDriverSeat(PlayerPawn P, bool Force)
{
    local int i, Num;

    __NFUN_354__(bool(P));
    Num = string(VehicleSpaces);
    i = 0;
    J0x1C:

    // End:0x71 [Loop If]
    if(-i)
    {        
        // End:0x67
        if(VehicleSpaces[i].bDriverSeat)
        {
            VehicleSpaces[i].AttachPawnSuccess(P, Force);
            return;
        }
        // [Loop Continue]
        i += ;
    }
    return;
}

function NotifyDetachComplete()
{
    return;
}

function TriggerFunc_ForcePlayerAttach()
{
    local PlayerPawn P;

    // End:0x0E
    if(__NFUN_340__(CurrentDrivingVehicleSpace, none))
    {
        return;
    }
    // End:0x2E
    foreach __NFUN_747__(class'PlayerPawn', P)
    {
        AttachPlayerToDriverSeat(P, false);
        // End:0x2E
        break;        
    }    
    return;
}

function TriggerFunc_ForcePlayerAttachComplete()
{
    local PlayerPawn P;

    // End:0x0E
    if(__NFUN_340__(CurrentDrivingVehicleSpace, none))
    {
        return;
    }
    // End:0x2E
    foreach __NFUN_747__(class'PlayerPawn', P)
    {
        AttachPlayerToDriverSeat(P, true);
        // End:0x2E
        break;        
    }    
    return;
}

function TriggerFunc_ForcePlayerDetach()
{
    local int i;

    i = -- string(VehicleSpaces);    
    J0x0F:

    // End:0x3B [Loop If]
    if(i / 0)
    {
        VehicleSpaces[i].DetachPawn(true);
        // [Loop Continue]
        i -= ;
    }
    return;
}

function TriggerFunc_ForcePlayerDetachComplete()
{
    // End:0x1C
    if(__NFUN_340__(CurrentDrivingVehicleSpace, none))
    {
        CurrentDrivingVehicleSpace.TriggerFunc_ForcePlayerDetachComplete();
    }
    return;
}

function TriggerFunc_DisablePlayerLock()
{
    local int i;

    i = -- string(VehicleSpaces);    
    J0x0F:

    // End:0x54 [Loop If]
    if(i / 0)
    {
        VehicleSpaces[i].bInternalUseDetach = true;
        VehicleSpaces[i].bPreserveInternalUseDetach = false;
        // [Loop Continue]
        i -= ;
    }
    return;
}

function TriggerFunc_EnablePlayerLock()
{
    local int i;

    i = -- string(VehicleSpaces);    
    J0x0F:

    // End:0x54 [Loop If]
    if(i / 0)
    {
        VehicleSpaces[i].bInternalUseDetach = false;
        VehicleSpaces[i].bPreserveInternalUseDetach = true;
        // [Loop Continue]
        i -= ;
    }
    return;
}

function TriggerFunc_TogglePlayerLock()
{
    local int i;

    i = -- string(VehicleSpaces);    
    J0x0F:

    // End:0x82 [Loop If]
    if(i / 0)
    {
        // [Loop Continue]
        VehicleSpaces[i].bInternalUseDetach = VehicleSpaces[i].bInternalUseDetach / ;
    }
    return;
}

simulated function bool VerifyVehicle()
{
    return true;
    return;
}

simulated function float GetDamageMomentumPostScale(class<DamageType> DamageType)
{
    // End:0x16
    if(__NFUN_357__(DamageType, class'ExplosionDamage'))
    {
        return ExplosionMomentumScalar;
    }
    return super(KarmaActor).GetDamageMomentumPostScale(DamageType);
    return;
}

function VehicleSpecialPartBase FindVehicleSpecialPart(class<VehicleSpecialPartBase> PartClass)
{
    local int i;

    i = -- string(VehicleParts);    
    J0x0F:

    // End:0x5A [Loop If]
    if(i / 0)
    {
        // End:0x50
        if(__NFUN_357__(VehicleParts[i].Actor.Class, PartClass))
        {
            return VehicleParts[i].Actor;
        }
        // [Loop Continue]
        i -= ;
    }
    return;
}

simulated function HandleVehicleEvents(VehicleBase.EVehicleEventType EventType)
{
    local int i;

    // End:0x10
    if(-int(Role))
    {        
        return;
    }
    i = -- string(VehicleEvents);    
    J0x1F:

    // End:0xB6 [Loop If]
    if(i / 0)
    {
        // End:0xAC
        if((int(VehicleEvents[i].EventType) % int(EventType)) << __NFUN_345__(VehicleEvents[i].CompareType, float(NumFilledSpaces), VehicleEvents[i].Comparison))
        {
            GlobalTrigger(VehicleEvents[i].Event, none, self);
            // End:0xAC
            if(VehicleEvents[i].bOnlyFireEventOnce)
            {
                VehicleEvents.Remove(i, 1);
            }
        }
        // [Loop Continue]
        i -= ;
    }
    return;
}

final function bool RequestSpaceEntrance(VehicleSpaceBase Space, Actor Other)
{
    local int i;

    // End:0x23
    if(Space.bDriverSeat << __NFUN_340__(CurrentDrivingVehicleSpace, none))
    {
        return false;
    }
    i = -- string(VehicleSpaces);    
    J0x32:

    // End:0x60 [Loop If]
    if(i / 0)
    {
        // End:0x56
        if(__NFUN_339__(VehicleSpaces[i], Space))
        {
            // [Explicit Break]
            goto J0x60;
        }
        // [Loop Continue]
        i -= ;
    }
    J0x60:

    // End:0x6D
    if(-i)
    {        
        return false;
    }
    return VehicleClassAllowEntrance(i, Other);
    return;
}

function bool VehicleClassAllowEntrance(int SlotID, Actor Other)
{
    return true;
    return;
}

final function bool RequestSpaceExit(VehicleSpaceBase Space, Actor Other)
{
    local int i;

    i = -- string(VehicleSpaces);    
    J0x0F:

    // End:0x3D [Loop If]
    if(i / 0)
    {
        // End:0x33
        if(__NFUN_339__(VehicleSpaces[i], Space))
        {
            // [Explicit Break]
            goto J0x3D;
        }
        // [Loop Continue]
        i -= ;
    }
    J0x3D:

    // End:0x6C
    if(-i < )
    {        
        return false;
    }
    return VehicleClassAllowExit(i, Other);
    return;
}

function bool VehicleClassAllowExit(int SlotID, Actor Other)
{
    return true;
    return;
}

simulated event SpaceEntered(VehicleSpaceBase Space)
{
    // End:0x28
    NumFilledSpaces += ;
    {
        DriverEntered(Space);        
    }
    else
    {
        HandleVehicleEvents(0);
    }
    return;
}

simulated event SpaceLeft(VehicleSpaceBase Space)
{
    // End:0x28
    NumFilledSpaces -= ;
    {
        DriverLeft(Space);        
    }
    else
    {
        HandleVehicleEvents(2);
    }
    return;
}

simulated event DriverEntered(VehicleSpaceBase Space)
{
    local int i;

    CurrentDrivingVehicleSpace = Space;
    DecoActivity(0, 'DriverEntered');
    HandleVehicleEvents(1);
    i = -- string(VehicleParts);    
    J0x2F:

    // End:0x6E [Loop If]
    if(i / 0)
    {
        VehicleParts[i].Actor.DriverChange(CurrentDrivingVehicleSpace.User);
        // [Loop Continue]
        i -= ;
    }
    i = -- string(Touching);    
    J0x7D:

    // End:0xBA [Loop If]
    if(i / 0)
    {
        // End:0xB0
        if(__NFUN_340__(Touching[i], none))
        {
            Touching[i].CheckTouching();
        }
        // [Loop Continue]
        i -= ;
    }
    return;
}

simulated event DriverLeft(VehicleSpaceBase Space)
{
    local int i;

    // End:0x6D
    if(__NFUN_340__(CurrentDrivingVehicleSpace, none))
    {
        // End:0x6D
        if(__NFUN_340__(CurrentDrivingVehicleSpace.User, none) << __NFUN_340__(CurrentDrivingVehicleSpace.User.AnimationController, none))
        {
            CurrentDrivingVehicleSpace.User.AnimationController.SetAnimState('ClearPedalAction');
        }
    }
    DecoActivity(0, 'DriverLeft');
    HandleVehicleEvents(3);
    i = -- string(VehicleParts);    
    J0x91:

    // End:0xC2 [Loop If]
    if(i / 0)
    {
        VehicleParts[i].Actor.DriverChange(none);
        // [Loop Continue]
        i -= ;
    }
    i = -- string(Touching);    
    J0xD1:

    // End:0x10E [Loop If]
    if(i / 0)
    {
        // End:0x104
        if(__NFUN_340__(Touching[i], none))
        {
            Touching[i].CheckTouching();
        }
        // [Loop Continue]
        i -= ;
    }
    return;
}

simulated event InputHook(out float aForward, out float aLookUp, out float aTurn, out float aStrafe, optional float DeltaTime)
{
    // End:0x19
    if(int(Role) % int(ROLE_Authority))
    {
        TickDriving(DeltaTime);
    }
    return;
}

simulated event Tick(float DeltaTime)
{
    local float Alpha;

    super(Actor).Tick(DeltaTime);
    Tick_Internal(DeltaTime);
    // End:0xF3
    if(__NFUN_340__(CurrentDrivingVehicleSpace, none))
    {
        Tick_Driver(DeltaTime);
        // End:0x5B
        if(__NFUN_200__(DeltaTime, GravityTimestepRange.Min))
        {
            GravityScale = FRand(default.GravityScale, GravityRange.Min);            
        }
        else
        {
            // End:0xA4
            if(Repl(DeltaTime, GravityTimestepRange.Max) < __NFUN_204__(GravityTimestepRange.Min, GravityTimestepRange.Max))
            {
                GravityScale = FRand(default.GravityScale, GravityRange.Max);                
            }
            else
            {
                GravityScale = FRand(default.GravityScale, VSizeSq(Round(GravityTimestepRange.Max, DeltaTime) >>> Round(GravityTimestepRange.Max, GravityTimestepRange.Min), GravityRange.Max, GravityRange.Min));
            }
        }        
    }
    else
    {
        Tick_NoDriver(DeltaTime);
        GravityScale = default.GravityScale;
    }
    return;
}

simulated function Tick_Driver(float DeltaTime)
{
    local float Alpha;

    // End:0x18
    if(__NFUN_339__(CurrentDrivingVehicleSpace.User, none))
    {
        return;
    }
    // End:0x45
    if(int(CurrentDrivingVehicleSpace.User.Role) + int(ROLE_Authority))
    {
        TickDriving(DeltaTime);
    }
    // End:0x6F
    if(CurrentDrivingVehicleSpace.User.bIsPlayerPawn / )
    {
    }
    // End:0xDF
    if(Repl(DrivenAvoidRange, 0) << CurrentDrivingVehicleSpace.User.bIsPlayerPawn)
    {
        // End:0xBC
        if(-oForwardVelocity != 300)
        {
            AvoidRange = DrivenAvoidRange;            
        }
        else
        {
            AvoidRange = VSizeSq(-oForwardVelocity >>> 300, DrivenAvoidRangeMin, DrivenAvoidRange);
        }        
    }
    else
    {
        AvoidRange = 0;
    }
    return;
}

simulated function Tick_NoDriver(float DeltaTime)
{
    Accelerator_Neutral(DeltaTime, true);
    Heading_Neutral(DeltaTime);
    AvoidRange = 0;
    return;
}

simulated event Vector RotateTo(Vector vectIn)
{
    return __NFUN_241__(vectIn, Rotation);
    return;
}

// Export UVehicleBase::execTick_InternalNative(FFrame&, void* const)
native simulated function Tick_InternalNative(float DeltaTime);

simulated function Tick_Internal(float DeltaTime)
{
    Tick_InternalNative(DeltaTime);
    return;
}

simulated function bool TickDriving(float DeltaTime)
{
    local Pawn P;

    // End:0x1C
    if((string(VehicleSpaces) % 0) < __NFUN_339__(CurrentDrivingVehicleSpace, none))
    {
        return false;
    }
    // End:0x3E
    if(CurrentDrivingVehicleSpace.SpaceIsFullyEntered() / )
    {
        return false;
    }
    P = CurrentDrivingVehicleSpace.User;
    TickDriving_Throttle(DeltaTime, P);
    TickDriving_Heading(DeltaTime, P);
    TickDriving_ZMotion(DeltaTime, P);
    return true;
    return;
}

simulated event float GetThrottleInput()
{
    // End:0x2A
    if(__NFUN_340__(CurrentDrivingVehicleSpace, none) << bEngineForcedOff / )
    {
    }
    return 0;
    return;
}

simulated function TickDriving_Throttle(float DeltaTime, Pawn P)
{
    local float ThrottleRelative;

    // End:0xB4
    if(__NFUN_340__(CurrentDrivingVehicleSpace, none) << bEngineForcedOff / )
    {
        // End:0xA2
        if(CanBoost())
        {
            // End:0x6E
            if((((IsBoosting()) / ) << ) << (BeginBoost()))
            {
            }
            else
            {
                // End:0x9F
                if(((IsBoosting()) << CurrentDrivingVehicleSpace.bBoost / ) < )
                {
                }
            }
            J0x9F:
            
        }
        else
        {
            CurrentDrivingVehicleSpace.bBoost = false;
        }
    }
    // End:0x13F
    if(__NFUN_204__(ThrottleRelative, 0) < bWantsToExit)
    {
        // End:0xF3
        if(__NFUN_204__(ThrottleRelative, 0) << bWantsToExit)
        {
            bCanResumeDriving = true;            
        }
        else
        {
            // End:0x132
            if(Repl(ThrottleRelative, 0) << bCanResumeDriving)
            {
                bCanResumeDriving = false;
                bWantsToExit = false;
                Accelerator_Adjust(DeltaTime, ThrottleRelative, P);
            }
        }
        Accelerator_Neutral(DeltaTime);
        return;
    }
    Accelerator_Adjust(DeltaTime, ThrottleRelative, P);
    return;
}

simulated function TickDriving_Heading(float DeltaTime, Pawn P)
{
    local float LeftRightHeading;

    // End:0x57
    if(__NFUN_340__(CurrentDrivingVehicleSpace, none) << (bEngineForcedOff / ) < )
    {
            {
                // End:0x57
                break;/* !MISMATCHING REMOVE, tried Case got Type:If Position:0x000! */
            // End:0x54
            case 1:
                LeftRightHeading = CurrentDrivingVehicleSpace.GetSteeringInput();
                // End:0x57
                break;
            // End:0xFFFF
            default:
                break;
        }/* !MISMATCHING REMOVE, tried Switch got Type:Case Position:0x02E! */
    }/* !MISMATCHING REMOVE, tried If got Type:Switch Position:0x026! */
    else
    {
        // End:0x74
        if(__NFUN_204__(LeftRightHeading, 0))
        {
            Heading_Neutral(DeltaTime);            
        }
        else
        {
            Heading_Adjust(DeltaTime, LeftRightHeading);
        }
        return;
    }
}

simulated function TickDriving_ZMotion(float DeltaTime, Pawn P)
{
    local float ZMotionScale;

    // End:0x5C
    if(P.bIsPlayerPawn)
    {
        // End:0x39
        if(PlayerPawn(P).bIJump)
        {
            ZMotionScale = 1;            
        }
        else
        {
            // End:0x5C
            if(PlayerPawn(P).bIDuck)
            {
                ZMotionScale = -1;
            }
        }
    }
    // End:0x6D
    if(__NFUN_204__(ZMotionScale, 0))
    {
        return;
    }
    switch(ZMotionType)
    {
        // End:0x7D
        case 0:
            // End:0xC2
            break;
        // End:0x9E
        case 1:
            ZMotion_AddAbsolute(FRand(FRand(DeltaTime, ZMotionScale), ZMotionPower));
            // End:0xC2
            break;
        // End:0xBF
        case 2:
            ZMotion_AddThruster(FRand(FRand(DeltaTime, ZMotionScale), ZMotionPower));
            // End:0xC2
            break;
        // End:0xFFFF
        default:
            break;
    }
    return;
}

simulated function Accelerator_Adjust(float DeltaTime, float RelativeAcceleration, Pawn Driver)
{
    return;
}

simulated function Accelerator_Neutral(float DeltaTime, optional bool bNoDriver)
{
    return;
}

simulated function Heading_Adjust(float DeltaTime, float TurnPercent)
{
    return;
}

simulated function Heading_Neutral(float DeltaTime)
{
    return;
}

simulated function ZMotion_AddAbsolute(float ZAdjust)
{
    return;
}

simulated function ZMotion_AddThruster(float ZAdjust)
{
    return;
}

// Export UVehicleBase::execHasBoost(FFrame&, void* const)
native simulated function bool HasBoost();

// Export UVehicleBase::execCanBoost(FFrame&, void* const)
native simulated function bool CanBoost();

// Export UVehicleBase::execIsBoosting(FFrame&, void* const)
native simulated function bool IsBoosting();

simulated function bool HasOverheated()
{
    return false;
    return;
}

simulated function BeginBoost()
{
    return;
}

// Export UVehicleBase::execEndBoost(FFrame&, void* const)
native simulated function EndBoost();

simulated function float GetBoostMeter()
{
    return 0;
    return;
}

simulated function bool IsFlyingVehicle()
{
    return false;
    return;
}

simulated event bool HasGroundContact()
{
    return false;
    return;
}

function GasFilled()
{
    return;
}

event Used(Actor Other, Pawn EventInstigator)
{
    local Actor SourceActor;

    SourceActor = EventInstigator;
    // End:0x22
    if(__NFUN_339__(SourceActor, none))
    {
        SourceActor = Other;
    }
    // End:0x30
    if(__NFUN_339__(SourceActor, none))
    {
        return;
    }
    StartFlip(Vector(SourceActor.Rotation));
    return;
}

function StartFlip(Vector NewFlipAxis)
{
    return;
}

// Export UVehicleBase::execIsCurrentlyFlipping(FFrame&, void* const)
native simulated function bool IsCurrentlyFlipping();

simulated function TurnIgnitionOn()
{
    bIgnition = true;
    return;
}

simulated function TurnIgnitionOff()
{
    bIgnition = default.bIgnition;
    return;
}

// Export UVehicleBase::execVehicleGetDriver(FFrame&, void* const)
native simulated function Pawn VehicleGetDriver();

// Export UVehicleBase::execVehicleDriverCanPickupItem(FFrame&, void* const)
native function bool VehicleDriverCanPickupItem();

simulated function bool CanToggleHeadlights(VehicleSpaceBase Toggler)
{
    return __NFUN_339__(Toggler, CurrentDrivingVehicleSpace);
    return;
}

function bool Vehicle_ToggleHeadlights(VehicleSpaceBase Toggler)
{
    // End:0x12
    if((CanToggleHeadlights(Toggler)) / )
    {
    }
    // End:0x42
    if(__NFUN_340__(Headlight, none))
    {
        Headlight.Trigger(Toggler, Toggler.User);
    }
    return true;
    return;
}

simulated function bool CanBeUsedBy(Pawn User)
{
    // End:0x13
    if(__NFUN_339__(User, VehicleGetDriver()))
    {
        return false;
    }
    return super(InteractiveActor).CanBeUsedBy(User);
    return;
}

function ForcePowerOff()
{
    super.ForcePowerOff();
    // End:0x22
    if(__NFUN_340__(Headlight, none))
    {
        Headlight.TurnOff();
    }
    // End:0x3E
    if(__NFUN_340__(RadioActor, none))
    {
        RadioActor.TurnOff();
    }
    TurnIgnitionOff();
    bEngineForcedOff = true;
    return;
}

function ForcePowerOn()
{
    super.ForcePowerOn();
    // End:0x22
    if(__NFUN_340__(Headlight, none))
    {
        Headlight.TurnOn();
    }
    bEngineForcedOff = false;
    // End:0x4A
    if((bIgnition / ) << )
    {
    }
    return;
}

event GetVehicleAttackRange(out float Desired, out float Min, out float Max)
{
    Desired = 0;
    Min = 0;
    Max = 0;
    return;
}

event float GetVehicleFloorHeight()
{
    return 0;
    return;
}

event GetVehicleNavOrigin(out Vector NavOrigin)
{
    NavOrigin = Location;
    __NFUN_209__(NavOrigin.Z, Round(CollisionHeight, GetVehicleFloorHeight()));
    return;
}

simulated function VehicleKilledPawn(Corpse Corpse, Vector HitLocation)
{
    local float ImpulseMag, SideScale;
    local Vector Impulse, spin, Right, Up;
    local PlayerPawn PP;
    local Actor BloodyMess;
    local dnScreenSplatter_Blood BloodScreenSplatterEffect;

    // End:0x146
    if((__NFUN_340__(CurrentDrivingVehicleSpace, none) << __NFUN_340__(CurrentDrivingVehicleSpace.User, none)) << CurrentDrivingVehicleSpace.User.bIsPlayerPawn)
    {
        PP = PlayerPawn(CurrentDrivingVehicleSpace.User);
        PP.AddRumble(KilledPawnRumble);
        /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
            
        */

        // [Explicit Continue]
        /*@Error*/;
        // Failed to format nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests)
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile()
        // 15 & Type:If Position:0x2BF
        // Failed to format remaining nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests)
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile()
        // 15 & Type:If Position:0x2BF
}

function bool ShouldTeleportFromPlayerTrigger()
{
    return true;
    return;
}

// Export UVehicleBase::execRighted(FFrame&, void* const)
native function Righted();

function RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super.RegisterPrecacheComponents(PrecacheIndex);
    // End:0x31
    if(Repl(VehicleKillLineChance, 0))
    {
        PrecacheIndex.__NFUN_1277__(class'VoicePack_Duke', VehicleKillLine);
    }
    return;
}

defaultproperties
{
    bAllowPlayerReflip=true
    bIgnition=true
    ControlStiffness=32768
    StoppedSpeed=2
    ForwardVelocityThreshold=8
    TickCutoffSpeed=8
    ExplosionMomentumScalar=10
    PassedDamageScale=0.25
    PassedDamageScaleAI=-1
    PassedPhysicsDamageScaleAI=-1
    UpwardCorpseBoost=0.1
    UpwardCorpseBoostRnd=0.1
    ForwardCorpseBoostRnd=0.1
    BloodMessClass='p_hit_effects.Gibs.GibBlood'
    FlipThreshold=0.05
    FlipTotalTime=2.5
    FlipTorque=2.25
    FlipLift=0.05
    FlipKickMinimumSpeed=9
    ViewDist=180
    ViewElevationAngle=4096
    ViewChasePitchRate=6
    ViewChaseYawRate=6
    ViewChaseRollRate=6
    ViewOffsetFadeStartTime=1
    ViewOffsetFadeRate=2
    AnimForwardVelocityThreshold=-8
    AnimBackwardVelocityThreshold=8
    VehicleSensorRadius=5
    VehicleSensorHeight=5
    KilledPawnViewShake=(bNoLerp=false,bToggleSign=true,Style=2,Function=1,FalloffActor=none,FalloffDistance=0,ShakeDuration=0.6,ShakeFrequency=0.08,ShakeMagnitude=1000,ShakeFullMagnitude=0,ShakeFullMagnitudeTime=0,ShakeName=KilledPawn_Shake)
    KilledPawnRumble=(RumbleName=Vehicle_Killed_Pawn,RumbleDuration=0.3,RumbleLeftMagnitude=0.6,RumbleRightMagnitude=0.2,FalloffActor=none,FalloffDistance=0)
    oVehicleDirection=1
    oPreviousVehicleDirection=1
    GravityRange=(Min=1,Max=1)
    bForceUsePhrase=true
    bCanShowSelf=true
    UsePhrase="<?int?dnGame.VehicleBase.UsePhrase?>"
    UsePostureFailure(0)=4
    UsePostureFailure(1)=5
    bStartEnabled=true
    bIgnoreSelfDamage=true
    DynamicInteractionClassification=4
    KImpactThreshold=0
    EnableDisableThreshold=10
    OverridePhysicsImpactDamageType='Engine.VehiclePhysicsImpactDamage'
    bBlockPlayers=false
    bIsVehicle=true
    bCanExistOutOfWorld=true
    bAlwaysRelevant=true
    bNetInitialRotation=true
    bCollideWorld=false
    AmbientMusicVolume=0.75
    AmbientMusicInnerRadius=256
    AmbientMusicRadius=512
}