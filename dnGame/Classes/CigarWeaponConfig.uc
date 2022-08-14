/*******************************************************************************
 * CigarWeaponConfig generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class CigarWeaponConfig extends ActivateUsedWeaponConfig;

defaultproperties
{
	AmmoClass='CigarAmmo'
	AmmoExpenditure=0
	MuzzleInfo(0)=(MuzzleFireStartAnim=CigarRemove,MuzzleFireAnim=CigarActivate,MuzzleFireStopAnim=CigarInsert,MuzzleFlashClass=none,MuzzleBoneName=mount_muzzle,MuzzleMountAngles=(Pitch=8741,Yaw=572915712,Roll=0),Roll=0)
	NumMeleeAttacks=0
	bFlashHUDOnActivate=false
	bStandardWeaponSwitch=false
	WeaponAnimName=noweapon
}