/*******************************************************************************
 * RailgunDamage generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class RailgunDamage extends BulletDamage
	abstract;

static function bool InstagibCorpses()
{
	return false;
	return;
}

static function bool CanCauseExpandDeath()
{
	return true;
	return;
}

defaultproperties
{
	bCanCauseExpandDeath=true
	DamageName="<?int?dnGame.RailgunDamage.DamageName?>"
	DeathMessage="<?int?dnGame.RailgunDamage.DeathMessage?>"
	SuicideDeathMessage="<?int?dnGame.RailgunDamage.SuicideDeathMessage?>"
	MomentumTransfer=3500
	Icon="dt_hud.ingame_hud.kill_sniper"
	FrameDamageLerp=0
	DeathMomentumScale=3
	DeathLiftScale=0.15
	MaterialEffectMappings=/* Array type was not detected. */
}