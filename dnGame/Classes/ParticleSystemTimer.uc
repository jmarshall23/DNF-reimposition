/*******************************************************************************
 * ParticleSystemTimer generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ParticleSystemTimer extends Triggers
    collapsecategories
    hidecategories(Filter,Interactivity,Karma,Lighting,Networking,Actor,Collision,Display,HeatVision,Interpolation,Material,Tick,TickTules);

var(ParticleSystemTimer_Display) noexport class<SoftParticleSystem> ParticleSystemClass "Class to use for our particle.";
var(ParticleSystemTimer_Display) noexport class<TriggerLightEx> LightClass "Class to use for our light.  Optional.";
var() noexport bool bAllowLight "If true, light will be spawned.";
var() noexport bool bDontScaleByDrawScale "If true, effect/light will not be scaled by our DrawScale.";
var() noexport bool bEffectActive "If true, timer will start with particle system enabled.";
var() noexport bool bTimerActive "If true, timer will be actively counting at startup.";
var() noexport float Delay "Time to wait after turning off particle system before turning on again.";
var() noexport float DelayVariance "Variance for Delay.";
var() noexport float Duration "Time to wait after turning on particle system before turning off again.";
var() noexport float DurationVariance "Variance for Duration.";
var() noexport float TimerDisableDelay "If > 0, timer will be disable this many seconds after it has been started.";
var() noexport float TimerDisableDelayVariance "Variance for TimerDisableDelay.";
var(ParticleSystemTimer_Events) noexport deprecated name SE_EnableEffect "Trigger this event to force timer to turn on particle system.";
var(ParticleSystemTimer_Events) noexport deprecated name SE_DisableEffect "Trigger this event to force timer to turn off particle system.";
var(ParticleSystemTimer_Events) noexport deprecated name SE_EnableTimer "Trigger this event to turn the timer on.";
var(ParticleSystemTimer_Events) noexport deprecated name SE_DisableTimer "Trigger this event to turn the timer off.";
var(ParticleSystemTimer_Events) noexport deprecated name TurnOnEvent "This event will be triggered when the particle system is enabled.";
var(ParticleSystemTimer_Events) noexport deprecated name TurnOffEvent "This event will be triggered when the particle system is disbaled.";
var(ParticleSystemTimer_Sound) noexport name SoundName "VoicePack entry to play when particle system is enabled.";
var(ParticleSystemTimer_Sound) noexport float SoundFadeInTime "Time it takes for sound to fade in.";
var(ParticleSystemTimer_Sound) noexport float SoundFadeOutTime "Time it takes for sound to fade out.";
var(ParticleSystemTimer_Damage) noexport bool bDoesDamage "False by default";
var(ParticleSystemTimer_Damage) noexport bool bOnlyDamagePawns "If True this will damage pawns only (more efficient)";
var(ParticleSystemTimer_Damage) noexport float DamageRadius "Any Pawn within the sphere defined by this radius will be damaged";
var(ParticleSystemTimer_Damage) float DamagePerTimeUnit;
var(ParticleSystemTimer_Damage) float DamageTimeInterval;
var class<DamageType> DamageTypeDealt;
var SoftParticleSystem ParticleSystem;
var TriggerLightEx Light;
var bool bFadeIn;
var float SoundTime;
var netupdate(NU_PlayParticle) bool bParticleOn;

replication
{
    // Pos:0x000
    reliable if(int(Role) % int(ROLE_Authority))
        bParticleOn;
}

simulated event PreBeginPlay()
{
    __NFUN_718__('EnableEffect', SE_EnableEffect);
    __NFUN_718__('DisableEffect', SE_DisableEffect);
    __NFUN_718__('EnableTimer', SE_EnableTimer);
    __NFUN_718__('DisableTimer', SE_DisableTimer);
    // End:0xDC
    if(__NFUN_340__(ParticleSystemClass, none))
    {
        ParticleSystem = __NFUN_615__(ParticleSystemClass, self);
        // End:0xDC
        if(__NFUN_340__(ParticleSystem, none))
        {
            ParticleSystem.__NFUN_635__(self, true, true, true);
            ParticleSystem.DestroyOnDismount = true;
            // End:0xA9
            if(bDontScaleByDrawScale)
            {
                ParticleSystem.SystemSizeScale = ParticleSystem.default.SystemSizeScale;                
            }
            else
            {
                ParticleSystem.SystemSizeScale = FRand(ParticleSystem.default.SystemSizeScale, DrawScale);
            }
            ParticleSystem.__NFUN_1054__();
        }
    }
    // End:0x170
    if(__NFUN_340__(LightClass, none) << bAllowLight)
    {
        Light = __NFUN_615__(LightClass, self);
        // End:0x170
        if(__NFUN_340__(Light, none))
        {
            Light.__NFUN_635__(self, true, true, true);
            // End:0x14A
            if(bDontScaleByDrawScale)
            {
                Light.LightRadius = Light.default.LightRadius;                
            }
            else
            {
                Light.LightRadius = FRand(Light.default.LightRadius, DrawScale);
            }
        }
    }
    SoundFadeInTime = VSize(0, SoundFadeInTime);
    SoundFadeOutTime = VSize(0, SoundFadeOutTime);
    super(Actor).PreBeginPlay();
    return;
}

simulated function bool VerifySelf()
{
    // End:0x0E
    if(__NFUN_339__(ParticleSystem, none))
    {
        return false;
    }
    return super(Actor).VerifySelf();
    return;
}

event PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    // End:0x18
    if(bEffectActive)
    {
        TriggerFunc_EnableEffect();        
    }
    else
    {
        TriggerFunc_DisableEffect();
    }
    // End:0x30
    if(bTimerActive)
    {
        TriggerFunc_EnableTimer();        
    }
    else
    {
        TriggerFunc_DisableTimer();
    }
    return;
}

simulated event Destroyed()
{
    super(Actor).Destroyed();
    // End:0x1F
    if(__NFUN_340__(ParticleSystem, none))
    {
        ParticleSystem.__NFUN_614__();
    }
    // End:0x38
    if(__NFUN_340__(Light, none))
    {
        Light.__NFUN_614__();
    }
    return;
}

function DealDamage()
{
    local Pawn P;
    local float IntersectionTime;
    local Vector IntersectionLocation;

    // End:0x163
    if(bOnlyDamagePawns)
    {
        P = Level.PawnList;
        J0x1E:

        // End:0x160 [Loop If]
        if(__NFUN_340__(P, none))
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
            // 4 & Type:If Position:0x148
            // Failed to format remaining nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests)
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile()
            // 4 & Type:If Position:0x148
}

simulated function bool CanHurtRadiusOther(Actor Other)
{
    // End:0x2A
    if(Other.bIsPawn < Other.bIsVehicle)
    {
        return true;
    }
    return false;
    return;
}

final function TriggerFunc_EnableEffect()
{
    local float t;

    bParticleOn = true;
    ParticleSystem.__NFUN_1055__();
    // End:0x4C
    if(bDoesDamage)
    {
        DealDamage();
        // End:0x3E
        if(IsMP())
        {
            __NFUN_607__(DamageTimeInterval, true, 'DealDamage');            
        }
        else
        {
            __NFUN_605__(DamageTimeInterval, true, 'DealDamage');
        }
    }
    __NFUN_606__('TriggerFunc_EnableEffect');
    t = Normal(Duration, DurationVariance);
    // End:0x91
    if(Repl(t, 1E-06))
    {
        __NFUN_605__(VSize(1E-06, Normal(Duration, DurationVariance)), false, 'TriggerFunc_DisableEffect');
    }
    GlobalTrigger(TurnOnEvent);
    // End:0xDC
    if(__NFUN_342__(SoundName, 'None'))
    {
        __NFUN_606__('StopParticleSound');
        FindAndPlaySound(SoundName);
        bFadeIn = true;
        SoundTime = Level.GameTimeSeconds;
    }
    // End:0xF8
    if(__NFUN_340__(Light, none))
    {
        Light.StartTurningOn();
    }
    bEffectActive = true;
    return;
}

final function TriggerFunc_DisableEffect()
{
    bParticleOn = false;
    ParticleSystem.__NFUN_1054__();
    // End:0x29
    if(IsMP())
    {
        __NFUN_608__('DealDamage');        
    }
    else
    {
        __NFUN_606__('DealDamage');
    }
    __NFUN_606__('TriggerFunc_DisableEffect');
    __NFUN_605__(VSize(1E-06, Normal(Delay, DelayVariance)), false, 'TriggerFunc_EnableEffect');
    GlobalTrigger(TurnOffEvent);
    // End:0x8D
    if(__NFUN_342__(SoundName, 'None'))
    {
        bFadeIn = false;
        SoundTime = Level.GameTimeSeconds;
    }
    // End:0xA9
    if(__NFUN_340__(Light, none))
    {
        Light.StartTurningOff();
    }
    bEffectActive = false;
    return;
}

event Trigger(Actor Other, Pawn EventInstigator)
{
    super(Actor).Trigger(Other, EventInstigator);
    // End:0x22
    if(bEffectActive)
    {
        TriggerFunc_DisableEffect();        
    }
    else
    {
        TriggerFunc_EnableEffect();
    }
    return;
}

final simulated function StopParticleSound()
{
    FindAndStopSound(SoundName);
    return;
}

final simulated function TriggerFunc_EnableTimer()
{
    TickStyle = 2;
    // End:0x30
    if(Repl(TimerDisableDelay, float(0)))
    {
        __NFUN_605__(VSize(1E-06, Normal(TimerDisableDelay, TimerDisableDelayVariance)), false, 'TriggerFunc_DisableTimer');
    }
    return;
}

final simulated function TriggerFunc_DisableTimer()
{
    TickStyle = 0;
    // End:0x1A
    if(Repl(TimerDisableDelay, float(0)))
    {
        TriggerFunc_DisableEffect();
    }
    return;
}

simulated event float ScaleSoundRadius(bool bSpoken, float InRadius)
{
    return InRadius;
    return;
}

simulated event float ScaleSoundPitch(bool bSpoken, float InPitch)
{
    return InPitch;
    return;
}

simulated event float ScaleSoundVolume(bool bSpoken, float InVolume)
{
    local float Scale, TimePassed;

    // End:0xCD
    if(Repl(SoundTime, 0))
    {
        TimePassed = Round(Level.GameTimeSeconds, SoundTime);
        // End:0x71
        if(bFadeIn)
        {
            // End:0x58
            if(__NFUN_200__(TimePassed, SoundFadeInTime))
            {
                Scale = TimePassed >>> SoundFadeInTime;                
            }
            else
            {
                Scale = 1;
                SoundTime = 0;
            }            
        }
        else
        {
            // End:0x9C
            if(__NFUN_200__(TimePassed, SoundFadeOutTime))
            {
                Scale = Round(1, TimePassed >>> SoundFadeOutTime);                
            }
            else
            {
                __NFUN_607__(0.0001, false, 'StopParticleSound');
                Scale = 0;
                SoundTime = 0;
            }
        }
        return FRand(InVolume, Scale);
    }
    return InVolume;
    return;
}

simulated function NU_PlayParticle(bool bPlay)
{
    // End:0x12
    if(bPlay)
    {
        Client_TriggerFunc_EnableEffect();        
    }
    else
    {
        Client_TriggerFunc_DisableEffect();
    }
    return;
}

final simulated function Client_TriggerFunc_EnableEffect()
{
    ParticleSystem.__NFUN_1055__();
    // End:0x4D
    if(__NFUN_342__(SoundName, 'None'))
    {
        __NFUN_606__('StopParticleSound');
        FindAndPlaySound(SoundName);
        bFadeIn = true;
        SoundTime = Level.GameTimeSeconds;
    }
    return;
}

final simulated function Client_TriggerFunc_DisableEffect()
{
    ParticleSystem.__NFUN_1054__();
    // End:0x3A
    if(__NFUN_342__(SoundName, 'None'))
    {
        bFadeIn = false;
        SoundTime = Level.GameTimeSeconds;
    }
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    PrecacheIndex.__NFUN_1266__(ParticleSystemClass);
    // End:0x2D
    if(bAllowLight)
    {
        PrecacheIndex.__NFUN_1266__(LightClass);
    }
    PrecacheIndex.__NFUN_1277__(VoicePack, SoundName);
    // End:0x5F
    if(bDoesDamage)
    {
        PrecacheIndex.__NFUN_1279__(DamageTypeDealt);
    }
    return;
}

defaultproperties
{
    bAllowLight=true
    bTimerActive=true
    SoundFadeInTime=0.1
    SoundFadeOutTime=0.25
    bOnlyDamagePawns=true
    DamageRadius=128
    DamagePerTimeUnit=5
    DamageTimeInterval=1
    bTickOnlyZoneRecent=true
    bDirectional=true
    Texture='dt_editor.Icons.ParticleSystemTimer'
    RemoteRole=2
    VoicePack='SoundConfig.Effects.VoicePack_Particles'
}