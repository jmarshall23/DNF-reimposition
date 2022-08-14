/*******************************************************************************
 * dnRocket_SuperTurret generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnRocket_SuperTurret extends dnRocket
	collapsecategories;

var dnControl_Turret OwnerTurret;

simulated event PostVerifySelf()
{
	OwnerTurret = dnControl_Turret(Owner);
	// End:0x44
	if(__NFUN_340__(OwnerTurret, none))
	{
		Instigator = OwnerTurret.User;
		__NFUN_652__(OwnerTurret.GetProjectileRotation());
	}
	super(Projectile).PostVerifySelf();
	return;
}

simulated function SpawnExplosionEffect(Vector HitLocation, optional Vector HitNormal, optional Actor HitActor)
{
	// End:0x25
	if(OwnerTurret.OverrideExplosionEffect(self, HitLocation, HitNormal, HitActor))
	{
		return;
	}
	super(Projectile).SpawnExplosionEffect(HitLocation, HitNormal, HitActor);
	return;
}

defaultproperties
{
	ProjectileAmbientSoundName=None
	bDoMaterialEffects=true
	bBreakGlass=true
	bWaterSplash=false
	Speed=16000
	MaxSpeed=9E+14
	AccelerationScaler=100000
	Damage=50
	DamageRadius=100
	DamageClass='SuperTurretDamage'
	ExplosionClass='p_Weapons.SuperTurret_Impact.SuperTurret_Impact_Spawner'
	bTelekineticable=false
	bCastStencilShadows=false
	DrawType=8
	PrePivot=(X=1.292418E-41,Y=2.954683E-17,Z=0)
	DrawScale=4
	StaticMesh='sm_class_effects.tracers.SuperTurret_Tracer'
	Skins(0)='dt_editor.Surface.Climbable_Masking'
}