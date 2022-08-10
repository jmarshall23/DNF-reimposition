struct SWeaponCfg
{
	var class<Weapon> Wpn;
	var bool ChargeWeapon;
	var float WeaponChargeTime;
	var float Min;
	var float Max;
	var float IdealMin;
	var float IdealMax;
	var int ReloadThresh;
	var int MinShots;
	var int RndShots;
	var float MinVolleyInterval;
	var float RndVolleyInterval;
	var Vector StandingFireOffset;
	var Vector CrouchingFireOffset;
	var Vector ProneFireOffset;
	var Vector PipeBombFireOffset;
	var bool HideWhenMultipleHolstered;
	var float ActionPointDistance;
	var AIActor.EAIWeaponClearShotType ClearShotRequirement;
	var bool MeleeFrozenTargets;
};