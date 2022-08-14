/*******************************************************************************
 * dnJumpPad generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnJumpPad extends dnDecoration
	collapsecategories;

var dnJumpPadTarget TargetPoint;
var() bool bFastOpen;
var() bool bStartOpen;
var bool bCanShoot;
var() name OpenTag;
var() name CloseTag;
var() name ToggleLockTag;
var() bool bDisablePlayerAirControl;
var bool bActive;
var bool bPlayBounceAnim;
var(dnJumpPad_MP) noexport bool bDeathMatch "Only usable in deathmatch";
var(dnJumpPad_MP) noexport bool bTeamDeathMatch "Only usable in team deathmatch";
var(dnJumpPad_MP) noexport bool bCaptureTheBabe "Only usable in capture the babe";
var(dnJumpPad_MP) noexport bool bKingOfTheHill "Only usable in KOTH";
var() noexport float MaxHeight "Maximum Arc Height from Location";

replication
{
	// Pos:0x000
	reliable if(__NFUN_148__(__NFUN_173__(int(Role), int(ROLE_Authority)), bNetInitial))
		bDisablePlayerAirControl, bStartOpen;
}

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	CheckMPGameType();
	return;
}

simulated function CheckMPGameType()
{
	local dnMultiplayer GameType;

	// End:0xE8
	if(__NFUN_148__(IsMP(), __NFUN_173__(int(Role), int(ROLE_Authority))))
	{
		GameType = dnMultiplayer(Level.Game);
		// End:0xE8
		if(__NFUN_340__(GameType, none))
		{
			// End:0x6A
			if(__NFUN_148__(__NFUN_173__(int(GameType.GameType), int(2)), __NFUN_145__(bCaptureTheBabe)))
			{
				__NFUN_614__();				
			}
			else
			{
				// End:0x95
				if(__NFUN_148__(__NFUN_173__(int(GameType.GameType), int(3)), __NFUN_145__(bTeamDeathMatch)))
				{
					__NFUN_614__();					
				}
				else
				{
					// End:0xC0
					if(__NFUN_148__(__NFUN_173__(int(GameType.GameType), int(1)), __NFUN_145__(bDeathMatch)))
					{
						__NFUN_614__();						
					}
					else
					{
						// End:0xE8
						if(__NFUN_148__(__NFUN_173__(int(GameType.GameType), int(4)), __NFUN_145__(bKingOfTheHill)))
						{
							__NFUN_614__();
						}
					}
				}
			}
		}
	}
	return;
}

simulated event PostVerifySelf()
{
	super.PostVerifySelf();
	// End:0x37
	if(bStartOpen)
	{
		bActive = true;
		bPlayBounceAnim = true;
		bCanShoot = true;
		DecoActivity(0, 'OpenIdle');		
	}
	else
	{
		DecoActivity(0, 'ClosedIdle');
	}
	__NFUN_718__('ForceOpen', OpenTag);
	__NFUN_718__('ForceClose', CloseTag);
	__NFUN_718__('ToggleLock', ToggleLockTag);
	TargetPoint = dnJumpPadTarget(FindActor(class'dnJumpPadTarget', Event));
	// End:0x97
	if(IsMP())
	{
		TickStyle = 0;
	}
	return;
}

simulated event PostNetInitial()
{
	local dnJumpPad_Collision Sensor;

	super.PostNetInitial();
	// End:0x34
	if(bStartOpen)
	{
		bActive = true;
		bPlayBounceAnim = true;
		bCanShoot = true;
		DecoActivity(0, 'OpenIdle');
	}
	// End:0x5B
	if(__NFUN_339__(TargetPoint, none))
	{
		TargetPoint = dnJumpPadTarget(FindActor(class'dnJumpPadTarget', Event));
	}
	Sensor = dnJumpPad_Collision(FindMountedActor(, class'dnJumpPad_Collision'));
	// End:0xA1
	if(__NFUN_340__(Sensor, none))
	{
		Sensor.ParentJumpPad = self;
		Sensor.__NFUN_816__(PhysicsEntityGroup);
	}
	return;
}

final simulated function TriggerFunc_ForceOpen()
{
	bCanShoot = false;
	// End:0x21
	if(bFastOpen)
	{
		DecoActivity(0, 'OpenFast');		
	}
	else
	{
		DecoActivity(0, 'Open');
	}
	return;
}

final simulated function TriggerFunc_ForceClose()
{
	bCanShoot = false;
	DecoActivity(0, 'Close');
	return;
}

simulated event AnimEndEx(SAnimEndInfo AnimEndInfo)
{
	super.AnimEndEx(AnimEndInfo);
	// End:0x76
	if(__NFUN_150__(__NFUN_150__(__NFUN_341__(AnimEndInfo.AnimName, 'closed_2_open'), __NFUN_341__(AnimEndInfo.AnimName, 'closed_2_open_fast')), __NFUN_341__(AnimEndInfo.AnimName, 'Bounce')))
	{
		DecoActivity(0, 'OpenIdle');
		bActive = true;
		bPlayBounceAnim = true;
		bCanShoot = true;		
	}
	else
	{
		// End:0xC7
		if(__NFUN_150__(__NFUN_341__(AnimEndInfo.AnimName, 'open_2_closed'), __NFUN_341__(AnimEndInfo.AnimName, 'pain_closed')))
		{
			DecoActivity(0, 'ClosedIdle');
			bActive = false;
			bPlayBounceAnim = false;
			bCanShoot = true;
		}
	}
	return;
}

final simulated function LaunchActor(KarmaActor Other)
{
	local float Time;
	local Vector LinVel, JumpStart;
	local DukeMultiPlayer dmp;

	// End:0x1B
	if(__NFUN_150__(__NFUN_339__(TargetPoint, none), __NFUN_145__(bActive)))
	{
		return;
	}
	// End:0x31
	if(bPlayBounceAnim)
	{
		DecoActivity(0, 'Bounce');
	}
	DecoActivity(0, 'Bounce_Sound');
	// End:0x13B
	if(__NFUN_150__(__NFUN_172__(int(Other.Role), int(ROLE_AutonomousProxy)), Other.bIsPipeBombOrTripMine))
	{
		JumpStart = Location;
		dmp = DukeMultiPlayer(Other);
		// End:0x10B
		if(__NFUN_340__(dmp, none))
		{
			// End:0xD2
			if(__NFUN_145__(dmp.bSpawnShrunk))
			{
				JumpStart = __NFUN_238__(JumpStart, __NFUN_232__(0, 0, dmp.JumpPadStartLocationHeight));				
			}
			else
			{
				JumpStart = __NFUN_238__(JumpStart, __NFUN_232__(0, 0, __NFUN_195__(dmp.JumpPadStartLocationHeight, dmp.DrawScale)));
			}
		}
		Other.JumpPadLaunch(JumpStart, TargetPoint.Location, MaxHeight,, bDisablePlayerAirControl);
	}
	return;
}

animevent simulated function EnableJump(optional EventInfo AnimEventInfo)
{
	bActive = true;
	return;
}

event TakeDamage(Pawn Instigator, float Damage, Vector DamageOrigin, Vector DamageDirection, class<DamageType> DamageType, optional name HitBoneName, optional Vector DamageStart)
{
	super.TakeDamage(Instigator, Damage, DamageOrigin, DamageDirection, DamageType, HitBoneName, DamageStart);
	// End:0x55
	if(__NFUN_148__(bCanShoot, bActive))
	{
		bCanShoot = false;
		DecoActivity(0, 'Bounce');		
	}
	else
	{
		// End:0x80
		if(__NFUN_148__(bCanShoot, __NFUN_145__(bActive)))
		{
			bCanShoot = false;
			DecoActivity(0, 'ClosedPain');
		}
	}
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super.RegisterPrecacheComponents(PrecacheIndex);
	// End:0x30
	if(PrecacheIndex.bIsMP)
	{
		PrecacheIndex.__NFUN_1269__(class'JumpPad_FB');
	}
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Hive_JumpPad_OpenSlow');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Hive_JumpPad_OpenFast');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Hive_JumpPad_Close');
	return;
}

defaultproperties
{
	bCanShoot=true
	bDeathMatch=true
	bTeamDeathMatch=true
	bCaptureTheBabe=true
	bKingOfTheHill=true
	MaxHeight=50
	DecoActivities_Default(0)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(ClosedIdle),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Animation'dnJumpPad.DA_Anim_JumpPad_Idle_Closed'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
	DecoActivities_Default(1)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(OpenIdle),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Animation'dnJumpPad.DA_Anim_JumpPad_Idle_Open'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
	DecoActivities_Default(2)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(Open),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Animation'dnJumpPad.DA_Anim_JumpPad_Open'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
	DecoActivities_Default(3)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(OpenFast),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Animation'dnJumpPad.DA_Anim_JumpPad_Open_Fast'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
	DecoActivities_Default(4)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(Close),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Animation'dnJumpPad.DA_Anim_JumpPad_Close'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
	DecoActivities_Default(5)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(Bounce),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Animation'dnJumpPad.DA_Anim_JumpPad_Bounce'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
	DecoActivities_Default(6)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(Bounce_Sound),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Sound'dnJumpPad.DA_Sound_JumpPad_Bounce'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
	DecoActivities_Default(7)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(ClosedPain),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Animation'dnJumpPad.DA_Anim_JumpPad_Closed_Pain'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
	MountOnSpawn(0)=(bSkipVerifySelf=false,SpawnClass='dnJumpPad_Collision',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0),MountOriginVariance=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
	bNoDamage=true
	bPlayerFallingDamageExempt=true
	KImpactThreshold=0
	bBlockKarma=true
	bTickOnlyZoneRecent=false
	bAcceptMinesInMultiplayer=false
	bAcceptMines=false
	Mesh='c_generic.alien_jumppad'
	VoicePack='SoundConfig.Interactive.VoicePack_Biology'
}