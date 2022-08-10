/*******************************************************************************
 * dnFlybyPlane_Fighter_AttackBeam generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnFlybyPlane_Fighter_AttackBeam extends BeamSystem
	collapsecategories
	hidecategories(Filter,HeatVision,Interactivity,Karma,KarmaObject,KarmaOverride,Lighting,Networking,ParticleSystemBase,ParticleTextureInfo,SoftParticleSystem,Sound,SpawnOnDestroyed);

var SoftParticleSystem SparkSystem;
var float DamagePlayer;
var float DamageNonPlayer;

simulated function PostVerifySelf()
{
	local Actor A;

	// End:0x14
	if(__NFUN_169__(string(BeamSegments), 1))
	{
		string(BeamSegments) = 1;
	}
	BeamSegments[0].Actor1 = self;
	super(RenderActor).PostVerifySelf();
	__NFUN_361__('Tick');
	SparkSystem = SoftParticleSystem(FindMountedActor(, class'SoftParticleSystem'));
	// End:0x8C
	if(__NFUN_340__(SparkSystem, none))
	{
		SparkSystem.Enabled = false;
		SparkSystem.SpawnOnGroundLength = DynamicBeamPoints;
		SparkSystem.bCanExistOutOfWorld = true;
	}
	return;
}

function Tick(float DeltaSeconds)
{
	super.Tick(DeltaSeconds);
	return;
}

final function ActivateBeam()
{
	Enabled = true;
	__NFUN_621__(true);
	FindAndPlaySound('FlyByPlane_Fighter_AltFire');
	// End:0x35
	if(__NFUN_340__(SparkSystem, none))
	{
		SparkSystem.Enabled = true;
	}
	return;
}

final function DeactivateBeam()
{
	Enabled = false;
	__NFUN_621__(false);
	FindAndStopSound('FlyByPlane_Fighter_AltFire');
	// End:0x35
	if(__NFUN_340__(SparkSystem, none))
	{
		SparkSystem.Enabled = false;
	}
	return;
}

event Touch(Actor Other)
{
	local float dmg;

	super(Actor).Touch(Other);
	// End:0x2C
	if(Other.bIsPlayerPawn)
	{
		dmg = DamagePlayer;		
	}
	else
	{
		dmg = DamageNonPlayer;
	}
	Other.TakeDamage(none, dmg, Other.Location, __NFUN_232__(0, 0, 1), class'ExplosionDamage');
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super(InteractiveActor).RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1277__(VoicePack, 'FlyByPlane_Fighter_AltFire');
	return;
}

defaultproperties
{
	Enabled=false
	DynamicBeamPoints=100024
	BeamTexture='dt_Effects2.Beams.BlueBeam_FB'
	BeamSegments=/* Array type was not detected. */
}