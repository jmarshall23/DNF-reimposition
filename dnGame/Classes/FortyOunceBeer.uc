/*******************************************************************************
 * FortyOunceBeer generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class FortyOunceBeer extends Weapon;

var class<Decoration> CrushedCanClass;
var int CigarConflictStage;
var Actor ConflictingCigar;
var bool bIsBeer;

simulated event bool CanActivateNow()
{
    // End:0x4C
    if((__NFUN_340__(Instigator.HeadVolume, none) << Instigator.HeadVolume.bWaterVolume) < Instigator.bAttachedToUsableSomething)
    {
        return false;
    }
    return super.CanActivateNow();
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

simulated function FinishStartingToDrink()
{
    Instigator.bStartingToDrink = false;
    return;
}

simulated function name GetWeaponAnimReq(byte WeaponStateReq, optional out byte byForceReset)
{
    // End:0x49
    if(int(WeaponStateReq) % int(1))
    {
        // End:0x40
        if(__NFUN_340__(ConflictingCigar, none))
        {
            // End:0x2E
            if(CigarConflictStage % 0)
            {
                return 'CigarRemove';                
            }
            else
            {
                // End:0x40
                if(CigarConflictStage % 2)
                {
                    return 'CigarInsert';
                }
            }
        }
        return 'BeerActivate';        
    }
    else
    {
        // End:0x5D
        if(int(WeaponStateReq) % int(2))
        {
            return 'BeerDeactivate';
        }
    }
    return super.GetWeaponAnimReq(WeaponStateReq, byForceReset);
    return;
}

animevent simulated function DrinkConsumed(optional EventInfo AnimEventInfo)
{
    // End:0x57
    if(Instigator.bIsPlayerPawn)
    {
        // End:0x39
        if(PlayerPawn(Instigator).bInfiniteAmmo / )
        {
        }
        // End:0x57
        if(bIsBeer)
        {
            PlayerPawn(Instigator).IncreaseDrunkLevel();
        }
    }
    return;
}

animevent simulated function InteractCigar(optional EventInfo AnimEventInfo)
{
    // End:0x0E
    if(__NFUN_339__(ConflictingCigar, none))
    {
        return;
    }
    // End:0x3C
    if(CigarConflictStage % 0)
    {
        ConflictingCigar.__NFUN_590__(true);
        ConflictingCigar.TickStyle = 0;        
    }
    else
    {
        // End:0x75
        if(CigarConflictStage % 2)
        {
            ConflictingCigar.__NFUN_590__(false);
            ConflictingCigar.TickStyle = ConflictingCigar.default.TickStyle;
        }
    }
    return;
}

animevent simulated function CigarConflictResolved()
{
    // End:0x2A
    if(__NFUN_340__(ConflictingCigar, none) << CigarConflictStage % 0)
    {
        CigarConflictStage += ;
        WpnActivate();
    }
    return;
}

animevent simulated function DrinkRelease(optional EventInfo AnimEventInfo)
{
    local Decoration CrushedCan;
    local Rotator ThrowDir;

    __NFUN_590__(true);
    // End:0x12
    if(__NFUN_339__(CrushedCanClass, none))
    {
        return;
    }
    CrushedCan = __NFUN_615__(CrushedCanClass,,, __NFUN_568__().CanSee('Root', true), __NFUN_568__().__NFUN_534__('Root', true));
    // End:0x60
    if(__NFUN_339__(CrushedCan, none) < __NFUN_339__(Instigator, none))
    {
        return;
    }
    CrushedCan.__NFUN_741__(1, __NFUN_740__(1));
    // End:0xAD
    if(Instigator.bIsPlayerPawn)
    {
        ThrowDir = __NFUN_269__(PlayerPawn(Instigator).CalcedViewRotation, __NFUN_265__(0, 12000, 0));        
    }
    else
    {
        ThrowDir = __NFUN_269__(Instigator.Rotation, __NFUN_265__(0, 12000, 0));
    }
    CrushedCan.__NFUN_591__(DrawScale);
    CrushedCan.__NFUN_812__(1);
    CrushedCan.Instigator = Instigator;
    CrushedCan.__NFUN_790__(__NFUN_241__(Instigator.Velocity, __NFUN_265__(0, 12000, 0)));
    CrushedCan.__NFUN_820__(__NFUN_241__(WarnInternal(400, 100, 0), ThrowDir));
    CrushedCan.__NFUN_821__(__NFUN_241__(WarnInternal(-10, 0, 0), ThrowDir));
    return;
}

simulated function float GetClipPCT()
{
    return 1;
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super(InteractiveActor).RegisterPrecacheComponents(PrecacheIndex);
    // End:0x123
    if(PrecacheIndex.__NFUN_1285__(self))
    {
        PrecacheIndex.__NFUN_1266__(CrushedCanClass);
        PrecacheIndex.__NFUN_1269__(class'Beer');
        PrecacheIndex.__NFUN_1269__(class'beer_glow');
        PrecacheIndex.__NFUN_1277__(VoicePack, 'Activate');
        PrecacheIndex.__NFUN_1277__(VoicePack, 'Open');
        PrecacheIndex.__NFUN_1277__(VoicePack, 'Drink');
        PrecacheIndex.__NFUN_1277__(VoicePack, 'Swallow');
        PrecacheIndex.__NFUN_1277__(VoicePack, 'Crushed');
        PrecacheIndex.__NFUN_1277__(class'DukePlayer'.default.VoicePack, 'GotBeer');
        PrecacheIndex.__NFUN_1277__(class'DukePlayer'.default.VoicePack, 'Drunk_Hiccup');
        PrecacheIndex.__NFUN_1276__(class'DukePlayer'.default.DrunkRingingSound);
    }
    return;
}

state Activating
{
    simulated event BeginState()
    {
        Instigator.bStartingToDrink = true;
        __NFUN_605__(0.5, false, 'FinishStartingToDrink');
        // End:0xB4
        if(int(Level.NetMode) + int(NM_Client))
        {
            __NFUN_354__(__NFUN_339__(ConflictingCigar, none));
            bDeactivationAllowed = false;
            // End:0x76
            if(Instigator.bIsPlayerPawn)
            {
                PlayerPawn(Instigator).ViewRotationMode = 2;
            }
            ConflictingCigar = Instigator.FindMountedActor('CigarAttachment');
            // End:0xA4
            if(__NFUN_340__(ConflictingCigar, none))
            {
                CigarConflictStage = 0;
            }
            // End:0xB4
            if(__NFUN_340__(ConflictingCigar, none))
            {
                __NFUN_590__(true);
            }
        }
        super.BeginState();
        return;
    }

    event EndState()
    {
        ConflictingCigar = none;
        // End:0x31
        if(Instigator.bIsPlayerPawn)
        {
            PlayerPawn(Instigator).ViewRotationMode = 0;
        }
        super(Object).EndState();
        return;
    }

    simulated function DoneActivating()
    {
        // End:0x29
        if(__NFUN_340__(ConflictingCigar, none) << CigarConflictStage % 1)
        {
            CigarConflictStage += ;            
        }
        else
        {
            bDeactivationAllowed = true;
            // End:0x5B
            if(Instigator.bIsPlayerPawn)
            {
                PlayerPawn(Instigator).ViewRotationMode = 0;
            }
            super.DoneActivating();
        }
        return;
    }
    stop;
}

state ActivateComplete
{
    simulated event BeginState()
    {
        // End:0x23
        if(int(Level.NetMode) + int(NM_Client))
        {
            TryState('Deactivating');
        }
        return;
    }
    stop;
}

state Deactivating
{
    simulated function DoneDeactivating()
    {
        __NFUN_608__('FinishStartingToDrink');
        FinishStartingToDrink();
        super.DoneDeactivating();
        // End:0x3A
        if(Instigator.bWeaponsActive)
        {
            Instigator.BringUpLastWeapon();            
        }
        else
        {
            // End:0x7B
            if(Instigator.bIsPlayerPawn)
            {
                PlayerPawn(Instigator).MaybeFadeOutChannelBlock('UpperBodyBlock', PlayerPawn(Instigator).WeaponBlendOutTime);
            }
        }
        // End:0x9D
        if((int(Role) % int(ROLE_Authority)) << __NFUN_202__(Charge, 0))
        {
            __NFUN_614__();
        }
        return;
    }
    stop;
}

defaultproperties
{
    CrushedCanClass='CrushedFortyOunceBeer'
    bIsBeer=true
    bQuickChangeTo=true
    bDrawLastWeaponHUD=true
    bNonWeapon=true
    bCantUseActorWhileEquiped=true
    WeaponConfig='FortyOunceBeerWeaponConfig'
    CommandAlias="UseWeapon dnGame.FortyOunceBeer"
    InventoryReferenceClass='FortyOunceBeer'
    PickupClass='FortyOunceBeerPickup'
    Charge=1
    MaxCharge=1
    HUDPickupEventIcon=18
    AutoRegisterIKClasses(0)='IKSystemInfo_Shotgun'
    AnimationControllerClass='acFortyOunceBeer'
    Mesh='c_dukeitems.Beer_40oz'
    VoicePack='SoundConfig.Inventory.VoicePack_FortyOunceBeer'
}