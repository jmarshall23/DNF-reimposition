/*******************************************************************************
 * MP_DevastatorWeaponConfig generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MP_DevastatorWeaponConfig extends MP_WeaponConfig;

defaultproperties
{
    AmmoClass='DevastatorAmmo'
    AdditionalPickupAmmoMin=69
    AdditionalPickupAmmoRnd=30
    MaxTraceDistance=0
    ProjectileClass='MP_dnRocket_Devastator'
    ViewKicks(0)=(bNoLerp=false,bToggleSign=false,Style=0,Function=4,FalloffActor=none,FalloffDistance=0,ShakeDuration=0.08,ShakeFrequency=0.16,ShakeMagnitude=650,ShakeFullMagnitude=0,ShakeFullMagnitudeTime=0,ShakeName=Devastor_ViewKick_0)
    ViewKicks(1)=(bNoLerp=false,bToggleSign=false,Style=1,Function=4,FalloffActor=none,FalloffDistance=0,ShakeDuration=0.08,ShakeFrequency=0.16,ShakeMagnitude=50,ShakeFullMagnitude=0,ShakeFullMagnitudeTime=0,ShakeName=Devastor_ViewKick_1)
    RumbleKicks(0)=(RumbleName=Devastator_Rumble,RumbleDuration=0.17,RumbleLeftMagnitude=0.4,RumbleRightMagnitude=0.22,FalloffActor=none,FalloffDistance=0)
    MuzzleInfo(0)=(MuzzleFireStartAnim=StartFireLeft,MuzzleFireAnim=FireLeft,MuzzleFireStopAnim=StopFireLeft,MuzzleFlashClass='p_Weapons.Devastator_MuzzleFlash.Devastator_MuzzleFlash_SpawnerMP',MuzzleBoneName=mount_muzzle_left_down,MuzzleMountAngles=(Pitch=0,Yaw=32768,Roll=0),ShellEjectionBoneName=mount_eject,ShellEjectionDir=(X=0,Y=0,Z=0),ShellEjectionVariance=(X=0,Y=0,Z=0),ShellEjectionForce=0)
    MuzzleInfo(1)=(MuzzleFireStartAnim=StartFireLeft,MuzzleFireAnim=FireLeft,MuzzleFireStopAnim=StopFireLeft,MuzzleFlashClass='p_Weapons.Devastator_MuzzleFlash.Devastator_MuzzleFlash_SpawnerMP',MuzzleBoneName=mount_muzzle_left_up,MuzzleMountAngles=(Pitch=0,Yaw=32768,Roll=0),ShellEjectionBoneName=None,ShellEjectionDir=(X=0,Y=0,Z=0),ShellEjectionVariance=(X=0,Y=0,Z=0),ShellEjectionForce=0)
    MuzzleInfo(2)=(MuzzleFireStartAnim=StartFireRight,MuzzleFireAnim=FireRight,MuzzleFireStopAnim=StopFireRight,MuzzleFlashClass='p_Weapons.Devastator_MuzzleFlash.Devastator_MuzzleFlash_SpawnerMP',MuzzleBoneName=mount_muzzle_right_down,MuzzleMountAngles=(Pitch=0,Yaw=32768,Roll=0),ShellEjectionBoneName=None,ShellEjectionDir=(X=0,Y=0,Z=0),ShellEjectionVariance=(X=0,Y=0,Z=0),ShellEjectionForce=0)
    MuzzleInfo(3)=(MuzzleFireStartAnim=StartFireRight,MuzzleFireAnim=FireRight,MuzzleFireStopAnim=StopFireRight,MuzzleFlashClass='p_Weapons.Devastator_MuzzleFlash.Devastator_MuzzleFlash_SpawnerMP',MuzzleBoneName=mount_muzzle_right_up,MuzzleMountAngles=(Pitch=0,Yaw=32768,Roll=0),ShellEjectionBoneName=None,ShellEjectionDir=(X=0,Y=0,Z=0),ShellEjectionVariance=(X=0,Y=0,Z=0),ShellEjectionForce=0)
    MuzzleLightClass='Weapon_LightEx_Devastator'
    MuzzleLightBoneName=mount_muzzle_left_down
    MeleeDamageType='MeleeDamage'
    bHasFireStart=true
    bHasLoopingFire=true
    bHasFireStop=true
    AmmoWarnPCT=0.14
    WeaponHeatAttackRate=0.5
    WeaponHeatDecayRate=0.125
    WeaponAnimName=Devastator
}