/*******************************************************************************
 * Details_Generic_Case_FireExtinguisher generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Details_Generic_Case_FireExtinguisher extends Details_Generic
	collapsecategories;

simulated function PostBeginPlay()
{
	super(dnDecoration).PostBeginPlay();
	DecoGlass_Case_FireExtinguisher(FindMountedActor(, class'DecoGlass_Case_FireExtinguisher')).TreasureBehind = FindMountedActor(, class'Barrels_Generic_Explosive_FireExt');
	return;
}

defaultproperties
{
	HealthPrefab=0
}