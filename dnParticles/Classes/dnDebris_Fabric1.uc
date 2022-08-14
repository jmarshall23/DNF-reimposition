/*******************************************************************************
 * dnDebris_Fabric1 generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnDebris_Fabric1 extends dnDebris
	hidecategories(Filter,HeatVision,Interactivity,KarmaObject,KarmaOverride,Networking);

defaultproperties
{
	Enabled=false
	DestroyWhenEmpty=true
	bUseAlphaRamp=true
	PrimeCount=45
	SpawnNumber=0
	MaximumParticles=45
	Lifetime=2
	LifetimeVariance=1
	InitialVelocity=(X=1.291857E-41,Y=2.797242E-17,Z=0)
	MaxVelocityVariance=(X=1.291857E-41,Y=2.803001E-17,Z=512)
	RealtimeAccelerationVariance=(X=-2.002198,Y=2.803107E-17,Z=3084)
	LocalFriction=945
	BounceElasticity=0.1
	AlphaMid=1
	AlphaEnd=0
	AlphaRampMid=0.85
	Textures(0)='dt_effects.Debris.stuffing1RC'
	Textures(1)='dt_effects.Debris.stuffing2RC'
	Textures(2)='dt_effects.Debris.stuffing3RC'
	Textures(3)='dt_effects.Debris.stuffing4aRC'
	Textures(4)='dt_effects.Debris.stuffing4bRC'
	Textures(5)='dt_effects.Debris.stuffing4cRC'
	StartDrawScale=0.0625
	EndDrawScale=0.0625
	DrawScaleVariance=0.0625
	RotationVariance=65535
	RotationVelocityMaxVariance=4
	TriggerType=0
	CollisionRadius=16
	CollisionHeight=16
	Style=3
	TimeWarp=0.75
}