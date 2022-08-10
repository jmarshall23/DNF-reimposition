/*******************************************************************************
 * dnControl_WorkoutBench generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnControl_WorkoutBench extends dnControl_TapPowered
	collapsecategories;

var() noexport name UserLiftGridName "Name for the AnimationGrid to use for lifting the bar.";
var() noexport name UserLiftReferenceName "Name for the Animation that defines the reference position of UserLiftGridName.";
var() noexport name UserShakeAnimName "Name for the Animation to use for shaking.";
var() noexport name UserAntiShakeAnimName "Name for the Animation to use for anti-shaking.";
var() noexport name UserIdleAnimName "Name for the Animation to use for upper body idle.";
var() noexport float InitialWeight "Startup weight amount on bar.  Code will attempt to match this, but the result may be less than the number inputted.  Max is 1000.";
var dnControlHelper_WorkoutBench_Bar MyBar;
var SMountPrefab BarDefaultMountPrefab;
var SMountPrefab BarHeldMountPrefab;

function PostVerifySelf()
{
	super.PostVerifySelf();
	MyBar = dnControlHelper_WorkoutBench_Bar(FindMountedActor(, class'dnControlHelper_WorkoutBench_Bar'));
	// End:0xB3
	if(__NFUN_340__(MyBar, none))
	{
		BarDefaultMountPrefab.MountOrigin = MyBar.MountOrigin;
		BarDefaultMountPrefab.MountAngles = MyBar.MountAngles;
		BarDefaultMountPrefab.MountType = MyBar.MountType;
		BarDefaultMountPrefab.MountMeshItem = MyBar.MountMeshItem;
		BarDefaultMountPrefab.bSurviveDismount = true;
		MyBar.ChallengeTag = ChallengeTag;
	}
	// End:0xC5
	if(__NFUN_201__(InitialWeight, float(0)))
	{
		CreateInitialWeight();
	}
	return;
}

final function CreateInitialWeight()
{
	local int WeightsLeft;
	local Settings_Workout_BarWeight_100lbs NewWeight;

	WeightsLeft = int(__NFUN_196__(InitialWeight, 100));
	J0x13:

	// End:0x7F [Loop If]
	if(__NFUN_148__(__NFUN_170__(__NFUN_185__(WeightsLeft), 0), MyBar.RoomForWeight()))
	{
		NewWeight = __NFUN_615__(class'Settings_Workout_BarWeight_100lbs');
		// End:0x52
		if(__NFUN_339__(NewWeight, none))
		{			
		}
		else
		{
			NewWeight.ChallengeTag = ChallengeTag;
			MyBar.AttachWeightToBar(NewWeight);
		}
		// [Loop Continue]
		goto J0x13;
	}
	return;
}

event Used(Actor Other, Pawn EventInstigator)
{
	// End:0x3A
	if(__NFUN_148__(__NFUN_339__(User, none), __NFUN_145__(MyBar.IsBalanced())))
	{
		EventInstigator.FindSoundAndSpeak('WeightBench_UseFail');
		return;
	}
	super(dnUsableSomething).Used(Other, EventInstigator);
	return;
}

simulated function AttachToUser()
{
	// End:0x1C
	if(__NFUN_150__(__NFUN_339__(MyBar, none), __NFUN_339__(User, none)))
	{
		return;
	}
	FindAndPlaySound('BenchPress_BarGrabbed', 3);
	MyBar.__NFUN_631__();
	MyBar.__NFUN_633__(BarHeldMountPrefab, User);
	return;
}

simulated function DetachFromUser()
{
	// End:0x0E
	if(__NFUN_339__(MyBar, none))
	{
		return;
	}
	FindAndPlaySound('BenchPress_BarPlaced', 3);
	MyBar.__NFUN_631__();
	MyBar.__NFUN_633__(BarDefaultMountPrefab, self);
	return;
}

function UserStraining(bool bStraining)
{
	// End:0x2B
	if(bStraining)
	{
		User.AnimationController.SetAnimState(UserShakeAnimName);		
	}
	else
	{
		User.AnimationController.SetAnimState(UserAntiShakeAnimName);
	}
	return;
}

function FullyLifted()
{
	super.FullyLifted();
	User.FindAndPlaySound(UserGruntSoundName, 1, true, false);
	// End:0x7E
	if(__NFUN_340__(DukePlayer(User), none))
	{
		// End:0x70
		if(__NFUN_203__(LiftWeight, 600))
		{
			DukePlayer(User).GivePermanentEgoCapAward(3);
			DukePlayer(User).GivePermanentEgoCapAward(4);			
		}
		else
		{
			__NFUN_607__(0.3, false, 'SayTooEasy');
		}
	}
	return;
}

function UpdateUserLift()
{
	User.AnimationController.SetAnimGridState(UserLiftGridName, 0, UserLiftVal);
	return;
}

simulated function DetachComplete()
{
	// End:0x2A
	if(__NFUN_148__(__NFUN_340__(MyBar, none), __NFUN_340__(MyBar.MountParent, self)))
	{
		DetachFromUser();
	}
	super(dnControl).DetachComplete();
	return;
}

function SayTooEasy()
{
	User.FindAndPlaySound('WeightBench_TooEasy');
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super.RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1266__(class'Settings_Workout_BarWeight_100lbs');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'BenchPress_BarGrabbed');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'BenchPress_BarPlaced');
	PrecacheIndex.__NFUN_1277__(class'VoicePack_Duke', UserGruntSoundName);
	PrecacheIndex.__NFUN_1277__(class'VoicePack_Duke', 'WeightBench_UseFail');
	PrecacheIndex.__NFUN_1277__(class'VoicePack_Duke', 'WeightBench_TooEasy');
	PrecacheIndex.__NFUN_1281__(UserLiftGridName);
	PrecacheIndex.__NFUN_1281__(UserLiftReferenceName);
	PrecacheIndex.__NFUN_1281__(UserShakeAnimName);
	PrecacheIndex.__NFUN_1281__(UserAntiShakeAnimName);
	PrecacheIndex.__NFUN_1281__(UserIdleAnimName);
	return;
}

state() AttachUserAnim
{
	function EndState()
	{
		// End:0x22
		if(__NFUN_340__(MyBar, none))
		{
			LiftWeight = MyBar.GetTotalWeight();
		}
		User.AnimationController.SetAnimState(UserLiftReferenceName);
		super.EndState();
		return;
	}
	stop;
}

defaultproperties
{
	UserLiftGridName=WorkoutBench_Lift_Grid
	UserLiftReferenceName=WorkoutBench_Lift_Reference
	UserShakeAnimName=WorkoutBench_Shake
	UserAntiShakeAnimName=WorkoutBench_AntiShake
	BarHeldMountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=true,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=mount_handleft,MountOrigin=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0)
	TapUsePhrase="<?int?dnDecorations.dnControl_WorkoutBench.TapUsePhrase?>"
	UserGruntDelay=10
	UserGruntSoundName=Gen_Grunt
	UserLiftVal=-0.7
}