/*******************************************************************************
 * BattleLord_Armor generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class BattleLord_Armor extends Destructible_Armor
    abstract
    collapsecategories;

event PreBeginPlay()
{
    super(dnDecoration).PreBeginPlay();
    __NFUN_832__(FRand(0.5, HealthCap) += HealthCap);
    return;
}

defaultproperties
{
    DamageTypesAcceptedOnly(0)='Engine.ExplosionDamage'
    Health=150
    HealthCap=150
    Mass=35
}