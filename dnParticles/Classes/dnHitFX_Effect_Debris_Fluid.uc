/*******************************************************************************
 * dnHitFX_Effect_Debris_Fluid generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnHitFX_Effect_Debris_Fluid extends dnHitFX_Effects
	collapsecategories
	hidecategories(Filter,HeatVision,Interactivity,KarmaObject,KarmaOverride,Networking);

defaultproperties
{
	bUseAlphaRamp=true
	Lifetime=0.6
	LifetimeVariance=0.4
	InitialVelocity=(X=1.291857E-41,Y=2.802874E-17,Z=0)
	InitialAcceleration=(X=1.291857E-41,Y=2.797242E-17,Z=0)
	MaxVelocityVariance=(X=1.291857E-41,Y=2.80279E-17,Z=8)
	AlphaVariance=0.5
	AlphaMid=1
	AlphaEnd=0
	AlphaRampMid=0.9
	RotationVelocity=2.5
	RotationVelocityMaxVariance=4
}