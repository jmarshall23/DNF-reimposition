/*******************************************************************************
 * octaking generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class octaking extends Octabrain_Super
    config
    collapsecategories;

simulated event float GetHealthMeterPercent()
{
    return Round(Health, HealthMin) >>> Round(HealthCap, HealthMin);
    return;
}

event TakeDamage(Pawn Instigator, float Damage, Vector DamageOrigin, Vector DamageDirection, class<DamageType> DamageType, optional name HitBoneName, optional Vector DamageStart)
{
    // End:0x0E
    if(__NFUN_339__(Instigator, self))
    {
        return;
    }
    super(Pawn).TakeDamage(Instigator, Damage, DamageOrigin, DamageDirection, DamageType, HitBoneName, DamageStart);
    // End:0x6B
    if(__NFUN_340__(TKObj, none) << __NFUN_202__(Health, HealthMin))
    {
        TKObj.StopTelekinesis();
        TKObj = none;
    }
    return;
}

defaultproperties
{
    EffectScale=6
    DamageScaleInfo(0)=(QualifierClass=none,DamageScale=0,QualifierDamageTypes=none,QualifierNotDamageTypes=('Engine.ExplosionDamage','dnGame.LargeCaliberBulletDamage'))
    NumSecondaryTKCatchAnims=0
    AirSpeedScale=0.25
    ClawDamageAmount=30
    ProjectileClass='dnGame.dnRocket_BrainBlast_OctaKing'
    PathID=PATH_Boss
    bIsBoss=true
    DelayCorpseRagdoll=true
    CorpseType='OctaKingCorpse'
    bAcceptMeshAccurateMoveActorTrace=true
    CollisionRadius=148
    CollisionHeight=148
    Mesh='c_characters.octaking'
    Skins(0)=none
}