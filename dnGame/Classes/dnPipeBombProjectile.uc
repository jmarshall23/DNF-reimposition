/*******************************************************************************
 * dnPipeBombProjectile generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnPipeBombProjectile extends dnGrenade
	collapsecategories
	dependson(DecalBomb);

var class<Detonator> DetonatorNotifyClass;
var float MaximumPipebombPickupVelocity;
var Pawn DetonationController;
var bool bAutoDecalBomb;
var int NumBeeps;
var() float BeepPeriod;

replication
{
	// Pos:0x000
	reliable if(__NFUN_173__(int(Role), int(ROLE_Authority)))
		rPipeBombExecuteExplode;
}

event Destroyed()
{
	local Detonator DetonatorRef;
	local DukeHUD PlayerHUD;

	// End:0x54
	if(__NFUN_148__(__NFUN_340__(DetonationController, none), __NFUN_340__(DetonatorNotifyClass, none)))
	{
		DetonatorRef = Detonator(DetonationController.__NFUN_917__(DetonatorNotifyClass));
		// End:0x54
		if(__NFUN_340__(DetonatorRef, none))
		{
			DetonatorRef.RemovePipebomb(self);
		}
	}
	// End:0x76
	foreach __NFUN_747__(class'DukeHUD', PlayerHUD)
	{
		PlayerHUD.RemoveActivePipeBomb(self);		
	}	
	super(dnProjectile).Destroyed();
	return;
}

event Spawned()
{
	local DukeHUD PlayerHUD;

	super(Actor).Spawned();
	// End:0x28
	foreach __NFUN_747__(class'DukeHUD', PlayerHUD)
	{
		PlayerHUD.AddActivePipeBomb(self);		
	}	
	__NFUN_605__(5, false, 'ClearAvoidRange');
	return;
}

function ClearAvoidRange()
{
	AvoidRange = 0;
	return;
}

simulated function InitializeMotion()
{
	return;
}

function ResumeCollision()
{
	__NFUN_812__(default.DynamicInteractionClassification);
	return;
}

simulated function NonImpactExplode()
{
	rPipeBombExecuteExplode(Location);
	return;
}

noexport simulated delegate rPipeBombExecuteExplode(Vector ExplosionLocation)
{
	ExecuteExplode(ExplosionLocation);
	return;
}

simulated function Explode(Vector HitLocation, optional Vector HitNormal, optional Actor HitActor)
{
	super(Projectile).Explode(HitLocation, HitNormal, HitActor);
	// End:0x3F
	if(bAutoDecalBomb)
	{
		class'DecalBomb'.static.StaticDeploy(class'dnExplosionDecalBomb', Location, Rotation, self, self);
	}
	return;
}

simulated function ProjectileTouchedSomething(Actor Other)
{
	local PipeBomb PipeBombRef;
	local Detonator DetonatorRef;
	local Inventory NewInv;
	local PlayerPawn P;

	// End:0xFC
	if(__NFUN_148__(__NFUN_148__(__NFUN_148__(__NFUN_173__(int(Role), int(ROLE_Authority)), Other.bIsPlayerPawn), __NFUN_200__(__NFUN_252__(Velocity), MaximumPipebombPickupVelocity)), __NFUN_150__(__NFUN_340__(Other, Instigator), __NFUN_201__(__NFUN_199__(Level.GameTimeSeconds, SpawnTime), SafetyTimer))))
	{
		P = PlayerPawn(Other);
		NewInv = class'Inventory'.static.AttemptPickup(class'PipeBomb', none, P, 1);
		// End:0xFC
		if(__NFUN_340__(NewInv, none))
		{
			DetonatorRef = Detonator(P.__NFUN_917__(class'Detonator'));
			// End:0xF9
			if(__NFUN_148__(__NFUN_340__(DetonatorRef, none), __NFUN_173__(DetonatorRef.ActivePipeBombCount, 1)))
			{
				P.BringUpLastWeapon();
			}
			__NFUN_614__();
		}
	}
	return;
}

function StartTelekinesis(Pawn TKOwner)
{
	super(InteractiveActor).StartTelekinesis(TKOwner);
	// End:0x32
	if(__NFUN_145__(bPrimedForExplosion))
	{
		ExplosionDelay = 2.5;
		BeepPeriod = 0.5;
		PrimeForDelayedExplosion();
	}
	return;
}

simulated function PrimeForDelayedExplosion()
{
	super.PrimeForDelayedExplosion();
	// End:0x30
	if(__NFUN_201__(BeepPeriod, 0))
	{
		FindAndPlaySound('Beep', 1);
		__NFUN_605__(BeepPeriod, true, 'DoBeepSound');
	}
	return;
}

simulated function DoBeepSound()
{
	AvoidRange = default.AvoidRange;
	// End:0x67
	if(__NFUN_200__(float(NumBeeps), __NFUN_199__(__NFUN_196__(ExplosionDelay, BeepPeriod), float(2))))
	{
		__NFUN_184__(NumBeeps);
		// End:0x5A
		if(__NFUN_200__(float(NumBeeps), __NFUN_199__(__NFUN_196__(ExplosionDelay, BeepPeriod), float(3))))
		{
			FindAndPlaySound('Beep', 1);			
		}
		else
		{
			FindAndPlaySound('MultiBeep', 1);
		}
	}
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super(InteractiveActor).RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1266__(class'dnExplosionDecalBomb');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Beep');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'MultiBeep');
	return;
}

defaultproperties
{
	DetonatorNotifyClass='Detonator'
	MaximumPipebombPickupVelocity=720
	bAutoDecalBomb=true
	UpwardsBoost=(X=1.292418E-41,Y=2.94903E-17,Z=0)
	bShowHUDWarning=true
	bExplodeOnDamage=true
	SafetyTimer=0.4
	Speed=750
	MaxSpeed=750
	Damage=125
	DamageRadius=260
	DamageClass='PipeBombDamage'
	NumBounces=-1
	ShakeScalar=2.25
	ShakeInfo(0)=(bNoLerp=false,bToggleSign=false,Style=3,Function=0,FalloffActor=none,FalloffDistance=0,ShakeDuration=0.55,ShakeFrequency=0.05,ShakeMagnitude=700,ShakeFullMagnitude=0,ShakeFullMagnitudeTime=0,ShakeName=dnPipeBombProjectile_Shake)
	RumbleInfo(0)=(RumbleName=dnPipeBombProjectile_Rumble,RumbleDuration=0.5,RumbleLeftMagnitude=0.8,RumbleRightMagnitude=0,FalloffActor=none,FalloffDistance=0)
	ExplosionClass='p_Weapons.PipeBomb_Explosion.PipeBomb_Explosion_Spawner'
	UnderwaterExplosionClass='p_Weapons.PipeBomb_Explosion_Underwater.PipeBomb_Explosion_Underwater_Spawner'
	ExplosionLight='dnExplosionLight_RPG'
	ExplosionSoundName=ProjectileExplode
	AvoidRange=200
	MountOnSpawn(0)=(bSkipVerifySelf=false,SpawnClass='PipeBombBeam',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=true,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=1.292418E-41,Y=2.95452E-17,Z=0),Z=0),MountOriginVariance=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
	MountOnSpawn(1)=(MountAngles=(Pitch=8741,Yaw=572915712,Roll=0),Roll=0)
	MountOnSpawn(2)=(MountAnglesVariance=(Pitch=8741,Yaw=572915712,Roll=0),Roll=0)
	HealthCap=1
	bResetOnFellOutOfWorld=true
	bStartEnabled=true
	bDoPhysicsWaterEffects=true
	WaterSplash='p_Decorations.WaterSplash_Medium.WaterSplash_Medium_Spawner'
	DynamicInteractionClassification=1
	PhysicsMaterial='dnMaterial.dnPhysicsMaterial_PipeBomb'
	KRestitution=0.5
	KLinearDamping=0.28
	KAngularDamping=0.58
	Density=2.8
	bBlockActors=false
	bBlockPlayers=false
	bIsPipeBombOrTripMine=true
	bDumbMesh=false
	bNetTemporary=false
	CollisionRadius=8
	CollisionHeight=8
	Mass=5
	DrawType=8
	StaticMesh='sm_class_decorations.Weapon_Pickups.PipeBomb_Static'
	LifeSpan=0
	NetPriority=1
	TransientSoundVolume=0.5
	TransientSoundRadius=800
	TransientSoundInnerRadius=400
	VoicePack='SoundConfig.Inventory.VoicePack_PipeBomb'
}