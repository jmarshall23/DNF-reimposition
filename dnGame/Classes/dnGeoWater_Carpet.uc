/*******************************************************************************
 * dnGeoWater_Carpet generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnGeoWater_Carpet extends dnGeoWater
	collapsecategories
	hidecategories(Filter,HeatVision,Interactivity,Networking,Sound,SpawnOnDestroyed,Interpolation);

defaultproperties
{
	DamageRadiusScale=0.75
	DamageStrengthScale=-0.55
	WaterDepth=0.001
	DisturbWaterStrengthScale=0.01
	WaterDamping=0.9999
	WaterSpeed=300
	UpdateRate=60
	bDontClampEdges=true
	EdgeDeltaMin=0
	VertexDeltaMin=0
	RandomNoiseTime=0
	bAITransparent=false
}