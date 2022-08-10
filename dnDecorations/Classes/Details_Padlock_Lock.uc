/*******************************************************************************
 * Details_Padlock_Lock generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Details_Padlock_Lock extends Details_Padlock;

var Details_Padlock_Base MyBase;
var KHinge MyHinge;
var KAngularJointLimit MyLimit;

function PostBeginPlay()
{
	super(dnDecoration).PostBeginPlay();
	MyBase = Details_Padlock_Base(Owner);
	// End:0x28
	if(__NFUN_339__(MyBase, none))
	{
		KillConstraints();
	}
	return;
}

final function KillConstraints()
{
	// End:0x20
	if(__NFUN_340__(MyHinge, none))
	{
		MyHinge.__NFUN_614__();
		MyHinge = none;
	}
	// End:0x40
	if(__NFUN_340__(MyLimit, none))
	{
		MyLimit.__NFUN_614__();
		MyLimit = none;
	}
	__NFUN_817__();
	return;
}

function Destroyed()
{
	// End:0x29
	if(__NFUN_340__(MyBase, none))
	{
		MyBase.CriticalDamage();
		MyBase = none;
		KillConstraints();
	}
	bDoOverlayEffect = false;
	super(dnDecoration).Destroyed();
	return;
}

function KarmaSetConstraintProperties(KConstraint ConstraintActor)
{
	local KAngularJointLimit Limit;
	local KHinge Hinge;

	Hinge = KHinge(ConstraintActor);
	// End:0x27
	if(__NFUN_340__(Hinge, none))
	{
		MyHinge = Hinge;
	}
	Limit = KAngularJointLimit(ConstraintActor);
	// End:0x5E
	if(__NFUN_340__(Limit, none))
	{
		Limit.__NFUN_1106__(4096);
		MyLimit = Limit;
	}
	return;
}