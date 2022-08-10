/*******************************************************************************
 * Settings_Bathroom_WaterCooler generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Settings_Bathroom_WaterCooler extends Settings_Bathroom
	collapsecategories;

enum ECoolerState
{
	COOLER_None,
	COOLER_Left,
	COOLER_Right
};

var SoftParticleSystem RightParticleFX;
var SoftParticleSystem LeftParticleFX;
var array<Vector> FaucetPoints;
var() noexport int DeltaHealth "How much health to give to the drinker of this fountain.";
var Containers_WaterCooler_Jug WaterJug;
var Pawn Drinker;
var Settings_Bathroom_WaterCooler.ECoolerState CoolerState;
var bool bLeftKnobUsed;

function PostVerifySelf()
{
	super(dnDecoration).PostVerifySelf();
	GetWaterJug();
	GetParticleFX();
	return;
}

final function bool GetUserRight(Pawn User)
{
	EndViewingAngleMinDiff = 0;
	return __NFUN_173__(GetUserLookAtPoint(User, FaucetPoints), 0);
	return;
}

final function GetWaterJug()
{
	WaterJug = Containers_WaterCooler_Jug(FindMountedActor('WaterJug'));
	// End:0x2D
	if(__NFUN_340__(WaterJug, none))
	{
		AttachJugToSelf(WaterJug);
	}
	return;
}

final function GetParticleFX()
{
	LeftParticleFX = SoftParticleSystem(FindMountedActor('LeftFX'));
	RightParticleFX = SoftParticleSystem(FindMountedActor('RightFX'));
	// End:0x44
	if(__NFUN_340__(LeftParticleFX, none))
	{
		SetParticleState(LeftParticleFX, false);
	}
	// End:0x5C
	if(__NFUN_340__(RightParticleFX, none))
	{
		SetParticleState(RightParticleFX, false);
	}
	return;
}

function bool VerifySelf()
{
	DeltaHealth = __NFUN_191__(DeltaHealth, 0, int(__NFUN_211__(float(DeltaHealth))));
	return super(Actor).VerifySelf();
	return;
}

simulated function bool CanGrabUseCombine(InteractiveActor Combinee)
{
	return __NFUN_148__(__NFUN_148__(__NFUN_339__(WaterJug, none), __NFUN_340__(Combinee, none)), __NFUN_340__(Containers_WaterCooler_Jug(Combinee), none));
	return;
}

simulated function bool CanBeUsedBy(Pawn User)
{
	// End:0x40
	if(__NFUN_148__(__NFUN_148__(__NFUN_339__(WaterJug, none), User.CarryingAnActor()), __NFUN_339__(Containers_WaterCooler_Jug(User.CarriedActor), none)))
	{
		return false;
	}
	return super(InteractiveActor).CanBeUsedBy(User);
	return;
}

event Used(Actor Other, Pawn EventInstigator)
{
	super(dnDecoration).Used(Other, EventInstigator);
	// End:0x20
	if(__NFUN_174__(int(CoolerState), int(0)))
	{
		return;
	}
	// End:0x69
	if(__NFUN_150__(__NFUN_150__(__NFUN_340__(WaterJug, none), __NFUN_339__(EventInstigator, none)), __NFUN_145__(EventInstigator.CarryingAnActor())))
	{
		TurnOn(EventInstigator, GetUserRight(EventInstigator));
		return;
	}
	return;
}

event UnUsed(Actor Other, Pawn EventInstigator)
{
	super(dnDecoration).UnUsed(Other, EventInstigator);
	// End:0x24
	if(__NFUN_174__(int(CoolerState), int(0)))
	{
		TurnOff();
	}
	return;
}

function DetachJug()
{
	// End:0x7B
	if(__NFUN_340__(WaterJug, none))
	{
		WaterJug.__NFUN_631__();
		WaterJug.RestoreCollision();
		WaterJug.__NFUN_642__(18);
		WaterJug.__NFUN_817__();
		WaterJug.SetCooler(none);
		WaterJug.__NFUN_820__(__NFUN_232__(0, 0, 300));
		WaterJug = none;
	}
	return;
}

final function AttachJugToSelf(Containers_WaterCooler_Jug AttachJug)
{
	// End:0x0E
	if(__NFUN_339__(AttachJug, none))
	{
		return;
	}
	AttachJug.SetCooler(self);
	AttachJug.StoreCollision();
	AttachJug.__NFUN_621__(, false, false, true, false);
	AttachJug.__NFUN_642__(0);
	AttachJug.MountType = 2;
	AttachJug.MountMeshItem = 'jugmount';
	AttachJug.MountOrigin = __NFUN_232__(0, 0, 0);
	AttachJug.MountAngles = __NFUN_265__(0, 0, 0);
	AttachJug.__NFUN_635__(self);
	return;
}

final function TurnOn(Pawn NewDrinker, bool rightSide)
{
	Drinker = NewDrinker;
	// End:0x1F
	if(rightSide)
	{
		CoolerState = 2;		
	}
	else
	{
		CoolerState = 1;
	}
	switch(CoolerState)
	{
		// End:0x6A
		case 1:
			DecoActivity(0, 'UseLeftKnob');
			// End:0x67
			if(__NFUN_148__(__NFUN_340__(WaterJug, none), __NFUN_340__(LeftParticleFX, none)))
			{
				SetParticleState(LeftParticleFX, true);
			}
			// End:0xA8
			break;
		// End:0xA5
		case 2:
			DecoActivity(0, 'UseRightKnob');
			// End:0xA2
			if(__NFUN_148__(__NFUN_340__(WaterJug, none), __NFUN_340__(RightParticleFX, none)))
			{
				SetParticleState(RightParticleFX, true);
			}
			// End:0xA8
			break;
		// End:0xFFFF
		default:
			break;
	}
	return;
}

final function TurnOff()
{
	switch(CoolerState)
	{
		// End:0x35
		case 1:
			DecoActivity(0, 'UnUseLeftKnob');
			// End:0x32
			if(__NFUN_340__(LeftParticleFX, none))
			{
				SetParticleState(LeftParticleFX, false);
			}
			// End:0x65
			break;
		// End:0x62
		case 2:
			DecoActivity(0, 'UnUseRightKnob');
			// End:0x5F
			if(__NFUN_340__(RightParticleFX, none))
			{
				SetParticleState(RightParticleFX, false);
			}
			// End:0x65
			break;
		// End:0xFFFF
		default:
			break;
	}
	Drinker = none;
	CoolerState = 0;
	return;
}

final function SetParticleState(SoftParticleSystem ParticleSystem, bool bEnabled)
{
	// End:0x72
	if(__NFUN_340__(ParticleSystem, none))
	{
		ParticleSystem.Enabled = bEnabled;
		// End:0x60
		if(bEnabled)
		{
			ParticleSystem.DisableTickWhenEmpty = false;
			ParticleSystem.TickStyle = ParticleSystem.default.TickStyle;			
		}
		else
		{
			ParticleSystem.DisableTickWhenEmpty = true;
		}
	}
	return;
}

final function BubbleActivity()
{
	// End:0x26
	if(__NFUN_150__(__NFUN_339__(WaterJug, none), __NFUN_173__(int(CoolerState), int(0))))
	{
		__NFUN_608__('BubbleActivity');
		return;
	}
	// End:0x47
	if(__NFUN_340__(Drinker, none))
	{
		Drinker.ModifyBladder(DeltaHealth);
	}
	DecoActivity(0, 'BubbleEffect');
	return;
}

function Destroyed()
{
	TurnOff();
	DetachJug();
	super(dnDecoration).Destroyed();
	return;
}

defaultproperties
{
	FaucetPoints(0)=(X=-1324460508,bNoScale=2.3,Z=8.78)
	FaucetPoints(1)=(X=5.533,Y=-2.3,Z=8.78)
	FaucetPoints(2)=(DeltaHealth=5,DecoActivities_Default=/* Array type was not detected. */,Pitch=/* Unknown default property type! */,SDecoActivitiesData=/* Unknown default property type! */,bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0)
	FaucetPoints(3)=(ActivityIDScript=/* Array type was not detected. */,Z=106,SDecoActivitySetup=40435723,Y=/* Unknown default property type! */,ActivityStates_Success=/* Array type was not detected. */)
	FaucetPoints(4)=(ActivityStates_Failure=/* Array type was not detected. */)
	FaucetPoints(5)=(ActivityDebugID="",Activities=/* Array type was not detected. */,ActivityRules=/* Array type was not detected. */)
	FaucetPoints(6)=(ActivityElements=/* Array type was not detected. */,Z[3]=/* Array type was not detected. */,TriggerFunc_ToggleLock=/* Unknown default property type! */,FlushSoundName=/* Unknown default property type! */,bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0)
	FaucetPoints(7)=(FailureActivityElements=/* Array type was not detected. */)
	FaucetPoints(8)=(FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))
	FaucetPoints(9)=(bDisabled=false)
	FaucetPoints(10)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=/* Array type was not detected. */,Z=108,SDecoActivitySetup=40435723,Y=/* Unknown default property type! */,ActivityStates_Success=/* Array type was not detected. */)
	FaucetPoints(11)=(ActivityStates_Failure=/* Array type was not detected. */)
	FaucetPoints(12)=(ActivityDebugID="",Activities=/* Array type was not detected. */,ActivityRules=/* Array type was not detected. */)
	FaucetPoints(13)=(ActivityElements=/* Array type was not detected. */,Z[3]=/* Array type was not detected. */,TriggerFunc_ToggleLock=/* Unknown default property type! */,FlushSoundName=/* Unknown default property type! */,bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0)
	FaucetPoints(14)=(FailureActivityElements=/* Array type was not detected. */)
	FaucetPoints(15)=(FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))
	FaucetPoints(16)=(bDisabled=false)
	FaucetPoints(17)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=/* Array type was not detected. */,Z=99,SDecoActivitySetup=40435723,Y=/* Unknown default property type! */,ActivityStates_Success=/* Array type was not detected. */)
	FaucetPoints(18)=(ActivityStates_Failure=/* Array type was not detected. */)
	FaucetPoints(19)=(ActivityDebugID="",Activities=/* Array type was not detected. */,ActivityRules=/* Array type was not detected. */)
	FaucetPoints(20)=(ActivityElements=/* Array type was not detected. */,Z=/* Unknown default property type! */,DrawScaleOverride=X,FlushSoundName=/* Unknown default property type! */,bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0)
	FaucetPoints(21)=(FailureActivityElements=/* Array type was not detected. */)
	FaucetPoints(22)=(FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))
	FaucetPoints(23)=(bDisabled=false)
	FaucetPoints(24)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=/* Array type was not detected. */,Z=103,SDecoActivitySetup=40435723,Y=/* Unknown default property type! */,ActivityStates_Success=/* Array type was not detected. */)
	FaucetPoints(25)=(ActivityStates_Failure=/* Array type was not detected. */)
	FaucetPoints(26)=(ActivityDebugID="",Activities=/* Array type was not detected. */,ActivityRules=/* Array type was not detected. */)
	FaucetPoints(27)=(ActivityElements=/* Array type was not detected. */,Z=/* Unknown default property type! */,DrawScaleOverride=/* Unknown default property type! */,FlushSoundName=/* Unknown default property type! */,bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0)
	FaucetPoints(28)=(FailureActivityElements=/* Array type was not detected. */)
	FaucetPoints(29)=(FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))
	FaucetPoints(30)=(bDisabled=false)
	FaucetPoints(31)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=/* Array type was not detected. */,Z=98,SDecoActivitySetup=40435723,Y=/* Unknown default property type! */,ActivityStates_Success=/* Array type was not detected. */)
	FaucetPoints(32)=(ActivityStates_Failure=/* Array type was not detected. */)
	FaucetPoints(33)=(ActivityDebugID="",Activities=/* Array type was not detected. */,ActivityRules=/* Array type was not detected. */)
	FaucetPoints(34)=(ActivityElements=/* Array type was not detected. */,X=(X=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=/* Array type was not detected. */),FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))
	FaucetPoints(35)=(bDisabled=false)
	FaucetPoints(36)=StartupActivities=/* Array type was not detected. */,Y=true,bSurviveDeath=true,DestroyedActivities=/* Array type was not detected. */,Pitch=/* Unknown default property type! */,
/* Exception thrown while deserializing FaucetPoints
System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at System.Collections.Generic.List`1.get_Item(Int32 index)
   at UELib.UnrealStreamImplementations.ReadNameReference(IUnrealStream stream) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 838
   at UELib.Core.UDefaultProperty.DeserializeTagUE1() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 204
   at UELib.Core.UDefaultProperty.DeserializeNextTag() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 193
   at UELib.Core.UDefaultProperty.Deserialize() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 169
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 767 */
	FaucetPoints(37)=
/* Exception thrown while deserializing FaucetPoints
System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at System.Collections.Generic.List`1.get_Item(Int32 index)
   at UELib.UnrealStreamImplementations.ReadNameReference(IUnrealStream stream) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 838
   at UELib.Core.UDefaultProperty.DeserializeTagUE1() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 204
   at UELib.Core.UDefaultProperty.DeserializeNextTag() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 193
   at UELib.Core.UDefaultProperty.Deserialize() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 169
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 767 */
	FaucetPoints(38)=
/* Exception thrown while deserializing FaucetPoints
System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at System.Collections.Generic.List`1.get_Item(Int32 index)
   at UELib.UnrealStreamImplementations.ReadNameReference(IUnrealStream stream) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 838
   at UELib.Core.UDefaultProperty.DeserializeTagUE1() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 204
   at UELib.Core.UDefaultProperty.DeserializeNextTag() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 193
   at UELib.Core.UDefaultProperty.Deserialize() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 169
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 767 */
	FaucetPoints(39)=
/* Exception thrown while deserializing FaucetPoints
System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at System.Collections.Generic.List`1.get_Item(Int32 index)
   at UELib.UnrealStreamImplementations.ReadNameReference(IUnrealStream stream) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 838
   at UELib.Core.UDefaultProperty.DeserializeTagUE1() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 204
   at UELib.Core.UDefaultProperty.DeserializeNextTag() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 193
   at UELib.Core.UDefaultProperty.Deserialize() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 169
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 767 */
	FaucetPoints(40)=(HealthPrefab=4,bForceUsePhrase=true,bUsable=true,bUnUsable=true,MountOnSpawn=/* Array type was not detected. */,Z=none,SpawnClass='Containers_WaterCooler_Jug',SpawnChance=1,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=true,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=WaterJug,ForceEvent=None,MountMeshItem=jugmount,MountOrigin=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0),MountOriginVariance=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0)
	FaucetPoints(41)=(MountAngles=(Pitch=8709,Yaw=571080704,Roll=0),Roll=0)
	FaucetPoints(42)=(MountAnglesVariance=(Pitch=8709,Yaw=571080704,Roll=0),Roll=0)
}