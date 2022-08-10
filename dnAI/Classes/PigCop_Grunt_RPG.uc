/*******************************************************************************
 * PigCop_Grunt_RPG generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class PigCop_Grunt_RPG extends PigCop_Shotgun
	config
	collapsecategories;

event EnumerateWeaponClasses(PrecacheIndex PrecacheIndex, out array< class<Weapon> > WeaponClasses)
{
	WeaponClasses[string(WeaponClasses)] = class'RPG_Pigcop';
	return;
}

defaultproperties
{
	WeaponConfig='WeaponCfg_PigCopRPG'
	Weapons(0)=class'C'
}