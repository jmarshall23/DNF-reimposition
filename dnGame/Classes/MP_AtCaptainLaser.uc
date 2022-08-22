/*******************************************************************************
 * MP_AtCaptainLaser generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MP_AtCaptainLaser extends MP_dnContinuousFireWeapon;

function AdjustProjectileSpawn(out Vector SpawnLocation, out Rotator SpawnRotation)
{
    SpawnRotation = GetStateName(SpawnRotation << __NFUN_265__(200, -200, 0), __NFUN_265__(200, 200, 0));
    super(Weapon).AdjustProjectileSpawn(SpawnLocation, SpawnRotation);
    return;
}

simulated event SpawnWeaponTracer(Vector TracerStart, Vector TracerEnd, float TracerChance, class<BeamSystem> TracerBeamClass, class<SoftParticleSystem> TracerBubblesClass, Actor HitActor)
{
    local Projectile Proj;
    local BeamTrail Beam;
    local BeamSystem BeamSys;
    local SoftParticleSystem Bubbles;
    local Vector BubbleStart, BubbleEnd, BubbleVector, HitNormal;
    local float Distance;
    local bool bWaterStart, bWaterEnd;
    local PhysicsVolume P;

    // End:0x68
    if(__NFUN_340__(TracerBeamClass, none) << __NFUN_202__( /= TracerChance))
    {
        BeamSys.__NFUN_591__(DrawScale);
        // End:0x68
        if(__NFUN_340__(BeamSys, none))
        {
            BeamSys.AddSegmentTracer(TracerStart, TracerEnd);
        }
    }
    // End:0x28A
    if(__NFUN_340__(TracerBubblesClass, none))
    {
        Bubbles = SoftParticleSystem(FindStaticActor(TracerBubblesClass));
        // End:0x28A
        if(__NFUN_340__(Bubbles, none))
        {
            P = __NFUN_728__(TracerStart);
            // End:0xC7
            if(__NFUN_340__(P, none))
            {
                bWaterStart = P.bWaterVolume;
            }
            P = __NFUN_728__(TracerEnd);
            // End:0xF8
            if(__NFUN_340__(P, none))
            {
                bWaterEnd = P.bWaterVolume;
            }
            // End:0x125
            if(bWaterStart << bWaterEnd)
            {
                BubbleStart = TracerStart;
                BubbleEnd = TracerEnd;                
            }
            else
            {
                // End:0x183
                if(bWaterStart)
                {
                    BubbleStart = TracerStart;
                    BubbleEnd = TracerStart;
                    // End:0x17F
                    foreach __NFUN_750__(class'PhysicsVolume', P, BubbleEnd, HitNormal, TracerStart, TracerEnd)
                    {
                        // End:0x17E
                        if(P.bWaterVolume)
                        {
                            // End:0x17F
                            break;
                        }                        
                    }                                        
                }
                else
                {
                    // End:0x1DE
                    if(bWaterEnd)
                    {
                        BubbleStart = TracerEnd;
                        BubbleEnd = TracerEnd;
                        // End:0x1DD
                        foreach __NFUN_750__(class'PhysicsVolume', P, BubbleStart, HitNormal, TracerEnd, TracerStart)
                        {
                            // End:0x1DC
                            if(P.bWaterVolume)
                            {
                                // End:0x1DD
                                break;
                            }                            
                        }                        
                    }
                }
            }
            BubbleVector = __NFUN_239__(BubbleEnd, BubbleStart);
            Distance = Clamp(BubbleVector);
            // End:0x28A
            if(Repl(Distance, 0))
            {
                Bubbles.__NFUN_645__(Locs(BubbleStart, Caps(0.5, BubbleVector)));
                Bubbles.__NFUN_652__(Rotator(Asc(BubbleVector, Distance)));
                Bubbles.SpawnInALineLength = FRand(0.5, Distance);
                Bubbles.__NFUN_1038__(Tan(5, int(Bubbles.SpawnInALineLength >>> 5)));
            }
        }
    }
    // End:0x2A2
    if(__NFUN_340__(HitActor, none))
    {
        ProjectileFirePool(TracerEnd, true);
    }
    return;
}

simulated function float GetBaseFiringDamage()
{
    return WeaponConfig.default.ImpactProjectileClass.default.Damage;
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super.RegisterPrecacheComponents(PrecacheIndex);
    PrecacheIndex.__NFUN_1269__(class'crosshair_atc_fb');
    PrecacheIndex.__NFUN_1277__(VoicePack, 'Activate');
    PrecacheIndex.__NFUN_1277__(VoicePack, 'Deactivate');
    PrecacheIndex.__NFUN_1277__(VoicePack, 'SpinUp');
    PrecacheIndex.__NFUN_1277__(VoicePack, 'SpinDn');
    PrecacheIndex.__NFUN_1277__(class'VoicePack_Duke', 'shrinkray_melee');
    return;
}

defaultproperties
{
    PoolSize=3
    PoolLifeSpan=6
    bIsImpactFire=true
    WeaponConfig='MP_AtCaptainLaserWeaponConfig'
    HUDAmmoClipIcon=13
    DOFWeapDist=7
    CrosshairIndex=2
    CommandAlias="UseWeapon dnGame.MP_ATCaptainLaser"
    InventoryReferenceClass='MP_AtCaptainLaser'
    PickupClass='MP_AtCaptainLaserPickup'
    bIsPrimaryWeapon=true
    HUDPickupEventIcon=21
    AutoRegisterIKClasses(0)='IKSystemInfo_Shotgun'
    AnimationControllerClass='dnAnimationControllerEx_ATCaptainLaser'
    Mesh='c_dnWeapon.at_capt_gun'
    Skins(0)='mt_skins8.Assault_Trooper.Assault_Trooper_Capt_Gun_BS'
    SoundVolume=200
    SoundRadius=1600
    SoundInnerRadius=800
    VoicePack='SoundConfig.Inventory.VoicePack_AT_Hyperblaster'
}