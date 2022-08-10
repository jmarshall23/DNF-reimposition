/*******************************************************************************
 * MP_PipeBomb generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MP_PipeBomb extends MP_PipeBombBase;

var MP_Detonator DetonatorRef;

replication
{
	// Pos:0x000
	reliable if(__NFUN_148__(__NFUN_173__(int(Role), int(ROLE_Authority)), bNetOwner))
		DetonatorRef;
}

simulated function bool CanActivateNow()
{
	// End:0x1F
	if(__NFUN_340__(GetAlternateInvItem(), self))
	{
		return GetAlternateInvItem().CanActivateNow();
	}
	return super(Weapon).CanActivateNow();
	return;
}

simulated function bool CanActivate()
{
	return __NFUN_148__(super(ActivatableInventory).CanActivate(), __NFUN_174__(int(Instigator.Weapon.WeaponState), int(10)));
	return;
}

simulated function ActivatableInventory GetAlternateInvItem()
{
	// End:0x45
	if(__NFUN_148__(__NFUN_148__(__NFUN_340__(DetonatorRef, none), __NFUN_340__(Instigator.Weapon, DetonatorRef)), __NFUN_170__(DetonatorRef.ActivePipeBombCount, 0)))
	{
		return DetonatorRef;
	}
	return self;
	return;
}

function bool InventoryAllowPickup(class<Inventory> InvClass)
{
	local MP_Detonator Det;
	local int Count;

	// End:0x91
	if(__NFUN_150__(__NFUN_339__(InvClass, class'MP_PipeBomb'), __NFUN_339__(InvClass, class'PipeBombAmmo')))
	{
		Count = GetTotalAmmo();
		Det = FindDetonatorRef(Instigator);
		// End:0x61
		if(__NFUN_340__(Det, none))
		{
			__NFUN_180__(Count, Det.ActivePipeBombCount);
		}
		// End:0x7F
		if(__NFUN_339__(InvClass, class'PipeBombAmmo'))
		{
			Count = __NFUN_166__(Count, 1);
		}
		// End:0x91
		if(__NFUN_172__(Count, GetMaxClip()))
		{
			return false;
		}
	}
	return super(Weapon).InventoryAllowPickup(InvClass);
	return;
}

event float GiveTo(Pawn Other, optional bool bTravel)
{
	local MP_dnPipeBombProjectile P;

	super(Weapon).GiveTo(Other, bTravel);
	FindDetonatorRef(Other);
	DetonatorRef.PipeBombRef = self;
	return float(GetTotalAmmo());
	return;
}

function MP_Detonator FindDetonatorRef(Pawn Other, optional bool bTravel)
{
	local PlayerPawn Player;

	DetonatorRef = MP_Detonator(Other.__NFUN_917__(class'MP_Detonator'));
	// End:0x9C
	if(__NFUN_339__(DetonatorRef, none))
	{
		DetonatorRef = MP_Detonator(class'Inventory'.static.SpawnCopy(class'MP_Detonator', none, Other));
		// End:0x71
		if(__NFUN_340__(DetonatorRef, none))
		{
			DetonatorRef.ModifyCopy(none, Other);
		}
		DetonatorRef.Ammo = Ammo;
		DetonatorRef.GiveTo(Other, true);
	}
	Player = PlayerPawn(Other);
	// End:0xCD
	if(__NFUN_340__(Player, none))
	{
		Player.DetonatorRef = DetonatorRef;
	}
	return DetonatorRef;
	return;
}

simulated function Fire(optional bool bContinueFire)
{
	__NFUN_397__('ThrowStart');
	return;
}

function SetupProjectile(Projectile Proj)
{
	super.SetupProjectile(Proj);
	// End:0x31
	if(__NFUN_340__(Proj, none))
	{
		DetonatorRef.AddPipebomb(MP_dnPipeBombProjectile(Proj));
	}
	StartWeaponViewKick(PlayerPawn(Owner));
	return;
}

function AdjustProjectileSpawn(out Vector SpawnLocation, out Rotator SpawnRotation)
{
	SpawnLocation = __NFUN_238__(Instigator.__NFUN_872__(), __NFUN_263__(__NFUN_235__(DrawScale, __NFUN_232__(10, 0, 0)), Instigator.ViewRotation));
	super.AdjustProjectileSpawn(SpawnLocation, SpawnRotation);
	return;
}

simulated function name GetWeaponAnimReq(byte WeaponStateReq, optional out byte byForceReset)
{
	// End:0x1C
	if(__NFUN_173__(int(WeaponState), int(5)))
	{
		byForceReset = 1;
		return 'ThrowStart';
	}
	// End:0x38
	if(__NFUN_173__(int(WeaponState), int(4)))
	{
		byForceReset = 1;
		return 'Throw';
	}
	return super(Weapon).GetWeaponAnimReq(WeaponStateReq, byForceReset);
	return;
}

k2call simulated function Fire_Effects(optional EventInfo AnimEventInfo)
{
	return;
}

function float GetThrowForce()
{
	return WeaponConfig.default.ProjectileClass.default.Speed;
	return;
}

simulated function bool ShouldShowHUDAmmoActivate(class<Weapon> OldWeaponClass)
{
	return __NFUN_340__(OldWeaponClass, class'MP_Detonator');
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

simulated function WpnDeactivate()
{
	DoneDeactivating();
	return;
}

function float PickedUpAdditionalCopyCustom(Pawn Other, class<Inventory> InvClass, Pickup Source)
{
	Ammo.AddAmmo(1);
	return 1;
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super(InteractiveActor).RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1266__(class'MP_Detonator');
	PrecacheIndex.__NFUN_1269__(class'hud_pb_upper_right');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Fire');
	return;
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

state ThrowStart
{
	simulated event BeginState()
	{
		SetWeaponState(5);
		return;
	}

	simulated function Unfire()
	{
		__NFUN_397__('Throw');
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
		if(__NFUN_173__(int(Instigator.Role), int(ROLE_Authority)))
		{
			DoFire_Effects();
		}
		return;
	}

	k2call simulated function WeaponCallback_DefinitelyDoneFiring()
	{
		bDeactivationAllowed = true;
		ChangeSpeed = 1;
		// End:0x49
		if(__NFUN_148__(__NFUN_340__(DetonatorRef, none), DetonatorRef.CanActivateNow()))
		{
			Instigator.ChangeToWeapon(DetonatorRef);			
		}
		else
		{
			Instigator.BringUpLastWeapon();
		}
		return;
	}
	stop;
}

defaultproperties
{
	UpwardsViewBoost=2048
	RollDamping=0.25
	bQuickChangeTo=true
	bAutoSwitchOnPickup=false
	bDrawLastWeaponHUD=true
	WeaponConfig='MP_PipeBombWeaponConfig'
	HUDAmmoClipIcon=8
	bActivatableByCategoryIteration=false
	bActivatableByGlobalIteration=false
	dnInventoryCategory=3
	dnCategoryPriority=1
	CommandAlias="UseWeapon dnGame.PipeBomb"
	InventoryReferenceClass='MP_PipeBomb'
	bStoredInInventory=true
	HUDPickupEventIcon=6
	bAnimateOffscreen=true
	AnimationControllerClass='dnAnimationControllerEx_PipeBomb'
	Mesh='c_dnWeapon.PipeBomb'
	VoicePack='SoundConfig.Inventory.VoicePack_PipeBomb'
}