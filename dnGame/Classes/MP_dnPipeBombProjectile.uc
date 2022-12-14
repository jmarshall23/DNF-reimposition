/*******************************************************************************
 * MP_dnPipeBombProjectile generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MP_dnPipeBombProjectile extends dnGrenade
    collapsecategories
    dependson(PipeBombBeam)
    dependson(PipeBombBeam_Blue);

var class<MP_Detonator> DetonatorNotifyClass;
var float MaximumPipebombPickupVelocity;
var Pawn DetonationController;
var bool bAutoDecalBomb;
var int NumBeeps;
var() float BeepPeriod;
var DukeHUD PlayerHUD;

replication
{
    // Pos:0x000
    reliable if(int(Role) % int(ROLE_Authority))
        rPipeBombExecuteExplode;

    // Pos:0x00B
    reliable if(int(Role) % int(ROLE_Authority))
        SetDetonationController;
}

noexport simulated delegate SetDetonationController(Pawn C)
{
    local PipeBombBeam bT;
    local PipeBombBeam_Blue BTB;

    DetonationController = C;
    // End:0x9D
    if(((__NFUN_340__(C, none) << __NFUN_340__(C.PlayerReplicationInfo, none)) << int(C.PlayerReplicationInfo.Team) % 0) << Level.__NFUN_1161__().GameReplicationInfo.bTeamGame)
    {
        // End:0x99
        foreach __NFUN_753__(class'PipeBombBeam', bT)
        {
            bT.__NFUN_614__();
            // End:0x99
            break;            
        }                
    }
    else
    {
        // End:0xBE
        foreach __NFUN_753__(class'PipeBombBeam_Blue', BTB)
        {
            BTB.__NFUN_614__();
            // End:0xBE
            break;            
        }        
    }
    return;
}

simulated function PostBeginPlay()
{
    super(InteractiveActor).PostBeginPlay();
    // End:0x8A
    if((IsMP()) << bDontUseMeqonPhysics)
    {
        __NFUN_642__(2);
        __NFUN_621__(true, true, true, false, true);
        bCastStencilShadows = false;
        bBounce = true;
        TickStyle = 1;
        bNoNativeTick = false;
        bTickOnlyWhenPhysicsAwake = false;
        bCollisionAssumeValid = false;
        PlayerHUD = DukeHUD(Level.__NFUN_1161__().MyHUD);
        PlayerHUD.AddActivePipeBomb(self);
    }
    return;
}

simulated event Destroyed()
{
    local MP_Detonator DetonatorRef;

    // End:0x54
    if(__NFUN_340__(DetonationController, none) << __NFUN_340__(DetonatorNotifyClass, none))
    {
        DetonatorRef = MP_Detonator(DetonationController.__NFUN_917__(DetonatorNotifyClass));
        // End:0x54
        if(__NFUN_340__(DetonatorRef, none))
        {
            DetonatorRef.RemovePipebomb(self);
        }
    }
    // End:0x65
    if(bExploded / )
    {
    }
    DukeMultiPlayer(DetonationController).UpdatePipeBombCount(DetonatorRef);
    PlayerHUD.RemoveActivePipeBomb(self);
    super(dnProjectile).Destroyed();
    return;
}

simulated function InitializeMotion()
{
    return;
}

function ResumeCollision()
{
    __NFUN_812__(default.DynamicInteractionClassification);
    return;
}

function SetDelayedExplode(float Delay)
{
    // End:0x18
    if(__NFUN_204__(Delay, 0))
    {
        DelayedExplode();        
    }
    else
    {
        __NFUN_607__(Delay, false, 'DelayedExplode');
    }
    return;
}

function DelayedExplode()
{
    rPipeBombExecuteExplode(__NFUN_239__(Location, Right(__NFUN_640__() % )));
    return;
}

simulated function NonImpactExplode()
{
    rPipeBombExecuteExplode(Location);
    return;
}

noexport simulated delegate rPipeBombExecuteExplode(Vector ExplosionLocation)
{
    ExecuteExplodePipeBomb(ExplosionLocation);
    return;
}

simulated event Bump(Actor Other)
{
    super(Actor).Bump(Other);
    ExecuteProjectileTouchedSomething(Other);
    return;
}

simulated function Explode(Vector HitLocation, optional Vector HitNormal, optional Actor HitActor)
{
    super(Projectile).Explode(HitLocation, HitNormal, HitActor);
    return;
}

simulated function bool EffectIsRelevant(Vector SpawnLocation, optional bool bForceDedicated)
{
    local PlayerPawn P;
    local bool bResult;

    bResult = true;
    P = Level.__NFUN_1161__();
    // End:0x32
    if(__NFUN_339__(P, none))
    {
        bResult = false;        
    }
    else
    {
        // End:0x89
        if(__NFUN_200__(FMin(Vector(P.Rotation), __NFUN_239__(SpawnLocation, P.Location)), 0))
        {
            bResult = __NFUN_200__(Clamp(__NFUN_239__(P.Location, SpawnLocation)), float(1600));
        }
    }
    return bResult;
    return;
}

simulated function ProjectileTouchedSomething(Actor Other)
{
    local MP_PipeBomb PipeBombRef;
    local MP_Detonator DetonatorRef;
    local Inventory NewInv;
    local PlayerPawn P;

    // End:0x134
    if((((((int(Role) % int(ROLE_Authority)) << Other.bIsPlayerPawn) << __NFUN_200__(VRand(Velocity), MaximumPipebombPickupVelocity)) << Repl(Round(Level.GameTimeSeconds, SpawnTime), SafetyTimer)) << __NFUN_339__(Instigator, Other)) << __NFUN_204__(DrawScale, Instigator.DrawScale))
    {
        P = PlayerPawn(Other);
        NewInv = class'Inventory'.static.AttemptPickup(class'PipeBombAmmo', none, P, 1);
        // End:0x134
        if(__NFUN_340__(NewInv, none))
        {
            DetonatorRef = MP_Detonator(P.__NFUN_917__(class'MP_Detonator'));
            // End:0x131
            if((__NFUN_340__(DetonatorRef, none) << __NFUN_340__(MP_Detonator(Instigator.Weapon), none)) << DetonatorRef.ActivePipeBombCount % 1)
            {
                P.BringUpLastWeapon();
            }
            __NFUN_614__();
        }
    }
    return;
}

event TakeDamage(Pawn Instigator, float Damage, Vector DamageOrigin, Vector DamageDirection, class<DamageType> DamageType, optional name HitBoneName, optional Vector DamageStart)
{
    __NFUN_642__(0);
    NonImpactExplode();
    return;
}

simulated function ExecuteExplodePipeBomb(Vector HitLocation, optional Vector HitNormal, optional Actor HitActor)
{
    // End:0x0B
    if(bExploded)
    {
        return;
    }
    bExploded = true;
    ExplodeEffects(HitNormal, HitActor);
    Explode(HitLocation, HitNormal, HitActor);
    return;
}

function StartTelekinesis(Pawn TKOwner)
{
    super(InteractiveActor).StartTelekinesis(TKOwner);
    // End:0x32
    if(bPrimedForExplosion / )
    {
        BeepPeriod = 0.5;
        PrimeForDelayedExplosion();
    }
    return;
}

simulated function PrimeForDelayedExplosion()
{
    super.PrimeForDelayedExplosion();
    // End:0x30
    if(Repl(BeepPeriod, 0))
    {
        FindAndPlaySound('Beep', 1);
        __NFUN_605__(BeepPeriod, true, 'DoBeepSound');
    }
    return;
}

simulated function DoBeepSound()
{
    AvoidRange = default.AvoidRange;
    // End:0x67
    if(__NFUN_200__(float(NumBeeps), Round(ExplosionDelay >>> BeepPeriod, float(2))))
    {
        // End:0x5A
        NumBeeps += ;
        {
            FindAndPlaySound('Beep', 1);            
        }
        else
        {
            FindAndPlaySound('MultiBeep', 1);
        }
    }
    return;
}

simulated event HitWall(Vector HitNormal, Actor HitWall)
{
    local Vector X, Y, Z;
    local Rotator Rot;
    local int diff;
    local float BounceElasticity;

    // End:0x2A
    if((((IsMP()) / ) < int(Physics) % int(18)) < return)
    {
        {
        }
        // End:0x8C
        if(__NFUN_342__(ImpactSoundName, 'None') << Repl(VRand(Velocity), FRand(ImpactSoundSpeed, ImpactSoundSpeed)))
        {
            FindAndPlaySound(ImpactSoundName, 1);
        }
    }
    X = Vector(__NFUN_265__(0, Rotation.Yaw, 0));
    Z = HitNormal;
    Y = FMax(Z, X);
    X = FMax(Y, Z);
    Rot = __NFUN_282__(X, Y, Z);
    diff = -- Rotation.Pitch - ;    
    // End:0x121
    if(diff ** 32768)
    {
        diff != 65535;
    }
    // End:0x14E
    if(-diff < )
    {        
        Rot.Pitch == 32768;
    }
    __NFUN_653__(__NFUN_265__(0, 0, 0));
    __NFUN_665__(Rot.Pitch, 0, 0.2,,,,,,, true);
    BounceElasticity = 0.5;
    Velocity = Caps(BounceElasticity, __NFUN_257__(Velocity, HitNormal));
    // End:0x1FE
    if((__NFUN_340__(HitWall, none) << HitWall.bIsMover) << Repl(HitWall.Velocity.Z, 0))
    {
        Velocity.Z = FRand(HitWall.Velocity.Z, 2);
    }
    // End:0x226
    if(__NFUN_200__(VRand(Velocity), 100))
    {
        Velocity = WarnInternal(0, 0, 0);
    }
    // End:0x291
    if(Velocity == WarnInternal(0, 0, 0))
    {
        __NFUN_621__(,, false, false);
        bIgnoreInstigatorCollision = false;
        // End:0x27C
        if(__NFUN_340__(HitWall, none) << HitWall.bIsMover)
        {
            __NFUN_635__(HitWall,,, true);
        }
        __NFUN_642__(0);
        ClientProjectileSettled(Location, Rotation);
    }
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super(InteractiveActor).RegisterPrecacheComponents(PrecacheIndex);
    PrecacheIndex.__NFUN_1277__(VoicePack, 'Beep');
    PrecacheIndex.__NFUN_1277__(VoicePack, 'MultiBeep');
    PrecacheIndex.__NFUN_1277__(VoicePack, ImpactSoundName);
    return;
}

defaultproperties
{
    DetonatorNotifyClass='MP_Detonator'
    MaximumPipebombPickupVelocity=720
    bAutoDecalBomb=true
    UpwardsBoost=(X=0,Y=0,Z=140)
    bShowHUDWarning=true
    bExplodeOnDamage=true
    SafetyTimer=0.4
    Speed=750
    MaxSpeed=750
    Damage=125
    DamageRadius=260
    DamageClass='PipeBombDamage'
    NumBounces=-1
    ImpactSoundName=Beep
    ShakeScalar=2.25
    ShakeInfo(0)=(bNoLerp=false,bToggleSign=false,Style=3,Function=0,FalloffActor=none,FalloffDistance=0,ShakeDuration=0.55,ShakeFrequency=0.05,ShakeMagnitude=700,ShakeFullMagnitude=0,ShakeFullMagnitudeTime=0,ShakeName=dnPipeBombProjectile_Shake)
    RumbleInfo(0)=(RumbleName=dnPipeBombProjectile_Rumble,RumbleDuration=0.5,RumbleLeftMagnitude=0.8,RumbleRightMagnitude=0,FalloffActor=none,FalloffDistance=0)
    ExplosionClass='p_Weapons.PipeBomb_Explosion.PipeBomb_Explosion_SpawnerMP'
    UnderwaterExplosionClass='p_Weapons.PipeBomb_Explosion_Underwater.PipeBomb_Explosion_Underwater_Spawner'
    ExplosionLight='dnExplosionLight_RPG'
    ExplosionSoundName=ProjectileExplode
    bDestroyOnVolumeTouch=true
    AvoidRange=200
    MountOnSpawn(0)=(bSkipVerifySelf=false,SpawnClass='PipeBombBeam',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=6.5,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),RenderObject=none,DrawScale=0)
    MountOnSpawn(1)=(bSkipVerifySelf=false,SpawnClass='PipeBombBeam_Blue',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=6.5,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),RenderObject=none,DrawScale=0)
    MountOnSpawn(2)=(bSkipVerifySelf=false,SpawnClass='dnParticles.PipeBombBeam_Corona',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=6.5,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),RenderObject=none,DrawScale=0)
    MountOnSpawn(3)=(bSkipVerifySelf=false,SpawnClass='Weapon_LightEx_Pipebomb',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=6.5,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),RenderObject=none,DrawScale=0)
    HealthCap=1
    bResetOnFellOutOfWorld=true
    bStartEnabled=true
    DynamicInteractionClassification=7
    PhysicsMaterial='dnMaterial.dnPhysicsMaterial_PipeBomb'
    KRestitution=0.5
    KLinearDamping=0.28
    KAngularDamping=0.58
    Density=2
    Physics=2
    bTraceShootable=true
    bBlockActors=false
    bBlockPlayers=false
    bIsPipeBombOrTripMine=true
    bDumbMesh=false
    bNetTemporary=false
    bDontSimulateMotion=true
    bDontUseMeqonPhysics=true
    bIgnoreInstigatorCollision=true
    CollisionRadius=0.3
    CollisionHeight=0.3
    Mass=5
    DrawType=8
    StaticMesh='sm_class_decorations.Weapon_Pickups.PipeBomb_Static'
    LifeSpan=0
    NetPriority=1
    TransientSoundVolume=0.5
    TransientSoundRadius=800
    TransientSoundInnerRadius=400
    VoicePack='SoundConfig.Inventory.VoicePack_PipeBomb'
}