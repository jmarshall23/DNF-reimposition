/*******************************************************************************
 * Shotgun_Strapless_Pigcop generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Shotgun_Strapless_Pigcop extends Shotgun_Strapless;

simulated function bool CanFire()
{
    return bWeaponFireLockout / ;
}

defaultproperties
{
    BaseDamagePerShot=7
    HighBaseDamagePerShot=8
    DamageFalloffStart=128
    DamageFalloffEnd=256
    WeaponConfig='ShotgunWeaponConfig_Pigcop'
    AutoRegisterIKClasses(0)='IKSystemInfo_Shotgun_Pigcop'
    MountMeshItem=mount_shotgun_r
    DrawScale=1.67
}