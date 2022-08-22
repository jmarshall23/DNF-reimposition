/*******************************************************************************
 * Vehicles_Deco_Car_Standard_Base generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Vehicles_Deco_Car_Standard_Base extends Vehicles_Deco_Bodies
    collapsecategories;

var() Vehicles_Deco_Bodies.ECarColor CarColor;
var() bool bUseDamagedSkins;
var() float ExplosionLift;
var() Vector ExplosionOffset;
var() float ExplosionRadius;
var() float ExplosionDamage;
var() float ExplosionFalloffStart;
var() float ExplosionDelay;
var() float ExplosionDelayVariance;
var() class<SoftParticleSystem> ExplosionParticleClass;
var() class<SoftParticleSystem> GlassExplosionParticleClass;
var() float ExplosionPlayerDamageScale;
var() int IgnitionHealthThreshhold;
var int SingleHitDamageThreshhold;
var bool bIgnited;
var float ImpactVelocityThreshhold;
var Vector ExplosionHingeLocations[4];
var Rotator ExplosionHingeMountAngles[4];
var Rotator ExplosionLimitMountAngles[4];
var Rotator ExplosionLimitSecondaryAxes[4];
var() bool bConstrained;
var bool bHasBeenStruck;
var() class<SoftParticleSystem> FireParticleClass;
var SoftParticleSystem Fire;
var SoftParticleSystem fire2;
var() Vector FireOffset;
var() Vector FireOffset2;
var() class<SoftParticleSystem> SmokeParticleClass;
var SoftParticleSystem Smoke;
var() Vector SmokeOffset;
var() float SmokeDuration;
var() float SmokeDurationVar;
var dnFriendFX_Spawners ExplosionParticle;
var dnFriendFX_Spawners GlassParticle;

simulated function Destroyed()
{
    super(dnDecoration).Destroyed();
    __NFUN_608__('Boom');
    // End:0x1F
    if(bSilentDestroy / )
    {
    }
    return;
}

simulated function bool CanHurtRadiusOther(Actor Other)
{
    // End:0x28
    if(__NFUN_340__(Vehicles_Deco_Car_Standard_Base(Other), none) < Other.bIsVehicle)
    {
        return false;
    }
    return super(Actor).CanHurtRadiusOther(Other);
    return;
}

function Boom()
{
    CriticalDamage();
    return;
}

event TakeDamage(Pawn Instigator, float Damage, Vector DamageOrigin, Vector DamageDirection, class<DamageType> DamageType, optional name HitBoneName, optional Vector DamageStart)
{
    local int i;
    local bool bFoundMatch;

    super.TakeDamage(Instigator, Damage, DamageOrigin, DamageDirection, DamageType, HitBoneName, DamageStart);
    // End:0x84
    if(string(DamageTypesAcceptedOnly) ** 0)
    {
        i = 0;
        J0x3C:

        // End:0x77 [Loop If]
        if(-i)
        {            
            // End:0x6D
            if(__NFUN_357__(DamageType, DamageTypesAcceptedOnly[i]))
            {
                bFoundMatch = true;
                // [Explicit Break]
                goto J0x77;
            }
            // [Loop Continue]
            i += ;
        }
        J0x77:

        // End:0x84
        if(bFoundMatch / )
        {
        }
    }
    i = 0;
    J0x8B:

    // End:0xBD [Loop If]
    if(-i)
    {        
        // End:0xB3
        if(__NFUN_339__(DamageType, DamageTypesIgnored[i]))
        {
            return;
        }
        // [Loop Continue]
        i += ;
    }
    // End:0xE2
    if((Damage != float(SingleHitDamageThreshhold)) << bHasBeenStruck / )
    {
        return;
    }
    // End:0x112
    if((__NFUN_202__(Health, float(IgnitionHealthThreshhold)) << bIgnited / ) << (StartUnstable()))
    {
    }
}

event bool TakePhysicsImpactDamage(float Damage, Vector DamageOrigin, Vector DamageDirection, class<DamageType> DamageType, Pawn Instigator, KarmaActor DamageActor)
{
    local float velMag, ImpulseMag, SideScale;
    local Vector Impulse, spin, Right, Up;

    // End:0x3A
    if(DamageActor.bIsVehicle / )
    {
    }
    bHasBeenStruck = true;
    velMag = Clamp(DamageActor.Velocity);
    // End:0x206
    if(((velMag != ImpactVelocityThreshhold) << DecorationIsDead() / ) << __NFUN_812__(1))
    {
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
        // 5 & Type:If Position:0x17A
        // Failed to format remaining nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests)
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile()
        // 5 & Type:If Position:0x17A
}

function SwitchInteraction()
{
    __NFUN_812__(0);
    return;
}

function StartUnstable()
{
    __NFUN_607__(Normal(ExplosionDelay, ExplosionDelayVariance), false, 'Boom');
    FindAndPlaySound('OnFire', 1);
    bIgnited = true;
    Fire = __NFUN_615__(FireParticleClass,,, Locs(__NFUN_241__(FireOffset, Rotation), Location));
    Fire.MountType = 0;
    Fire.__NFUN_635__(self, false, false, true);
    fire2 = __NFUN_615__(FireParticleClass,,, Locs(__NFUN_241__(FireOffset2, Rotation), Location));
    fire2.MountType = 0;
    fire2.__NFUN_635__(self, false, false, true);
    return;
}

function Explode()
{
    local dnFriendFX_Spawners FriendSpawner;
    local KHinge ExplosionHinge;
    local KAngularJointLimit ExplosionLimit;
    local int Index, i, j;

    // End:0x5D
    if(__NFUN_340__(ExplosionParticle, none))
    {
        ExplosionParticle.SystemSizeScale = FRand(DrawScale, 2);
        ExplosionParticle.__NFUN_645__(Location);
        ExplosionParticle.__NFUN_652__(Rotation);
        ExplosionParticle.ExecuteEffect(true);
    }
    // End:0xB3
    if(__NFUN_340__(GlassParticle, none))
    {
        GlassParticle.SystemSizeScale = DrawScale;
        GlassParticle.__NFUN_645__(Location);
        GlassParticle.__NFUN_652__(Rotation);
        GlassParticle.ExecuteEffect(true);
    }
    // End:0xC7
    if(__NFUN_340__(BurntMesh, none))
    {
        __NFUN_595__(BurntMesh);
    }
    __NFUN_642__(18);
    // End:0x1CC
    if(bConstrained)
    {
        Index = Sin(4);
        ExplosionHinge = __NFUN_615__(class'KHinge', self,, Locs(__NFUN_241__(ExplosionHingeLocations[Index], Rotation), Location), __NFUN_269__(ExplosionHingeMountAngles[Index], Rotation));
        // End:0x147
        if(__NFUN_340__(ExplosionHinge, none))
        {
            ExplosionHinge.KConstraintActor1 = self;
            ExplosionHinge.__NFUN_642__(18);
        }
        ExplosionLimit = __NFUN_615__(class'KAngularJointLimit', self,, Location, __NFUN_269__(ExplosionLimitMountAngles[Index], Rotation));
        // End:0x1CC
        if(__NFUN_340__(ExplosionLimit, none))
        {
            ExplosionLimit.KConstraintActor1 = self;
            ExplosionLimit.__NFUN_1106__(6000);
            ExplosionLimit.__NFUN_1107__(true, __NFUN_269__(ExplosionLimitSecondaryAxes[Index], Rotation));
            ExplosionLimit.__NFUN_642__(18);
        }
    }
    j = 1;
    i = -- string(VehicleParts);    
    J0x1E2:

    // End:0x248 [Loop If]
    if(i / 0)
    {
        // End:0x23E
        if(__NFUN_340__(VehicleParts[i].VehiclePartActor, none))
        {
            VehicleParts[i].VehiclePartActor.ScheduleExplode(j);
            // End:0x23E
            j += ;
            {
                j = 1;
            }
        }
        // [Loop Continue]
        i -= ;
    }
    __NFUN_820__(WarnInternal(0, 0, ExplosionLift), Locs(__NFUN_241__(ExplosionOffset, Rotation), Location));
    FindAndPlaySound('Veh_Explosion');
    __NFUN_701__(none);
    // End:0x2A4
    if(__NFUN_340__(Fire, none))
    {
        Fire.__NFUN_1054__();
        Fire.__NFUN_614__();
    }
    // End:0x2CA
    if(__NFUN_340__(fire2, none))
    {
        fire2.__NFUN_1054__();
        fire2.__NFUN_614__();
    }
    Smoke = __NFUN_615__(SmokeParticleClass,,, Locs(__NFUN_241__(SmokeOffset, Rotation), Location));
    Smoke.MountType = 0;
    Smoke.__NFUN_635__(self, false, false, true);
    __NFUN_607__(Normal(SmokeDuration, SmokeDurationVar), false, 'TurnOffSmoke');
    HurtRadius(ExplosionDamage, Location, ExplosionRadius, ExplosionFalloffStart,, Location, ExplosionPlayerDamageScale);
    return;
}

function TurnOffSmoke()
{
    Smoke.__NFUN_1054__();
    return;
}

function TurnOffPartPhysics(Vehicles_Deco_Parts Part)
{
    // End:0x18
    if(bConstrained)
    {
        Part.__NFUN_642__(0);
    }
    return;
}

function PostVerifySelf()
{
    local name DecoActName;
    local int i;
    local string DecoActString;
    local StaticMesh Mesh;

    super.PostVerifySelf();
    Mesh = StaticMesh(__NFUN_596__());
    __NFUN_595__(BurntMesh);
    __NFUN_595__(Mesh);
    // End:0x32
    if(bConstrained)
    {
        __NFUN_642__(0);
    }
    ExplosionParticle = FindFriendSpawner(class<dnFriendFX_Spawners>(ExplosionParticleClass));
    // End:0x97
    if(__NFUN_340__(ExplosionParticle, none))
    {
        ExplosionParticle.SystemSizeScale = FRand(DrawScale, 2);
        ExplosionParticle.__NFUN_645__(Location);
        ExplosionParticle.__NFUN_652__(Rotation);        
    }
    else
    {
        ExplosionParticle = dnFriendFX_Spawners(__NFUN_615__(ExplosionParticleClass,,, Location));
        ExplosionParticle.SystemSizeScale = FRand(DrawScale, 2);
    }
    GlassParticle = FindFriendSpawner(class<dnFriendFX_Spawners>(GlassExplosionParticleClass));
    // End:0x12B
    if(__NFUN_340__(GlassParticle, none))
    {
        GlassParticle.SystemSizeScale = DrawScale;
        GlassParticle.__NFUN_645__(Location);
        GlassParticle.__NFUN_652__(Rotation);        
    }
    else
    {
        GlassParticle = dnFriendFX_Spawners(__NFUN_615__(GlassExplosionParticleClass,,, Location));
    }
    // End:0x185
    if((((int(CarColor) + int(6)) << int(CarColor) + int(5)) << int(CarColor) + int(7)) << int(CarColor) + int(8))
    {
        return;
    }
    DecoActString = __NFUN_302__(string(__NFUN_365__(Enum'ECarColor', int(CarColor))), "_Deco");
    // End:0x1C1
    if(bUseDamagedSkins)
    {
        DecoActString = __NFUN_302__(DecoActString, "_Dmg");
    }
    DecoActName = __NFUN_343__(DecoActString);
    DecoActivity(0, DecoActName);
    i = -- string(VehicleParts);    
    J0x1EB:

    // End:0x239 [Loop If]
    if(i / 0)
    {
        // End:0x22F
        if(__NFUN_340__(VehicleParts[i].VehiclePartActor, none))
        {
            VehicleParts[i].VehiclePartActor.DecoActivity(0, DecoActName);
        }
        // [Loop Continue]
        i -= ;
    }
    return;
}

function DestroyMountedActors(bool bSkipSpawnOnDestroyed, bool bSilentDestroy)
{
    local int i;

    i = -- string(VehicleParts);    
    J0x0F:

    // End:0xC6 [Loop If]
    if(i / 0)
    {
        // End:0xBC
        if(__NFUN_340__(VehicleParts[i].VehiclePartActor, none))
        {
            VehicleParts[i].VehiclePartActor.DestroyMountedActors(bSkipSpawnOnDestroyed, bSilentDestroy);
            // End:0x7E
            if(bSkipSpawnOnDestroyed)
            {
                VehicleParts[i].VehiclePartActor.bSpawnOnDestroyed = false;
            }
            // End:0xA4
            if(bSilentDestroy)
            {
                VehicleParts[i].VehiclePartActor.bSilentDestroy = true;
            }
            VehicleParts[i].VehiclePartActor.__NFUN_614__();
        }
        // [Loop Continue]
        i -= ;
    }
    super(Actor).DestroyMountedActors(bSkipSpawnOnDestroyed, bSilentDestroy);
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super.RegisterPrecacheComponents(PrecacheIndex);
    PrecacheIndex.__NFUN_1277__(VoicePack, 'OnFire');
    PrecacheIndex.__NFUN_1277__(VoicePack, 'Veh_Explosion');
    PrecacheIndex.__NFUN_1266__(FireParticleClass);
    PrecacheIndex.__NFUN_1266__(ExplosionParticleClass);
    PrecacheIndex.__NFUN_1266__(GlassExplosionParticleClass);
    PrecacheIndex.__NFUN_1266__(SmokeParticleClass);
    return;
}

defaultproperties
{
    ExplosionLift=800000
    ExplosionRadius=246
    ExplosionDamage=100
    ExplosionFalloffStart=200
    ExplosionDelay=5
    ExplosionDelayVariance=2
    ExplosionParticleClass='p_Decorations.Car_Explosion.Car_Explosion_Spawner'
    GlassExplosionParticleClass='p_Decorations.Car_Explode_GlassShatter.Car_Explode_GlassShatter_Spawner'
    ExplosionPlayerDamageScale=0.5
    IgnitionHealthThreshhold=120
    SingleHitDamageThreshhold=100
    ImpactVelocityThreshhold=800
    ExplosionHingeLocations[0]=(X=26.65509,Y=44.70543,Z=-29.8121)
    ExplosionHingeLocations[1]=(X=27.15509,Y=-46.79457,Z=-29.8121)
    ExplosionHingeLocations[2]=(X=-87.84491,Y=-0.461239,Z=-29.62262)
    ExplosionHingeLocations[3]=(X=148.6551,Y=0.970137,Z=-29.8121)
    ExplosionHingeMountAngles[2]=(Pitch=0,Yaw=-16384,Roll=0)
    ExplosionHingeMountAngles[3]=(Pitch=0,Yaw=-16384,Roll=0)
    ExplosionLimitMountAngles[0]=(Pitch=0,Yaw=-16384,Roll=0)
    ExplosionLimitMountAngles[1]=(Pitch=0,Yaw=16384,Roll=0)
    ExplosionLimitMountAngles[3]=(Pitch=0,Yaw=32768,Roll=0)
    ExplosionLimitSecondaryAxes[0]=(Pitch=6000,Yaw=-16384,Roll=0)
    ExplosionLimitSecondaryAxes[1]=(Pitch=6000,Yaw=16384,Roll=0)
    ExplosionLimitSecondaryAxes[2]=(Pitch=6000,Yaw=0,Roll=0)
    ExplosionLimitSecondaryAxes[3]=(Pitch=6000,Yaw=32768,Roll=0)
    bConstrained=true
    FireParticleClass='p_Decorations.Car_Fire.Car_Fire_Main'
    FireOffset=(X=115,Y=-6,Z=0)
    FireOffset2=(X=100,Y=20,Z=1)
    SmokeParticleClass='p_Vehicles.Deco_Vehicle.DestroyedVehSmoke'
    SmokeOffset=(X=115,Y=0,Z=-20)
    SmokeDuration=8
    SmokeDurationVar=2
    bStartupOff=true
    bSurviveDeath=true
    HealthPrefab=5
    DamageTypesAcceptedOnly(0)='dnGame.BulletDamage'
    DamageTypesAcceptedOnly(1)='Engine.ExplosionDamage'
    Health=180
    HealthCap=180
    bTickOnlyWhenPhysicsAwake=true
    ImpactSoundRadius=16384
    ImpactSoundInnerRadius=512
    PhysicsEntityGroup=VehiclesDecoGroup
    PhysicsSoundOverrides(0)=(SoundType=0,OtherMaterialTypes=none,OtherMassTypes=none,Sounds=('a_impact.Vehicles.Veh_Impact_01','a_impact.Vehicles.Veh_Impact_02','a_impact.Vehicles.Veh_Impact_03','a_impact.Vehicles.Veh_Impact_04'),SoundInfo=(InputRange=(Min=64,Max=1200),OutputPitchRange=(Min=0.7,Max=0.8),OutputVolumeRange=(Min=0.5,Max=1)),bDisableSoundInWater=true)
    PhysicsSoundOverrides(1)=(SoundType=1,OtherMaterialTypes=none,OtherMassTypes=none,Sounds=('a_impact.Vehicles.Veh_Roll_Loop_01'),SoundInfo=(InputRange=(Min=0.4,Max=8),OutputPitchRange=(Min=0.9,Max=1.1),OutputVolumeRange=(Min=0.75,Max=1)),bDisableSoundInWater=true)
    PhysicsSoundOverrides(2)=(SoundType=2,OtherMaterialTypes=none,OtherMassTypes=none,Sounds=('a_impact.metal.BoatScrape01'),SoundInfo=(InputRange=(Min=128,Max=400),OutputPitchRange=(Min=0.7,Max=0.8),OutputVolumeRange=(Min=0.5,Max=1)),bDisableSoundInWater=true)
}