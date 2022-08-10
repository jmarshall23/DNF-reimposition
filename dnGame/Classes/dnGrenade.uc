/*******************************************************************************
 * dnGrenade generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnGrenade extends dnProjectile
	abstract
	collapsecategories;

const SPEED_BOUNCE_STOP_LIMIT = 20.0f;
const SPEED_BOUNCE_SOUND_LIMIT = 50.0f;
const WATER_LOGGED_REFRESH_RATE = 0.25f;
const BOUNCE_SOUNDPITCH_VARIANCE = 0.2f;

var() noexport bool bExplodeOnAnyImpact "If this is true, then when the grenade hits ANYTHING, it will explode.";
var() noexport bool bPrimeForExplosionOnImpact "If true we start counting down explosion delay after the grendade has hit something.";
var() noexport bool bRotationFollowsVelocity "If this is true, then the rotation of the grenade always follows the current velocity of the grenade.";
var() noexport float ExplosionDelay "Amount of time it takes for the grenade to explode. 0 means just sit around forever.";
var() noexport float ExplosionDelayVariance "Variance on the amount of time the grenade takes to explode.";
var() noexport Vector UpwardsBoost "Amount to boost the velocity of this grenade upwards when it is spawned in (to give it more of a lobbing effect.";
var() noexport float WaterVelocityScaler "How much hitting water affects our current velocity.";
var bool bSpin;
var bool bPrimedForExplosion;
var bool bShowHUDWarning;

simulated function PostVerifySelf()
{
	super(Projectile).PostVerifySelf();
	// End:0x28
	if(__NFUN_148__(__NFUN_201__(ExplosionDelay, 0), __NFUN_145__(bPrimeForExplosionOnImpact)))
	{
		PrimeForDelayedExplosion();
	}
	__NFUN_362__('Tick');
	// End:0x61
	if(__NFUN_148__(__NFUN_340__(Owner, none), Owner.bIsPawn))
	{
		Instigator = Pawn(Owner);
	}
	return;
}

simulated function PrimeForDelayedExplosion()
{
	bPrimedForExplosion = true;
	__NFUN_605__(__NFUN_226__(ExplosionDelay, ExplosionDelayVariance), false, 'NonImpactExplode');
	return;
}

simulated function InitializeMotion()
{
	local Vector ThrowImpulse;

	UpwardsBoost = __NFUN_263__(UpwardsBoost, __NFUN_276__(Rotator(PhysicsVolume.Gravity), Rotator(__NFUN_232__(0, 0, -1))));
	ThrowImpulse = __NFUN_238__(UpwardsBoost, __NFUN_235__(Speed, Vector(Rotation)));
	DoThrow(ThrowImpulse);
	return;
}

final simulated function DoThrow(Vector ThrowVelocity)
{
	local Actor A;
	local float SpinRate, DrawScalar;

	// End:0x2B
	if(__NFUN_340__(Instigator, none))
	{
		DrawScalar = __NFUN_196__(1, Instigator.DrawScale);		
	}
	else
	{
		DrawScalar = 1;
	}
	__NFUN_642__(18);
	__NFUN_790__(ThrowVelocity);
	// End:0x83
	if(bSpin)
	{
		SpinRate = __NFUN_195__(__NFUN_251__(__NFUN_234__(ThrowVelocity, DrawScalar)), 0.01);
		__NFUN_791__(__NFUN_263__(__NFUN_232__(0, SpinRate, 0), Rotation));
	}
	return;
}

simulated function ProjectileHitSomething(Vector HitNormal, Actor HitActor)
{
	// End:0x16
	if(bExplodeOnAnyImpact)
	{
		ImpactExplode(HitNormal);
		return;
	}
	// End:0x54
	if(__NFUN_148__(__NFUN_148__(bPrimeForExplosionOnImpact, __NFUN_145__(bPrimedForExplosion)), __NFUN_150__(__NFUN_339__(Instigator, none), __NFUN_340__(HitActor, Instigator))))
	{
		PrimeForDelayedExplosion();
		return;
	}
	super(Projectile).ProjectileHitSomething(HitNormal, HitActor);
	return;
}

simulated function ImpactExplode(Vector HitNormal)
{
	ExecuteExplode(Location, HitNormal);
	return;
}

simulated function NonImpactExplode()
{
	ExecuteExplode(Location, __NFUN_233__(__NFUN_253__(PhysicsVolume.Gravity)));
	return;
}

defaultproperties
{
	bSpin=true
	bWaterSplash=true
	DamageClass='GrenadeDamage'
	KImpactThreshold=50
	KLinearDamping=0
	KAngularDamping=0
	GravityScale=0.5
	Physics=18
	bBlockKarma=true
}