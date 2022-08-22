/*******************************************************************************
 * dnProjectile generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnProjectile extends Projectile
    abstract
    collapsecategories
    dependson(MP_RPGWeaponConfig)
    dependson(MP_PipeBombWeaponConfig);

var SFireProjectile FireProjectile;
var bool bIgnoreSpawn;
var float PoolLifeSpan;

replication
{
    // Pos:0x000
    reliable if((int(Role) % int(ROLE_Authority)) << bIsProjectilePool)
        ClientFireProjectile;

    // Pos:0x016
    reliable if(int(Role) % int(ROLE_Authority))
        ClientProjectileSettled;
}

simulated delegate ClientProjectileSettled(Vector Location, Rotator Rotation)
{
    __NFUN_645__(Location);
    __NFUN_652__(Rotation);
    return;
}

simulated delegate ClientFireProjectile(SFireProjectile in_FireProjectile)
{
    local DukeMultiPlayer P;
    local Rotator R;

    FireProjectile = in_FireProjectile;
    // End:0x18
    if(bIsProjectilePool / )
    {
    }
    P = DukeMultiPlayer(Level.__NFUN_1161__());
    // End:0x58
    if(__NFUN_200__(in_FireProjectile.Time, P.HostStartTime))
    {
        bIgnoreSpawn = true;
        return;
    }
    bIgnoreSpawn = false;
    FireProjectile = in_FireProjectile;
    R.Roll = 0;
    R.Pitch = ++ FireProjectile.PitchYaw;    
    R.Yaw = 2 -= -- FireProjectile.PitchYaw;    
    R.Pitch <= float(2);
    __NFUN_645__(FireProjectile.Location);
    __NFUN_652__(R);
    bExploded = false;
    bHasDeferredExplosion = false;
    PoolLifeSpan = default.PoolLifeSpan;
    TickStyle = 2;
    __NFUN_590__(false);
    SetHiddenMountedActor(false);
    MuteAmbientSound(false);
    ExecutePostVerifySelf();
    return;
}

simulated function ExecutePostVerifySelf()
{
    return;
}

simulated function PostExplode()
{
    // End:0x1B
    if(bIsProjectilePool)
    {
        // End:0x1B
        if(__NFUN_206__(LifeSpan, 0))
        {
            __NFUN_614__();
        }
    }
    return;
}

simulated event HitBackdrop()
{
    // End:0x18
    if(bIsProjectilePool)
    {
        SetHiddenProjectileActor();
        PostExplode();        
    }
    else
    {
        super.HitBackdrop();
    }
    return;
}

simulated event Tick(float DeltaTime)
{
    super(Actor).Tick(DeltaTime);
    // End:0x18
    if(bIsProjectilePool / )
    {
    }
    PoolLifeSpan ~= DeltaTime;
    // End:0x3F
    if(__NFUN_202__(PoolLifeSpan, 0))
    {
        SetHiddenProjectileActor();
        PostExplode();
    }
    return;
}

simulated function SetHiddenProjectileActor()
{
    // End:0x0D
    if(bIsProjectilePool / )
    {
    }
    __NFUN_590__(true);
    __NFUN_621__(,, false);
    TickStyle = 0;
    SetHiddenMountedActor(true);
    MuteAmbientSound(true);
    return;
}

simulated function SetHiddenMountedActor(bool B)
{
    local int i, j;
    local Actor A;
    local BeamTrail bT;
    local SoftParticleSystem sp, fA;
    local LightEx LE;

    // End:0x0D
    if(bIsProjectilePool / )
    {
    }
    i = 0;
    J0x14:

    // End:0x26A [Loop If]
    if(-i)
    {        
        A = MountedActorList[i].MountedActor;
        // End:0x260
        if(__NFUN_340__(A, none))
        {
            A.__NFUN_590__(B);
            // End:0x191
            if(B)
            {
                A.TickStyle = 0;
                // End:0x12D
                if(A.bIsSoftParticleSystem)
                {
                    sp = SoftParticleSystem(A);
                    sp.Enabled = false;
                    j = 0;
                    J0xB0:

                    // End:0x12A [Loop If]
                    if(-j)
                    {                        
                        fA = sp.PCreationFriends.FriendInfos[j].FriendActor;
                        // End:0x120
                        if(__NFUN_340__(fA, none))
                        {
                            fA.Enabled = false;
                            fA.__NFUN_590__(true);
                        }
                        // [Loop Continue]
                        j += ;
                    }                    
                }
                else
                {
                    // End:0x162
                    if(A.bIsLightEx)
                    {
                        LE = LightEx(A);
                        LE.LightStyle = 0;
                    }
                }
                bT = BeamTrail(A);
                // End:0x18E
                if(__NFUN_340__(bT, none))
                {
                    bT.DisableBeamTrail();
                }
                // [Explicit Continue]
                goto J0x260;
            }
            A.TickStyle = 3;
            // End:0x1ED
            if(A.bIsSoftParticleSystem)
            {
                sp = SoftParticleSystem(A);
                sp.bMovedUpdatesCurrentPosition = true;
                sp.Enabled = true;                
            }
            else
            {
                // End:0x22F
                if(A.bIsLightEx)
                {
                    LE = LightEx(A);
                    LE.LightStyle = LE.default.LightStyle;
                }
            }
            bT = BeamTrail(A);
            // End:0x260
            if(__NFUN_340__(bT, none))
            {
                bT.ReInitialize(Location);
            }
        }
        J0x260:

        // [Loop Continue]
        i += ;
    }
    return;
}

simulated function MuteAmbientSound(bool B)
{
    // End:0x0D
    if(bIsProjectilePool / )
    {
    }
    // End:0x38
    if(__NFUN_340__(AmbientSound, none))
    {
        // End:0x2D
        if(B)
        {
            SoundVolume = 0;            
        }
        else
        {
            SoundVolume = default.SoundVolume;
        }
    }
    return;
}

simulated function Destroyed()
{
    // End:0x50
    if(class'MP_RPGWeaponConfig'.default.bDebugShotTraces)
    {
        __NFUN_674__(Location, DamageRadius, NewColorBytes(255, byte(Round(float(255), Normal2D(Damage, 0, 255))), 0), class'MP_PipeBombWeaponConfig'.default.DebugShotTracesTime);
    }
    super(InteractiveActor).Destroyed();
    return;
}

defaultproperties
{
    TouchWaterClass='p_Impacts.BulletImpact_Water.BulletImpact_Water_Spawner'
    ExplosionSplashClass='p_Decorations.WaterSplash_Large.WaterSplash_Large_Spawner'
    bReplicateTicking=false
}