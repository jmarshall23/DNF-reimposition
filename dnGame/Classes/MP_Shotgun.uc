/*******************************************************************************
 * MP_Shotgun generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MP_Shotgun extends MP_Weapon;

var() float BaseDamagePerShot;
var() float HighBaseDamagePerShot;
var() float DamageFalloffStart;
var() float DamageFalloffEnd;
var() StaticMesh ReloadShellRenderObject;
var SMountPrefab UserReloadShellMount;
var WeaponClip ReloadShell;
var float ShrunkDamageModifier;

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	ReloadShell = __NFUN_615__(class'WeaponClip', self);
	// End:0x41
	if(__NFUN_340__(ReloadShell, none))
	{
		ReloadShell.__NFUN_595__(ReloadShellRenderObject);
		ReloadShell.__NFUN_590__(true);
	}
	return;
}

simulated function OnDestroyed()
{
	super.OnDestroyed();
	// End:0x1F
	if(__NFUN_340__(ReloadShell, none))
	{
		ReloadShell.__NFUN_614__();
	}
	return;
}

animevent simulated function Mount_Shell_User(optional EventInfo AnimEventInfo)
{
	// End:0x38
	if(Instigator.bIsPlayerPawn)
	{
		ReloadShell.__NFUN_590__(false);
		ReloadShell.__NFUN_633__(UserReloadShellMount, Instigator);
	}
	return;
}

animevent simulated function Shell_Inserted(optional EventInfo AnimEventInfo)
{
	DisableReloadShell();
	return;
}

final simulated function DisableReloadShell()
{
	ReloadShell.DestroyOnDismount = false;
	ReloadShell.__NFUN_631__();
	ReloadShell.__NFUN_590__(true);
	return;
}

simulated function float GetBaseFiringDamage()
{
	return __NFUN_195__(Instigator.TraceFireDamageMultiplier, BaseDamagePerShot);
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super(InteractiveActor).RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1269__(class'crosshair_shotgun_fb');
	PrecacheIndex.__NFUN_1267__(ReloadShellRenderObject);
	PrecacheIndex.__NFUN_1266__(class'WeaponClip');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Activate');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Deactivate');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Fire');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'ShellEject');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'ReloadShell');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'ReloadCock');
	PrecacheIndex.__NFUN_1277__(class'VoicePack_Duke', 'shotgun_melee');
	return;
}

state Firing
{
	simulated event float GetBaseDamage(Actor Victim, optional Pawn DamageInstigator, optional class<DamageType> DamageType, optional Vector HitDirection, optional Vector HitPosition, optional name BoneName, optional Vector SourceTraceOrigin)
	{
		local float Dist, TraceFireDamageMultiplier, myDrawScale, falloffStart, falloffEnd;

		TraceFireDamageMultiplier = __NFUN_195__(GetTraceFireDamageScale(DamageInstigator, DamageType), Instigator.TraceFireDamageMultiplier);
		// End:0x43
		if(__NFUN_204__(HighBaseDamagePerShot, BaseDamagePerShot))
		{
			return __NFUN_195__(TraceFireDamageMultiplier, BaseDamagePerShot);
		}
		myDrawScale = __NFUN_196__(DamageInstigator.DrawScale, DamageInstigator.default.DrawScale);
		falloffStart = __NFUN_195__(DamageFalloffStart, myDrawScale);
		falloffEnd = __NFUN_195__(DamageFalloffEnd, myDrawScale);
		Dist = __NFUN_251__(__NFUN_239__(SourceTraceOrigin, HitPosition));
		// End:0xC0
		if(__NFUN_202__(Dist, falloffStart))
		{
			return __NFUN_195__(TraceFireDamageMultiplier, HighBaseDamagePerShot);			
		}
		else
		{
			// End:0xDF
			if(__NFUN_203__(Dist, falloffEnd))
			{
				return __NFUN_195__(TraceFireDamageMultiplier, BaseDamagePerShot);				
			}
			else
			{
				return __NFUN_195__(TraceFireDamageMultiplier, __NFUN_228__(__NFUN_196__(__NFUN_199__(Dist, falloffStart), __NFUN_199__(falloffEnd, falloffStart)), HighBaseDamagePerShot, BaseDamagePerShot));
			}
		}
		return;
	}

	animevent simulated function WeaponCallback_MaybeDoneFiring()
	{
		ClearLockout();
		super.WeaponCallback_MaybeDoneFiring();
		return;
	}
	stop;
}

state Reloading
{
	simulated event EndState()
	{
		super.EndState();
		DisableReloadShell();
		return;
	}

	simulated function Fire(optional bool bContinueFire)
	{
		global.Fire();
		return;
	}

	simulated function bool CanFire()
	{
		return global.CanFire();
		return;
	}

	animevent simulated function WeaponCallback_MaybeDoneReloading()
	{
		// End:0x11
		if(__NFUN_145__(AttemptFire()))
		{
			super.WeaponCallback_MaybeDoneReloading();
		}
		return;
	}

	animevent simulated function WeaponCallback_DefinitelyDoneReloading()
	{
		// End:0x11
		if(__NFUN_145__(AttemptFire()))
		{
			super.WeaponCallback_DefinitelyDoneReloading();
		}
		return;
	}
	stop;
}

defaultproperties
{
	HighBaseDamagePerShot=40
	DamageFalloffStart=800
	DamageFalloffEnd=800
	ReloadShellRenderObject='sm_class_dukeitems.ShotGun_Shell_Casing.ShotGunShell_reload'
	UserReloadShellMount=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=mount_handleft,MountOrigin=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
	ShrunkDamageModifier=0.1
	WeaponConfig='MP_ShotgunWeaponConfig'
	AmmoLoaded=7
	HUDAmmoClipIcon=3
	DOFWeapDist=7.5
	DOFWeapDistDelta=1
	CrosshairIndex=7
	dnInventoryCategory=2
	dnCategoryPriority=1
	CommandAlias="UseWeapon dnGame.MP_Shotgun"
	InventoryReferenceClass='MP_Shotgun'
	PickupClass='MP_ShotgunPickup'
	bIsPrimaryWeapon=true
	HUDPickupEventIcon=1
	AutoRegisterIKClasses(0)='IKSystemInfo_Shotgun'
	AnimationControllerClass='dnAnimationControllerEx_Shotgun'
	CollisionRadius=19
	CollisionHeight=6
	Mesh='c_dnWeapon.Shotgun'
	SoundVolume=255
	SoundRadius=3200
	SoundInnerRadius=1600
	VoicePack='SoundConfig.Inventory.VoicePack_Shotgun'
}