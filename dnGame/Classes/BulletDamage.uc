/*******************************************************************************
 * BulletDamage generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class BulletDamage extends TraceDamageType
	abstract
	native;

static event PerformAdditionalDamageEffect(Actor ShootActor, float ShootActorRelativeDrawscale, Actor HitActor, Vector HitLocation, Vector HitNormal, class<Material> HitMaterial)
{
	local dnFriendFX_Spawners HitEffectActor;
	local Pawn ShootPawn;
	local bool bRedHot;

	super(DamageType).PerformAdditionalDamageEffect(ShootActor, ShootActorRelativeDrawscale, HitActor, HitLocation, HitNormal, HitMaterial);
	// End:0x32
	if(__NFUN_339__(ShootActor, none))
	{
		return;
	}
	// End:0x58
	if(ShootActor.bIsPawn)
	{
		ShootPawn = Pawn(ShootActor);		
	}
	else
	{
		ShootPawn = ShootActor.Instigator;
	}
	// End:0xA1
	if(__NFUN_150__(__NFUN_339__(ShootPawn, none), __NFUN_342__(ShootActor.Class.Name, 'Railgun')))
	{
		return;
	}
	// End:0x110
	if(__NFUN_148__(__NFUN_340__(HitActor, none), __NFUN_145__(HitActor.bStatic)))
	{
		// End:0xDC
		if(__NFUN_340__(HitActor.MountParent, none))
		{
			return;
		}
		// End:0xF6
		if(__NFUN_173__(int(HitActor.Physics), int(18)))
		{
			return;
		}
		// End:0x110
		if(__NFUN_173__(int(HitActor.DrawType), int(2)))
		{
			return;
		}
	}
	// End:0x135
	if(__NFUN_148__(__NFUN_340__(HitActor, none), __NFUN_145__(HitActor.bStatic)))
	{
		return;
	}
	HitEffectActor = ShootActor.FindFriendSpawner(class'BulletImpact_Metal_HotCenter_Spawner');
	// End:0x1E2
	if(__NFUN_340__(HitEffectActor, none))
	{
		HitEffectActor.SystemSizeScale = __NFUN_195__(HitEffectActor.default.SystemSizeScale, ShootActorRelativeDrawscale);
		__NFUN_207__(HitEffectActor.SystemSizeScale, ShootActor.GetImpactEffectAdditionalScale());
		HitEffectActor.__NFUN_645__(__NFUN_238__(HitLocation, HitNormal));
		HitEffectActor.__NFUN_652__(Rotator(__NFUN_253__(HitNormal)));
		HitEffectActor.ExecuteEffect(true);
	}
	return;
}

defaultproperties
{
	DamageName="<?int?dnGame.BulletDamage.DamageName?>"
	DeathMessage="<?int?dnGame.BulletDamage.DeathMessage?>"
	SuicideDeathMessage="<?int?dnGame.BulletDamage.SuicideDeathMessage?>"
	MomentumTransfer=50
	DamageRumbles(0)=(RumbleName=TraceDamageRumble,RumbleDuration=0.1,RumbleLeftMagnitude=0.7,RumbleRightMagnitude=0.7,FalloffActor=none,FalloffDistance=0)
	MaterialEffectMappings(0)=(MaterialClasses=('dnMaterial.Cardboard'),Effect=(bMountHitFX=false,Effect='p_Impacts.BulletImpact_Cardboard.BulletImpact_CardBoard_Spawner',EffectScale=0,FakeLightIntensity=0,LifetimeOverride=0,Action=none,EffectDecal=none,Sound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=Guns,SimpleSingleSound=none,Sounds=('a_impact.Bullet.BulletBody01','a_impact.Bullet.BulletBody02'),SlotPriority=0,VolumePrefab=0,Slots=none,Volume=1,VolumeVariance=0,InnerRadius=256,InnerRadiusVariance=0,Radius=1024,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0),Velocity3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
	MaterialEffectMappings(1)=none
	MaterialEffectMappings(2)=none
	MaterialEffectMappings(3)=(MaterialClasses=('dnMaterial.Sand'),Effect=(bMountHitFX=false,Effect='p_Impacts.BulletImpact_SandBags.BulletImpact_SandBags_Spawner',EffectScale=0,FakeLightIntensity=0,LifetimeOverride=0,Action=none,EffectDecal='dnParticles.BulletHole_Generic',Sound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=Guns,SimpleSingleSound=none,Sounds=('a_impact.Bullet.BulletDirt01','a_impact.Bullet.BulletDirt02'),SlotPriority=0,VolumePrefab=0,Slots=none,Volume=1,VolumeVariance=0,InnerRadius=256,InnerRadiusVariance=0,Radius=1024,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0),Velocity3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
	MaterialEffectMappings(4)=none
	MaterialEffectMappings(5)=none
	MaterialEffectMappings(6)=(MaterialClasses=('dnMaterial.Dirt','dnMaterial.Dust'),Effect=(bMountHitFX=false,Effect='p_Impacts.BulletImpact_Dust.BulletImpact_Dust_Spawner',EffectScale=0,FakeLightIntensity=0,LifetimeOverride=0,Action=none,EffectDecal=none,Sound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=Guns,SimpleSingleSound=none,Sounds=('a_impact.Bullet.BulletDirt01','a_impact.Bullet.BulletDirt02'),SlotPriority=0,VolumePrefab=0,Slots=none,Volume=1,VolumeVariance=0,InnerRadius=256,InnerRadiusVariance=0,Radius=1024,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0),Velocity3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
	MaterialEffectMappings(7)=none
	MaterialEffectMappings(8)=none
	MaterialEffectMappings(9)=(MaterialClasses=('dnMaterial.Explosive_Barrel'),Effect=(bMountHitFX=true,Effect='dnParticles.ExplosiveBarrel_Steam',EffectScale=0,FakeLightIntensity=0,LifetimeOverride=0,Action=none,EffectDecal=none,Sound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=Guns,SimpleSingleSound=none,Sounds=('a_impact.Bullet.BulletMetal01','a_impact.Bullet.BulletMetal02'),SlotPriority=0,VolumePrefab=0,Slots=none,Volume=1,VolumeVariance=0,InnerRadius=256,InnerRadiusVariance=0,Radius=1024,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0),Velocity3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
	MaterialEffectMappings(10)=none
	MaterialEffectMappings(11)=none
	MaterialEffectMappings(12)=(MaterialClasses=('dnMaterial.fabric','dnMaterial.Carpet'),Effect=(bMountHitFX=false,Effect='p_Impacts.BulletImpact_Fabric.BulletImpact_Fabric_Spawner',EffectScale=0,FakeLightIntensity=0,LifetimeOverride=0,Action=none,EffectDecal='dnParticles.BulletHole_Fabric',Sound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=Guns,SimpleSingleSound=none,Sounds=('a_impact.Bullet.BulletCloth01','a_impact.Bullet.BulletCloth02'),SlotPriority=0,VolumePrefab=0,Slots=none,Volume=1,VolumeVariance=0,InnerRadius=256,InnerRadiusVariance=0,Radius=1024,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0),Velocity3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
	MaterialEffectMappings(13)=none
	MaterialEffectMappings(14)=none
	MaterialEffectMappings(15)=(MaterialClasses=('dnMaterial.Fabric_Thin'),Effect=(bMountHitFX=false,Effect='p_Impacts.BulletImpact_Fabric.BulletImpact_Fabric_Spawner',EffectScale=0,FakeLightIntensity=0,LifetimeOverride=0,Action=none,EffectDecal='dnParticles.BulletHole_Fabric_Thin',Sound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=Guns,SimpleSingleSound=none,Sounds=('a_impact.Bullet.BulletCloth01','a_impact.Bullet.BulletCloth02'),SlotPriority=0,VolumePrefab=0,Slots=none,Volume=1,VolumeVariance=0,InnerRadius=256,InnerRadiusVariance=0,Radius=1024,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0),Velocity3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
	MaterialEffectMappings(16)=none
	MaterialEffectMappings(17)=none
	MaterialEffectMappings(18)=(MaterialClasses=('dnMaterial.Flesh_Human'),Effect=(bMountHitFX=false,Effect='p_hit_effects.Flesh_Human.Flesh_Human_Spawner',EffectScale=0,FakeLightIntensity=0,LifetimeOverride=0,Action=none,EffectDecal='dnParticles.BulletHole_FleshHuman',Sound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=Guns,SimpleSingleSound=none,Sounds=('a_impact.body.Headshot_01','a_impact.body.BodyGib_01','a_impact.body.BodyGib_06'),SlotPriority=0,VolumePrefab=0,Slots=none,Volume=1,VolumeVariance=0,InnerRadius=256,InnerRadiusVariance=0,Radius=1024,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0),Velocity3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
	MaterialEffectMappings(19)=none
	MaterialEffectMappings(20)=none
	MaterialEffectMappings(21)=(MaterialClasses=('dnMaterial.Flesh_Alien'),Effect=(bMountHitFX=false,Effect='p_hit_effects.Flesh_Human.Flesh_Human_Spawner',EffectScale=0,FakeLightIntensity=0,LifetimeOverride=0,Action=none,EffectDecal='dnParticles.BulletHole_FleshHuman',Sound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=Guns,SimpleSingleSound=none,Sounds=('a_impact.body.Headshot_01','a_impact.body.BodyGib_01','a_impact.body.BodyGib_06'),SlotPriority=0,VolumePrefab=0,Slots=none,Volume=1,VolumeVariance=0,InnerRadius=256,InnerRadiusVariance=0,Radius=1024,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0),Velocity3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
	MaterialEffectMappings(22)=none
	MaterialEffectMappings(23)=none
	MaterialEffectMappings(24)=(MaterialClasses=('dnMaterial.Flesh_LargeCreature'),Effect=(bMountHitFX=false,Effect='p_hit_effects.Large_creature.Large_creature_Spawner',EffectScale=0,FakeLightIntensity=0,LifetimeOverride=0,Action=none,EffectDecal='dnParticles.BulletHole_FleshHuman',Sound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=Guns,SimpleSingleSound=none,Sounds=('a_impact.body.ImpactBody15a','a_impact.body.ImpactBody18a','a_impact.body.ImpactBody19a'),SlotPriority=0,VolumePrefab=0,Slots=none,Volume=1,VolumeVariance=0,InnerRadius=256,InnerRadiusVariance=0,Radius=1024,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0),Velocity3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
	MaterialEffectMappings(25)=none
	MaterialEffectMappings(26)=none
	MaterialEffectMappings(27)=(MaterialClasses=('dnMaterial.Forcefields'),Effect=(bMountHitFX=false,Effect='p_Impacts.BulletImpact_ForceField.BulletImpact_ForceField_Spawner',EffectScale=0,FakeLightIntensity=0,LifetimeOverride=0,Action=none,EffectDecal=none,Sound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=Guns,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=1,VolumeVariance=0,InnerRadius=256,InnerRadiusVariance=0,Radius=1024,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0),Velocity3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
	MaterialEffectMappings(28)=none
	MaterialEffectMappings(29)=none
	NearMissChance=0.8
	NearMissMaxDistSq=10000
	NearMissClass='BulletNearMissEffect'
}