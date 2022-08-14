/*******************************************************************************
 * ATLaser_TrailBeam generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ATLaser_TrailBeam extends BeamTrail
	collapsecategories
	hidecategories(Filter,HeatVision,Interactivity,Karma,KarmaObject,KarmaOverride,Lighting,Networking,ParticleSystemBase,ParticleTextureInfo,SoftParticleSystem,Sound,SpawnOnDestroyed);

defaultproperties
{
	MinSegmentDelay=0.1
	DefaultLifetime=0.5
	BeamTexture='dt_Effects2.Beams.BlueFireBeam'
	BeamTextureRotate=90
	bCollisionAssumeValid=true
	bNetTemporary=true
	Style=8
	ActorColorList(0)=(ActorColor=(B=121,G=2,R=1,A=255),G=255,B=255,A=255)
	RemoteRole=0
}