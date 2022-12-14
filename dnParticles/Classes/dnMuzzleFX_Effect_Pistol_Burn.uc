/*******************************************************************************
 * dnMuzzleFX_Effect_Pistol_Burn generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnMuzzleFX_Effect_Pistol_Burn extends dnMuzzleFX_Effects
	collapsecategories
	hidecategories(Filter,HeatVision,Interactivity,KarmaObject,KarmaOverride,Networking);

defaultproperties
{
	SpawnInALine=true
	UseZoneGravity=false
	bUseAlphaRamp=true
	Lifetime=0.1
	SpawnOffset=(X=1.291857E-41,Y=2.80262E-17,Z=0)
	SpawnInALineLength=3
	InitialVelocity=(X=1.291857E-41,Y=2.797242E-17,Z=0)
	MaxVelocityVariance=(X=1.291857E-41,Y=2.797242E-17,Z=0)
	AlphaMid=1
	AlphaEnd=0
	AlphaRampMid=0.75
	Textures(0)='dt_effects.Fire.Flamestill1bRC'
	Textures(1)='dt_effects.Fire.flamehotend2RC'
	StartDrawScale=0.0625
	EndDrawScale=0
	bForceNonFinalBlendBlooms=true
	NonFinalBlendBloomTint=(B=85,G=1,R=1,A=64)
	Style=6
}