/*******************************************************************************
 * DukeMultiplayerAssets generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class DukeMultiplayerAssets extends DukeMultiPlayer
	config(User)
	collapsecategories;

var StaticMesh CylinderMesh;

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	return;
}

simulated function LevelUpEffect()
{
	// End:0x0B
	if(IsMyDigs())
	{
		return;
	}
	// End:0x58
	if(__NFUN_145__(IsLocallyControlled()))
	{
		// End:0x39
		if(__NFUN_339__(levelup, none))
		{
			levelup = RenderActor(FindMountedActor(, class'LevelUpIndicator'));
		}
		// End:0x55
		if(__NFUN_340__(levelup, none))
		{
			levelup.BeginEffect();
		}		
	}
	else
	{
		FindAndPlaySound('EgoCap_Increase');
	}
	super.LevelUpEffect();
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super.RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1269__(class'Duke_Shirt_D_01');
	PrecacheIndex.__NFUN_1269__(class'Duke_Shirt_D_02');
	PrecacheIndex.__NFUN_1269__(class'Duke_Shirt_D_03');
	PrecacheIndex.__NFUN_1269__(class'Duke_Shirt_D_04');
	PrecacheIndex.__NFUN_1269__(class'Duke_Shirt_D_05');
	PrecacheIndex.__NFUN_1269__(class'Duke_Shirt_D_06');
	PrecacheIndex.__NFUN_1269__(class'Duke_Shirt_D_07');
	PrecacheIndex.__NFUN_1269__(class'duke_logo_d_01');
	PrecacheIndex.__NFUN_1269__(class'duke_logo_d_02');
	PrecacheIndex.__NFUN_1269__(class'duke_logo_d_03');
	PrecacheIndex.__NFUN_1269__(class'duke_logo_d_04');
	PrecacheIndex.__NFUN_1269__(class'duke_logo_d_05');
	PrecacheIndex.__NFUN_1269__(class'duke_logo_d_06');
	PrecacheIndex.__NFUN_1269__(class'duke_logo_d_07');
	PrecacheIndex.__NFUN_1269__(class'Duke_logo_d_08');
	PrecacheIndex.__NFUN_1269__(class'Duke_logo_d_09');
	PrecacheIndex.__NFUN_1269__(class'Duke_logo_d_10');
	PrecacheIndex.__NFUN_1269__(class'Duke_logo_d_11');
	PrecacheIndex.__NFUN_1269__(class'Duke_logo_d_12');
	PrecacheIndex.__NFUN_1269__(class'Duke_logo_d_13');
	PrecacheIndex.__NFUN_1269__(class'Duke_logo_d_14');
	PrecacheIndex.__NFUN_1269__(class'Duke_logo_d_15');
	PrecacheIndex.__NFUN_1269__(class'Duke_logo_d_16');
	PrecacheIndex.__NFUN_1269__(class'Duke_logo_d_17');
	PrecacheIndex.__NFUN_1269__(class'Duke_logo_d_18');
	PrecacheIndex.__NFUN_1269__(class'Duke_logo_d_19');
	PrecacheIndex.__NFUN_1269__(class'duke_logo_d_20');
	PrecacheIndex.__NFUN_1269__(class'duke_logo_d_21');
	PrecacheIndex.__NFUN_1269__(class'duke_logo_d_22');
	PrecacheIndex.__NFUN_1269__(class'duke_logo_d_23');
	PrecacheIndex.__NFUN_1269__(class'duke_logo_d_24');
	PrecacheIndex.__NFUN_1269__(class'duke_logo_d_25');
	PrecacheIndex.__NFUN_1269__(class'duke_logo_d_26');
	PrecacheIndex.__NFUN_1269__(class'duke_logo_d_27');
	PrecacheIndex.__NFUN_1269__(class'duke_logo_d_28');
	PrecacheIndex.__NFUN_1269__(class'duke_logo_d_29');
	PrecacheIndex.__NFUN_1269__(class'duke_logo_d_30');
	PrecacheIndex.__NFUN_1269__(class'duke_logo_d_31');
	PrecacheIndex.__NFUN_1269__(class'duke_logo_d_32');
	PrecacheIndex.__NFUN_1269__(class'duke_logo_d_33');
	PrecacheIndex.__NFUN_1269__(class'duke_logo_d_34');
	PrecacheIndex.__NFUN_1269__(class'duke_promo_d_2KGames');
	PrecacheIndex.__NFUN_1269__(class'duke_promo_d_3DRealms');
	PrecacheIndex.__NFUN_1269__(class'duke_promo_d_GameStop_USA');
	PrecacheIndex.__NFUN_1269__(class'duke_promo_d_Gearbox');
	PrecacheIndex.__NFUN_1269__(class'duke_promo_d_Piranha');
	PrecacheIndex.__NFUN_1269__(class'duke_promo_d_Stripper_ASIA');
	PrecacheIndex.__NFUN_1269__(class'duke_promo_d_Triptyeh');
	PrecacheIndex.__NFUN_1267__(class'Dukes_Glasses');
	PrecacheIndex.__NFUN_1267__(class'Dukes_Glasses_3D');
	PrecacheIndex.__NFUN_1267__(class'Dukes_Glasses_Aviators');
	PrecacheIndex.__NFUN_1267__(class'Dukes_Glasses_Beaked');
	PrecacheIndex.__NFUN_1267__(class'Dukes_Glasses_Bug');
	PrecacheIndex.__NFUN_1267__(class'Dukes_Glasses_Fakenose');
	PrecacheIndex.__NFUN_1267__(class'Dukes_Glasses_Goggles');
	PrecacheIndex.__NFUN_1267__(class'Dukes_Glasses_Hannibal');
	PrecacheIndex.__NFUN_1267__(class'Dukes_Glasses_Hearts');
	PrecacheIndex.__NFUN_1267__(class'Dukes_Glasses_Hornedf');
	PrecacheIndex.__NFUN_1267__(class'Dukes_Glasses_Hornedm');
	PrecacheIndex.__NFUN_1267__(class'Dukes_Glasses_Hypno');
	PrecacheIndex.__NFUN_1267__(class'Dukes_Glasses_Inuit');
	PrecacheIndex.__NFUN_1267__(class'Dukes_Glasses_OLD');
	PrecacheIndex.__NFUN_1267__(class'Dukes_Glasses_Scuba');
	PrecacheIndex.__NFUN_1267__(class'Dukes_Glasses_Shutter');
	PrecacheIndex.__NFUN_1267__(class'Dukes_Glasses_Snow');
	PrecacheIndex.__NFUN_1267__(class'Dukes_Glasses_Sports');
	PrecacheIndex.__NFUN_1267__(class'Dukes_Glasses_Star');
	PrecacheIndex.__NFUN_1267__(class'Dukes_Glasses_Stock');
	PrecacheIndex.__NFUN_1267__(class'Dukes_Glasses_Tea');
	PrecacheIndex.__NFUN_1267__(class'Dukes_Glasses_Video');
	PrecacheIndex.__NFUN_1267__(class'Dukes_Glasses_Wrap');
	PrecacheIndex.__NFUN_1267__(class'Dukes_Hats_Pimp');
	PrecacheIndex.__NFUN_1267__(class'Dukes_Hats_Viking');
	PrecacheIndex.__NFUN_1267__(class'dukes_hats_alien');
	PrecacheIndex.__NFUN_1267__(class'dukes_hats_arrow');
	PrecacheIndex.__NFUN_1267__(class'dukes_hats_beer');
	PrecacheIndex.__NFUN_1267__(class'dukes_hats_bonsai');
	PrecacheIndex.__NFUN_1267__(class'dukes_hats_brainslug');
	PrecacheIndex.__NFUN_1267__(class'dukes_hats_cap');
	PrecacheIndex.__NFUN_1267__(class'dukes_hats_capbw');
	PrecacheIndex.__NFUN_1267__(class'dukes_hats_cheese');
	PrecacheIndex.__NFUN_1267__(class'dukes_hats_chef');
	PrecacheIndex.__NFUN_1267__(class'dukes_hats_chicken');
	PrecacheIndex.__NFUN_1267__(class'dukes_hats_conehead');
	PrecacheIndex.__NFUN_1267__(class'dukes_hats_crown');
	PrecacheIndex.__NFUN_1267__(class'dukes_hats_fez');
	PrecacheIndex.__NFUN_1267__(class'dukes_hats_football');
	PrecacheIndex.__NFUN_1267__(class'dukes_hats_grandpuba');
	PrecacheIndex.__NFUN_1267__(class'dukes_hats_headdress');
	PrecacheIndex.__NFUN_1267__(class'dukes_hats_headphones');
	PrecacheIndex.__NFUN_1267__(class'dukes_hats_hoplite');
	PrecacheIndex.__NFUN_1267__(class'dukes_hats_jester');
	PrecacheIndex.__NFUN_1267__(class'dukes_hats_military');
	PrecacheIndex.__NFUN_1267__(class'dukes_hats_miner');
	PrecacheIndex.__NFUN_1267__(class'dukes_hats_pickelhaube');
	PrecacheIndex.__NFUN_1267__(class'dukes_hats_pith');
	PrecacheIndex.__NFUN_1267__(class'dukes_hats_propellerhat');
	PrecacheIndex.__NFUN_1267__(class'dukes_hats_pumpkin');
	PrecacheIndex.__NFUN_1267__(class'dukes_hats_samurai');
	PrecacheIndex.__NFUN_1267__(class'dukes_hats_trafficcone');
	PrecacheIndex.__NFUN_1267__(class'dukes_hats_unclesam');
	return;
}

defaultproperties
{
	CylinderMesh='SM_Multiplayer.KOTH.KOTH_PointCylinder'
	MP_VoicePack='SoundConfig.Players.VoicePack_Duke_MP'
	SP_VoicePack='SoundConfig.Players.VoicePack_Duke'
	BlueTeamShirtColorIdx=11
	RedTeamShirtColorIdx=12
	DoubleDamageStartAndLoop=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound='a_inventory.DoubleDamage.DoubleDamage_StartLoop',Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=(16),Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=1,Location3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0),Velocity3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
	DoubleDamageEnd=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound='a_inventory.Invincibility.Invincibility_EndWarn',Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=(16),Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=1,Location3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0),Velocity3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
	ChallengeCompleteSoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=('a_stingers.Combat.EgoGain_01'),SlotPriority=0,VolumePrefab=0,Slots=(0),Volume=2,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=true,bNoOcclude=true,bNoAIHear=true,bNoScale=true,bSpoken=false,bPlayThroughListener=false,bNoDoppler=true,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=1,Location3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0),Velocity3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
	InvincibilityEffectMaterial='dt_Effects_mp.PowerUp.InvincibleFX_FB'
	DamageBoosterEffectMaterial='dt_Effects_mp.PowerUp.PowerUpFX_FB'
	DukeSkin='mt_skinsMaleBod.duke_mp.duke_shirt_mp_bs'
	ShirtColors(0)=(R=255,G=255,B=255,A=0)
	ShirtColors(1)=(R=166,G=20,B=20,A=0)
	ShirtColors(2)=(R=204,G=0,B=153,A=0)
	ShirtColors(3)=(R=113,G=9,B=161,A=0)
	ShirtColors(4)=(R=51,G=70,B=153,A=0)
	ShirtColors(5)=(R=61,G=158,B=145,A=0)
	ShirtColors(6)=(R=50,G=205,B=20,A=0)
	ShirtColors(7)=(R=223,G=225,B=32,A=0)
	ShirtColors(8)=(R=235,G=95,B=18,A=0)
	ShirtColors(9)=(R=62,G=62,B=62,A=0)
	ShirtColors(10)=(R=128,G=128,B=0,A=0)
	ShirtColors(11)=(R=0,G=30,B=255,A=0)
	ShirtColors(12)=(R=255,G=0,B=0,A=0)
	BeepSoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=('a_menu.Menu.Menu_Arrow_R_01_ST'),SlotPriority=0,VolumePrefab=0,Slots=(0),Volume=2,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=true,bNoOcclude=true,bNoAIHear=true,bNoScale=true,bSpoken=false,bPlayThroughListener=false,bNoDoppler=true,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=1,Location3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0),Velocity3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
	CountdownSoundInfo[0]=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=('a_stingers.Combat.Combat_Over_01'),SlotPriority=0,VolumePrefab=0,Slots=(0),Volume=2,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=true,bNoOcclude=true,bNoAIHear=true,bNoScale=true,bSpoken=false,bPlayThroughListener=false,bNoDoppler=true,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=1,Location3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0),Velocity3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
	CountdownSoundInfo[1]=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=('a_multiplayer.Announcer.Announcer_Countdown_01'),SlotPriority=0,VolumePrefab=0,Slots=(0),Volume=2,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=true,bNoOcclude=true,bNoAIHear=true,bNoScale=true,bSpoken=false,bPlayThroughListener=false,bNoDoppler=true,bDialogSound=true,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=1,Location3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0),Velocity3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
	CountdownSoundInfo[2]=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=('a_multiplayer.Announcer.Announcer_Countdown_02'),SlotPriority=0,VolumePrefab=0,Slots=(0),Volume=2,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=true,bNoOcclude=true,bNoAIHear=true,bNoScale=true,bSpoken=false,bPlayThroughListener=false,bNoDoppler=true,bDialogSound=true,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=1,Location3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0),Velocity3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
	CountdownSoundInfo[3]=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=('a_multiplayer.Announcer.Announcer_Countdown_03'),SlotPriority=0,VolumePrefab=0,Slots=(0),Volume=2,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=true,bNoOcclude=true,bNoAIHear=true,bNoScale=true,bSpoken=false,bPlayThroughListener=false,bNoDoppler=true,bDialogSound=true,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=1,Location3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0),Velocity3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
	CountdownSoundInfo[4]=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=('a_multiplayer.Announcer.Announcer_Countdown_04'),SlotPriority=0,VolumePrefab=0,Slots=(0),Volume=2,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=true,bNoOcclude=true,bNoAIHear=true,bNoScale=true,bSpoken=false,bPlayThroughListener=false,bNoDoppler=true,bDialogSound=true,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=1,Location3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0),Velocity3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
	CountdownSoundInfo[5]=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=('a_multiplayer.Announcer.Announcer_Countdown_05'),SlotPriority=0,VolumePrefab=0,Slots=(0),Volume=2,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=true,bNoOcclude=true,bNoAIHear=true,bNoScale=true,bSpoken=false,bPlayThroughListener=false,bNoDoppler=true,bDialogSound=true,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=1,Location3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0),Velocity3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
	CountdownSoundInfo[6]=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=('a_menu.Menu.Menu_MP_Counter_01'),SlotPriority=0,VolumePrefab=0,Slots=(0),Volume=2,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=true,bNoOcclude=true,bNoAIHear=true,bNoScale=true,bSpoken=false,bPlayThroughListener=false,bNoDoppler=true,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=1,Location3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0),Velocity3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
	CountdownSoundInfo[7]=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=('a_menu.Menu.Menu_MP_Counter_01'),SlotPriority=0,VolumePrefab=0,Slots=(0),Volume=2,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=true,bNoOcclude=true,bNoAIHear=true,bNoScale=true,bSpoken=false,bPlayThroughListener=false,bNoDoppler=true,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=1,Location3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0),Velocity3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
	CountdownSoundInfo[8]=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=('a_menu.Menu.Menu_MP_Counter_01'),SlotPriority=0,VolumePrefab=0,Slots=(0),Volume=2,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=true,bNoOcclude=true,bNoAIHear=true,bNoScale=true,bSpoken=false,bPlayThroughListener=false,bNoDoppler=true,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=1,Location3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0),Velocity3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
	CountdownSoundInfo[9]=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=('a_menu.Menu.Menu_MP_Counter_01'),SlotPriority=0,VolumePrefab=0,Slots=(0),Volume=2,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=true,bNoOcclude=true,bNoAIHear=true,bNoScale=true,bSpoken=false,bPlayThroughListener=false,bNoDoppler=true,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=1,Location3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0),Velocity3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
	CountdownSoundInfo[10]=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=('a_menu.Menu.Menu_MP_Counter_01'),SlotPriority=0,VolumePrefab=0,Slots=(0),Volume=2,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=true,bNoOcclude=true,bNoAIHear=true,bNoScale=true,bSpoken=false,bPlayThroughListener=false,bNoDoppler=true,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=1,Location3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0),Velocity3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
	DrunkEffectClass='p_multiplayer.Effects.Beer_Bubbles'
	InvincibilityPickupSnd=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=Special,SimpleSingleSound='a_inventory.Invincibility.Invincibility_StartLoop',Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=(20),Volume=1,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=true,bNoOcclude=true,bNoAIHear=true,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=true,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=1,Location3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0),Velocity3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
	SteroidHUDEffectMaterial='dt_hud.steriods.MP_steroids_fb1'
	InvincibilityHUDEffectMaterial='dt_hud.EgoTrip.EgoTrip_fb'
	MountOnSpawn(0)=(bSkipVerifySelf=false,SpawnClass='LevelUpIndicator',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0),MountOriginVariance=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
	Mesh='c_characters.duke_mp'
}