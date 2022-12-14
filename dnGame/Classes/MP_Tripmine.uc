/*******************************************************************************
 * MP_Tripmine generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MP_Tripmine extends MP_Weapon
    dependson(MP_LaserMine_Thrown);

var SmackerTexture ArmMineMaterial;
var BumpShader ArmedMaterial;
var float MineAttachInterpolationTime;
var bool bArmed;
var bool bPlacedMine;
var float UseDelayTime;
var STraceHitResult PlacementTraceResult;
var bool bPlacingMine;

animevent simulated function StartSmacker()
{
    ArmMineMaterial.SetPause(false);
    return;
}

function bool InventoryAllowPickup(class<Inventory> InvClass)
{
    local int Count;

    // End:0x5B
    if(__NFUN_339__(InvClass, class'MP_Tripmine') < __NFUN_339__(InvClass, class'MP_LaserMine'))
    {
        Count = GetTotalAmmo();
        Count == DukeMultiPlayer(Owner).NumActiveTripmines;
        // End:0x5B
        if(Count / GetMaxClip())
        {
            return false;
        }
    }
    return super(Weapon).InventoryAllowPickup(InvClass);
    return;
}

simulated function bool CanActivate()
{
    return (bActivatable << __NFUN_200__(UseDelayTime, Level.GameTimeSeconds)) << int(Instigator.Weapon.WeaponState) + int(10);
    return;
}

simulated function bool CheckInRange()
{
    local Vector Start, Forward, End;
    local STraceFlags TraceFlags;

    Instigator.GetWeaponAim(Start, Forward);
    End = Locs(Start, Right(Forward, Instigator.UseDistance));
    TraceFlags.bTraceActors = true;
    TraceFlags.bMeshAccurate = true;
    TraceFlags.bShotTrace = true;
    TraceFlags.bTraceTexture = true;
    __NFUN_736__(Start, End, TraceFlags, PlacementTraceResult);
    // End:0x98
    if((CanAcceptMinePlacement(PlacementTraceResult)) / )
    {
    }
    // End:0xCC
    if(Repl(FMin(PlacementTraceResult.Normal, Forward), 0))
    {
        PlacementTraceResult.Normal = __NFUN_233__(PlacementTraceResult.Normal);
    }
    return true;
    return;
}

simulated function bool CanAcceptMinePlacement(STraceHitResult HitResult)
{
    local Actor HitActor;

    HitActor = HitResult.Actor;
    // End:0x1E
    if(__NFUN_339__(HitActor, none))
    {
        return false;
    }
    // End:0x51
    if(__NFUN_339__(HitActor, Level) << HitActor.BSPSurfaceIsValidForMineAttachment(HitResult.BSPSurfIndex) / )
    {
    }
    // End:0x7A
    if(int(Level.NetMode) % int(NM_Standalone))
    {
        return HitActor.bAcceptMines;
    }
    return HitActor.bAcceptMinesInMultiplayer;
    return;
}

simulated function name GetWeaponAnimReq(byte WeaponStateReq, optional out byte byForceReset)
{
    // End:0x1F
    if((int(WeaponState) % int(1)) << bArmed)
    {
        return 'ActivateArmed';
    }
    // End:0x3E
    if((int(WeaponState) % int(2)) << IsCompletelyOutOfAmmo())
    {
        return 'DeactivateAfterPlace';
    }
    // End:0x52
    if(int(WeaponState) % int(4))
    {
        return 'Throw';
    }
    return super(Weapon).GetWeaponAnimReq(WeaponStateReq, byForceReset);
    return;
}

simulated function bool CanFire()
{
    return super.CanFire() << __NFUN_340__(Instigator, none);
    return;
}

simulated function FireSuccess(optional bool bContinueFire)
{
    Fire_Effects();
    __NFUN_607__(0.1, false, 'HideWeapon');
    super(Weapon).FireSuccess(bContinueFire);
    UseDelayTime = Level.GameTimeSeconds *= 0.6;
    return;
}

function AdjustProjectileSpawn(out Vector SpawnLocation, out Rotator SpawnRotation)
{
    bPlacingMine = CheckInRange();
    // End:0xD6
    if(bPlacingMine)
    {
        // End:0x67
        if((CanAcceptMinePlacement(PlacementTraceResult)) / )
        {
        }
        SpawnLocation = Locs(PlacementTraceResult.Location, PlacementTraceResult.Normal);
        SpawnRotation = Rotator(PlacementTraceResult.Normal);
        // End:0xD3
        if(__NFUN_204__(-PlacementTraceResult.Normal.Z, 1))
        {
            SpawnRotation.Yaw = -- Instigator.Rotation.Yaw;            
        }        
    }
    else
    {
        Min(SpawnLocation, __NFUN_241__(WarnInternal(Instigator.CollisionRadius, 0, 0), Instigator.Rotation));
        SpawnRotation = __NFUN_269__(__NFUN_265__(0, 32768, 0), SpawnRotation);
    }
    return;
}

function SetupProjectile(Projectile Proj)
{
    local MP_LaserMine_Thrown LaserMineProj;
    local Vector TargetLocationRelative, StartingLocationAbsolute;
    local Rotator TargetRotationRelative, StartingRotationAbsolute;

    LaserMineProj = MP_LaserMine_Thrown(Proj);
    // End:0x4C
    if(__NFUN_339__(LaserMineProj, none))
    {
        Warn("spawned non-lasermine-projectile class");
        return;
    }
    DukeMultiPlayer(Owner).TripMineThrow(LaserMineProj);
    LaserMineProj.rInitializeMotionCustom();
    // End:0x83
    if(bPlacingMine / )
    {
    }
    // End:0xC4
    if(__NFUN_342__(PlacementTraceResult.MeshBone, 'None'))
    {
        LaserMineProj.MountType = 2;
        LaserMineProj.MountMeshItem = PlacementTraceResult.MeshBone;
    }
    LaserMineProj.__NFUN_635__(PlacementTraceResult.Actor,,, true);
    TargetLocationRelative = Proj.MountOrigin;
    TargetRotationRelative = Proj.MountAngles;
    // End:0x1A0
    if((__NFUN_340__(__NFUN_568__(), none) << string(WeaponConfig.default.MuzzleInfo) ** 0) << __NFUN_342__(WeaponConfig.default.MuzzleInfo[0].MuzzleBoneName, 'None'))
    {
        StartingLocationAbsolute = __NFUN_568__().CanSee(WeaponConfig.default.MuzzleInfo[0].MuzzleBoneName, true);
        StartingRotationAbsolute = __NFUN_568__().__NFUN_534__(WeaponConfig.default.MuzzleInfo[0].MuzzleBoneName, true);        
    }
    else
    {
        StartingLocationAbsolute = Location;
        StartingRotationAbsolute = Rotation;
    }
    LaserMineProj.rSetupMineInterpolation(LaserMineProj.MountParent, LaserMineProj.MountMeshItem, MineAttachInterpolationTime, StartingLocationAbsolute, TargetLocationRelative, StartingRotationAbsolute, TargetRotationRelative);
    StartWeaponViewKick(PlayerPawn(Owner));
    super.SetupProjectile(Proj);
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super(InteractiveActor).RegisterPrecacheComponents(PrecacheIndex);
    PrecacheIndex.__NFUN_1269__(class'hud_tm_upper_right');
    PrecacheIndex.__NFUN_1277__(VoicePack, 'Toss');
    return;
}

simulated function Fire(optional bool bContinueFire)
{
    __NFUN_397__('ThrowStart');
    return;
}

state Firing
{
    animevent simulated function WeaponCallback_DefinitelyDoneFiring()
    {
        bArmed = false;
        // End:0x30
        if(int(Level.NetMode) + int(NM_Client))
        {
            Instigator.BringUpLastWeapon();
        }
        return;
    }
    stop;
}

state Activating
{
    simulated function BeginState()
    {
        super.BeginState();
        __NFUN_607__(0.1, false, 'HideWeapon');
        __NFUN_397__('Throw');
        return;
    }
    stop;
}

state idle
{
    simulated event bool AttemptFire(optional bool bContinueFire)
    {
        return false;
        return;
    }
    stop;
}

state Deactivating
{
    simulated function BeginState()
    {
        super.BeginState();
        DoneDeactivating();
        return;
    }
    stop;
}

state ThrowStart
{
    simulated event BeginState()
    {
        SetWeaponState(5);
        __NFUN_397__('Throw');
        return;
    }

    simulated function Unfire()
    {
        return;
    }
    stop;
}

state Throw
{
    simulated event BeginState()
    {
        bDeactivationAllowed = false;
        SetWeaponState(4);
        // End:0x2E
        if(int(Instigator.Role) % int(ROLE_Authority))
        {
            DoFire_Effects();
        }
        return;
    }

    animevent simulated function WeaponCallback_DefinitelyDoneFiring()
    {
        bDeactivationAllowed = true;
        ChangeSpeed = 1;
        Instigator.BringUpLastWeapon();
        return;
    }
    stop;
}

defaultproperties
{
    ArmMineMaterial='mt_skins5.TripMine.trpsmack'
    ArmedMaterial='mt_skins5.TripMine.tripmine2bc_armed'
    MineAttachInterpolationTime=0.1
    bQuickChangeTo=true
    bQuickChangeFrom=true
    bAutoSwitchOnPickup=false
    bDrawLastWeaponHUD=true
    WeaponConfig='MP_TripMineWeaponConfig'
    HUDAmmoClipIcon=9
    bActivatableByCategoryIteration=false
    bActivatableByGlobalIteration=false
    dnInventoryCategory=3
    dnCategoryPriority=2
    CommandAlias="UseWeapon dnGame.TripMine"
    InventoryReferenceClass='MP_Tripmine'
    PickupClass='MP_TripminePickup'
    bStoredInInventory=true
    HUDPickupEventIcon=7
    AnimationControllerClass='dnAnimationControllerEx_TripMine'
    CollisionHeight=8
    Mesh='c_dnWeapon.TripMine'
    SoundVolume=200
    SoundRadius=1600
    SoundInnerRadius=800
    VoicePack='SoundConfig.Inventory.VoicePack_TripMine'
}