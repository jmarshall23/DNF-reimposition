/*******************************************************************************
 * dnHitFX_Effect_Debris_Light generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnHitFX_Effect_Debris_Light extends dnHitFX_Effects
	collapsecategories
	hidecategories(Filter,HeatVision,Interactivity,KarmaObject,KarmaOverride,Networking);

defaultproperties
{
	ParticlesCollideWithWorld=true
	UseZoneFluidFriction=true
	bUseAlphaRamp=true
	Lifetime=3
	LifetimeVariance=2
	InitialVelocity=(X=1.291857E-41,Y=2.802959E-17,Z=0)
	MaxVelocityVariance=(X=1.291857E-41,Y=2.803001E-17,Z=256)
	RealtimeAccelerationVariance=(X=1.291857E-41,Y=2.803086E-17,Z=2048)
	LocalFriction=300
	BounceElasticity=0.1
	ParticlesCollidePercent=0.25
	ZoneGravityScaler=0.33
	ZoneVelocityScaler=2
	AlphaMid=1
	AlphaEnd=0
	AlphaRampMid=0.9
	RotationVelocity=1
	RotationVelocityMaxVariance=2
}