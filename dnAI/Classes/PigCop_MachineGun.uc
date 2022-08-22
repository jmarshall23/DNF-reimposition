/*******************************************************************************
 * PigCop_MachineGun generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class PigCop_MachineGun extends PigCop_Grunt
    config
    collapsecategories;

static function class<AIActor> GetSpawnClass(AIActorFactory Factory)
{
    return default.Class;
    return;
}

event EnumerateWeaponClasses(PrecacheIndex PrecacheIndex, out array< class<Weapon> > WeaponClasses)
{
    WeaponClasses[string(WeaponClasses)] = class'MachineGun_Pigcop';
    return;
}

defaultproperties
{
    WeaponConfig='WeaponCfg_PigCopMachinegun'
    Weapons(0)='dnGame.MachineGun_Pigcop'
    DroolParms=(MinSpitTime=10,RndSpitTime=5,SpitOnPainChance=1,Bone=jaw,Location=(X=0,Y=-11.5,Z=-1.7),Rotation=(Pitch=4467,Yaw=-16379,Roll=1),SpawnClass='p_Creatures.Drool.Spittle01_Spawner')
    Mesh='c_characters.PigCopC'
    ActorColorList(0)=(ActorColor=(R=159,G=135,B=117,A=255),ActorColor_LightEx=none,ActorColor_LightExScale=(X=0,Y=0,Z=0),id=Generic0)
    ActorColorList(1)=(ActorColor=(R=128,G=0,B=0,A=255),ActorColor_LightEx=none,ActorColor_LightExScale=(X=0,Y=0,Z=0),id=Generic1)
}