/*******************************************************************************
 * MeleeDamage generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MeleeDamage extends TraceDamageType
	abstract
	native;

static function bool ShouldInstantGlassShatter()
{
	return true;
	return;
}

static function bool CanDismemberCorpses()
{
	return false;
	return;
}

static function bool ShouldDoSteroidsSpecialFX()
{
	return true;
	return;
}

defaultproperties
{
	MomentumTransfer=2275
	DamageVibrations(0)=(bNoLerp=false,bToggleSign=true,Style=2,Function=1,FalloffActor=none,FalloffDistance=0,ShakeDuration=0.4,ShakeFrequency=0.08,ShakeMagnitude=1000,ShakeFullMagnitude=0,ShakeFullMagnitudeTime=0,ShakeName=MeleeDamage_Shake)
	DamageRumbles(0)=(RumbleName=MeleeDamage_Rumble,RumbleDuration=0.2,RumbleLeftMagnitude=0.45,RumbleRightMagnitude=0.45,FalloffActor=none,FalloffDistance=0)
	Icon="dt_hud.ingame_hud.kill_melee"
	BodyPartDamageScaleLerp=0
	DeathMomentumScale=1.75
	DeathLiftScale=0
	bIgnoreUseHitEffectOverrides=true
	MaterialEffectMappings(0)=(MaterialClasses=('dnMaterial.Flesh_Alien'),Effect=(bMountHitFX=false,Effect='p_hit_effects.Blood_Melee.Blood_Melee_Spawner',EffectScale=0,FakeLightIntensity=0,LifetimeOverride=0,Action=none,EffectDecal=none,Sound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=('a_impact.Melee.Melee_Impact_Flesh_01','a_impact.Melee.Melee_Impact_Flesh_02'),SlotPriority=0,VolumePrefab=0,Slots=none,Volume=1.25,VolumeVariance=0,InnerRadius=256,InnerRadiusVariance=0,Radius=1024,RadiusVariance=0,Pitch=1,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0),Velocity3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
	MaterialEffectMappings(1)=none
	MaterialEffectMappings(2)=none
	MaterialEffectMappings(3)=(MaterialClasses=('dnMaterial.Flesh_Human'),Effect=(bMountHitFX=false,Effect='p_hit_effects.Blood_Melee.Blood_Melee_Spawner',EffectScale=0,FakeLightIntensity=0,LifetimeOverride=0,Action=none,EffectDecal=none,Sound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=('a_impact.Melee.Melee_Impact_Flesh_01','a_impact.Melee.Melee_Impact_Flesh_02'),SlotPriority=0,VolumePrefab=0,Slots=none,Volume=1.25,VolumeVariance=0,InnerRadius=256,InnerRadiusVariance=0,Radius=1024,RadiusVariance=0,Pitch=1,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0),Velocity3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
	MaterialEffectMappings(4)=none
	MaterialEffectMappings(5)=none
	MaterialEffectMappings(6)=(MaterialClasses=('dnMaterial.Goo'),Effect=(bMountHitFX=false,Effect='p_Impacts.HiveGooSplash.HiveGooSplash_Spawner',EffectScale=0,FakeLightIntensity=0,LifetimeOverride=0,Action=none,EffectDecal=none,Sound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=('a_impact.Melee.Melee_Impact_Flesh_01','a_impact.Melee.Melee_Impact_Flesh_01'),SlotPriority=0,VolumePrefab=0,Slots=none,Volume=1.25,VolumeVariance=0,InnerRadius=256,InnerRadiusVariance=0,Radius=1024,RadiusVariance=0,Pitch=1,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0),Velocity3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
	MaterialEffectMappings(7)=none
	MaterialEffectMappings(8)=none
	MaterialEffectMappings(9)=(MaterialClasses=('dnMaterial.Ice'),Effect=(bMountHitFX=false,Effect='p_Impacts.BulletImpact_Ice.BulletImpact_Ice_Spawner',EffectScale=0,FakeLightIntensity=0,LifetimeOverride=0,Action=none,EffectDecal=none,Sound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=('a_impact.Melee.Melee_Impact_Surface_01','a_impact.Melee.Melee_Impact_Surface_02'),SlotPriority=0,VolumePrefab=0,Slots=none,Volume=1.25,VolumeVariance=0,InnerRadius=256,InnerRadiusVariance=0,Radius=1024,RadiusVariance=0,Pitch=1,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0),Velocity3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
	MaterialEffectMappings(10)=none
	MaterialEffectMappings(11)=none
	SteroidsImpulseMultiplier=0.05
	SteroidsMeleeZImpulse=1000
}