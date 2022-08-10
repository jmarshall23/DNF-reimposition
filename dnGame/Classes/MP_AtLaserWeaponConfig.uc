/*******************************************************************************
 * MP_AtLaserWeaponConfig generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MP_AtLaserWeaponConfig extends MP_WeaponConfig;

defaultproperties
{
	AmmoClass='ATLaserAmmo'
	AdditionalPickupAmmoMin=42
	AdditionalPickupAmmoRnd=18
	TraceDamageType='ATLaserDamage'
	TracerBeamSystemClass='MP_ATLaser_TrailBeam'
	TracerBeamChance=1
	bCheatMuzzleBlockage=true
	ImpactProjectileClass='MP_dnRocket_ATLaser'
	ViewKicks=/* Array type was not detected. */
	RandomSeed=none
}