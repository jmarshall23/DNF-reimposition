/*******************************************************************************
 * PigCop_Shotgun generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class PigCop_Shotgun extends PigCop_Grunt
	config
	collapsecategories;

static function class<AIActor> GetSpawnClass(AIActorFactory Factory)
{
	return default.Class;
	return;
}

event EnumerateWeaponClasses(PrecacheIndex PrecacheIndex, out array< class<Weapon> > WeaponClasses)
{
	WeaponClasses[string(WeaponClasses)] = class'Shotgun_Strapless_Pigcop';
	return;
}

defaultproperties
{
	WeaponConfig='WeaponCfg_PigCopShotgun'
	Weapons(0)='dnGame.Shotgun_Strapless_Pigcop'
	DroolParms=(MinSpitTime=10,RndSpitTime=5,SpitOnPainChance=1,Bone=jaw,Location=(X=1.298303E-41,Y=3.773024E-17,Z=-11.5),Z=-1.7)
}