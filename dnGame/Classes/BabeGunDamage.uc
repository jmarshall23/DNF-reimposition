/*******************************************************************************
 * BabeGunDamage generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class BabeGunDamage extends BulletDamage
    abstract;

static function bool InstagibCorpses()
{
    return true;
    return;
}

defaultproperties
{
    DamageName="<?int?dnGame.BabeGunDamage.DamageName?>"
    DeathMessage="<?int?dnGame.BabeGunDamage.DeathMessage?>"
    SuicideDeathMessage="<?int?dnGame.BabeGunDamage.SuicideDeathMessage?>"
    MomentumTransfer=900
    Icon="dt_hud.ingame_hud.Kill_BabePistol"
    DeathMomentumScale=7
    DeathLiftScale=0.15
    DamageScaleMap[1]=4
    DamageScaleMap[19]=4
}