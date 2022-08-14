/*******************************************************************************
 * Pickup generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Pickup extends InteractiveActor
	abstract
	native
	collapsecategories
	notplaceable
	dependson(GameInfo)
	dependson(RespawnMarker);

cpptext
{
// Stripped
}

var() class<Inventory> InventoryType;
var() float RespawnTime;
var bool bInitialized;
var() bool bAllowTouchPickup;
var() bool bAllowUsePickup;
var int AmmoCharge;
var SSoundInfo RespawnSoundInfo;
var Pawn PickupNotifyPawn;
var RespawnMarker RespawnMarkerActor;
var class<RespawnMarker> RespawnMarkerClass;
var netupdate(NU_ShowRespawnMarkerTime) float ShowRespawnMarkerTime;

replication
{
	// Pos:0x000
	reliable if(__NFUN_173__(int(Role), int(ROLE_Authority)))
		ShowRespawnMarkerTime;

	// Pos:0x00B
	reliable if(__NFUN_173__(int(Role), int(ROLE_Authority)))
		GoPhysics, SetShowRespawnMarkerTime;
}

simulated function NU_ShowRespawnMarkerTime(float in_NewShowRespawnMarkerTime)
{
	local Vector RespawnMarkerOffset;

	ShowRespawnMarkerTime = in_NewShowRespawnMarkerTime;
	// End:0x81
	if(__NFUN_339__(RespawnMarkerActor, none))
	{
		RespawnMarkerOffset.Z = __NFUN_199__(RespawnMarkerClass.default.CollisionHeight, default.CollisionHeight);
		__NFUN_246__(RespawnMarkerOffset, DrawScale);
		RespawnMarkerActor = __NFUN_615__(RespawnMarkerClass, self,, __NFUN_238__(Location, RespawnMarkerOffset), __NFUN_265__(0, 0, 0));
		// End:0x81
		if(IsMP())
		{
			RespawnMarkerActor.__NFUN_591__(DrawScale);
		}
	}
	// End:0xA8
	if(__NFUN_201__(ShowRespawnMarkerTime, 0))
	{
		RespawnMarkerActor.Show(ShowRespawnMarkerTime);		
	}
	else
	{
		RespawnMarkerActor.Hide();
	}
	return;
}

noexport simulated delegate GoPhysics(optional KarmaActor StateActor)
{
	local Rotator ThrowRot;

	// End:0x30
	if(__NFUN_340__(StateActor, none))
	{
		__NFUN_645__(StateActor.Location);
		__NFUN_652__(StateActor.Rotation);
	}
	// End:0x49
	if(IsMP())
	{
		__NFUN_621__(,,,, true);
		__NFUN_642__(2);		
	}
	else
	{
		__NFUN_621__(,,, true);
		__NFUN_642__(18);
	}
	// End:0x144
	if(__NFUN_340__(StateActor, none))
	{
		StateActor.__NFUN_800__(self);
		__NFUN_801__();
		// End:0x144
		if(__NFUN_148__(StateActor.Owner.bIsPlayerPawn, __NFUN_145__(PlayerPawn(StateActor.Owner).IsDead())))
		{
			ThrowRot = __NFUN_283__(PlayerPawn(StateActor.Owner).ViewRotation);
			// End:0x10E
			if(__NFUN_170__(ThrowRot.Pitch, -8192))
			{
				__NFUN_820__(__NFUN_241__(__NFUN_232__(100, 100, 250), ThrowRot));				
			}
			else
			{
				__NFUN_820__(__NFUN_241__(__NFUN_232__(0, 0, -100), ThrowRot));
			}
			__NFUN_821__(__NFUN_241__(__NFUN_232__(-100, 0, 0), Rotation));
		}
	}
	__NFUN_817__();
	return;
}

function PostVerifySelf()
{
	super(RenderActor).PostVerifySelf();
	bInitialized = true;
	return;
}

event PostLoadMap()
{
	local Vector RespawnMarkerOffset;

	// End:0x1C9
	if(__NFUN_148__(__NFUN_148__(__NFUN_148__(__NFUN_148__(__NFUN_201__(RespawnTime, 0), __NFUN_150__(__NFUN_339__(Owner, none), __NFUN_145__(Owner.bIsInventory))), __NFUN_340__(Level.Game, none)), __NFUN_309__(Level.Game.RespawnMarkerType, "")), __NFUN_339__(RespawnMarkerActor, none)))
	{
		// End:0xB5
		if(__NFUN_339__(RespawnMarkerClass, none))
		{
			RespawnMarkerClass = class<RespawnMarker>(__NFUN_366__(Level.Game.RespawnMarkerType, class'Class'));
		}
		RespawnMarkerOffset.Z = __NFUN_199__(RespawnMarkerClass.default.CollisionHeight, default.CollisionHeight);
		__NFUN_246__(RespawnMarkerOffset, DrawScale);
		RespawnMarkerActor = __NFUN_615__(RespawnMarkerClass, self,, __NFUN_238__(Location, RespawnMarkerOffset), __NFUN_265__(0, 0, 0));
		RespawnMarkerActor.bCastStencilShadows = bCastStencilShadows;
		// End:0x136
		if(IsMP())
		{
			RespawnMarkerActor.__NFUN_591__(DrawScale);
		}
		// End:0x1AE
		if(__NFUN_339__(RespawnMarkerActor, none))
		{
			BroadcastLog(__NFUN_302__(__NFUN_302__(__NFUN_302__(string(self), ".PostLoadMap(): could not spawn respawn marker of class '"), Level.Game.RespawnMarkerType), "'."));			
		}
		else
		{
			RespawnMarkerActor.Hide();
			ShowRespawnMarkerTime = 0;
		}
	}
	// End:0x1D7
	if(IsMP())
	{
		__NFUN_642__(0);
	}
	super(Actor).PostLoadMap();
	return;
}

function EnterVoid()
{
	__NFUN_621__(false);
	__NFUN_590__(true);
	return;
}

function LeaveVoid()
{
	__NFUN_621__(true);
	__NFUN_590__(false);
	return;
}

// Export UPickup::execDoPickup(FFrame&, void* const)
native function bool DoPickup(Pawn Other, optional Actor.EPickupSource PickupSource)
{
	//native.Other;
	//native.PickupSource;	
}

event FinishPickup(Pawn Other)
{
	AnnouncePickup(Other);
	HandleRespawn();
	TickStyle = default.TickStyle;
	bNoNativeTick = default.bNoNativeTick;
	return;
}

function AnnouncePickup(Pawn Other)
{
	// End:0x22
	if(__NFUN_340__(PickupNotifyPawn, none))
	{
		PickupNotifyPawn.NotifyPickup(self, Other);
	}
	return;
}

static function bool CanBeVended(Pawn PotentialBuyer)
{
	// End:0x22
	if(__NFUN_145__(class'Inventory'.static.CanPickupClass(GetDefaultInventoryClass(), PotentialBuyer)))
	{
		return false;
	}
	return super.CanBeVended(PotentialBuyer);
	return;
}

function HandleRespawn()
{
	// End:0x2E
	if(__NFUN_150__(__NFUN_200__(RespawnTime, 0), __NFUN_173__(int(Level.NetMode), int(NM_Standalone))))
	{
		__NFUN_614__();
		return;
	}
	GlobalTrigger(Event);
	// End:0x58
	if(Level.Game.bWeaponsStay)
	{
		return;
	}
	__NFUN_397__('Sleeping');
	return;
}

static function class<Inventory> GetDefaultInventoryClass()
{
	return default.InventoryType;
	return;
}

simulated function bool CanBeUsedBy(Pawn User)
{
	return __NFUN_148__(__NFUN_148__(bAllowUsePickup, super.CanBeUsedBy(User)), __NFUN_150__(__NFUN_145__(IsMP()), __NFUN_339__(User.CarriedActor, none)));
	return;
}

// Export UPickup::execAttemptPickup(FFrame&, void* const)
native function bool AttemptPickup(Actor Other, optional bool bTickPickup)
{
	//native.Other;
	//native.bTickPickup;	
}

noexport simulated delegate SetShowRespawnMarkerTime(float Time)
{
	ShowRespawnMarkerTime = Time;
	NU_ShowRespawnMarkerTime(ShowRespawnMarkerTime);
	return;
}

function WakeUp()
{
	// End:0x11
	if(__NFUN_200__(RespawnTime, float(0)))
	{
		__NFUN_614__();
		return;
	}
	__NFUN_608__('WakeUp');
	PlaySpawnEffect();
	__NFUN_397__('Pickup');
	return;
}

function PlaySpawnEffect()
{
	Level.Game.PlaySpawnEffect(self);
	return;
}

auto state Pickup
{
	function BeginState()
	{
		LeaveVoid();
		// End:0x21
		if(Level.bStartup)
		{
			bAlwaysRelevant = true;
		}
		__NFUN_621__(false);
		__NFUN_621__(true);
		return;
	}

	simulated function RetryTouch()
	{
		local int i;

		J0x00:
		// End:0x44 [Loop If]
		if(__NFUN_169__(i, string(Touching)))
		{
			// End:0x3A
			if(Touching[i].bIsPlayerPawn)
			{
				Touch(Touching[i]);
			}
			__NFUN_184__(i);
			// [Loop Continue]
			goto J0x00;
		}
		return;
	}

	function Touch(Actor Other)
	{
		// End:0x32
		if(__NFUN_148__(__NFUN_148__(__NFUN_145__(bInitialized), IsMP()), __NFUN_170__(string(Touching), 0)))
		{
			__NFUN_605__(0.001, false, 'RetryTouch');
		}
		// End:0x67
		if(__NFUN_148__(Other.bIsPawn, __NFUN_145__(AttemptPickup(Other))))
		{
			TickStyle = 3;
			bNoNativeTick = false;
		}
		return;
	}

	function UnTouch(Actor Other)
	{
		super(Actor).UnTouch(Other);
		// End:0x2F
		if(__NFUN_173__(string(Touching), 0))
		{
			TickStyle = default.TickStyle;
			bNoNativeTick = default.bNoNativeTick;
		}
		return;
	}

	function Used(Actor Other, Pawn EventInstigator)
	{
		// End:0x0D
		if(__NFUN_145__(bAllowUsePickup))
		{
			return;
		}
		DoPickup(Pawn(Other), 2);
		return;
	}
	stop;
}

state Sleeping
{
	function BeginState()
	{
		EnterVoid();
		// End:0x51
		if(__NFUN_148__(__NFUN_340__(RespawnMarkerActor, none), Level.Game.bRespawnMarkers))
		{
			RespawnMarkerActor.Show(RespawnTime);
			SetShowRespawnMarkerTime(RespawnTime);
		}
		__NFUN_607__(RespawnTime, false, 'WakeUp');
		return;
	}

	function EndState()
	{
		LeaveVoid();
		// End:0x2D
		if(__NFUN_340__(RespawnMarkerActor, none))
		{
			RespawnMarkerActor.Hide();
			SetShowRespawnMarkerTime(0);
		}
		return;
	}
	stop;
}

defaultproperties
{
	RespawnTime=10
	bAllowTouchPickup=true
	bAllowUsePickup=true
	bDrawHUDInfo=true
	bForceUsePhrase=true
	bUsable=true
	UsePhrase="<?int?Engine.Pickup.UsePhrase?>"
	bTakeDamageMomentum=false
	bTakeExplosionDamageMomentum=false
	bIgnorePawnAirCushion=true
	DynamicInteractionClassification=1
	Physics=18
	bTraceShootable=false
	bUseCylinderCollision=true
	bBlockKarma=true
	bIsPickup=true
	bNoNativeTick=true
	bTickOnlyRecent=true
	bTickOnlyZoneRecent=true
	bAcceptMinesInMultiplayer=false
	bAcceptMines=false
	bCollideActors=true
	TouchClasses(0)='Pawn'
	TouchClasses(1)='PhysicsVolume'
	Mass=15
}