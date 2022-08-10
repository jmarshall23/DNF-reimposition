/*******************************************************************************
 * Details_Padlock_Base generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Details_Padlock_Base extends Details_Padlock
	collapsecategories
	dependson(Details_Padlock_Lock)
	dependson(Details_Padlock_Latch);

var() noexport deprecated name LatchMountParentTag "Tag of the actor we want to use as the latch's mount parent.";
var() noexport deprecated Actor LatchMountParent "Actor we want to use as the latch's mount parent.";
var() noexport name LatchMountParentBoneName "Bone on LatchMountParent to mount the latch to.";
var() noexport deprecated name LatchTag "If set, will override the Tag of the latch.";
var Details_Padlock_Latch Latch;
var Details_Padlock_Lock Lock;

function PostVerifySelf()
{
	super(dnDecoration).PostVerifySelf();
	Latch = Details_Padlock_Latch(FindOwnedActor(class'Details_Padlock_Latch', 'Latch', true));
	// End:0xCE
	if(__NFUN_340__(Latch, none))
	{
		// End:0x50
		if(__NFUN_342__(LatchTag, 'None'))
		{
			Latch.__NFUN_567__(LatchTag);
		}
		// End:0x76
		if(__NFUN_342__(LatchMountParentTag, 'None'))
		{
			LatchMountParent = FindActor(class'Actor', LatchMountParentTag);
		}
		// End:0xCE
		if(__NFUN_340__(LatchMountParent, none))
		{
			// End:0xB9
			if(__NFUN_342__(LatchMountParentBoneName, 'None'))
			{
				Latch.MountType = 2;
				Latch.MountMeshItem = LatchMountParentBoneName;
			}
			Latch.__NFUN_635__(LatchMountParent,,, true);
		}
	}
	Lock = Details_Padlock_Lock(FindOwnedActor(class'Details_Padlock_Lock', 'Lock', true));
	return;
}

function Destroyed()
{
	// End:0x33
	if(__NFUN_148__(__NFUN_340__(Lock, none), __NFUN_145__(Lock.DecorationIsDead())))
	{
		Lock.CriticalDamage();
	}
	// End:0x4F
	if(__NFUN_340__(Latch, none))
	{
		Latch.SwingOpen();
	}
	super(dnDecoration).Destroyed();
	return;
}

defaultproperties
{
	bSurviveDeath=true
	DestroyedActivities=/* Array type was not detected. */
}