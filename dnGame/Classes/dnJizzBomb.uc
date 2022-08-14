/*******************************************************************************
 * dnJizzBomb generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnJizzBomb extends dnGrenade
	collapsecategories;

defaultproperties
{
	bExplodeOnAnyImpact=true
	bRotationFollowsVelocity=true
	ExplosionDelay=4
	ExplosionDelayVariance=2
	UpwardsBoost=(X=1.292418E-41,Y=2.94903E-17,Z=0)
	bExplodeOnDamage=true
	bExplodeOnWaterTouch=true
	bWaterSplash=false
	Speed=600
	Damage=25
	DamageRadius=60
	ShakeScalar=1.5
	ShakeInfo(0)=(bNoLerp=false,bToggleSign=false,Style=3,Function=0,FalloffActor=none,FalloffDistance=0,ShakeDuration=0.5,ShakeFrequency=0.05,ShakeMagnitude=200,ShakeFullMagnitude=0,ShakeFullMagnitudeTime=0,ShakeName=dnJizzBomb_Shake)
	ExplosionSplashClass=none
	ExplosionClass='p_Creatures.Pregnator_Spit.Pregnator_Spit_Impact_Spawner'
	ExplosionSoundName=ProjectileExplode
	DeferredExplosionTimer=0
	DeferredExplosionTimerVariance=0
	bTelekineticable=false
	MountOnSpawn(0)=(bSkipVerifySelf=false,SpawnClass='p_Creatures.Pregnator_Spit.Pregnator_Spit_Main',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=true,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0),MountOriginVariance=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
	SpawnOnDestroyedSimple(0)='dnJizzBombFX_Impact_HUDFX'
	bClientSidePhysics=true
	CollisionRadius=3
	CollisionHeight=3
	RotationRate=(Pitch=8741,Yaw=572915712,Roll=0)
	Mass=10
	DrawType=8
	DrawScale=1.25
	StaticMesh='sm_class_effects.Pregnator_Spit.Pregnator_Spit'
	SoundVolume=128
	SoundRadius=1600
	SoundInnerRadius=800
	VoicePack='SoundConfig.Inventory.VoicePack_JizzBomb'
}