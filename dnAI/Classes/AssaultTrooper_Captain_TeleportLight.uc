/*******************************************************************************
 * AssaultTrooper_Captain_TeleportLight generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AssaultTrooper_Captain_TeleportLight extends Weapon_LightEx
	collapsecategories
	hidecategories(Collision,Filter,HeatVision,Interactivity,Karma,KarmaObject,KarmaOverride,Networking,SpawnOnDestroyed);

defaultproperties
{
	FlashTime=0.25
	LightRadius=350
	LightIntensity=15
	LightColor=(B=87,G=5,R=1,A=191)
	AttenuationMap=none
	LightPeriod=75
	Physics=9
}