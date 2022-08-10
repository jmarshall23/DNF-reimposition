/*******************************************************************************
 * DualPistol_Pigcop_SuperAccurate generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class DualPistol_Pigcop_SuperAccurate extends DualPistol_Pigcop;

static event GiveToAI(Pawn Other)
{
	local class<Weapon> PistolClass;

	// End:0x0E
	if(__NFUN_339__(Other, none))
	{
		return;
	}
	Other.Level.Game.GiveInventoryTo(Other, class'Pistol_Pigcop_SuperAccurate', true);
	Other.Level.Game.GiveInventoryTo(Other, class'Pistol_Pigcop_SuperAccurate', true);
	return;
}

defaultproperties
{
	WeaponConfig='DualPistolWeaponConfig_Pigcop_SuperAccurate'
}