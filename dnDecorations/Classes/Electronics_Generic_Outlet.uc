/*******************************************************************************
 * Electronics_Generic_Outlet generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Electronics_Generic_Outlet extends Electronics_Generic
	abstract
	collapsecategories;

var() noexport float DamageAmount "How much to hurt the user by.";

simulated event Used(Actor Other, Pawn EventInstigator)
{
	super(dnDecoration).Used(Other, EventInstigator);
	// End:0x74
	if(__NFUN_340__(EventInstigator, none))
	{
		EventInstigator.HandQuickAction('HandQuickAction_Switch_FingerPush');
		EventInstigator.TakeDamage(none, DamageAmount, __NFUN_232__(0, 0, 0), __NFUN_232__(0, 0, 0), class'ElectricalDamage',, Location);
	}
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super(dnDecoration).RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1281__('HandQuickAction_Switch_FingerPush');
	PrecacheIndex.__NFUN_1279__(class'ElectricalDamage');
	return;
}

defaultproperties
{
	DamageAmount=1
}