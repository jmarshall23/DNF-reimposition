/*******************************************************************************
 * dnControl_Bathroom_UrinationReceptacle generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnControl_Bathroom_UrinationReceptacle extends dnControl
	abstract
	collapsecategories;

const kUrinationReceptacle_AttachUserAnim = 2;
const kUrinationReceptacle_DetachUser = 4;

enum EToiletType
{
	TOILET_Standard,
	TOILET_Urinal
};

var(dnToilet) dnControl_Bathroom_UrinationReceptacle.EToiletType ToiletType;
var(dnToilet) noexport int DeltaEgo "How much ego to give to the user.";
var(dnToilet) noexport int DeltaBladder "How much piss to remove from the user.";
var(dnToilet) noexport name FlushSoundName "VoicePack entry to play when flushed.";
var(dnToilet) noexport name FlushAnim "Flush animation";
var(dnToilet) noexport float FlushTime "Amount of time to flush before user can pee again";
var(dnToilet) noexport float PissTime "Amount of time player has to piss";
var(dnToilet) float PissDrunkTime;
var(dnToilet) float PissLockoutThreshold;
var bool bPassedLockoutThreshold;
var bool bFlushing;
var bool bClogged;
var InteractiveActor FlushActor;
var SMountedActorPrefab PeeSplashPrefab;
var SoftParticleSystem PeeSplash;
var localized string PissPhrase;

replication
{
	// Pos:0x000
	reliable if(__NFUN_173__(int(Role), int(ROLE_Authority)))
		EnterIdle, EnterPressPee, 
		EnterReleasePee, GetOff;
}

function bool CanAttachPawn(Pawn TestPawn)
{
	// End:0x0B
	if(bFlushing)
	{
		return false;
	}
	// End:0x16
	if(bClogged)
	{
		return false;
	}
	// End:0x48
	if(__NFUN_145__(TestPawn.bCanPiss))
	{
		TestPawn.FindSoundAndSpeak('Piss_LockOut');
		Flush();
		return false;
	}
	return super.CanAttachPawn(TestPawn);
	return;
}

final function StartPeeSplash()
{
	// End:0x4F
	if(__NFUN_340__(PeeSplash, none))
	{
		PeeSplash.Enabled = true;
		PeeSplash.DisableTickWhenEmpty = false;
		PeeSplash.TickStyle = PeeSplash.default.TickStyle;
	}
	return;
}

final function StopPeeSplash()
{
	// End:0x30
	if(__NFUN_340__(PeeSplash, none))
	{
		PeeSplash.DisableTickWhenEmpty = true;
		PeeSplash.Enabled = false;
	}
	return;
}

simulated function bool CanBeUsedBy(Pawn User)
{
	return __NFUN_148__(__NFUN_145__(bFlushing), super(dnUsableSomething).CanBeUsedBy(User));
	return;
}

noexport simulated delegate EnterIdle()
{
	ForceStateTransition('idle');
	return;
}

noexport simulated delegate EnterPressPee()
{
	// End:0x34
	if(__NFUN_150__(__NFUN_173__(int(User.Role), int(ROLE_Authority)), __NFUN_173__(int(User.Role), int(ROLE_AutonomousProxy))))
	{
		return;
	}
	ForceStateTransition('PressPee');
	return;
}

noexport simulated delegate EnterReleasePee(optional bool bBecauseOfAuthority)
{
	// End:0x27
	if(__NFUN_148__(__NFUN_173__(int(User.Role), int(ROLE_AutonomousProxy)), __NFUN_145__(bBecauseOfAuthority)))
	{
		return;
	}
	ForceStateTransition('ReleasePee');
	return;
}

noexport simulated delegate GetOff()
{
	User.FindSoundAndSpeak('Heal');
	DetachPawnSuccess(true);
	return;
}

function Flush()
{
	bFlushing = true;
	DecoActivity(0, 'Flushing');
	FlushTime = FindAndPlaySound(FlushSoundName, 1);
	// End:0x5C
	if(__NFUN_340__(__NFUN_568__(), none))
	{
		FlushTime = __NFUN_225__(FlushTime, MeshInstance.__NFUN_553__(FlushAnim));
		DecoPlayAnim(FlushAnim);
	}
	__NFUN_605__(FlushTime, false, 'EndFlush');
	return;
}

function EndFlush()
{
	bFlushing = false;
	DecoActivity(0, 'Clear');
	TickStyle = default.TickStyle;
	return;
}

final function ClearFlushActor()
{
	FlushActor.bSilentDestroy = true;
	FlushActor.__NFUN_614__();
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super.RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1277__(VoicePack, FlushSoundName);
	PrecacheIndex.__NFUN_1284__(Mesh, FlushAnim);
	PrecacheIndex.__NFUN_1268__(PeeSplashPrefab);
	PrecacheIndex.__NFUN_1266__(class'dnPissFX_Male');
	PrecacheIndex.__NFUN_1277__(class'VoicePack_Duke', 'Piss');
	PrecacheIndex.__NFUN_1277__(class'VoicePack_Duke', 'PissEnd');
	PrecacheIndex.__NFUN_1277__(class'VoicePack_Duke', 'Piss_LockOut');
	PrecacheIndex.__NFUN_1277__(class'VoicePack_Duke', 'Heal');
	PrecacheIndex.__NFUN_1277__(class'VoicePack_Duke', 'Zipper');
	return;
}

simulated state() AttachUserLERP
{
	simulated event BeginState()
	{
		super(Object).BeginState();
		TickStyle = 3;
		// End:0x4A
		if(__NFUN_148__(__NFUN_340__(PlayerPawn(User), none), __NFUN_201__(PlayerPawn(User).DrunkLevel, 0)))
		{
			PissTime = PissDrunkTime;
		}
		return;
	}
	stop;
}

simulated state() idle
{
	simulated event BeginState()
	{
		// End:0x32
		if(__NFUN_148__(__NFUN_339__(PeeSplash, none), __NFUN_340__(PeeSplashPrefab.SpawnClass, none)))
		{
			PeeSplash = SoftParticleSystem(__NFUN_837__(PeeSplashPrefab));
		}
		return;
	}

	simulated function UsableSomethingQueryInteractKeyInfoState(HUD HUD)
	{
		SetHUDKeyInfoState(HUD, 1, true, 26,,, PissPhrase);
		return;
	}
	stop;
}

simulated state() IdleCantPiss
{	stop;
}

simulated state() PressPee
{
	simulated event BeginState()
	{
		// End:0x3F
		if(__NFUN_173__(int(User.Role), int(ROLE_AutonomousProxy)))
		{
			// End:0x3F
			if(__NFUN_340__(DukePlayer(User), none))
			{
				DukePlayer(User).ServerStartPissingInReceptacle(self);
			}
		}
		// End:0x53
		if(__NFUN_173__(int(Role), int(ROLE_Authority)))
		{
			EnterPressPee();
		}
		User.EnablePiss();
		// End:0x8B
		if(__NFUN_340__(DukePlayer(User), none))
		{
			DukePlayer(User).GivePermanentEgoCapAward(0);
		}
		__NFUN_606__('StopPeeSplash');
		__NFUN_607__(0.15, false, 'StartPeeSplash');
		return;
	}

	simulated function UsableSomethingQueryInteractKeyInfoState(HUD HUD)
	{
		return;
	}

	event Tick(float DeltaTime)
	{
		super(dnControl).Tick(DeltaTime);
		__NFUN_210__(PissTime, DeltaTime);
		// End:0x3A
		if(__NFUN_202__(PissTime, float(0)))
		{
			User.DrainedIt();
			EnterReleasePee(true);
		}
		// End:0x51
		if(__NFUN_202__(PissTime, PissLockoutThreshold))
		{
			bPassedLockoutThreshold = true;
		}
		return;
	}
	stop;
}

simulated state() ReleasePee
{
	simulated event BeginState()
	{
		// End:0x3F
		if(__NFUN_173__(int(User.Role), int(ROLE_AutonomousProxy)))
		{
			// End:0x3F
			if(__NFUN_340__(DukePlayer(User), none))
			{
				DukePlayer(User).ServerStopPissingInReceptacle(self);
			}
		}
		User.DisablePiss();
		// End:0x89
		if(__NFUN_173__(int(Role), int(ROLE_Authority)))
		{
			// End:0x83
			if(__NFUN_145__(User.bCanPiss))
			{
				__NFUN_607__(0.75, false, 'GetOff');				
			}
			else
			{
				EnterIdle();
			}
		}
		__NFUN_606__('StartPeeSplash');
		__NFUN_607__(0.15, false, 'StopPeeSplash');
		return;
	}

	simulated function UsableSomethingQueryInteractKeyInfoState(HUD HUD)
	{
		return;
	}
	stop;
}

simulated state() DetachUser
{
	simulated function StartState()
	{
		PissTime = default.PissTime;
		StopPeeSplash();
		User.DisablePiss();
		// End:0x3A
		if(bPassedLockoutThreshold)
		{
			User.DrainedIt();
		}
		Flush();
		super.StartState();
		return;
	}
	stop;
}

simulated state() DetachUserLERP
{
	simulated function StartState()
	{
		super.StartState();
		return;
	}
	stop;
}

defaultproperties
{
	DeltaEgo=10
	DeltaBladder=-10
	FlushTime=2
	PissTime=10
	PissDrunkTime=20
	PissLockoutThreshold=5
	PissPhrase="<?int?dnGame.dnControl_Bathroom_UrinationReceptacle.PissPhrase?>"
}