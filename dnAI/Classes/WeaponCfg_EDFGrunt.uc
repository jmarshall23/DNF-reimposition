/*******************************************************************************
 * WeaponCfg_EDFGrunt generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class WeaponCfg_EDFGrunt extends WeaponCfg
    abstract;

defaultproperties
{
    Cfg(0)=(Wpn=none,ChargeWeapon=false,WeaponChargeTime=0,Min=0,Max=50,IdealMin=5,IdealMax=20,ReloadThresh=0,MinShots=0,RndShots=0,MinVolleyInterval=0,RndVolleyInterval=0,StandingFireOffset=(X=0,Y=0,Z=0),CrouchingFireOffset=(X=0,Y=0,Z=0),ProneFireOffset=(X=0,Y=0,Z=0),PipeBombFireOffset=(X=19.836,Y=-23.111,Z=39.06),HideWhenMultipleHolstered=false,ActionPointDistance=0,ClearShotRequirement=0,MeleeFrozenTargets=false)
    Cfg(1)=(Wpn='dnGame.Pistol_EDF',ChargeWeapon=false,WeaponChargeTime=0,Min=100,Max=1000,IdealMin=200,IdealMax=600,ReloadThresh=1,MinShots=7,RndShots=0,MinVolleyInterval=0.2,RndVolleyInterval=0,StandingFireOffset=(X=32,Y=0,Z=21),CrouchingFireOffset=(X=30,Y=0,Z=2),ProneFireOffset=(X=0,Y=0,Z=0),PipeBombFireOffset=(X=18.014,Y=-25.864,Z=36.248),HideWhenMultipleHolstered=false,ActionPointDistance=60,ClearShotRequirement=1,MeleeFrozenTargets=false)
    Cfg(2)=(Wpn='dnGame.Shotgun_EDF',ChargeWeapon=false,WeaponChargeTime=0,Min=50,Max=1000,IdealMin=300,IdealMax=800,ReloadThresh=1,MinShots=1,RndShots=3,MinVolleyInterval=0.2,RndVolleyInterval=0.2,StandingFireOffset=(X=37.9,Y=6.4,Z=10.7),CrouchingFireOffset=(X=28.7,Y=7.6,Z=-0.3),ProneFireOffset=(X=0,Y=0,Z=0),PipeBombFireOffset=(X=20.362,Y=-18.446,Z=38.85),HideWhenMultipleHolstered=false,ActionPointDistance=60,ClearShotRequirement=1,MeleeFrozenTargets=false)
    Cfg(3)=(Wpn='dnGame.MachineGun_EDF',ChargeWeapon=false,WeaponChargeTime=0,Min=100,Max=3000,IdealMin=400,IdealMax=1000,ReloadThresh=5,MinShots=10,RndShots=0,MinVolleyInterval=0.2,RndVolleyInterval=0,StandingFireOffset=(X=34.4,Y=7.6,Z=18),CrouchingFireOffset=(X=31.4,Y=9.1,Z=0.3),ProneFireOffset=(X=0,Y=0,Z=0),PipeBombFireOffset=(X=19.816,Y=-26.156,Z=35.485),HideWhenMultipleHolstered=false,ActionPointDistance=60,ClearShotRequirement=1,MeleeFrozenTargets=false)
    Cfg(4)=(Wpn='dnGame.RPG_EDF',ChargeWeapon=false,WeaponChargeTime=0,Min=150,Max=5000,IdealMin=400,IdealMax=1000,ReloadThresh=1,MinShots=1,RndShots=0,MinVolleyInterval=0.2,RndVolleyInterval=0.2,StandingFireOffset=(X=29.2,Y=4,Z=23.2),CrouchingFireOffset=(X=32.7,Y=8.1,Z=-1),ProneFireOffset=(X=0,Y=0,Z=0),PipeBombFireOffset=(X=18.669,Y=-27.25,Z=37.904),HideWhenMultipleHolstered=false,ActionPointDistance=60,ClearShotRequirement=2,MeleeFrozenTargets=false)
    Cfg(5)=(Wpn='FreezeRay_EDF',ChargeWeapon=false,WeaponChargeTime=0,Min=150,Max=1000,IdealMin=300,IdealMax=800,ReloadThresh=1,MinShots=1,RndShots=3,MinVolleyInterval=0.2,RndVolleyInterval=0.2,StandingFireOffset=(X=37.9,Y=6.4,Z=10.7),CrouchingFireOffset=(X=28.7,Y=7.6,Z=-0.3),ProneFireOffset=(X=0,Y=0,Z=0),PipeBombFireOffset=(X=20.362,Y=-18.446,Z=38.85),HideWhenMultipleHolstered=false,ActionPointDistance=60,ClearShotRequirement=1,MeleeFrozenTargets=true)
    Cfg(6)=(Wpn='Shrinkray_EDF',ChargeWeapon=false,WeaponChargeTime=0,Min=150,Max=1000,IdealMin=300,IdealMax=800,ReloadThresh=1,MinShots=1,RndShots=3,MinVolleyInterval=0.2,RndVolleyInterval=0.2,StandingFireOffset=(X=37.9,Y=6.4,Z=10.7),CrouchingFireOffset=(X=28.7,Y=7.6,Z=-0.3),ProneFireOffset=(X=0,Y=0,Z=0),PipeBombFireOffset=(X=20.362,Y=-18.446,Z=38.85),HideWhenMultipleHolstered=false,ActionPointDistance=60,ClearShotRequirement=1,MeleeFrozenTargets=true)
    Cfg(7)=(Wpn='Devastator_EDF',ChargeWeapon=false,WeaponChargeTime=0,Min=150,Max=1000,IdealMin=300,IdealMax=800,ReloadThresh=1,MinShots=4,RndShots=0,MinVolleyInterval=3,RndVolleyInterval=1,StandingFireOffset=(X=37.9,Y=6.4,Z=10.7),CrouchingFireOffset=(X=28.7,Y=7.6,Z=-0.3),ProneFireOffset=(X=0,Y=0,Z=0),PipeBombFireOffset=(X=20.362,Y=-18.446,Z=38.85),HideWhenMultipleHolstered=false,ActionPointDistance=60,ClearShotRequirement=2,MeleeFrozenTargets=false)
    Cfg(8)=(Wpn='Railgun_EDF',ChargeWeapon=false,WeaponChargeTime=0,Min=200,Max=9000,IdealMin=300,IdealMax=1200,ReloadThresh=0,MinShots=1,RndShots=0,MinVolleyInterval=2,RndVolleyInterval=0.5,StandingFireOffset=(X=37.9,Y=6.4,Z=10.7),CrouchingFireOffset=(X=28.7,Y=7.6,Z=-0.3),ProneFireOffset=(X=0,Y=0,Z=0),PipeBombFireOffset=(X=20.362,Y=-18.446,Z=38.85),HideWhenMultipleHolstered=false,ActionPointDistance=60,ClearShotRequirement=1,MeleeFrozenTargets=false)
    Cfg(9)=(Wpn='dnGame.Pistol_Gold',ChargeWeapon=false,WeaponChargeTime=0,Min=100,Max=1000,IdealMin=200,IdealMax=600,ReloadThresh=1,MinShots=7,RndShots=0,MinVolleyInterval=0.2,RndVolleyInterval=0,StandingFireOffset=(X=32,Y=0,Z=21),CrouchingFireOffset=(X=30,Y=0,Z=2),ProneFireOffset=(X=0,Y=0,Z=0),PipeBombFireOffset=(X=18.014,Y=-25.864,Z=36.248),HideWhenMultipleHolstered=false,ActionPointDistance=0,ClearShotRequirement=1,MeleeFrozenTargets=false)
    PreferredWeapons(0)='dnGame.MachineGun_EDF'
    PreferredWeapons(1)='dnGame.Shotgun_EDF'
    PreferredWeapons(2)='dnGame.Pistol_EDF'
    PreferredWeapons(3)='Devastator_EDF'
    PreferredWeapons(4)='dnGame.RPG_EDF'
    PreferredWeapons(5)='Railgun_EDF'
    PreferredWeapons(6)='FreezeRay_EDF'
    PreferredWeapons(7)='Shrinkray_EDF'
    PreferredWeapons(8)='dnGame.Pistol_Gold'
}