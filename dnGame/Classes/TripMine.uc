/*******************************************************************************
 * TripMine generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class TripMine extends Weapon
	dependson(LaserMine_Thrown);

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

simulated function bool CanActivate()
{
	return __NFUN_148__(__NFUN_148__(bActivatable, __NFUN_339__(Instigator.CarriedActor, none)), __NFUN_200__(UseDelayTime, Level.GameTimeSeconds));
	return;
}

simulated function bool CheckInRange()
{
	local Vector Start, Forward, End;
	local STraceFlags TraceFlags;

	Instigator.GetWeaponAim(Start, Forward);
	End = __NFUN_238__(Start, __NFUN_234__(Forward, Instigator.UseDistance));
	TraceFlags.bTraceActors = true;
	TraceFlags.bMeshAccurate = true;
	TraceFlags.bShotTrace = true;
	TraceFlags.bTraceTexture = true;
	__NFUN_736__(Start, End, TraceFlags, PlacementTraceResult);
	return CanAcceptMinePlacement(PlacementTraceResult);
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
	if(__NFUN_148__(__NFUN_339__(HitActor, Level), __NFUN_145__(HitActor.BSPSurfaceIsValidForMineAttachment(HitResult.BSPSurfIndex))))
	{
		return false;
	}
	// End:0x7A
	if(__NFUN_173__(int(Level.NetMode), int(NM_Standalone)))
	{
		return HitActor.bAcceptMines;
	}
	return HitActor.bAcceptMinesInMultiplayer;
	return;
}

simulated function name GetWeaponAnimReq(byte WeaponStateReq, optional out byte byForceReset)
{
	// End:0x1F
	if(__NFUN_148__(__NFUN_173__(int(WeaponState), int(1)), bArmed))
	{
		return 'ActivateArmed';
	}
	// End:0x3E
	if(__NFUN_148__(__NFUN_173__(int(WeaponState), int(2)), IsCompletelyOutOfAmmo()))
	{
		return 'DeactivateAfterPlace';
	}
	return super.GetWeaponAnimReq(WeaponStateReq, byForceReset);
	return;
}

simulated function bool CanFire()
{
	return __NFUN_148__(super.CanFire(), __NFUN_340__(Instigator, none));
	return;
}

simulated function FireSuccess(optional bool bContinueFire)
{
	Fire_Effects();
	__NFUN_590__(true);
	super.FireSuccess(bContinueFire);
	// End:0x3E
	if(__NFUN_174__(int(Level.NetMode), int(NM_Client)))
	{
		Instigator.BringUpLastWeapon();
	}
	UseDelayTime = __NFUN_198__(Level.GameTimeSeconds, 0.6);
	return;
}

function AdjustProjectileSpawn(out Vector SpawnLocation, out Rotator SpawnRotation)
{
	bPlacingMine = CheckInRange();
	// End:0xCA
	if(bPlacingMine)
	{
		// End:0x67
		if(__NFUN_145__(CanAcceptMinePlacement(PlacementTraceResult)))
		{
			Warn(__NFUN_302__("attempting to place on non-accepting actor ", string(PlacementTraceResult.Actor)));
		}
		SpawnLocation = PlacementTraceResult.Location;
		SpawnRotation = Rotator(PlacementTraceResult.Normal);
		// End:0xC7
		if(__NFUN_204__(__NFUN_211__(PlacementTraceResult.Normal.Z), 1))
		{
			SpawnRotation.Yaw = __NFUN_166__(Instigator.Rotation.Yaw, 32768);
		}		
	}
	else
	{
		__NFUN_249__(SpawnLocation, __NFUN_241__(__NFUN_232__(Instigator.CollisionRadius, 0, 0), Instigator.Rotation));
		SpawnRotation = __NFUN_269__(__NFUN_265__(0, 32768, 0), SpawnRotation);
	}
	return;
}

function SetupProjectile(Projectile Proj)
{
	local LaserMine_Thrown LaserMineProj;
	local Vector TargetLocationRelative, StartingLocationAbsolute;
	local Rotator TargetRotationRelative, StartingRotationAbsolute;

	LaserMineProj = LaserMine_Thrown(Proj);
	// End:0x4C
	if(__NFUN_339__(LaserMineProj, none))
	{
		Warn("spawned non-lasermine-projectile class");
		return;
	}
	LaserMineProj.rInitializeMotionCustom();
	// End:0x69
	if(__NFUN_145__(bPlacingMine))
	{
		return;
	}
	// End:0x101
	if(__NFUN_148__(__NFUN_148__(__NFUN_340__(__NFUN_568__(), none), __NFUN_170__(string(WeaponConfig.default.MuzzleInfo), 0)), __NFUN_342__(WeaponConfig.default.MuzzleInfo[0].MuzzleBoneName, 'None')))
	{
		StartingLocationAbsolute = __NFUN_568__().__NFUN_533__(WeaponConfig.default.MuzzleInfo[0].MuzzleBoneName, true);
		StartingRotationAbsolute = __NFUN_568__().__NFUN_534__(WeaponConfig.default.MuzzleInfo[0].MuzzleBoneName, true);		
	}
	else
	{
		StartingLocationAbsolute = Location;
		StartingRotationAbsolute = Rotation;
	}
	LaserMineProj.rThrownMineAttach(StartingLocationAbsolute, StartingRotationAbsolute, LaserMineProj.Location, LaserMineProj.Rotation, PlacementTraceResult.Actor, PlacementTraceResult.MeshBone);
	StartWeaponViewKick(PlayerPawn(Owner));
	super.SetupProjectile(Proj);
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super(InteractiveActor).RegisterPrecacheComponents(PrecacheIndex);
	// End:0x45
	if(PrecacheIndex.__NFUN_1285__(self))
	{
		PrecacheIndex.__NFUN_1269__(class'hud_tm_upper_right');
		PrecacheIndex.__NFUN_1277__(VoicePack, 'Toss');
	}
	return;
}

state Firing
{
	animevent simulated function WeaponCallback_DefinitelyDoneFiring()
	{
		bArmed = false;
		Instigator.BringUpLastWeapon();
		return;
	}
	stop;
}

state Activating
{
	simulated function DoneActivating()
	{
		super.DoneActivating();
		Fire();
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
	WeaponConfig='TripMineWeaponConfig'
	HUDAmmoClipIcon=9
	bActivatableByCategoryIteration=false
	bActivatableByGlobalIteration=false
	dnInventoryCategory=3
	dnCategoryPriority=2
	CommandAlias="UseWeapon dnGame.TripMine"
	InventoryReferenceClass='TripMine'
	PickupClass='TripMinePickup'
	HUDPickupEventIcon=7
	AutoRegisterIKClasses(0)='IKSystemInfo_Shotgun'
	AnimationControllerClass='dnAnimationControllerEx_TripMine'
	CollisionHeight=8
	Mesh='c_dnWeapon.TripMine'
	SoundVolume=200
	SoundRadius=1600
	SoundInnerRadius=800
	VoicePack='SoundConfig.Inventory.VoicePack_TripMine'
}