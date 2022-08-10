/*******************************************************************************
 * MP_MachineGun generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MP_MachineGun extends MP_dnContinuousFireWeapon;

var float BaseDamagePerShot;
var float StartingHorizShotError;
var float StartingVertShotError;
var float LastShotTime;
var float ErrorDeltaPerc;
var float MaxShotErrorTime;
var float ErrorGainPerShotPerc;
var int LastWeaponSeed;

simulated function float GetBaseFiringDamage()
{
	return __NFUN_195__(Instigator.TraceFireDamageMultiplier, BaseDamagePerShot);
	return;
}

simulated event GetShotError(out float HorizShotError, out float VertShotError)
{
	local float ErrorPercLoss, TimeSeconds;
	local PlayerPawn l_Pawn;

	l_Pawn = PlayerPawn(Instigator);
	// End:0xBC
	if(__NFUN_148__(__NFUN_340__(l_Pawn, none), __NFUN_174__(LastWeaponSeed, l_Pawn.WeaponSeed)))
	{
		LastWeaponSeed = l_Pawn.WeaponSeed;
		TimeSeconds = __NFUN_195__(float(l_Pawn.WeaponSeed), 0.001);
		ErrorPercLoss = __NFUN_196__(__NFUN_199__(TimeSeconds, LastShotTime), MaxShotErrorTime);
		__NFUN_209__(ErrorDeltaPerc, ErrorPercLoss);
		__NFUN_210__(ErrorDeltaPerc, ErrorGainPerShotPerc);
		ErrorDeltaPerc = __NFUN_227__(ErrorDeltaPerc, 0, 1);
		LastShotTime = TimeSeconds;
	}
	HorizShotError = __NFUN_228__(ErrorDeltaPerc, WeaponConfig.default.HorizShotError, StartingHorizShotError);
	VertShotError = __NFUN_228__(ErrorDeltaPerc, WeaponConfig.default.VertShotError, StartingVertShotError);
	// End:0x13D
	if(Instigator.IsZoomedIn())
	{
		__NFUN_207__(HorizShotError, WeaponConfig.default.ZoomErrorPct);
		__NFUN_207__(VertShotError, WeaponConfig.default.ZoomErrorPct);
	}
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super.RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1269__(class'crosshair_ripper_fb');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Activate');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Deactivate');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'ClipIn');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'ClipOut');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Slide_Bck');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Slide_Fwd');
	PrecacheIndex.__NFUN_1277__(class'VoicePack_Duke', 'machinegun_melee');
	return;
}

defaultproperties
{
	BaseDamagePerShot=18
	MaxShotErrorTime=2
	ErrorGainPerShotPerc=0.1
	bFiringSoundForFireStart=true
	WeaponConfig='MP_MachineGunWeaponConfig'
	AmmoLoaded=50
	HUDAmmoClipIcon=2
	DOFWeapDist=9
	DOFWeapDistDelta=2
	CrosshairIndex=6
	FullClipRenderObject='sm_class_dukeitems.Ripper_Ammo.ripper_clip_full'
	EmptyClipRenderObject='sm_class_dukeitems.Ripper_Ammo.ripper_clip_empty'
	UserInsertClipMount=(bDontActuallyMount=false,bHideable=true,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=true,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=true,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=mount_handleft,MountOrigin=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
	WeaponClipMount=(bDontActuallyMount=false,bHideable=true,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=true,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=true,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=mount_magazine,MountOrigin=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
	EmptyClipPhysMaterial='dnMaterial.dnPhysicsMaterial_EmptyClip'
	dnInventoryCategory=2
	dnCategoryPriority=2
	CommandAlias="UseWeapon dnGame.MP_MachineGun"
	InventoryReferenceClass='MP_MachineGun'
	PickupClass='MP_MachineGunPickup'
	bIsPrimaryWeapon=true
	HUDPickupEventIcon=2
	AutoRegisterIKClasses=/* Array type was not detected. */
}