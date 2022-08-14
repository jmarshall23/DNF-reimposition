/*******************************************************************************
 * LaserMine generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class LaserMine extends dnProjectile
	collapsecategories
	dependson(LaserMineBeam);

var() noexport bool bArmImmediately "When set, the mine will start arming the moment it is spawned into the world.";
var() noexport bool bNoArmSound "Don't make noise while arming, use for preplaced mines.";
var() noexport bool bNoAmbience "Disable the trip mine's ambient noise completely.";
var() noexport bool bDisableOnStartup "Should the beam start disabled?";
var() noexport bool bDisableTraceOnStartup "Should the beam disable tracing on startup.";
var() noexport bool bOnlyTracePawns "Should the beam only trace against pawns?";
var() noexport float ArmingTime "Time in seconds to arm the laser";
var() noexport float AutoDetonateTime "When a mine is placed and told to detonate automatically (placed in an area it can't make a beam or placed on a bad guy), how long before going off.";
var() noexport float BlastDistance "Distance the damage comes out of the mine";
var() noexport float BlastAngleLimit "Max angle of the damage from the mine";
var() noexport float BeamDistance "How far out a beam should go to try and find a suitable target to attach to. If it doesn't find one, it will auto-detonate.";
var SSoundInfo ArmedSound;
var SSoundInfo ArmingCharge;
var Sound AmbientHum;
var() noexport Color ShieldedLaserColor "Color of the laser when the mine is shielded.";
var() noexport Color NormalLaserColor "Color of the laser when the mine is no longer shielded.";
var() noexport name ToggleBeamTag "Trigger this event to enable/disable the beam.";
var() noexport name ToggleBeamTracingTag "Trigger this event to enable/disable the per-frame trace on the beam.";
var() noexport deprecated LaserMine LinkedLaserMine "Set this to another laser mine to make them share a beam.";
var() noexport class<LaserMineBeam> BeamClass "Beam class to use for this laser mine.";
var array<LaserMine> PreviousLaserMines;
var bool bLinkComplete;
var SMountedActorPrefab ShieldMountPrefab;
var int UpwardsViewBoost;
var array<Actor> HurtRadiusIgnoreActors;
var netupdate(NU_bArmedChange) bool bArmed;
var LaserMineBeam LaserBeam;
var float ForceArmTimer;

replication
{
	// Pos:0x000
	reliable if(__NFUN_173__(int(Role), int(ROLE_Authority)))
		rAutoDetonate, rInitializeMotionCustom, 
		rSetupMineInterpolation, rSpawnLaserBeam, 
		rThrownMineAttach;

	// Pos:0x00B
	reliable if(__NFUN_173__(int(Role), int(ROLE_Authority)))
		bArmed;
}

noexport simulated delegate rThrownMineAttach(Vector AbsoluteLocation, Rotator AbsoluteRotation, Vector TraceLocation, Rotator TraceRotation, Actor TraceActor, name MeshBoneName)
{
	__NFUN_642__(default.Physics);
	RestoreCollision();
	__NFUN_645__(TraceLocation);
	__NFUN_652__(TraceRotation);
	// End:0x41
	if(__NFUN_342__(MeshBoneName, 'None'))
	{
		MountType = 2;
		MountMeshItem = MeshBoneName;
	}
	__NFUN_635__(TraceActor,,, true);
	SetupMineInterpolation(MountParent, MountMeshItem, 0.1, AbsoluteLocation, MountOrigin, AbsoluteRotation, MountAngles);
	return;
}

noexport simulated delegate rSetupMineInterpolation(Actor InterpolationRelativeActor, name InterpolationRelativeBone, float InterpolationTime, Vector InterpolationStartingLocationAbsolute, Vector InterpolationEndingLocation, Rotator InterpolationStartingRotationAbsolute, Rotator InterpolationEndingRotation)
{
	SetupMineInterpolation(InterpolationRelativeActor, InterpolationRelativeBone, InterpolationTime, InterpolationStartingLocationAbsolute, InterpolationEndingLocation, InterpolationStartingRotationAbsolute, InterpolationEndingRotation);
	return;
}

simulated function SetupMineInterpolation(Actor InterpolationRelativeActor, name InterpolationRelativeBone, float InterpolationTime, Vector InterpolationStartingLocationAbsolute, Vector InterpolationEndingLocation, Rotator InterpolationStartingRotationAbsolute, Rotator InterpolationEndingRotation)
{
	local SDesiredLocation DesiredLocation;

	__NFUN_645__(InterpolationStartingLocationAbsolute);
	__NFUN_652__(InterpolationStartingRotationAbsolute);
	// End:0x33
	if(__NFUN_342__(InterpolationRelativeBone, 'None'))
	{
		MountType = 2;
		MountMeshItem = InterpolationRelativeBone;
	}
	__NFUN_635__(InterpolationRelativeActor,,, true);
	DesiredLocation.Target = InterpolationEndingLocation;
	DesiredLocation.TimeTotal = InterpolationTime;
	DesiredLocation.FunctionComplete = 'MineAttached';
	__NFUN_650__(DesiredLocation);
	__NFUN_663__(InterpolationEndingRotation,, InterpolationTime,,,,,,, true);
	return;
}

simulated event PostVerifySelf()
{
	super(Projectile).PostVerifySelf();
	// End:0x2E
	if(__NFUN_206__(DrawScale, default.DrawScale))
	{
		BlastDistance = __NFUN_196__(__NFUN_195__(BlastDistance, DrawScale), default.DrawScale);
	}
	return;
}

event PostBeginPlay()
{
	local LaserMine LM;

	super(InteractiveActor).PostBeginPlay();
	// End:0x33
	if(__NFUN_145__(bLinkComplete))
	{
		// End:0x32
		foreach __NFUN_747__(class'LaserMine', LM)
		{
			LM.ProcessLinking();			
		}		
	}
	// End:0x42
	if(bArmImmediately)
	{
		MineAttached();
	}
	return;
}

final simulated function ProcessLinking()
{
	// End:0x13
	if(__NFUN_339__(LinkedLaserMine, self))
	{
		LinkedLaserMine = none;
	}
	// End:0x69
	if(__NFUN_340__(LinkedLaserMine, none))
	{
		// End:0x46
		if(__NFUN_339__(LinkedLaserMine.LinkedLaserMine, self))
		{
			LinkedLaserMine.LinkedLaserMine = none;
		}
		LinkedLaserMine.PreviousLaserMines[LinkedLaserMine.PreviousLaserMines.Add(1)] = self;
	}
	bLinkComplete = true;
	return;
}

simulated function InitializeMotion()
{
	return;
}

noexport simulated delegate rInitializeMotionCustom()
{
	local Rotator TossAngle;

	StoreCollision();
	__NFUN_621__(true, true, true, true, true);
	bIgnorePawnAirCushion = true;
	__NFUN_642__(18);
	TossAngle = __NFUN_283__(__NFUN_275__(Instigator.ViewRotation, __NFUN_265__(UpwardsViewBoost, 0, 0)));
	TossAngle.Pitch = __NFUN_191__(TossAngle.Pitch, -16384, 16384);
	__NFUN_790__(__NFUN_235__(__NFUN_195__(__NFUN_196__(DrawScale, default.DrawScale), ThrowForce), Vector(TossAngle)));
	__NFUN_607__(ForceArmTimer, false, 'MineAttached');
	return;
}

simulated function bool CanAcceptMinePlacement(STraceHitResult HitResult)
{
	local Actor HitActor;

	HitActor = HitResult.Actor;
	// End:0x1E
	if(__NFUN_339__(HitActor, none))
	{
		return false;
	}
	// End:0x51
	if(__NFUN_148__(__NFUN_339__(HitActor, Level), __NFUN_145__(HitActor.BSPSurfaceIsValidForMineAttachment(HitResult.BSPSurfIndex))))
	{
		return false;
	}
	// End:0x7A
	if(__NFUN_173__(int(Level.NetMode), int(NM_Standalone)))
	{
		return HitActor.bAcceptMines;
	}
	return HitActor.bAcceptMinesInMultiplayer;
	return;
}

event KImpact(name SelfBoneName, KarmaActor Other, name OtherBoneName, Vector inPosition, Vector ImpactVelocity, Vector ImpactNormal)
{
	local STraceFlags TraceFlags;
	local STraceHitResult PlacementTraceResult;
	local Vector AbsoluteLocation;
	local Rotator AbsoluteRotation;
	local float TraceDist;
	local bool bAccept, bAcceptAtAnyAngle;
	local Pawn pawnTarget;
	local float dotproduct;
	local Vector pushDir;

	// End:0x1A
	if(__NFUN_173__(int(Level.NetMode), int(NM_Client)))
	{
		return;
	}
	// End:0xC4
	if(__NFUN_339__(Other, Instigator))
	{
		dotproduct = __NFUN_244__(ImpactVelocity, ImpactNormal);
		// End:0xC2
		if(__NFUN_201__(dotproduct, float(0)))
		{
			pushDir = __NFUN_239__(Location, Instigator.Location);
			pushDir.Z = 0;
			pushDir = __NFUN_253__(pushDir);
			// End:0xB5
			if(__NFUN_148__(__NFUN_204__(pushDir.X, float(0)), __NFUN_204__(pushDir.Y, float(0))))
			{
				pushDir.X = 1;
			}
			__NFUN_790__(__NFUN_234__(pushDir, float(100)));
		}
		return;
	}
	// End:0x2D0
	if(__NFUN_148__(__NFUN_340__(Other, Instigator), __NFUN_339__(MountParent, none)))
	{
		// End:0x151
		if(__NFUN_340__(Other, none))
		{
			// End:0x120
			if(__NFUN_173__(int(Level.NetMode), int(NM_Standalone)))
			{
				bAccept = Other.bAcceptMines;				
			}
			else
			{
				bAccept = Other.bAcceptMinesInMultiplayer;
			}
			bAcceptAtAnyAngle = Other.bAcceptMinesAtAnyAngle;			
		}
		else
		{
			bAccept = true;
			bAcceptAtAnyAngle = true;
		}
		// End:0x2D0
		if(__NFUN_148__(bAccept, __NFUN_150__(bAcceptAtAnyAngle, __NFUN_201__(__NFUN_244__(Vector(Rotation), ImpactNormal), float(0)))))
		{
			TraceFlags.bTraceActors = true;
			TraceFlags.bMeshAccurate = true;
			TraceFlags.bShotTrace = true;
			TraceFlags.bTraceTexture = true;
			AbsoluteLocation = Location;
			AbsoluteRotation = Rotation;
			TraceDist = float(__NFUN_188__(int(__NFUN_251__(ImpactVelocity)), int(Instigator.UseDistance)));
			pawnTarget = Pawn(Other);
			// End:0x240
			if(__NFUN_340__(pawnTarget, none))
			{
				// End:0x240
				if(__NFUN_200__(TraceDist, pawnTarget.CollisionRadius))
				{
					TraceDist = pawnTarget.CollisionRadius;
				}
			}
			ImpactNormal = __NFUN_253__(ImpactNormal);
			__NFUN_736__(__NFUN_238__(Location, __NFUN_234__(__NFUN_234__(ImpactNormal, TraceDist), 0.5)), __NFUN_238__(Location, __NFUN_234__(__NFUN_233__(ImpactNormal), TraceDist)), TraceFlags, PlacementTraceResult);
			// End:0x2D0
			if(CanAcceptMinePlacement(PlacementTraceResult))
			{
				rThrownMineAttach(AbsoluteLocation, AbsoluteRotation, PlacementTraceResult.Location, Rotator(PlacementTraceResult.Normal), PlacementTraceResult.Actor, PlacementTraceResult.MeshBone);
			}
		}
	}
	return;
}

simulated function ProjectileHitSomething(Vector HitNormal, Actor Wall)
{
	return;
}

event MineAttached()
{
	__NFUN_608__('MineAttached');
	// End:0x2D
	if(__NFUN_145__(bNoArmSound))
	{
		FindAndPlaySound('Impact', 3);
		FindAndPlaySound('Arming', 3);
	}
	__NFUN_621__(, true);
	bTraceShootable = true;
	// End:0xC8
	if(__NFUN_148__(__NFUN_340__(MountParent, none), __NFUN_150__(__NFUN_150__(MountParent.bIsPawn, __NFUN_148__(__NFUN_340__(MountParent.MountParent, none), MountParent.MountParent.bIsPawn)), __NFUN_148__(__NFUN_340__(Decoration(MountParent), none), Decoration(MountParent).bEnemy))))
	{
		ArmMineOnPawn();		
	}
	else
	{
		__NFUN_607__(ArmingTime, false, 'ArmMine');
	}
	// End:0xF8
	if(__NFUN_340__(MountParent, none))
	{
		MountParent.TripMineAttached(self, AutoDetonateTime);
	}
	TickStyle = 0;
	return;
}

function ArmMineOnPawn()
{
	local Pawn MountPawn;

	__NFUN_607__(ArmingTime, false, 'rSpawnLaserBeam');
	__NFUN_607__(AutoDetonateTime, false, 'rAutoDetonate');
	__NFUN_608__('ArmMine');
	MountPawn = Pawn(MountParent);
	// End:0x5A
	if(__NFUN_339__(MountPawn, none))
	{
		MountPawn = Pawn(MountParent.MountParent);
	}
	// End:0xAA
	if(__NFUN_148__(__NFUN_148__(__NFUN_340__(MountPawn, none), __NFUN_340__(DukePlayer(Instigator), none)), MountPawn.IsEnemyTo(Instigator)))
	{
		DukePlayer(Instigator).AwardAchievement(21);
	}
	return;
}

function Disarm()
{
	__NFUN_608__('rAutoDetonate');
	bArmed = false;
	return;
}

noexport simulated delegate rSpawnLaserBeam()
{
	SpawnLaserBeam();
	return;
}

function ArmMine()
{
	bArmed = true;
	SpawnLaserBeam();
	// End:0x26
	if(__NFUN_145__(bNoArmSound))
	{
		FindAndPlaySound('Armed', 3);
	}
	// End:0x3C
	if(__NFUN_145__(bNoAmbience))
	{
		FindAndPlaySound('Armed_Ambience');
	}
	return;
}

simulated function NU_bArmedChange(bool newbArmed)
{
	// End:0x12
	if(newbArmed)
	{
		SpawnLaserBeam();		
	}
	else
	{
		// End:0x2B
		if(__NFUN_340__(LaserBeam, none))
		{
			LaserBeam.__NFUN_614__();
		}
	}
	return;
}

simulated function SpawnLaserBeam()
{
	local Vector X, Y, Z;

	__NFUN_279__(Rotation, X, Y, Z);
	// End:0x24F
	if(__NFUN_148__(__NFUN_148__(__NFUN_339__(LaserBeam, none), __NFUN_340__(BeamClass, none)), __NFUN_150__(__NFUN_340__(LinkedLaserMine, none), __NFUN_171__(string(PreviousLaserMines), 0))))
	{
		LaserBeam = __NFUN_615__(BeamClass);
		LaserBeam.bDebugEvents = bDebugEvents;
		LaserBeam.MountType = 2;
		LaserBeam.MountMeshItem = 'mount_beam';
		LaserBeam.__NFUN_635__(self, false, false, false, false, false);
		LaserBeam.TraceEnabled = __NFUN_145__(bDisableTraceOnStartup);
		LaserBeam.bBeamOnlyCheckPawns = bOnlyTracePawns;
		LaserBeam.TickNearbyRadius = BeamDistance;
		LaserBeam.__NFUN_590__(bHidden);
		// End:0x186
		if(__NFUN_148__(__NFUN_340__(Instigator, none), __NFUN_150__(Instigator.bFullyShrunk, Instigator.IsShrinking())))
		{
			LaserBeam.BeamStartWidth = __NFUN_195__(LaserBeam.BeamStartWidth, 0.25);
			LaserBeam.BeamEndWidth = __NFUN_195__(LaserBeam.BeamEndWidth, 0.25);
		}
		EnableBeam(__NFUN_145__(bDisableOnStartup));
		// End:0x1B3
		if(__NFUN_173__(int(Role), int(ROLE_Authority)))
		{
			LaserBeam.BeamTriggerActor = self;
		}
		// End:0x1E7
		if(__NFUN_340__(LinkedLaserMine, none))
		{
			LaserBeam.AddSegmentActor(LaserBeam, LinkedLaserMine,, 'mount_beam', 'mount_beam');			
		}
		else
		{
			LaserBeam.AddSegmentActorAndLoc(LaserBeam, __NFUN_238__(LaserBeam.Location, __NFUN_234__(X, BeamDistance)),,, 'mount_beam');
			LaserBeam.DynamicBeamPoints = BeamDistance;
		}
		__NFUN_718__('ToggleBeam', ToggleBeamTag);
		__NFUN_718__('ToggleBeamTracing', ToggleBeamTracingTag);
	}
	return;
}

function TriggerFunc_ToggleBeam()
{
	// End:0x24
	if(__NFUN_340__(LaserBeam, none))
	{
		EnableBeam(__NFUN_145__(LaserBeam.Enabled));
	}
	return;
}

function TriggerFunc_ToggleBeamTracing()
{
	// End:0x64
	if(__NFUN_340__(LaserBeam, none))
	{
		LaserBeam.TraceEnabled = __NFUN_145__(LaserBeam.TraceEnabled);
		// End:0x64
		if(__NFUN_148__(LaserBeam.Enabled, LaserBeam.TraceEnabled))
		{
			LaserBeam.__NFUN_745__();
		}
	}
	return;
}

final function EnableBeam(bool bEnable)
{
	// End:0xAE
	if(__NFUN_340__(LaserBeam, none))
	{
		LaserBeam.Enabled = bEnable;
		// End:0x7C
		if(bEnable)
		{
			// End:0x5A
			if(__NFUN_148__(IsMP(), __NFUN_173__(int(Role), int(ROLE_Authority))))
			{
				LaserBeam.TickStyle = 3;				
			}
			else
			{
				LaserBeam.TickStyle = LaserBeam.default.TickStyle;
			}			
		}
		else
		{
			LaserBeam.TickStyle = 0;
		}
		// End:0xAE
		if(LaserBeam.Enabled)
		{
			LaserBeam.__NFUN_745__();
		}
	}
	return;
}

simulated function bool CanBeUsedBy(Pawn User)
{
	// End:0x5B
	if(__NFUN_148__(__NFUN_339__(LinkedLaserMine, none), __NFUN_171__(string(PreviousLaserMines), 0)))
	{
		// End:0x5B
		if(__NFUN_148__(__NFUN_148__(__NFUN_145__(bShielded), bEMPulsed), class'Inventory'.static.CanPickupClass(class'TripMine', User)))
		{
			return super(InteractiveActor).CanBeUsedBy(User);
		}
	}
	return false;
	return;
}

event Used(Actor Other, Pawn EventInstigator)
{
	super(InteractiveActor).Used(Other, EventInstigator);
	// End:0x3B
	if(__NFUN_340__(class'Inventory'.static.AttemptPickup(class'TripMine', none, EventInstigator), none))
	{
		DisarmMine();
		__NFUN_614__();
	}
	return;
}

function DisarmMine()
{
	bArmed = false;
	// End:0x21
	if(__NFUN_340__(LaserBeam, none))
	{
		LaserBeam.__NFUN_614__();
	}
	__NFUN_701__(none);
	return;
}

simulated event Trigger(Actor Other, Pawn Instigator)
{
	super(Actor).Trigger(Other, Instigator);
	// End:0x3E
	if(__NFUN_339__(Other, LaserBeam))
	{
		DeferredExplosionTimer = 0;
		DeferredExplosionTimerVariance = 0;
		Detonate();
		return;
	}
	// End:0x50
	if(bArmed)
	{
		DisarmMine();		
	}
	else
	{
		ArmMine();
	}
	return;
}

simulated event DetachedFromMountParent()
{
	super(Actor).DetachedFromMountParent();
	// End:0x1A
	if(__NFUN_173__(int(Role), int(ROLE_Authority)))
	{
		AutoDetonate();
	}
	return;
}

simulated function Detonate()
{
	// End:0x37
	if(bArmed)
	{
		// End:0x26
		if(__NFUN_340__(MountParent, none))
		{
			MountParent.TripMineExplode(self);
		}
		ExecuteExplode(Location, Vector(Rotation));
	}
	return;
}

noexport simulated delegate rAutoDetonate()
{
	AutoDetonate();
	return;
}

final simulated function AutoDetonate()
{
	bArmed = true;
	Detonate();
	return;
}

function NoteHurtRadius(Actor Other)
{
	// End:0x1F
	if(__NFUN_340__(Other, none))
	{
		HurtRadiusIgnoreActors[HurtRadiusIgnoreActors.Add(1)] = Other;
	}
	return;
}

simulated function bool CanHurtRadiusOther(Actor Other)
{
	local int i;

	i = __NFUN_166__(string(HurtRadiusIgnoreActors), 1);
	J0x0F:

	// End:0x3C [Loop If]
	if(__NFUN_172__(i, 0))
	{
		// End:0x32
		if(__NFUN_339__(HurtRadiusIgnoreActors[i], Other))
		{
			return false;
		}
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0x0F;
	}
	return super(Projectile).CanHurtRadiusOther(Other);
	return;
}

function DoDamage(Vector HitLocation, Actor HitActor)
{
	HurtRadiusIgnoreActors.Empty();
	HurtRadiusDirectional(Damage, Location, BlastDistance, DamageFalloffStart, Vector(Rotation), BlastAngleLimit, DamageClass);
	super(Projectile).DoDamage(HitLocation, HitActor);
	return;
}

event TakeDamage(Pawn Instigator, float Damage, Vector DamageOrigin, Vector DamageDirection, class<DamageType> DamageType, optional name HitBoneName, optional Vector DamageStart)
{
	super(Projectile).TakeDamage(Instigator, Damage, DamageOrigin, DamageDirection, DamageType, HitBoneName, DamageStart);
	// End:0x34
	if(bNoDamage)
	{
		return;
	}
	// End:0x64
	if(__NFUN_339__(DamageType, class'LaserMineDamage'))
	{
		bNoDamage = true;
		__NFUN_607__(__NFUN_226__(0.5, 0.25), false, 'Detonate');		
	}
	else
	{
		Detonate();
	}
	return;
}

simulated function Destroyed()
{
	// End:0x19
	if(__NFUN_340__(LaserBeam, none))
	{
		LaserBeam.__NFUN_614__();
	}
	// End:0x32
	if(__NFUN_145__(bSilentDestroy))
	{
		bArmed = true;
		Detonate();
	}
	PassDestroyed();
	super.Destroyed();
	return;
}

final simulated function PassDestroyed()
{
	local LaserMine LM;

	// End:0x2B
	if(__NFUN_340__(LinkedLaserMine, none))
	{
		LM = LinkedLaserMine;
		LinkedLaserMine = none;
		LM.__NFUN_614__();
	}
	J0x2B:

	// End:0x79 [Loop If]
	if(__NFUN_170__(string(PreviousLaserMines), 0))
	{
		LM = PreviousLaserMines[0];
		PreviousLaserMines.Remove(0, 1);
		// End:0x76
		if(__NFUN_340__(LM, none))
		{
			LM.LinkedLaserMine = none;
			LM.__NFUN_614__();
		}
		// [Loop Continue]
		goto J0x2B;
	}
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super(InteractiveActor).RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1266__(BeamClass);
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Impact');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Arming');
	// End:0x6D
	if(__NFUN_145__(bNoArmSound))
	{
		PrecacheIndex.__NFUN_1277__(VoicePack, 'Armed');
	}
	// End:0x8F
	if(__NFUN_145__(bNoAmbience))
	{
		PrecacheIndex.__NFUN_1277__(VoicePack, 'Armed_Ambience');
	}
	return;
}

defaultproperties
{
	ArmingTime=2
	AutoDetonateTime=3
	BlastDistance=450
	BlastAngleLimit=40
	BeamDistance=2048
	ShieldedLaserColor=(B=121,G=2,R=1,A=64)
	NormalLaserColor=(B=121,G=2,R=1,A=255)
	BeamClass='LaserMineBeam_Thrown'
	UpwardsViewBoost=2048
	ForceArmTimer=3
	AITargetable=true
	MaxSpeed=0
	Damage=125
	DamageRadius=100
	DamageClass='LaserMineDamage'
	ShakeScalar=2.25
	ShakeInfo(0)=(bNoLerp=false,bToggleSign=false,Style=3,Function=0,FalloffActor=none,FalloffDistance=0,ShakeDuration=0.55,ShakeFrequency=0.05,ShakeMagnitude=800,ShakeFullMagnitude=0,ShakeFullMagnitudeTime=0,ShakeName=LaserMine_Shake)
	RumbleInfo(0)=(RumbleName=LaserMine_Rumble,RumbleDuration=0.5,RumbleLeftMagnitude=0.8,RumbleRightMagnitude=0,FalloffActor=none,FalloffDistance=0)
	ExplosionDecal='dnParticles.dnDecal_BlastMarkBlack'
	ExplosionClass='p_Weapons.Rpg_Explosion.RPG_Explosion_Spawner'
	UnderwaterExplosionClass='p_Weapons.RPG_Explosion_Underwater.RPG_Explosion_Underwater_Spawner'
	ExplosionLight='dnExplosionLight_RPG'
	ExplosionSoundName=ProjectileExplode
	bDrawHUDInfo=true
	bUsable=true
	bTelekineticable=false
	ThrowForce=600
	EMPDisableTime=5
	StartAnimSequence=tm_open
	HealthCap=1
	KImpactThreshold=50
	Physics=9
	bTraceShootable=true
	bAcceptMeshAccurateMoveActorTrace=true
	bBlockPlayers=false
	bNoFailMountedMovement=true
	bAcceptMinesInMultiplayer=false
	bAcceptMines=false
	bNetTemporary=false
	bDontSimulateMotion=true
	bCollideWorld=false
	CollisionRadius=10
	CollisionHeight=4
	TickStyle=0
	PrePivot=(X=1.292418E-41,Y=2.965293E-17,Z=0)
	Mesh='c_dnWeapon.TripMine'
	Skins(0)=none
	Skins(1)='mt_skins5.TripMine.tripmine2bc_armed'
	LifeSpan=0
	SoundVolume=48
	SoundRadius=400
	SoundInnerRadius=200
	VoicePack='SoundConfig.Inventory.VoicePack_TripMine'
}