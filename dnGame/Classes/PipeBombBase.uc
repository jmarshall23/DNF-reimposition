/*******************************************************************************
 * PipeBombBase generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class PipeBombBase extends Weapon
	abstract;

var int UpwardsViewBoost;
var float RollDamping;
var float RollThrowRandomness;
var float ThrowThrowRandomness;
var Vector ThrowVelocity;
var Vector ThrowAngVelocity;
var float ThrowSpinRate;
var bool bCheatCollision;

k2call simulated function Fire_Effects(optional EventInfo AnimEventInfo)
{
	__NFUN_590__(true);
	super.Fire_Effects(AnimEventInfo);
	return;
}

function AdjustProjectileSpawn(out Vector SpawnLocation, out Rotator SpawnRotation)
{
	local Vector TrashVector, ViewDirection;
	local Rotator DefaultProjRotation, TossAngle;
	local float Damping, ThrowRandomness, ColRad;
	local int UpwardsBoost;
	local Vector TraceEnd;
	local STraceFlags TraceFlags;
	local STraceHitResult HitResult, HitResultMoved;

	SpawnRotation = Rotation;
	UpwardsBoost = UpwardsViewBoost;
	ThrowRandomness = ThrowThrowRandomness;
	Instigator.GetWeaponAim(TrashVector, ViewDirection);
	DefaultProjRotation = Rotator(ViewDirection);
	TossAngle = __NFUN_283__(__NFUN_275__(DefaultProjRotation, __NFUN_265__(UpwardsBoost, 0, 0)));
	TossAngle.Pitch = __NFUN_191__(TossAngle.Pitch, -16384, 16384);
	ThrowVelocity = __NFUN_234__(__NFUN_234__(Vector(TossAngle), GetThrowForce()), __NFUN_199__(1, Damping));
	ThrowSpinRate = __NFUN_195__(__NFUN_195__(__NFUN_251__(ThrowVelocity), __NFUN_199__(__NFUN_222__(), 0.5)), ThrowRandomness);
	ThrowAngVelocity = __NFUN_241__(__NFUN_232__(ThrowSpinRate, 0, 0), DefaultProjRotation);
	// End:0x102
	if(__NFUN_340__(Instigator, none))
	{
		__NFUN_246__(ThrowVelocity, Instigator.DrawScale);
	}
	TraceFlags.bTraceActors = true;
	TraceFlags.bMeshAccurate = false;
	TraceFlags.bAbortFirstHit = true;
	TraceFlags.bShotTrace = true;
	TraceFlags.bNoParticles = true;
	TraceFlags.bNoFudge = true;
	TraceEnd = __NFUN_238__(SpawnLocation, __NFUN_234__(__NFUN_253__(ThrowVelocity), 100));
	ColRad = class'dnPipeBombProjectile'.default.CollisionRadius;
	// End:0x1A2
	if(__NFUN_340__(Instigator, none))
	{
		__NFUN_207__(ColRad, Instigator.DrawScale);
	}
	__NFUN_736__(SpawnLocation, TraceEnd, TraceFlags, HitResult, __NFUN_232__(ColRad, ColRad, ColRad));
	// End:0x249
	if(__NFUN_340__(HitResult.Actor, none))
	{
		TraceEnd = __NFUN_238__(Instigator.__NFUN_872__(), __NFUN_234__(__NFUN_253__(ThrowVelocity), 100));
		__NFUN_736__(Instigator.__NFUN_872__(), TraceEnd, TraceFlags, HitResultMoved);
		// End:0x249
		if(__NFUN_339__(HitResultMoved.Actor, none))
		{
			SpawnLocation = Instigator.__NFUN_872__();
			bCheatCollision = true;
		}
	}
	return;
}

function SetupProjectile(Projectile Proj)
{
	local dnPipeBombProjectile PipeBombProj;

	PipeBombProj = dnPipeBombProjectile(Proj);
	// End:0x5E
	if(__NFUN_339__(PipeBombProj, none))
	{
		Warn(__NFUN_303__("spawned non-pipebomb-projectile class", string(Proj.Class)));
		return;
	}
	PipeBombProj.__NFUN_790__(ThrowVelocity);
	PipeBombProj.__NFUN_791__(ThrowAngVelocity);
	PipeBombProj.DetonationController = Instigator;
	// End:0xC7
	if(bCheatCollision)
	{
		PipeBombProj.__NFUN_812__(8);
		PipeBombProj.__NFUN_607__(0.2, false, 'ResumeCollision');
	}
	bCheatCollision = false;
	return;
}

function bool ShouldPerformRoll()
{
	return __NFUN_173__(int(Instigator.PostureStateEx), int(3));
	return;
}

function float GetThrowForce()
{
	return;
}

defaultproperties
{
	RollThrowRandomness=0.008
	ThrowThrowRandomness=0.04
}