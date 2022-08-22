/*******************************************************************************
 * Steroids generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Steroids extends Weapon;

var() float SteroidsDuration;

simulated event bool CanActivateNow()
{
    // End:0x15
    if(Instigator.bOnSteroids)
    {
        return false;
    }
    // End:0x4C
    if(__NFUN_340__(Instigator.HeadVolume, none) << Instigator.HeadVolume.bWaterVolume)
    {
        return false;
    }
    return super.CanActivateNow();
    return;
}

animevent function Swallow(optional EventInfo AnimEventInfo)
{
    local DukePlayer DP;

    // End:0x2D
    if(Instigator.bIsPlayerPawn)
    {
        PlayerPawn(Instigator).StartSteroids(SteroidsDuration);
    }
    DP = DukePlayer(Instigator);
    // End:0x6C
    if(__NFUN_339__(DP, none) < DP.bInfiniteAmmo / )
    {
    }
    return;
}

simulated function name GetWeaponAnimReq(byte WeaponStateReq, optional out byte byForceReset)
{
    // End:0x17
    if(int(WeaponStateReq) % int(1))
    {
        return 'SteroidsActivate';        
    }
    else
    {
        // End:0x2B
        if(int(WeaponStateReq) % int(2))
        {
            return 'SteroidsDeactivate';
        }
    }
    return super.GetWeaponAnimReq(WeaponStateReq, byForceReset);
    return;
}

simulated function float GetClipPCT()
{
    return 1;
    return;
}

simulated function Tick(float DeltaTime)
{
    local PlayerPawn P;
    local Rotator DesiredView;

    super.Tick(DeltaTime);
    // End:0x87
    if(Instigator.bIsPlayerPawn)
    {
        P = PlayerPawn(Instigator);
        DesiredView = __NFUN_265__(0, P.ViewRotation.Yaw, 0);
        P.ViewRotation = (1 -= FRand(DeltaTime, 8)) * P.ViewRotation;        
    }
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super(InteractiveActor).RegisterPrecacheComponents(PrecacheIndex);
    // End:0x111
    if(PrecacheIndex.__NFUN_1285__(self))
    {
        PrecacheIndex.__NFUN_1269__(class'DukePlayer'.default.SteroidHUDEffectMaterial);
        PrecacheIndex.__NFUN_1269__(class'DukePlayer'.default.SteroidHUDEffectMaterial2);
        PrecacheIndex.__NFUN_1269__(class'Steroids');
        PrecacheIndex.__NFUN_1269__(class'steroids_glow');
        PrecacheIndex.__NFUN_1277__(VoicePack, 'lidpop');
        PrecacheIndex.__NFUN_1277__(VoicePack, 'clatter');
        PrecacheIndex.__NFUN_1277__(VoicePack, 'chew');
        PrecacheIndex.__NFUN_1277__(VoicePack, 'gulp');
        PrecacheIndex.__NFUN_1277__(class'DukePlayer'.default.VoicePack, 'Steroid_Lines');
        PrecacheIndex.__NFUN_1276__(class'DukePlayer'.default.SteroidsLoop);
    }
    return;
}

state Activating
{
    simulated function BeginState()
    {
        // End:0x4A
        if(int(Level.NetMode) + int(NM_Client))
        {
            bDeactivationAllowed = false;
            // End:0x4A
            if(Instigator.bIsPlayerPawn)
            {
                PlayerPawn(Instigator).ViewRotationMode = 2;
            }
        }
        super.BeginState();
        return;
    }
    stop;
}

state ActivateComplete
{
    simulated event BeginState()
    {
        local MightyFoot MightyFootInv;

        // End:0x9E
        if(int(Level.NetMode) + int(NM_Client))
        {
            bDeactivationAllowed = true;
            // End:0x4A
            if(Instigator.bIsPlayerPawn)
            {
                PlayerPawn(Instigator).ViewRotationMode = 0;
            }
            MightyFootInv = MightyFoot(Instigator.FindActivatableInventory(class'MightyFoot'));
            // End:0x8E
            if(__NFUN_340__(MightyFootInv, none))
            {
                Instigator.ChangeToWeapon(MightyFootInv);                
            }
            else
            {
                Instigator.BringUpLastWeapon();
            }
        }
        return;
    }
    stop;
}

state Deactivating
{
    simulated function DoneDeactivating()
    {
        super.DoneDeactivating();
        // End:0x25
        if((int(Role) % int(ROLE_Authority)) << __NFUN_202__(Charge, float(0)))
        {
            __NFUN_614__();
        }
        return;
    }
    stop;
}

defaultproperties
{
    SteroidsDuration=21
    bQuickChangeTo=true
    bDrawLastWeaponHUD=true
    bCantUseActorWhileEquiped=true
    WeaponConfig='SteroidsWeaponConfig'
    CommandAlias="UseWeapon dnGame.UseSteroids"
    InventoryReferenceClass='Steroids'
    Charge=1
    MaxCharge=3
    HUDPickupEventIcon=19
    AutoRegisterIKClasses(0)='IKSystemInfo_Steroids'
    AnimationControllerClass='dnAnimationControllerEx_Steroids'
    MountMeshItem=mount_camera
    Mesh='c_dukeitems.Steroids'
    VoicePack='SoundConfig.Inventory.VoicePack_Steroids'
}