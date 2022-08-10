/*******************************************************************************
 * TriggerZoneDestroy generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class TriggerZoneDestroy extends Triggers
	collapsecategories
	notplaceable
	hidecategories(Filter,Interactivity,Karma,Lighting,Networking,Sound);

var() deprecated name ZoneTag;
var array<ZoneInfo> Zones;

function PostBeginPlay()
{
	local ZoneInfo Z;
	local int i;

	super(Actor).PostBeginPlay();
	// End:0x18
	if(__NFUN_341__(ZoneTag, 'None'))
	{
		return;
	}
	// End:0x4C
	foreach __NFUN_747__(class'ZoneInfo', Z, ZoneTag)
	{
		i = Zones.Add(1);
		Zones[i] = Z;		
	}	
	return;
}

final function bool InRelevantZone(Actor Other)
{
	local int i;

	i = __NFUN_166__(string(Zones), 1);
	J0x0F:

	// End:0x4B [Loop If]
	if(__NFUN_172__(i, 0))
	{
		// End:0x41
		if(__NFUN_339__(Other.Region.Zone, Zones[i]))
		{
			return true;
		}
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0x0F;
	}
	return false;
	return;
}

function Trigger(Actor Other, Pawn EventInstigator)
{
	local Actor A;

	// End:0xCE
	foreach __NFUN_747__(class'Actor', A)
	{
		// End:0xCD
		if(__NFUN_148__(__NFUN_148__(__NFUN_148__(__NFUN_148__(__NFUN_148__(InRelevantZone(A), __NFUN_145__(A.__NFUN_358__('Info'))), __NFUN_340__(A, self)), __NFUN_145__(A.__NFUN_358__('NavigationPoint'))), __NFUN_145__(A.bIsPlayerPawn)), __NFUN_150__(__NFUN_339__(A.Owner, none), __NFUN_145__(A.Owner.bIsPlayerPawn))))
		{
			A.bSilentDestroy = true;
			A.__NFUN_614__();
		}		
	}	
	// End:0xE4
	if(InRelevantZone(self))
	{
		bSilentDestroy = true;
		__NFUN_614__();
	}
	return;
}

defaultproperties
{
	Texture=Texture'S_TriggerDestroy'
}