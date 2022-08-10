/*******************************************************************************
 * KConvexSensor generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KConvexSensor extends KSensor
	native
	collapsecategories
	notplaceable;

cpptext
{
// Stripped
}

var(KSensor) const StaticMesh ConvexSource;

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super(Actor).RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1267__(ConvexSource);
	return;
}