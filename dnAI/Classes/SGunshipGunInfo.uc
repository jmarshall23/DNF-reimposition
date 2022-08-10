struct SGunshipGunInfo
{
	var() dnGunship_Base.EGunshipGun_GunType GunType;
	var() float FireInterval;
	var() class<dnProjectile> ProjectileClass;
	var() float TraceChance;
	var() class<BeamSystem> TracerBeamSystemClass;
	var() class<SoftParticleSystem> TracerBubblesClass;
	var() int HorizShotError;
	var() int VertShotError;
	var() name FireSound;
};