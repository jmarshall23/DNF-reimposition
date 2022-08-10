/*******************************************************************************
 * MP_AtCaptainLaserWeaponConfig generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MP_AtCaptainLaserWeaponConfig extends MP_WeaponConfig;

defaultproperties
{
	AmmoClass='ATCaptainLaserAmmo'
	AdditionalPickupAmmoMin=56
	AdditionalPickupAmmoRnd=24
	TraceDamageType='ATCaptainLaserDamage'
	TracerBeamSystemClass='MP_ATCaptainLaser_TrailBeam'
	TracerBeamChance=1
	bCheatMuzzleBlockage=true
	ImpactProjectileClass='MP_dnRocket_ATCaptainLaser'
	ViewKicks=/* Array type was not detected. */
	RandomSeed=none
}