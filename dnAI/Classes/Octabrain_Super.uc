/*******************************************************************************
 * Octabrain_Super generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Octabrain_Super extends AIActor
	config;

var dnOctabrainFX_BrainChargeA Eyebrow;
var dnOctabrainBrainLightningA Charge;
var float ProjectileGate;
var float PickupTKObjGate;
var bool MeleeLocked;
var() noexport float MinProjectileInterval "Minimum time between projectiles";
var() noexport float RndProjectileInterval "Random time between projectiles (added to MinProjectileInterval)";
var() noexport float PickupTKObjInterval "Wait at least this long in between picking up tk objects";
var() noexport float ChanceLockMelee "Percentage chance of locking melee after each melee attack";
var() noexport float ChanceUnlockMelee "Percentage chance of unlocking melee after each shot fired";
var() float PainKLinearDamping;
var() float CorpseImpulseMomentumScale;
var() float LightFadeOutTime;
var() float LightFadeInTime;
var() bool FadeLightIn;
var float EffectScale;
var MaterialEx ChargeMaterial;

simulated event bool CanBreatheNormally()
{
	return true;
	return;
}

event PostBeginPlay()
{
	super.PostBeginPlay();
	ProjectileGate = __NFUN_195__(__NFUN_222__(), __NFUN_198__(MinProjectileInterval, RndProjectileInterval));
	PickupTKObjGate = PickupTKObjInterval;
	// End:0x58
	if(__NFUN_340__(MountedLightEx, none))
	{
		MountedLightEx.LightRadius = 0;
		MountedLightEx.MarkDirty();
	}
	__NFUN_601__('Generic1', NewColorBytes(0, 0, 0, 255));
	return;
}

event bool ShouldCatchTKObj(InteractiveActor CandidateTKObj, optional bool bCheckLOS)
{
	local Engine.BaseAI.EAIOp MyOp;
	local Vector CandidateVel;
	local bool IsThrownOrFired;

	// End:0x0B
	if(IsFrozen())
	{
		return false;
	}
	// End:0x30
	if(__NFUN_150__(__NFUN_339__(CandidateTKObj, none), __NFUN_145__(CandidateTKObj.bTelekineticable)))
	{
		return false;
	}
	// End:0x3B
	if(CurrentOpMustFinish)
	{
		return false;
	}
	// End:0x83
	if(__NFUN_150__(__NFUN_150__(__NFUN_339__(CandidateTKObj.Owner, self), __NFUN_340__(CandidateTKObj.CarriedBy, none)), __NFUN_339__(CandidateTKObj.Instigator, self)))
	{
		return false;
	}
	// End:0x8B
	if(__NFUN_921__())
	{
		return false;
	}
	// End:0xB7
	if(__NFUN_202__(__NFUN_244__(__NFUN_253__(__NFUN_239__(CandidateTKObj.Location, Location)), Vector(Rotation)), MinTKDot))
	{
		return false;
	}
	// End:0xC8
	if(__NFUN_173__(int(GetExecutive()), int(1)))
	{
		return true;
	}
	// End:0xEB
	if(__NFUN_148__(__NFUN_340__(TKObj, none), CandidateTKObj.bTelekineticableSingleOnly))
	{
		return false;
	}
	MyOp = GetCurrentOp();
	// End:0x107
	if(IsTKIgnoreClass(CandidateTKObj))
	{
		return false;
	}
	// End:0x178
	if(__NFUN_150__(__NFUN_148__(__NFUN_340__(Projectile(CandidateTKObj), none), __NFUN_340__(Projectile(CandidateTKObj).Instigator, self)), __NFUN_148__(__NFUN_340__(Instigator, none), __NFUN_148__(CandidateTKObj.__NFUN_794__(CandidateVel), __NFUN_201__(__NFUN_252__(CandidateVel), 300)))))
	{
		IsThrownOrFired = true;		
	}
	else
	{
		IsThrownOrFired = false;
	}
	// End:0x236
	if(__NFUN_145__(IsThrownOrFired))
	{
		// End:0x199
		if(__NFUN_340__(TKObj, none))
		{
			return false;
		}
		// End:0x1A9
		if(__NFUN_173__(int(AttackConstraint), int(3)))
		{
			return false;
		}
		// End:0x1C4
		if(__NFUN_201__(PickupTKObjGate, Level.GameTimeSeconds))
		{
			return false;
		}
		// End:0x1D5
		if(__NFUN_173__(int(GetCurrentOp()), int(62)))
		{
			return false;
		}
		// End:0x208
		if(__NFUN_150__(__NFUN_145__(PrimaryTarget.IsValidTarget()), __NFUN_200__(PrimaryTarget.GetRange2D(), 350)))
		{
			return false;
		}
		// End:0x236
		if(bCheckLOS)
		{
			// End:0x236
			if(__NFUN_174__(CandidateTKObj.Region.iZone, Region.iZone))
			{
				return false;
			}
		}
	}
	return true;
	return;
}

event NotifySetTargetActor()
{
	super.NotifySetTargetActor();
	return;
}

event CreateShootProjectileEffects()
{
	CreateEyebrow();
	CreateCharge();
	return;
}

event DestroyShootProjectileEffects()
{
	// End:0x20
	if(__NFUN_340__(Eyebrow, none))
	{
		Eyebrow.__NFUN_614__();
		Eyebrow = none;
	}
	// End:0x40
	if(__NFUN_340__(Charge, none))
	{
		Charge.__NFUN_614__();
		Charge = none;
	}
	return;
}

function bool CreateEyebrow()
{
	// End:0xB5
	if(__NFUN_339__(Eyebrow, none))
	{
		Eyebrow = __NFUN_615__(class'dnOctabrainFX_BrainChargeA', self);
		// End:0x3F
		if(__NFUN_204__(DrawScale, 1))
		{
			Eyebrow.__NFUN_591__(EffectScale);			
		}
		else
		{
			Eyebrow.__NFUN_591__(DrawScale);
		}
		// End:0x5F
		if(__NFUN_339__(Eyebrow, none))
		{
			return false;
		}
		Eyebrow.MountType = 2;
		Eyebrow.MountMeshItem = 'eyelid_m1';
		Eyebrow.__NFUN_635__(self);
		Eyebrow.__NFUN_567__(Name);
		Eyebrow.__NFUN_642__(9);
	}
	return true;
	return;
}

function bool CreateCharge()
{
	bDoOverlayEffect = true;
	OverlayMaterial = ChargeMaterial;
	OverlayEffectAlpha = 0;
	FadeOverlayEffect(1, 0.1);
	__NFUN_589__('Generic1', NewColorBytes(140, 168, 215), 0.1);
	return true;
	return;
}

function NotifyTeleKinesisStarted(InteractiveActor TeleKinesisActor)
{
	super.NotifyTeleKinesisStarted(TeleKinesisActor);
	CreateShootProjectileEffects();
	FindSoundAndSpeak('Sound_Telekinesis');
	return;
}

function NotifyTeleKinesisStopped(InteractiveActor TeleKinesisActor)
{
	super.NotifyTeleKinesisStopped(TeleKinesisActor);
	// End:0x20
	if(__NFUN_174__(int(GetCurrentOp()), int(117)))
	{
		DestroyShootProjectileEffects();
	}
	bDoOverlayEffect = false;
	FadeOverlayEffect(0, 0.1);
	__NFUN_589__('Generic1', NewColorBytes(0, 0, 0), 0.1);
	PickupTKObjGate = __NFUN_198__(Level.GameTimeSeconds, PickupTKObjInterval);
	__NFUN_698__(14, 0.25, 0, 1);
	return;
}

function DischargeTKObj(Vector Vel, bool Constrain)
{
	// End:0x37
	if(DebugTK)
	{
		DrawArrow(TKObj.Location, __NFUN_253__(Vel), __NFUN_251__(Vel), 255, 0, 0, 255, 5);
	}
	TKObj.TelekineticThrow(Vel, Constrain);
	TKObj = none;
	ProjectileGate = __NFUN_198__(__NFUN_198__(Level.GameTimeSeconds, MinProjectileInterval), __NFUN_195__(__NFUN_222__(), RndProjectileInterval));
	// End:0x9F
	if(__NFUN_148__(MeleeLocked, __NFUN_200__(__NFUN_222__(), ChanceUnlockMelee)))
	{
		MeleeLocked = false;
	}
	// End:0xB6
	if(Constrain)
	{
		FindSoundAndSpeak('Sound_Telekinesis_Throw');		
	}
	else
	{
		__NFUN_698__(14, 0.25, 0, 1);
	}
	return;
}

simulated function TeleKinesisSoundFadedOut()
{
	__NFUN_695__(14);
	return;
}

function float RateHackTilAnimsReady()
{
	// End:0x18
	if(__NFUN_173__(int(GetCurrentOp()), int(62)))
	{
		return 1.66;		
	}
	else
	{
		return 1;
	}
	return;
}

function Anim_MoveTo_StrafeLeft(Engine.BaseAI.EAIMoveSpeed eMoveSpeed)
{
	FindSoundAndSpeak('Sound_Pursuit');
	PlayAnim('Anim_SidestepLeft', RateHackTilAnimsReady());
	return;
}

function Anim_MoveTo_StrafeRight(Engine.BaseAI.EAIMoveSpeed eMoveSpeed)
{
	FindSoundAndSpeak('Sound_Pursuit');
	PlayAnim('Anim_SidestepRight', RateHackTilAnimsReady());
	return;
}

function Anim_Run()
{
	FindSoundAndSpeak('Sound_Pursuit');
	PlayAnim('Anim_Run', RateHackTilAnimsReady());
	return;
}

function Anim_RunBackward()
{
	FindSoundAndSpeak('Sound_Pursuit');
	PlayAnim('Anim_RunBackwards', RateHackTilAnimsReady());
	return;
}

k2call simulated function NotifySlash(optional EventInfo AnimEventInfo)
{
	// End:0x31
	if(__NFUN_148__(__NFUN_148__(__NFUN_145__(MeleeLocked), __NFUN_174__(int(AttackConstraint), int(1))), __NFUN_200__(__NFUN_222__(), 0.6)))
	{
		MeleeLocked = true;
	}
	FindSoundAndSpeak('Sound_Attack_Throw');
	// End:0x62
	if(ApplyDamage(class'TentacleDamage', int(ClawDamageAmount), ClawDamageVel, 4))
	{
		FindSoundAndSpeak('Sound_Enemy_Thrown');
	}
	return;
}

k2call simulated function NotifyBite(optional EventInfo AnimEventInfo)
{
	// End:0x31
	if(__NFUN_148__(__NFUN_148__(__NFUN_145__(MeleeLocked), __NFUN_174__(int(AttackConstraint), int(1))), __NFUN_200__(__NFUN_222__(), ChanceLockMelee)))
	{
		MeleeLocked = true;
	}
	FindSoundAndSpeak('Sound_Attack_Bite');
	// End:0x62
	if(ApplyDamage(class'BiteDamage', int(BiteDamageAmount), BiteDamageVel, 4))
	{
		FindSoundAndSpeak('Sound_Enemy_Thrown');
	}
	return;
}

k2call simulated function NotifyCharge(optional EventInfo AnimEventInfo)
{
	FindSoundAndSpeak('Sound_Charge');
	return;
}

k2call simulated function NotifyFire(optional EventInfo AnimEventInfo)
{
	local dnProjectile Proj;

	Proj = FireProjectile('None', ProjectileClass, CalcLeadTime(ProjectileClass.default.MaxSpeed), false);
	// End:0xF0
	if(__NFUN_340__(Proj, none))
	{
		// End:0x5C
		if(__NFUN_204__(DrawScale, 1))
		{
			Proj.__NFUN_591__(EffectScale);			
		}
		else
		{
			Proj.__NFUN_591__(DrawScale);
		}
		bDoOverlayEffect = false;
		FadeOverlayEffect(0, 0.1);
		__NFUN_589__('Generic1', NewColorBytes(0, 0, 0), 0.1);
		FindSoundAndSpeak('Sound_FireBrainBlast');
		ProjectileGate = __NFUN_198__(__NFUN_198__(Level.GameTimeSeconds, MinProjectileInterval), __NFUN_195__(__NFUN_222__(), RndProjectileInterval));
		// End:0xF0
		if(__NFUN_148__(MeleeLocked, __NFUN_200__(__NFUN_222__(), ChanceUnlockMelee)))
		{
			MeleeLocked = false;
		}
	}
	// End:0x102
	if(__NFUN_339__(TKObj, none))
	{
		DestroyShootProjectileEffects();
	}
	// End:0x116
	if(__NFUN_340__(MountedLightEx, none))
	{
		FadeLightIn = false;
	}
	return;
}

k2call simulated function NotifyIdle(optional EventInfo AnimEventInfo)
{
	// End:0x2E
	if(__NFUN_150__(__NFUN_145__(PrimaryTarget.IsValidTarget()), __NFUN_339__(PrimaryTargetActor, none)))
	{
		FindSoundAndSpeak('Sound_Idle');
	}
	return;
}

event Engine.BaseAI.EAICode COND_NeedToMoveToAttack()
{
	// End:0x18
	if(__NFUN_145__(PrimaryTarget.IsValidTarget()))
	{
		return 4;
	}
	return 0;
	return;
}

event Engine.BaseAI.EAICode COND_ShouldGotoAttack()
{
	local Engine.BaseAI.EAICode Code;

	Code = COND_NeedToMoveToAttack();
	// End:0x20
	if(__NFUN_174__(int(Code), int(0)))
	{
		return Code;
	}
	// End:0x3F
	if(__NFUN_148__(__NFUN_145__(SetGoal(9)), __NFUN_145__(SetGoal(15))))
	{
		return 53;
	}
	return 0;
	return;
}

event Engine.BaseAI.EAICode COND_ShouldShootProjectile()
{
	local Engine.BaseAI.EAICode Code;

	// End:0x0F
	if(__NFUN_340__(TKObj, none))
	{
		return 30;
	}
	// End:0x27
	if(__NFUN_145__(PrimaryTarget.IsValidTarget()))
	{
		return 4;
	}
	// End:0x38
	if(__NFUN_173__(int(AttackConstraint), int(3)))
	{
		return 72;
	}
	// End:0x54
	if(__NFUN_200__(Level.GameTimeSeconds, ProjectileGate))
	{
		return 60;
	}
	Code = CheckCondition(45);
	// End:0x76
	if(__NFUN_174__(int(Code), int(0)))
	{
		return Code;
	}
	return 0;
	return;
}

event Engine.BaseAI.EAICode COND_ShouldMelee()
{
	local Engine.BaseAI.EAICode Code;
	local float DistToTarget;
	local Pawn pawnTarget;

	// End:0x07
	if(true)
	{
		return 72;
	}
	pawnTarget = Pawn(PrimaryTargetActor);
	// End:0x3E
	if(__NFUN_148__(__NFUN_340__(pawnTarget, none), __NFUN_340__(pawnTarget.InteractiveDecoration, none)))
	{
		return 1;
	}
	// End:0x5F
	if(__NFUN_150__(__NFUN_173__(int(AttackConstraint), int(1)), __NFUN_173__(int(AttackConstraint), int(3))))
	{
		return 0;
	}
	// End:0x73
	if(__NFUN_174__(int(CheckCondition(20)), int(0)))
	{
		return 1;
	}
	// End:0x84
	if(__NFUN_173__(int(AttackConstraint), int(2)))
	{
		return 72;
	}
	// End:0x90
	if(MeleeLocked)
	{
		return 1;
	}
	return CheckCondition(91);
	return;
}

event Engine.BaseAI.EAICode COND_ShouldEndMelee()
{
	// End:0x21
	if(__NFUN_150__(__NFUN_173__(int(AttackConstraint), int(1)), __NFUN_173__(int(AttackConstraint), int(3))))
	{
		return 73;
	}
	// End:0x3D
	if(__NFUN_150__(__NFUN_173__(int(AttackConstraint), int(2)), MeleeLocked))
	{
		return 0;
	}
	return 1;
	return;
}

function DiedActivity(optional Pawn Killer, optional int Damage, optional Vector DamageOrigin, optional Vector DamageDirection, optional class<DamageType> DamageType, optional name HitBoneName)
{
	// End:0x18
	if(__NFUN_357__(DamageType, class'ExplosionDamage'))
	{
		bInstaGib = true;
	}
	// End:0x3B
	if(__NFUN_340__(TKObj, none))
	{
		TKObj.StopTelekinesis();
		TKObj = none;
	}
	__NFUN_589__('Generic1', NewColorBytes(0, 0, 0), 0.025);
	super.DiedActivity(Killer, Damage, DamageOrigin, DamageDirection, DamageType, HitBoneName);
	return;
}

event NotifyOpStarted(Engine.BaseAI.EAIOp NewOp, Engine.BaseAI.EAIOp OldOp)
{
	super.NotifyOpStarted(NewOp, OldOp);
	// End:0x29
	if(__NFUN_173__(int(NewOp), int(96)))
	{
		KLinearDamping = PainKLinearDamping;
	}
	// End:0x58
	if(__NFUN_173__(int(NewOp), int(117)))
	{
		FadeLightIn = true;
		__NFUN_589__('Generic1', NewColorBytes(255, 255, 255), 0.5);
	}
	// End:0xAC
	if(__NFUN_148__(__NFUN_340__(TKObj, none), __NFUN_174__(int(GetExecutive()), int(1))))
	{
		switch(NewOp)
		{
			// End:0x82
			case 13:
			// End:0x87
			case 141:
			// End:0x8F
			case 103:
				// End:0xAC
				break;
			// End:0xFFFF
			default:
				TKObj.StopTelekinesis();
				TKObj = none;
				// End:0xAC
				break;
				break;
		}
	}
	return;
}

event NotifyOpEnded(Engine.BaseAI.EAIOp Op, Engine.BaseAI.EAIOpStatus Status)
{
	super.NotifyOpEnded(Op, Status);
	// End:0x29
	if(__NFUN_173__(int(Op), int(96)))
	{
		KLinearDamping = default.KLinearDamping;
	}
	return;
}

function dnProjectile FireProjectile(name MuzzleName, class<dnProjectile> ProjClass, float LeadTime, bool CheckLOS)
{
	__NFUN_589__('Generic1', NewColorBytes(0, 0, 0), 0.025);
	return super.FireProjectile(MuzzleName, ProjClass, LeadTime, CheckLOS);
	return;
}

function float CalculateFlyContraintStrengthScalar(float DeltaTime)
{
	return super.CalculateFlyContraintStrengthScalar(DeltaTime);
	return;
}

simulated function ApplyDeathImpulse(KarmaActor ImpulseCorpse, int Damage, class<DamageType> DamageType, Vector DamageOrigin, Vector DamageDir, name BoneName, Pawn DeathInstigator)
{
	local float DirectionalDot, DrawScaleDifference;
	local Vector CorpseGravity, DamageMomentum;
	local bool bSteroids;

	// End:0x110
	if(__NFUN_148__(__NFUN_340__(DamageType, none), __NFUN_340__(ImpulseCorpse, none)))
	{
		CorpseGravity = ImpulseCorpse.__NFUN_640__();
		DrawScaleDifference = 1;
		// End:0x8F
		if(__NFUN_148__(__NFUN_340__(DeathInstigator, none), __NFUN_206__(DeathInstigator.DrawScale, DeathInstigator.default.DrawScale)))
		{
			DrawScaleDifference = __NFUN_196__(DeathInstigator.DrawScale, DeathInstigator.default.DrawScale);
		}
		// End:0xB2
		if(__NFUN_340__(DeathInstigator, none))
		{
			bSteroids = DeathInstigator.bOnSteroids;
		}
		DamageMomentum = __NFUN_234__(__NFUN_234__(__NFUN_235__(DrawScaleDifference, ImpulseCorpse.GenerateDamageMomentum(DamageDir, DamageType, DrawScaleDifference, bSteroids)), DamageType.default.DeathMomentumScale), CorpseImpulseMomentumScale);
		ImpulseCorpse.__NFUN_790__(DamageMomentum, 3);
	}
	return;
}

event float GetDefaultGotoXRange(float Range)
{
	return 35;
	return;
}

function AIScaleDamage(Pawn Instigator, out float Damage, Engine.Object.EPawnBodyPart Part, Vector DamageOrigin, Vector DamageDirection, class<DamageType> DamageType, optional name HitBoneName, optional Vector DamageStart)
{
	// End:0x0E
	if(__NFUN_339__(Instigator, self))
	{
		return;
	}
	super.AIScaleDamage(Instigator, Damage, Part, DamageOrigin, DamageDirection, DamageType, HitBoneName, DamageStart);
	return;
}

function Vector GetFireAimAtPos()
{
	local Vector EndPos;

	EndPos = PrimaryTarget.GetBodyPos();
	return EndPos;
	return;
}

event Tick(float DeltaSeconds)
{
	super(Actor).Tick(DeltaSeconds);
	// End:0x16C
	if(__NFUN_340__(MountedLightEx, none))
	{
		// End:0xD2
		if(__NFUN_148__(__NFUN_173__(int(GetCurrentOp()), int(117)), FadeLightIn))
		{
			MountedLightEx.LightRadius = __NFUN_224__(__NFUN_198__(MountedLightEx.LightRadius, __NFUN_195__(MountedLightEx.default.LightRadius, __NFUN_196__(DeltaSeconds, LightFadeInTime))), MountedLightEx.default.LightRadius);
			MountedLightEx.LightIntensity = __NFUN_224__(__NFUN_198__(MountedLightEx.LightIntensity, __NFUN_195__(MountedLightEx.default.LightIntensity, __NFUN_196__(DeltaSeconds, LightFadeInTime))), MountedLightEx.default.LightIntensity);			
		}
		else
		{
			MountedLightEx.LightRadius = __NFUN_225__(__NFUN_199__(MountedLightEx.LightRadius, __NFUN_195__(MountedLightEx.default.LightRadius, __NFUN_196__(DeltaSeconds, LightFadeOutTime))), 0);
			MountedLightEx.LightIntensity = __NFUN_225__(__NFUN_199__(MountedLightEx.LightIntensity, __NFUN_195__(MountedLightEx.default.LightIntensity, __NFUN_196__(DeltaSeconds, LightFadeOutTime))), 0);
		}
		MountedLightEx.MarkDirty();
	}
	return;
}

simulated function TripMineAttached(Actor TripMineActor, float AutoDetonateTime)
{
	bForceHaywire = true;
	CanUseOp(80);
	HaywireParms.HitNormal = Vector(TripMineActor.Rotation);
	CurrentOpMustFinish = false;
	SuspendExecutive(true);
	SuspendWeaponTargetEvaluation(true);
	SuspendLookTargetEvaluation(true);
	ExecuteOp(80);
	bForceHaywire = false;
	return;
}

simulated function BecomeFrozen()
{
	CurrentOpMustFinish = false;
	ExecuteOp(85);
	CurrentOpMustFinish = true;
	super.BecomeFrozen();
	DestroyShootProjectileEffects();
	bDoOverlayEffect = false;
	FadeOverlayEffect(0, 0.1);
	__NFUN_589__('Generic1', NewColorBytes(0, 0, 0), 0.1);
	DropTKObjStraightDown();
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	local InteractiveActor TKObj;

	super(Pawn).RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1266__(class'dnOctabrainFX_BrainChargeA');
	// End:0xC8
	foreach __NFUN_747__(class'InteractiveActor', TKObj)
	{
		// End:0x46
		if(__NFUN_145__(TKObj.bTelekineticable))
		{
			continue;			
		}
		// End:0x87
		if(__NFUN_309__(TKObj.TelekinesisChargeClassName, ""))
		{
			PrecacheIndex.__NFUN_1266__(class<Actor>(__NFUN_366__(string(TKObj.TelekinesisCharge), class'Class')));
		}
		// End:0xC7
		if(__NFUN_309__(TKObj.TelekinesisBeamSystemClassName, ""))
		{
			PrecacheIndex.__NFUN_1266__(class<Actor>(__NFUN_366__(TKObj.TelekinesisBeamSystemClassName, class'Class')));
		}		
	}	
	PrecacheIndex.__NFUN_1269__(ChargeMaterial);
	RegisterAIAnimationControllerEntry(PrecacheIndex, 'Anim_Idle');
	RegisterAIAnimationControllerEntry(PrecacheIndex, 'Anim_Run');
	RegisterAIAnimationControllerEntry(PrecacheIndex, 'Anim_RunBackwards');
	RegisterAIAnimationControllerEntry(PrecacheIndex, 'Anim_TurnLeft45');
	RegisterAIAnimationControllerEntry(PrecacheIndex, 'Anim_TurnLeft180');
	RegisterAIAnimationControllerEntry(PrecacheIndex, 'Anim_TurnRight45');
	RegisterAIAnimationControllerEntry(PrecacheIndex, 'Anim_TurnRight180');
	RegisterAIAnimationControllerEntry(PrecacheIndex, 'Anim_SidestepLeft');
	RegisterAIAnimationControllerEntry(PrecacheIndex, 'Anim_SidestepRight');
	RegisterAIAnimationControllerEntry(PrecacheIndex, 'Anim_Attack');
	RegisterAIAnimationControllerEntry(PrecacheIndex, 'Anim_ShootProjectile');
	RegisterAIAnimationControllerEntry(PrecacheIndex, 'Anim_CatchTKObj0');
	RegisterAIAnimationControllerEntry(PrecacheIndex, 'Anim_ThrowTKObj0');
	RegisterAIAnimationControllerEntry(PrecacheIndex, 'Anim_ReleaseTKObj');
	PrecacheIndex.__NFUN_1279__(class'BiteDamage');
	PrecacheIndex.__NFUN_1279__(class'TentacleDamage');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Sound_Attack_Bite');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Sound_Attack_Throw');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Sound_Charge');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Sound_Enemy_Thrown');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Sound_FireBrainBlast');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Sound_Idle');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Sound_PreFire');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Sound_Pursuit');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Sound_Telekinesis');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Sound_Telekinesis_Throw');
	return;
}

event EnumerateUsableAnimationControllers(PrecacheIndex PrecacheIndex, out array<Engine.BaseAI.EAIAnimController> UsableControllers)
{
	UsableControllers[string(UsableControllers)] = 1;
	return;
}

state AnimX
{
	event BeginState()
	{
		local Engine.BaseAI.EAIOp MyOp;

		super.BeginState();
		MyOp = GetCurrentOp();
		// End:0x23
		if(__NFUN_173__(int(MyOp), int(92)))
		{			
		}
		else
		{
			// End:0x3C
			if(__NFUN_173__(int(MyOp), int(117)))
			{
				FindSoundAndSpeak('Sound_PreFire');
			}
		}
		return;
	}

	function MovementFudgeActor(Actor MoveTarget, float Speed)
	{
		__NFUN_889__(MoveTarget);
		return;
	}
	stop;
}

defaultproperties
{
	MeleeLocked=true
	MinProjectileInterval=1
	RndProjectileInterval=4
	PickupTKObjInterval=1
	ChanceLockMelee=0.25
	ChanceUnlockMelee=0.35
	PainKLinearDamping=0.5
	CorpseImpulseMomentumScale=0.1
	LightFadeOutTime=0.25
	LightFadeInTime=0.25
	EffectScale=1
	ChargeMaterial='dt_Effects2.Overlays.EnergyOverlay_FB'
	MountedLightExMountPrefab=(bSkipVerifySelf=false,SpawnClass='Octabrain_MountedLightEx',SpawnChance=1,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=true,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=1.298303E-41,Y=3.773024E-17,Z=0),Z=0),MountOriginVariance=(X=1.298303E-41,Y=3.773024E-17,Z=0),Z=0)
	Nodes(0)=(GroupCrossfadeOverride=22,Root=8.117489E+11)
	Nodes(1)=(SucCond=1,SucFunc=None,FailCond=1,FailFunc=None,Op=0,OpRef=0,SharedTransitions=(none,(StateTable=/* Array type was not detected. */),(CurStateIndex=0),(Ident=Guard,Status=0,ReportedInvalid=false,SucCond=76,SucFunc=None,FailCond=1,FailFunc=None,Op=0,OpRef=0,SharedTransitions=/* Array type was not detected. */),(StateTable=/* Array type was not detected. */),(CurStateIndex=0),(Ident=GotoGuardAttack,Status=0,ReportedInvalid=false,SucCond=61,SucFunc=None,FailCond=1,FailFunc=None,Op=0,OpRef=0,SharedTransitions=/* Array type was not detected. */),(StateTable=/* Array type was not detected. */),(CurStateIndex=0),(Ident=GotoGuardPos,Status=0,ReportedInvalid=false,SucCond=79,SucFunc=None,FailCond=1,FailFunc=None,Op=0,OpRef=0,SharedTransitions=/* Array type was not detected. */),(StateTable=/* Array type was not detected. */)),CurStateIndex=0)
	Nodes(2)=(Ident=Attack,Status=0,ReportedInvalid=false,SucCond=7,SucFunc=None,FailCond=10,FailFunc=None,Op=0,OpRef=0,SharedTransitions=(none,(StateTable=/* Array type was not detected. */),(CurStateIndex=0),(Ident=AttackMelee,Status=0,ReportedInvalid=false,SucCond=7,SucFunc=None,FailCond=1,FailFunc=None,Op=0,OpRef=0,SharedTransitions=/* Array type was not detected. */),(StateTable=/* Array type was not detected. */),(CurStateIndex=0),(Ident=AttackWeapon,Status=0,ReportedInvalid=false,SucCond=7,SucFunc=None,FailCond=1,FailFunc=None,Op=0,OpRef=0,SharedTransitions=/* Array type was not detected. */),(StateTable=/* Array type was not detected. */),(CurStateIndex=0),(Ident=AttackActionPoint,Status=0,ReportedInvalid=false,SucCond=7,SucFunc=None,FailCond=1,FailFunc=None,Op=0,OpRef=0,SharedTransitions=/* Array type was not detected. */),(StateTable=/* Array type was not detected. */)),CurStateIndex=0)
	Nodes(3)=(Ident=TK,Status=0,ReportedInvalid=false,SucCond=1,SucFunc=None,FailCond=89,FailFunc=None,Op=0,OpRef=0,SharedTransitions=(none,(StateTable=/* Array type was not detected. */),(CurStateIndex=0),(Ident=AvoidDanger,Status=0,ReportedInvalid=false,SucCond=1,SucFunc=None,FailCond=1,FailFunc=None,Op=0,OpRef=0,SharedTransitions=/* Array type was not detected. */),(StateTable=/* Array type was not detected. */),(CurStateIndex=0),(Ident=Wait,Status=0,ReportedInvalid=false,SucCond=1,SucFunc=None,FailCond=1,FailFunc=None,Op=0,OpRef=0,SharedTransitions=/* Array type was not detected. */),(StateTable=/* Array type was not detected. */),(CurStateIndex=0),(Ident=Default,Status=0,ReportedInvalid=false,SucCond=0,SucFunc=None,FailCond=0,FailFunc=None,Op=85,OpRef=0,SharedTransitions=/* Array type was not detected. */),(StateTable=/* Array type was not detected. */)),CurStateIndex=0)
	Nodes(4)=(Ident=Pain,Status=0,ReportedInvalid=false,SucCond=0,SucFunc=None,FailCond=0,FailFunc=None,Op=96,OpRef=0,SharedTransitions=(none,(StateTable=/* Array type was not detected. */),(CurStateIndex=0),(Ident=idle,Status=0,ReportedInvalid=false,SucCond=0,SucFunc=None,FailCond=0,FailFunc=None,Op=85,OpRef=0,SharedTransitions=/* Array type was not detected. */),(StateTable=/* Array type was not detected. */),(CurStateIndex=0),(Ident=IdleEx,Status=0,ReportedInvalid=false,SucCond=0,SucFunc=None,FailCond=0,FailFunc=None,Op=86,OpRef=0,SharedTransitions=/* Array type was not detected. */),(StateTable=/* Array type was not detected. */),(CurStateIndex=0),(Ident=FaceTarget,Status=0,ReportedInvalid=false,SucCond=0,SucFunc=None,FailCond=0,FailFunc=None,Op=145,OpRef=0,SharedTransitions=/* Array type was not detected. */),(StateTable=/* Array type was not detected. */)),CurStateIndex=0)
	Nodes(5)=(Ident=FaceGuardedActor,Status=0,ReportedInvalid=false,SucCond=0,SucFunc=None,FailCond=0,FailFunc=None,Op=143,OpRef=0,SharedTransitions=(none,(StateTable=/* Array type was not detected. */),(CurStateIndex=0),(Ident=GotoGoalFacePosOneStep,Status=0,ReportedInvalid=false,SucCond=0,SucFunc=None,FailCond=0,FailFunc=None,Op=48,OpRef=0,SharedTransitions=/* Array type was not detected. */),(StateTable=/* Array type was not detected. */),(CurStateIndex=0),(Ident=GotoMeleeRangeFocusActor,Status=0,ReportedInvalid=false,SucCond=0,SucFunc=None,FailCond=0,FailFunc=None,Op=66,OpRef=0,SharedTransitions=/* Array type was not detected. */),(StateTable=/* Array type was not detected. */),(CurStateIndex=0),(Ident=GotoGuardMeleeAttack,Status=0,ReportedInvalid=false,SucCond=0,SucFunc=None,FailCond=0,FailFunc=None,Op=66,OpRef=0,SharedTransitions=/* Array type was not detected. */),(StateTable=/* Array type was not detected. */)),CurStateIndex=0)
	Win=-1216937130
	ate=Code
}