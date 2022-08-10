/*******************************************************************************
 * TriggerRestore generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class TriggerRestore extends Triggers
	collapsecategories
	hidecategories(Filter,Interactivity,Karma,Lighting,Networking,Sound);

struct STriggerRestoreInfo
{
	var Vector Location;
	var Rotator Rotation;
	var class<Actor> ActorClass;
	var name Tag;
	var Actor ActorInstance;
};

var() bool bRestoreRotation;
var() bool bRestoreLocation;
var() array<name> Tags;
var array<STriggerRestoreInfo> Info;

event PostBeginPlay()
{
	local int i;
	local Actor A;
	local STriggerRestoreInfo inf;

	super(Actor).PostBeginPlay();
	i = 0;
	J0x0D:

	// End:0xCB [Loop If]
	if(__NFUN_169__(i, string(Tags)))
	{
		// End:0xC0
		foreach __NFUN_747__(class'Actor', A, Tags[i])
		{
			inf.Location = A.Location;
			inf.Rotation = A.Rotation;
			inf.ActorClass = A.Class;
			inf.Tag = Tags[i];
			inf.ActorInstance = A;
			Info[Info.Add(1)] = inf;			
		}		
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x0D;
	}
	return;
}

event Trigger(Actor Other, Pawn EventInstigator)
{
	local int i, Found;
	local Actor A;
	local STriggerRestoreInfo inf;

	super(Actor).Trigger(Other, EventInstigator);
	i = 0;
	J0x17:

	// End:0xFE [Loop If]
	if(__NFUN_169__(i, string(Info)))
	{
		inf = Info[i];
		// End:0xC2
		if(__NFUN_340__(inf.ActorInstance, none))
		{
			inf.ActorInstance.__NFUN_621__(,,, false);
			// End:0x84
			if(bRestoreLocation)
			{
				inf.ActorInstance.__NFUN_645__(inf.Location);
			}
			// End:0xA9
			if(bRestoreRotation)
			{
				inf.ActorInstance.__NFUN_652__(inf.Rotation);
			}
			inf.ActorInstance.__NFUN_621__(,,, true);
			// [Explicit Continue]
			goto J0xF4;
		}
		A = __NFUN_615__(inf.ActorClass,, inf.Tag, inf.Location, inf.Rotation);
		J0xF4:

		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x17;
	}
	return;
}

defaultproperties
{
	bRestoreRotation=true
	bRestoreLocation=true
}