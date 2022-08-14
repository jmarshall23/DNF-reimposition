/*******************************************************************************
 * dnFlybyPlane_Fighter_Gibs generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnFlybyPlane_Fighter_Gibs extends dnDecoration_Gibs
	collapsecategories;

var SoftParticleSystem CrashingEffect;

function PostBeginPlay()
{
	super.PostBeginPlay();
	CrashingEffect = SoftParticleSystem(FindMountedActor('CRASHING_EFFECT', class'SoftParticleSystem'));
	// End:0x3F
	if(__NFUN_340__(CrashingEffect, none))
	{
		CrashingEffect.Enabled = true;
	}
	__NFUN_607__(5, false, 'TurnOffSmoke');
	return;
}

simulated event PostSpawnDestroyedActorPool()
{
	super.PostSpawnDestroyedActorPool();
	FindAndPlaySound('FlyByPlane_Fighter_Crashing');
	return;
}

event Destroyed()
{
	TurnOffSmoke();
	super(dnDecoration).Destroyed();
	return;
}

final function TurnOffSmoke()
{
	// End:0x1E
	if(__NFUN_340__(CrashingEffect, none))
	{
		CrashingEffect.Enabled = false;
	}
	return;
}

event KImpact(name SelfBoneName, KarmaActor Other, name OtherBoneName, Vector Position, Vector ImpactVelocity, Vector ImpactNormal)
{
	super(dnDecoration).KImpact(SelfBoneName, Other, OtherBoneName, Position, ImpactVelocity, ImpactNormal);
	CriticalDamage();
	KAngularDamping = 1;
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super.RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1277__(VoicePack, 'FlyByPlane_Fighter_Crashing');
	return;
}

defaultproperties
{
	Gibs(0)=(RenderObject='sm_class_vehicles.Aircraft.AlienDroneShip_GIB1',bForcedOnly=false)
	HealthPrefab=5
	MountOnSpawn(0)=(bSkipVerifySelf=false,SpawnClass='p_Vehicles.Alien_Fighter_Damaged.FlybyPlane_Damaged_Main',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=CRASHING_EFFECT,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0),MountOriginVariance=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
	Health=50
	bIgnoresPhysicsDamage=true
	DynamicInteractionClassification=8
	PhysicsMaterial='dnMaterial.dnPhysicsMaterial_Body'
	KRestitution=0.01
	GravityScale=0.76
	DamageScaler=0
	PhysicsEntityGroup=DnFlyByPlane_Gibs
	Physics=18
	bBlockActors=false
	bBlockKarma=true
	Mass=25000
	DrawType=8
	LifeSpan=1
	LifeSpanVariance=0.6
	VoicePack='SoundConfig.Vehicles.VoicePack_AlienFighter'
}