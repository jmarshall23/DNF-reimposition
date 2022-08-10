/*******************************************************************************
 * Containers_Paintcan generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Containers_Paintcan extends Containers_Generic
	collapsecategories;

event Destroyed()
{
	class'DecalBomb'.static.StaticDeploy(class'PaintSplatter_White', Location, Rotation, self, self);
	super(dnDecoration).Destroyed();
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super(dnDecoration).RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1266__(class'PaintSplatter_White');
	return;
}

defaultproperties
{
	bSurviveDeath=true
	DestroyedActivities=/* Array type was not detected. */
	SpawnOnDestroyedSimple=/* Array type was not detected. */
	Rotator=/* Unknown default property type! */
}