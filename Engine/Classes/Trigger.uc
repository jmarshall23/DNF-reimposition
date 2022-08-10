/*******************************************************************************
 * Trigger generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Trigger extends Triggers
	native
	collapsecategories
	notplaceable
	hidecategories(Filter,Interactivity,Karma,Lighting,Networking,Sound);

enum ETriggerType
{
	TT_PlayerProximity,
	TT_PawnProximity,
	TT_ClassProximity,
	TT_AnyProximity,
	TT_TakeDamage,
	TT_PlayerProximityAndUse,
	TT_PlayerProximityAndLookUse,
	TT_TagProximity,
	TT_EventProximity,
	TT_PlayerProximityAndLook
};

enum ETriggerShrunkType
{
	TST_Either,
	TST_OnlyShrunk,
	TST_OnlyNonShrunk
};

var() bool bForceInstigator;
var() bool bDebug;
var Pawn DukeInstigator;
var() Trigger.ETriggerType TriggerType;
var() noexport Trigger.ETriggerShrunkType TriggerShrunkType "Used when TriggerType is set to one for Pawns or Players." "TST_Either: All pawns accepted." "TST_OnlyShrunk: Only shrunk pawns accepted." "TST_OnlyNonShrunk: Only non-shrunk pawns accepted.";
var(Events) noexport name LookUseTags[16] "Tags of things that can be looked at.";
var(Events) noexport name LookUseEvents[16] "The corresponding events to the above.";
var(Events) noexport name EnableTag "EnableSelf will be called when this event is triggered";
var(Events) noexport name DisableTag "DisableSelf will be called when this event is triggered";
var Actor LookUseTriggered[16];
var() noexport string Message "Human readable triggering message.";
var() noexport bool bTriggerOnceOnly "Only trigger once and then go dormant.";
var() noexport bool bUnTriggerOnceOnly "Only untrigger once and then go dormant.";
var bool bTriggered;
var bool bUnTriggered;
var() noexport bool bInitiallyActive "For triggers that are activated/deactivated by other triggers.";
var() class<Actor> ClassProximityType;
var() class<Actor> ClassProximityType2;
var() noexport deprecated name TagEventProximity "Tag or event name used by TT_TagProximity or TT_EventProximity.";
var() noexport float RepeatTriggerTime "If > 0, repeat trigger message at this interval is still touching other.";
var() noexport float ReTriggerDelay "Minimum time before trigger can be triggered again.";
var() noexport float ReUnTriggerDelay "Minimum time before untrigger can be triggered again.";
var float AllowTriggerTime;
var float AllowUnTriggerTime;
var() noexport float DamageThreshold "Minimum damage to trigger if TT_TakeDamage.";
var() noexport deprecated name UntriggerEvent "Event to be executed when trigger is untriggered.";
var() noexport bool bTriggerWhenCrouched "If TT_PlayerProximityAndUse and the player is crouched the trigger is still usable.";
var() noexport class<RenderActor> TriggerWhenClassCarried "Only trigger if the player is carrying a RenderActor of this class.";
var() noexport bool DestroyCarriedActor "When triggered by a player, destroy their carried actor.";
var Actor TriggerActor;
var Actor TriggerActor2;
var bool PlayerTriggered;
var bool ValidTouch;
var int Touches;

function PostBeginPlay()
{
	local Actor A;

	// End:0x11
	if(__NFUN_145__(bInitiallyActive))
	{
		FindTriggerActor();
	}
	super(Actor).PostBeginPlay();
	FindDuke();
	__NFUN_718__('EnableSelf', EnableTag);
	__NFUN_718__('DisableSelf', DisableTag);
	return;
}

final function TriggerFunc_EnableSelf()
{
	EnableSelf();
	return;
}

final function TriggerFunc_DisableSelf()
{
	DisableSelf();
	return;
}

function FindDuke()
{
	local PlayerPawn Player;

	// End:0x0E
	if(__NFUN_340__(DukeInstigator, none))
	{
		return;
	}
	// End:0x2F
	foreach __NFUN_747__(class'PlayerPawn', Player,, true)
	{
		DukeInstigator = Player;
		// End:0x2F
		break;		
	}	
	return;
}

function FindTriggerActor()
{
	local Actor A;

	TriggerActor = none;
	TriggerActor2 = none;
	// End:0x75
	foreach __NFUN_747__(class'Actor', A)
	{
		// End:0x74
		if(__NFUN_341__(A.Event, Tag))
		{
			// End:0x4C
			if(__NFUN_340__(Counter(A), none))
			{				
				return;
			}
			// End:0x66
			if(__NFUN_339__(TriggerActor, none))
			{
				TriggerActor = A;
				// End:0x74
				continue;
			}
			TriggerActor2 = A;			
			return;
		}		
	}	
	return;
}

final function EnableTicking()
{
	TickStyle = 2;
	return;
}

final function DisableTicking()
{
	// End:0x18
	if(__NFUN_150__(ValidTouch, __NFUN_170__(Touches, 0)))
	{
		return;
	}
	TickStyle = 0;
	return;
}

function CheckTouchList()
{
	local Actor A;

	// End:0x28
	foreach __NFUN_749__(class'Actor', A)
	{
		// End:0x27
		if(__NFUN_340__(A, none))
		{
			Touch(A);
		}		
	}	
	return;
}

event InteractiveActor SpecialLook(PlayerPawn LookPlayer)
{
	local Vector X, Y, Z, StartTrace, EndTrace, HitLocation,
		HitNormal, DrawOffset, PointUV;

	local Texture HitMeshTexture;
	local Actor HitActor, HitActor2;

	__NFUN_621__(false, false, false);
	bTraceUsable = false;
	HitActor = LookPlayer.TraceFromCrosshairMesh(LookPlayer.UseDistance);
	bTraceUsable = true;
	__NFUN_621__(true, false, false);
	return InteractiveActor(HitActor);
	return;
}

final function DisableSelf()
{
	bInitiallyActive = false;
	Touches = 0;
	ValidTouch = false;
	DisableTicking();
	return;
}

final function EnableSelf()
{
	local bool bWasActive;

	bWasActive = bInitiallyActive;
	bInitiallyActive = true;
	// End:0x26
	if(__NFUN_145__(bWasActive))
	{
		CheckTouchList();
	}
	return;
}

function bool CheckShrunkType(Pawn Pawn)
{
	// End:0x22
	if(__NFUN_173__(int(TriggerShrunkType), int(1)))
	{
		return Pawn.IsMostlyShrunk();		
	}
	else
	{
		// End:0x43
		if(__NFUN_173__(int(TriggerShrunkType), int(2)))
		{
			return __NFUN_145__(Pawn.IsMostlyShrunk());
		}
	}
	return true;
	return;
}

function bool IsRelevant(Actor Other)
{
	local Pawn P;

	// End:0x0D
	if(__NFUN_145__(bInitiallyActive))
	{
		return false;
	}
	P = Pawn(Other);
	switch(TriggerType)
	{
		// End:0x2A
		case 0:
		// End:0x2F
		case 6:
		// End:0x34
		case 5:
		// End:0x81
		case 9:
			return __NFUN_148__(__NFUN_148__(__NFUN_148__(__NFUN_340__(P, none), P.bIsPlayer), __NFUN_145__(P.__NFUN_358__('AIPawn'))), CheckShrunkType(P));
		// End:0x9E
		case 7:
			return __NFUN_341__(Other.Tag, TagEventProximity);
		// End:0xBB
		case 8:
			return __NFUN_341__(Other.Event, TagEventProximity);
		// End:0xDA
		case 1:
			return __NFUN_148__(__NFUN_340__(P, none), CheckShrunkType(P));
		// End:0x113
		case 2:
			return __NFUN_150__(__NFUN_357__(Other.Class, ClassProximityType), __NFUN_357__(Other.Class, ClassProximityType2));
		// End:0x11A
		case 3:
			return true;
		// End:0x14E
		case 4:
			return __NFUN_148__(__NFUN_340__(Projectile(Other), none), __NFUN_203__(Projectile(Other).Damage, DamageThreshold));
		// End:0xFFFF
		default:
			return;
			break;
	}
}

function TriggerTarget(Actor Other)
{
	local Actor A;
	local int Counter;
	local RenderActor RA;

	// End:0x0B
	if(bTriggered)
	{
		return;
	}
	// End:0x86
	if(__NFUN_148__(__NFUN_340__(TriggerWhenClassCarried, none), __NFUN_150__(__NFUN_150__(__NFUN_150__(__NFUN_339__(Other, none), __NFUN_145__(Other.bIsPlayerPawn)), __NFUN_339__(PlayerPawn(Other).CarriedActor, none)), __NFUN_340__(PlayerPawn(Other).CarriedActor.Class, TriggerWhenClassCarried))))
	{
		return;
	}
	// End:0x103
	if(__NFUN_148__(__NFUN_148__(DestroyCarriedActor, __NFUN_340__(Pawn(Other), none)), __NFUN_340__(Pawn(Other).CarriedActor, none)))
	{
		RA = Pawn(Other).CarriedActor;
		Pawn(Other).DropCarriedActor(10, true, false, true);
		RA.__NFUN_614__();
	}
	// End:0x12F
	if(__NFUN_148__(__NFUN_201__(ReTriggerDelay, 0), __NFUN_201__(AllowTriggerTime, Level.GameTimeSeconds)))
	{
		return;
	}
	AllowTriggerTime = __NFUN_198__(Level.GameTimeSeconds, ReTriggerDelay);
	GlobalTrigger(Event, Other.Instigator, Other);
	// End:0x1A6
	if(bDebug)
	{
		BroadcastMessage(__NFUN_302__(__NFUN_303__(__NFUN_303__("Triggering:", string(Other)), ", Message:"), Message));
	}
	// End:0x1BE
	if(__NFUN_309__(Message, ""))
	{
		BroadcastMessage(Message);
	}
	// End:0x1D2
	if(bTriggerOnceOnly)
	{
		bTriggered = true;		
	}
	else
	{
		// End:0x1EC
		if(__NFUN_201__(RepeatTriggerTime, float(0)))
		{
			__NFUN_607__(RepeatTriggerTime, true, 'RepeatCallback');
		}
	}
	return;
}

function UntriggerTarget(Actor Other)
{
	local Actor A;
	local int i;

	// End:0x16
	if(__NFUN_148__(bUnTriggerOnceOnly, bUnTriggered))
	{
		return;
	}
	bUnTriggered = true;
	// End:0x4A
	if(__NFUN_148__(__NFUN_201__(ReUnTriggerDelay, 0), __NFUN_201__(AllowUnTriggerTime, Level.GameTimeSeconds)))
	{
		return;
	}
	AllowUnTriggerTime = __NFUN_198__(Level.GameTimeSeconds, ReUnTriggerDelay);
	// End:0xB1
	if(__NFUN_342__(Event, 'None'))
	{
		// End:0xB0
		foreach __NFUN_747__(class'Actor', A, Event)
		{
			A.UnTrigger(Other, Other.Instigator);			
		}		
	}
	GlobalTrigger(UntriggerEvent, Other.Instigator);
	return;
}

function Touch(Actor Other)
{
	// End:0x8B
	if(__NFUN_148__(__NFUN_150__(__NFUN_339__(Other.Instigator, none), __NFUN_339__(Instigator, none)), bForceInstigator))
	{
		FindDuke();
		// End:0x6B
		if(bDebug)
		{
			BroadcastMessage(__NFUN_303__("Forcing Instigator to Duke: ", string(DukeInstigator)));
		}
		Instigator = DukeInstigator;
		Other.Instigator = DukeInstigator;
	}
	// End:0xE2
	if(IsRelevant(Other))
	{
		// End:0xD7
		if(__NFUN_150__(__NFUN_150__(__NFUN_173__(int(TriggerType), int(5)), __NFUN_173__(int(TriggerType), int(6))), __NFUN_173__(int(TriggerType), int(9))))
		{
			__NFUN_184__(Touches);
			EnableTicking();			
		}
		else
		{
			TriggerTarget(Other);
		}
	}
	return;
}

function int HitLookUseTag(PlayerPawn P)
{
	local int i;
	local Actor A;
	local name aTag;

	// End:0x12
	if(__NFUN_339__(P, none))
	{
		return -1;
	}
	// End:0x64
	if(__NFUN_148__(__NFUN_340__(P.LookHitActor, none), P.LookHitActor.CanBeUsedBy(P)))
	{
		A = P.LookHitActor;		
	}
	else
	{
		A = P.TraceFromCrosshairMesh(2000);
	}
	// End:0x91
	if(__NFUN_339__(A, none))
	{
		return -1;
	}
	aTag = A.Tag;
	// End:0xBC
	if(__NFUN_341__(aTag, 'None'))
	{
		return -1;
	}
	i = 0;
	J0xC3:

	// End:0x106 [Loop If]
	if(__NFUN_169__(i, 16))
	{
		// End:0xFC
		if(__NFUN_341__(LookUseTags[i], aTag))
		{
			Event = LookUseEvents[i];
			return i;
		}
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0xC3;
	}
	return -1;
	return;
}

function Tick(float DeltaSeconds)
{
	local int i, t, u, lookUseThisFrame;
	local PlayerPawn P;

	super(Actor).Tick(DeltaSeconds);
	// End:0x3B
	if(__NFUN_148__(__NFUN_148__(__NFUN_174__(int(TriggerType), int(5)), __NFUN_174__(int(TriggerType), int(6))), __NFUN_174__(int(TriggerType), int(9))))
	{
		return;
	}
	ValidTouch = false;
	// End:0x1D3
	foreach __NFUN_749__(class'PlayerPawn', P)
	{
		ValidTouch = true;
		u = -1;
		// End:0x13B
		if(__NFUN_173__(int(TriggerType), int(9)))
		{
			u = HitLookUseTag(P);
			// End:0xC7
			if(__NFUN_174__(-1, u))
			{
				// End:0xC7
				if(__NFUN_145__(bool(LookUseTriggered[u])))
				{
					LookUseTriggered[u] = P;
					TriggerTarget(LookUseTriggered[u]);
				}
			}
			t = 0;
			J0xCE:

			// End:0x138 [Loop If]
			if(__NFUN_169__(t, 16))
			{
				// End:0x12E
				if(__NFUN_150__(__NFUN_174__(t, u), __NFUN_173__(u, -1)))
				{
					// End:0x12E
					if(__NFUN_339__(P, LookUseTriggered[t]))
					{
						UntriggerTarget(LookUseTriggered[t]);
						LookUseTriggered[t] = none;
					}
				}
				__NFUN_184__(t);
				// [Loop Continue]
				goto J0xCE;
			}
			// End:0x1D2
			continue;
		}
		// End:0x1B6
		if(__NFUN_148__(P.bIUse, __NFUN_150__(__NFUN_145__(P.bIDuck), bTriggerWhenCrouched)))
		{
			// End:0x1B3
			if(__NFUN_150__(__NFUN_174__(int(TriggerType), int(6)), __NFUN_174__(HitLookUseTag(P), -1)))
			{
				// End:0x1B3
				if(__NFUN_145__(PlayerTriggered))
				{
					PlayerTriggered = true;
					TriggerTarget(P);
				}
			}
			// End:0x1D2
			continue;
		}
		// End:0x1CA
		if(PlayerTriggered)
		{
			UntriggerTarget(P);
		}
		PlayerTriggered = false;		
	}	
	// End:0x1E5
	if(__NFUN_145__(ValidTouch))
	{
		DisableTicking();
	}
	return;
}

function RepeatCallback()
{
	local bool bKeepTiming;
	local int i, t;
	local Actor A;

	bKeepTiming = false;
	// End:0xA6
	foreach __NFUN_749__(class'Actor', A)
	{
		// End:0xA5
		if(IsRelevant(A))
		{
			// End:0x92
			if(__NFUN_173__(int(TriggerType), int(9)))
			{
				t = 0;
				J0x3B:

				// End:0x8F [Loop If]
				if(__NFUN_171__(t, 16))
				{
					// End:0x60
					if(__NFUN_339__(LookUseTriggered[t], A))
					{
						// [Explicit Break]
						goto J0x8F;
					}
					// End:0x85
					if(__NFUN_174__(t, 16))
					{
						bKeepTiming = true;
						TriggerTarget(LookUseTriggered[t]);
					}
					__NFUN_184__(t);
					// [Loop Continue]
					goto J0x3B;
				}
				J0x8F:

				// End:0xA5
				continue;
			}
			bKeepTiming = true;
			TriggerTarget(A);
		}		
	}	
	// End:0xBA
	if(__NFUN_145__(bKeepTiming))
	{
		__NFUN_608__('RepeatCallback');
	}
	return;
}

event TakeDamage(Pawn Instigator, float Damage, Vector DamageOrigin, Vector DamageDirection, class<DamageType> DamageType, optional name HitBoneName, optional Vector DamageStart)
{
	local Actor A;

	// End:0xCE
	if(__NFUN_148__(__NFUN_148__(__NFUN_148__(bInitiallyActive, __NFUN_173__(int(TriggerType), int(4))), __NFUN_203__(Damage, DamageThreshold)), __NFUN_340__(Instigator, none)))
	{
		// End:0x64
		if(__NFUN_148__(__NFUN_201__(ReTriggerDelay, 0), __NFUN_201__(AllowTriggerTime, Level.GameTimeSeconds)))
		{
			return;
		}
		AllowTriggerTime = __NFUN_198__(Level.GameTimeSeconds, ReTriggerDelay);
		GlobalTrigger(Event, Instigator, Instigator);
		// End:0xC1
		if(__NFUN_309__(Message, ""))
		{
			Instigator.Instigator.ClientMessage(Message);
		}
		// End:0xCE
		if(bTriggerOnceOnly)
		{
			__NFUN_621__(false);
		}
	}
	return;
}

function UnTouch(Actor Other)
{
	local Actor A;
	local int i, t;
	local bool Relevant;

	// End:0x0E
	if(__NFUN_339__(Other, none))
	{
		return;
	}
	Relevant = IsRelevant(Other);
	// End:0xB1
	if(Relevant)
	{
		// End:0x65
		if(__NFUN_148__(__NFUN_148__(__NFUN_174__(int(TriggerType), int(5)), __NFUN_174__(int(TriggerType), int(6))), __NFUN_174__(int(TriggerType), int(9))))
		{
			UntriggerTarget(Other);			
		}
		else
		{
			// End:0x91
			if(__NFUN_148__(Other.bIsPawn, PlayerTriggered))
			{
				UntriggerTarget(Other);				
			}
			else
			{
				// End:0xB1
				if(__NFUN_145__(Other.bIsPawn))
				{
					UntriggerTarget(Other);
				}
			}
		}
	}
	// End:0x110
	if(__NFUN_173__(int(TriggerType), int(9)))
	{
		t = 0;
		J0xC6:

		// End:0x110 [Loop If]
		if(__NFUN_169__(t, 16))
		{
			// End:0x106
			if(__NFUN_339__(Other, LookUseTriggered[t]))
			{
				UntriggerTarget(LookUseTriggered[t]);
				LookUseTriggered[t] = none;
			}
			__NFUN_184__(t);
			// [Loop Continue]
			goto J0xC6;
		}
	}
	// End:0x168
	if(__NFUN_148__(Relevant, __NFUN_150__(__NFUN_150__(__NFUN_173__(int(TriggerType), int(5)), __NFUN_173__(int(TriggerType), int(6))), __NFUN_173__(int(TriggerType), int(9)))))
	{
		__NFUN_185__(Touches);
		// End:0x168
		if(__NFUN_171__(Touches, 0))
		{
			Touches = 0;
			DisableTicking();
		}
	}
	return;
}

state() NormalTrigger
{	stop;
}

state() OtherTriggerToggles
{
	function Trigger(Actor Other, Pawn EventInstigator)
	{
		// End:0x12
		if(bInitiallyActive)
		{
			DisableSelf();			
		}
		else
		{
			EnableSelf();
		}
		return;
	}
	stop;
}

state() OtherTriggerTurnsOn
{
	function Trigger(Actor Other, Pawn EventInstigator)
	{
		EnableSelf();
		return;
	}
	stop;
}

state() OtherTriggerTurnsOff
{
	function Trigger(Actor Other, Pawn EventInstigator)
	{
		DisableSelf();
		return;
	}
	stop;
}

defaultproperties
{
	bInitiallyActive=true
	bTriggerWhenCrouched=true
	bSpecialLook=true
	bNoNativeTick=false
	bCollideActors=true
	InitialState=NormalTrigger
	Texture=Texture'S_Trigger'
}