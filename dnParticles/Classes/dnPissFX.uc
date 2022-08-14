/*******************************************************************************
 * dnPissFX generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnPissFX extends dnCharacterFX
	collapsecategories
	hidecategories(Filter,HeatVision,Interactivity,KarmaObject,KarmaOverride,Networking);

defaultproperties
{
	Enabled=false
	DisableTickWhenEmpty=true
	RelativeSpawn=true
	RelativeSpawnVelocity=true
	UseZoneTerminalVelocity=true
	DieOutsideWorld=true
	UseLines=true
	Connected=true
	SpawnPeriod=0.07
	Lifetime=0.25
	LineStartColor=(B=85,G=1,R=1,A=202)
	LineEndColor=(B=85,G=1,R=1,A=202)
	LineStartWidth=0.6
	LineEndWidth=0.6
	Textures(0)='dt_effects.liquids.urinestream2RC'
	StartDrawScale=0.01
	EndDrawScale=0.3
	DrawScaleVariance=0.07
	CollisionRadius=0
	CollisionHeight=0
	TickStyle=3
	Style=3
}