/*******************************************************************************
 * PistolWeaponConfig generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class PistolWeaponConfig extends WeaponConfig;

defaultproperties
{
	AmmoClass='PistolAmmo'
	AdditionalPickupAmmoMin=44
	AdditionalPickupAmmoRnd=20
	ReloadCount=8
	ReloadClipAmmo=8
	TraceDamageType='PistolDamage'
	TracerBeamSystemClass='dnTracerFX_BeamSegment'
	TracerBubblesClass='p_Weapons.Generic.WaterBubblesTracer'
	HorizShotError=0.01
	VertShotError=0.01
	ViewKicks=/* Array type was not detected. */
	OverrideSurvivalChance=(EndingBlendAlpha=/* Unknown default property type! */)
}