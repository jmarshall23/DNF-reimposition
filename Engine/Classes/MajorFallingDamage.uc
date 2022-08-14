/*******************************************************************************
 * MajorFallingDamage generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MajorFallingDamage extends FallingDamage
	abstract;

defaultproperties
{
	DamageVibrations(0)=(bNoLerp=false,bToggleSign=false,Style=0,Function=5,FalloffActor=none,FalloffDistance=0,ShakeDuration=0.08,ShakeFrequency=0.16,ShakeMagnitude=4096,ShakeFullMagnitude=0,ShakeFullMagnitudeTime=0,ShakeName=FallingDamage_Shake_0)
	DamageRumbles(0)=(RumbleName=MajorFallingDamage_Rumble,RumbleDuration=0.3,RumbleLeftMagnitude=0.85,RumbleRightMagnitude=0,FalloffActor=none,FalloffDistance=0)
}