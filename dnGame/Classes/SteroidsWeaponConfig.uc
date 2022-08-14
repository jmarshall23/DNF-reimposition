/*******************************************************************************
 * SteroidsWeaponConfig generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class SteroidsWeaponConfig extends WeaponConfig;

defaultproperties
{
	AmmoClass='SteroidsAmmo'
	AmmoExpenditure=0
	MuzzleInfo(0)=(MuzzleFireStartAnim=FireStart,MuzzleFireAnim=SteroidsActivate,MuzzleFireStopAnim=FireStop,MuzzleFlashClass=none,MuzzleBoneName=mount_muzzle,MuzzleMountAngles=(Pitch=8741,Yaw=572915712,Roll=0),Roll=0)
	bFlashHUDOnActivate=false
	bStandardWeaponSwitch=false
	DoneActivatingStateTransition=ActivateComplete
	WeaponAnimName=noweapon
}