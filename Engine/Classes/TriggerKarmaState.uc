/*******************************************************************************
 * TriggerKarmaState generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class TriggerKarmaState extends TriggerKarma
	collapsecategories
	notplaceable
	hidecategories(Filter,Interactivity,Karma,Lighting,Networking,Sound);

enum EKarmaState
{
	KSTATE_Wake,
	KSTATE_Sleep
};

var() noexport bool bAffectOther "If true, this will ignore the event and wake/sleep the 'Other' actor that started this event chain.";
var() noexport TriggerKarmaState.EKarmaState KarmaState "Wake = Karma object starts simulating physics" "Sleep = Karma object stops simulating physics" "Toggle = switches to opposite state";

function Trigger(Actor Other, Pawn EventInstigator)
{
	local KarmaActor K;

	// End:0x53
	if(bAffectOther)
	{
		K = KarmaActor(Other);
		// End:0x50
		if(__NFUN_340__(K, none))
		{
			// End:0x43
			if(__NFUN_173__(int(KarmaState), int(0)))
			{
				K.__NFUN_817__();				
			}
			else
			{
				K.__NFUN_818__();
			}
		}		
	}
	else
	{
		// End:0x88
		if(__NFUN_173__(int(KarmaState), int(0)))
		{
			// End:0x84
			foreach __NFUN_747__(class'KarmaActor', K, Event)
			{
				K.__NFUN_817__();				
			}						
		}
		else
		{
			// End:0xAB
			foreach __NFUN_747__(class'KarmaActor', K, Event)
			{
				K.__NFUN_818__();				
			}			
		}
	}
	return;
}
