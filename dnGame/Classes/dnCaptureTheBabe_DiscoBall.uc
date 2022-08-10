/*******************************************************************************
 * dnCaptureTheBabe_DiscoBall generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnCaptureTheBabe_DiscoBall extends GameModeSpecificDecoration
	collapsecategories;

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x29
	if(__NFUN_173__(int(dnCaptureTheBabe_BabeArea(Owner).Team), 1))
	{
		__NFUN_595__(class'CTB_GogoBall_R');
	}
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super(dnDecoration).RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1267__(class'CTB_GogoBall_R', self);
	return;
}

defaultproperties
{
	bCaptureTheBabe=true
}