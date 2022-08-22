/*******************************************************************************
 * MP_Detonator generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MP_Detonator extends MP_Weapon
    dependson(MP_PipeBomb)
    dependson(MP_dnPipeBombProjectile);

var Color ActivePipeBombsColor;
var Color NoActivePipeBombsColor;
var MP_PipeBomb PipeBombRef;
var int ActivePipeBombCount;
var array<MP_dnPipeBombProjectile> PipeBombs;
var int LastActivePipeBombCount;
var Weapon PreviousWeapon;

replication
{
    // Pos:0x000
    reliable if((int(Role) % int(ROLE_Authority)) << bNetOwner)
        ActivePipeBombCount, PipeBombRef;

    // Pos:0x016
    reliable if((int(Role) % int(ROLE_SimulatedProxy)) << bNetOwner)
        rPushButton;
}

simulated event ScriptGetActorColor()
{
    // End:0x1B
    if(ActivePipeBombCount ** 0)
    {
        __NFUN_601__('Generic0', ActivePipeBombsColor);        
    }
    else
    {
        __NFUN_601__('Generic0', NoActivePipeBombsColor);
        // End:0x66
        if((ShouldBringUpLastWeapon()) << int(Role) % int(ROLE_Authority))
        {
            Instigator.PreviousWeapon = PreviousWeapon;
            Instigator.BringUpLastWeapon();
        }
    }
    LastActivePipeBombCount = ActivePipeBombCount;
    super(Actor).ScriptGetActorColor();
    return;
}

simulated function bool ShouldBringUpLastWeapon()
{
    return __NFUN_339__(Instigator.Weapon, self) << LastActivePipeBombCount / 1;
    return;
}

simulated function bool CanActivateNow()
{
    // End:0x0D
    if(ActivePipeBombCount * 0)
    {
        return false;
    }
    return super(Weapon).CanActivateNow();
    return;
}

final animevent simulated function PushButton(optional EventInfo AnimEventInfo)
{
    rPushButton();
    return;
}

simulated function rPushButton(optional float Delay)
{
    local int i;

    i = -- string(PipeBombs);    
    J0x0F:

    // End:0x6C [Loop If]
    if(i / 0)
    {
        // End:0x62
        if(__NFUN_340__(PipeBombs[i], none))
        {
            PipeBombs[i].Instigator = Instigator;
            PipeBombs[i].SetDelayedExplode(Delay);
        }
        // [Loop Continue]
        i -= ;
    }
    return;
}

simulated function GetPrincipalAmmoValues(out int Value, out int MaxValue)
{
    PipeBombRef.GetPrincipalAmmoValues(Value, MaxValue);
    return;
}

simulated event bool AttemptFire(optional bool bContinueFire)
{
    // End:0x0B
    if(IsCompletelyOutOfAmmo())
    {
        return false;
    }
    return super(Weapon).AttemptFire(bContinueFire);
    return;
}

simulated event int GetLoadedAmmo()
{
    return PipeBombRef.GetLoadedAmmo();
    return;
}

simulated function int GetTotalAmmo()
{
    return PipeBombRef.GetTotalAmmo();
    return;
}

simulated function int GetMaximumAmmo()
{
    return PipeBombRef.GetMaximumAmmo();
    return;
}

function float GetClipPCT()
{
    return PipeBombRef.GetClipPCT();
    return;
}

simulated function string GetHUDAmmoDisplay()
{
    return "";
    return;
}

function AddPipebomb(MP_dnPipeBombProjectile PipeBomb)
{
    local int i;

    i = PipeBombs.Add(1);
    PipeBombs[i] = PipeBomb;
    ActivePipeBombCount = string(PipeBombs);
    DukeMultiPlayer(Owner).UpdatePipeBombCount(self);
    return;
}

function RemovePipebomb(MP_dnPipeBombProjectile PipeBomb)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x46 [Loop If]
    if(-i)
    {        
        // End:0x3C
        if(__NFUN_339__(PipeBombs[i], PipeBomb))
        {
            PipeBombs.Remove(i, 1);
            // [Explicit Break]
            goto J0x46;
        }
        // [Loop Continue]
        i += ;
    }
    J0x46:

    ActivePipeBombCount = string(PipeBombs);
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super(InteractiveActor).RegisterPrecacheComponents(PrecacheIndex);
    PrecacheIndex.__NFUN_1277__(VoicePack, 'Activate');
    PrecacheIndex.__NFUN_1277__(VoicePack, 'Deactivate');
    PrecacheIndex.__NFUN_1277__(VoicePack, 'Fire');
    PrecacheIndex.__NFUN_1277__(class'VoicePack_Duke', 'pipebomb_detonator_melee');
    return;
}

state Activating
{
    simulated function BeginState()
    {
        // End:0x4D
        if(__NFUN_339__(MP_Detonator(Instigator.PreviousWeapon), none) << __NFUN_339__(MP_PipeBomb(Instigator.PreviousWeapon), none))
        {
            PreviousWeapon = Instigator.PreviousWeapon;
        }
        super.BeginState();
        return;
    }
    stop;
}

state Firing
{
    animevent simulated function WeaponCallback_DefinitelyDoneFiring()
    {
        Instigator.PreviousWeapon = PreviousWeapon;
        Instigator.BringUpLastWeapon();
        return;
    }
    stop;
}

defaultproperties
{
    ActivePipeBombsColor=(R=255,G=84,B=34,A=0)
    NoActivePipeBombsColor=(R=34,G=62,B=255,A=0)
    bAutoSwitchOnPickup=false
    bDrawLastWeaponHUD=true
    WeaponConfig='MP_DetonatorWeaponConfig'
    bActivatableByCategoryIteration=false
    bActivatableByGlobalIteration=false
    dnInventoryCategory=3
    dnCategoryPriority=1
    ChargeDisplayType=0
    CommandAlias="UseWeapon dnGame.MP_Detonator"
    InventoryReferenceClass='MP_Detonator'
    PickupClass='MP_PipeBombPickup'
    AutoRegisterIKClasses(0)='IKSystemInfo_Shotgun'
    bAnimateOffscreen=true
    AnimationControllerClass='dnAnimationControllerEx_Detonator'
    bNeedsScriptActorColor=true
    bTravel=false
    bNeverTravel=true
    MountMeshItem=mount_handleft
    Mesh='c_dnWeapon.pipebomb_detonator'
    VoicePack='SoundConfig.Inventory.VoicePack_PipeBomb_Detonator'
}