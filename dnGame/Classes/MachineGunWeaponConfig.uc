/*******************************************************************************
 * MachineGunWeaponConfig generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MachineGunWeaponConfig extends WeaponConfig;

defaultproperties
{
    AmmoClass='MachineGunAmmo'
    AdditionalPickupAmmoMin=140
    AdditionalPickupAmmoRnd=60
    ReloadCount=50
    ReloadClipAmmo=50
    TraceDamageType='MachineGunDamage'
    TracerBeamSystemClass='dnTracerFX_BeamSegment'
    TracerBubblesClass='p_Weapons.Generic.WaterBubblesTracer'
    HorizShotError=0.07
    VertShotError=0.04
    ViewKicks(0)=(bNoLerp=false,bToggleSign=false,Style=3,Function=1,FalloffActor=none,FalloffDistance=0,ShakeDuration=-1,ShakeFrequency=0.025,ShakeMagnitude=50,ShakeFullMagnitude=250,ShakeFullMagnitudeTime=3,ShakeName=MachineGun_ViewKick_0)
    RumbleKicks(0)=(RumbleName=MachineGun_Rumble,RumbleDuration=0.12,RumbleLeftMagnitude=0.25,RumbleRightMagnitude=0.5,FalloffActor=none,FalloffDistance=0)
    MuzzleInfo(0)=(MuzzleFireStartAnim=FireStart,MuzzleFireAnim=Fire,MuzzleFireStopAnim=FireStop,MuzzleFlashClass='p_Weapons.Ripper_Muzzleflash.Ripper_Muzzleflash_Spawner',MuzzleBoneName=mount_barrel_left,MuzzleMountAngles=(Pitch=0,Yaw=0,Roll=0),ShellEjectionBoneName=mount_eject,ShellEjectionDir=(X=1,Y=2,Z=5),ShellEjectionVariance=(X=1,Y=1.5,Z=2.5),ShellEjectionForce=200)
    MuzzleInfo(1)=(MuzzleFireStartAnim=FireStart,MuzzleFireAnim=Fire,MuzzleFireStopAnim=FireStop,MuzzleFlashClass='p_Weapons.Ripper_Muzzleflash.Ripper_Muzzleflash_Spawner',MuzzleBoneName=mount_barrel_middle,MuzzleMountAngles=(Pitch=0,Yaw=0,Roll=0),ShellEjectionBoneName=mount_eject,ShellEjectionDir=(X=1,Y=2,Z=5),ShellEjectionVariance=(X=1,Y=1.5,Z=2.5),ShellEjectionForce=200)
    MuzzleInfo(2)=(MuzzleFireStartAnim=FireStart,MuzzleFireAnim=Fire,MuzzleFireStopAnim=FireStop,MuzzleFlashClass='p_Weapons.Ripper_Muzzleflash.Ripper_Muzzleflash_Spawner',MuzzleBoneName=mount_barrel_right,MuzzleMountAngles=(Pitch=0,Yaw=0,Roll=0),ShellEjectionBoneName=mount_eject,ShellEjectionDir=(X=1,Y=2,Z=5),ShellEjectionVariance=(X=1,Y=1.5,Z=2.5),ShellEjectionForce=200)
    MuzzleLightClass='Weapon_LightEx_M16'
    MuzzleLightBoneName=mount_barrel_middle
    bMuzzleShellEjectionOwnerVelIndependent=true
    MeleeDamageType='MeleeDamage'
    bHasFireStart=true
    bHasFireStop=true
    bFireInterruptFiring=true
    AmmoWarnPCT=0.05
    LockoutFireTime=0.06
    WeaponHeatAttackRate=0.065
    WeaponHeatDecayRate=0.095
    WeaponAnimName=MachineGun
}