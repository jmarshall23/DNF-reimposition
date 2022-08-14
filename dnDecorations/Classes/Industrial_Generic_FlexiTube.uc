/*******************************************************************************
 * Industrial_Generic_FlexiTube generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Industrial_Generic_FlexiTube extends Industrial_Generic
	abstract
	collapsecategories;

var() noexport float SteamDuration "How long you want steam to pour out of this tube when it gets destroyed. -1 means go forever.";
var() noexport float SteamPulseRate "How frequently the steam should cause the entire thing to move around.";
var() float SteamPulseRateVariance;
var bool bTubeOpen;
var bool bSteamAvailable;
var SoftParticleSystem SteamEffect;

event PostBeginPlay()
{
	OpenTube();
	super(dnDecoration).PostBeginPlay();
	return;
}

function NotDeadYet()
{
	super(dnDecoration).NotDeadYet();
	StartFlowing();
	return;
}

final function StartFlowing()
{
	SteamEffect = SoftParticleSystem(FindMountedActor('SteamEffect'));
	// End:0x24
	if(__NFUN_339__(SteamEffect, none))
	{
		return;
	}
	bSteamAvailable = true;
	EnableSteam();
	// End:0x4F
	if(__NFUN_201__(SteamDuration, 0))
	{
		__NFUN_605__(SteamDuration, false, 'StopFlowing');
	}
	return;
}

final function StopFlowing()
{
	DisableSteam(true);
	return;
}

event Trigger(Actor Other, Pawn EventInstigator)
{
	super(dnDecoration).Trigger(Other, EventInstigator);
	// End:0x22
	if(bTubeOpen)
	{
		CloseTube();		
	}
	else
	{
		OpenTube();
	}
	return;
}

final function OpenTube()
{
	bTubeOpen = true;
	DecoActivity(0, 'OpenTube');
	DecoActivity(0, 'SteamFlowing');
	EnableSteam();
	SteamPulse();
	return;
}

final function CloseTube()
{
	bTubeOpen = false;
	DecoActivity(0, 'CloseTube');
	DecoActivity(0, 'SteamStopped');
	DisableSteam();
	__NFUN_606__('SteamPulse');
	return;
}

final function SteamPulse()
{
	// End:0x11
	if(__NFUN_202__(SteamPulseRate, 0))
	{
		return;
	}
	// End:0x32
	if(__NFUN_148__(bTubeOpen, bSteamAvailable))
	{
		DecoActivity(0, 'SteamPulse_Hard');
	}
	__NFUN_605__(__NFUN_226__(SteamPulseRate, SteamPulseRateVariance), false, 'SteamPulse');
	return;
}

final function EnableSteam()
{
	// End:0x0E
	if(__NFUN_339__(SteamEffect, none))
	{
		return;
	}
	// End:0x28
	if(__NFUN_150__(__NFUN_145__(bSteamAvailable), __NFUN_145__(bTubeOpen)))
	{
		return;
	}
	SteamEffect.Enabled = true;
	return;
}

final function DisableSteam(optional bool bPermanently)
{
	// End:0x0E
	if(__NFUN_339__(SteamEffect, none))
	{
		return;
	}
	SteamEffect.Enabled = false;
	// End:0x43
	if(bPermanently)
	{
		bSteamAvailable = false;
		SteamEffect.DestroyWhenEmptyAfterSpawn = true;
	}
	return;
}

defaultproperties
{
	SteamDuration=5
	SteamPulseRate=2
	SteamPulseRateVariance=2
	DecoActivities_Default(0)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=none,ActivityID=(22),ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Spawn'Industrial_Generic_FlexiTube.DA_Spawn_Industrial_Generic_FlexiTube_Brkn'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
	DecoActivities_Default(1)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(SteamPulse_Hard),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_KarmaImpulse'Industrial_Generic_FlexiTube.DA_KImpulse_Industrial_Generic_FlexiTube_HardPulse'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
	AutoConstraints(0)=(bConstraintDisabledOnDeath=false,bConstraintOnDeath=false,BoneName=Root,ConstraintMounting=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0),MountOriginVariance=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0)
	AutoConstraints(1)=(MountAngles=(Pitch=8709,Yaw=571080704,Roll=0),Roll=0)
	bSurviveDeath=true
	DamageThreshold=40
	bStartEnabled=true
	bTickOnlyWhenPhysicsAwake=true
	Physics=18
	bCanExistOutOfWorld=true
	TickStyle=2
	DrawType=2
}