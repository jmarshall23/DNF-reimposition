struct SHaywire
{
	var() bool bAllowHaywire;
	var() float MinTime;
	var() float MaxTime;
	var() Vector LinearAccel;
	var() Vector AngularAccel;
	var() float HaywireStartTime;
	var() float MinTimeToExplode;
	var() float ChanceExplosion;
	var() float HurtRadiusDamage;
	var() float DamageRadius;
	var() float DamageRadiusFallOffStart;
	var() class<dnFriendFX_Spawners> ExplosionClass;
	var() class<LightEx> ExplosionLight;
	var() name ExplosionSoundName;
	var() Vector HitNormal;
};