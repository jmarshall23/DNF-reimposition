/*******************************************************************************
 * dnBreakableGlassTrigger generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnBreakableGlassTrigger extends Triggers
	collapsecategories
	hidecategories(Filter,Interactivity,Karma,Lighting,Networking,Sound);

var() deprecated name GlassTag;
var() bool bDirForce;
var() float ForceScale;

event Trigger(Actor Other, Pawn EventInstigator)
{
	local dnBreakableGlass Glass;

	// End:0x36
	foreach __NFUN_747__(class'dnBreakableGlass', Glass, GlassTag)
	{
		Glass.ReplicateBreakGlass(Location, bDirForce, ForceScale);		
	}	
	return;
}

defaultproperties
{
	bDirForce=true
	ForceScale=300
}