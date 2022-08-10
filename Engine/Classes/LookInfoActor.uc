/*******************************************************************************
 * LookInfoActor generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class LookInfoActor extends InteractiveActor
	collapsecategories
	notplaceable;

var() noexport bool bUseProxy "When this is true, then when the player presses USE on this, it will send a Used message to all actors pointed to by it's Event.";

function PostVerifySelf()
{
	super(RenderActor).PostVerifySelf();
	Texture = none;
	return;
}

event Used(Actor Other, Pawn EventInstigator)
{
	local Actor A;

	super.Used(Other, EventInstigator);
	// End:0x4A
	if(bUseProxy)
	{
		// End:0x49
		foreach __NFUN_747__(class'Actor', A, Event)
		{
			A.Used(Other, EventInstigator);			
		}		
	}
	return;
}

defaultproperties
{
	bLookWhenHidden=true
	bDrawHUDInfo=true
	bForceUsePhrase=true
	bUsable=true
	bNoDamage=true
	bTraceShootable=false
	bBlockCamera=false
	bHidden=true
	bNoNativeTick=true
	bCollideActors=true
	TickStyle=0
}