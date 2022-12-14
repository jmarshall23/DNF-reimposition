/*******************************************************************************
 * FallingDamage generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class FallingDamage extends DamageType
    abstract;

defaultproperties
{
    DeathMessage="<?int?Engine.FallingDamage.DeathMessage?>"
    SuicideDeathMessage="<?int?Engine.FallingDamage.SuicideDeathMessage?>"
    DamageVibrations(0)=(bNoLerp=false,bToggleSign=false,Style=0,Function=5,FalloffActor=none,FalloffDistance=0,ShakeDuration=0.08,ShakeFrequency=0.16,ShakeMagnitude=2048,ShakeFullMagnitude=0,ShakeFullMagnitudeTime=0,ShakeName=FallingDamage_Shake_0)
    Icon="dt_hud.ingame_hud.kill_fall"
}