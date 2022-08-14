/*******************************************************************************
 * dnCaptureTheBabe_Player generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnCaptureTheBabe_Player extends DukeMultiplayerAssets
	config(User)
	collapsecategories
	dependson(dnCaptureTheBabe_Hand)
	dependson(PlayerProgression)
	dependson(MetagameHUD);

var netupdate(NU_SetClientCarryingBabe) bool bCarryingBabe;
var netupdate(NU_SetClientButtSlap) bool bButtSlap;
var netupdate(NU_SetClientTouchedEnemyBabe2) Pawn carriedbabe;
var netupdate(NU_SetClientCarrierShrinking) bool carrierShrinking;
var bool MarkedForSquish;
var class<Weapon> SavedWeapon;
var int SavedAmmo;
var Pawn LastInstigator;
var bool bCanSlap;
var dnCaptureTheBabe_Hand hand;
var Pawn handPawn;
var bool bReloading;
var array<name> ButtSlapSound;
var float CollisionModifierWithBabe;
var float BusyTime;
var float MinBusyTime;

replication
{
	// Pos:0x000
	reliable if(__NFUN_169__(int(Role), int(ROLE_Authority)))
		SetButtSlap, SetCarrierShrinking, 
		SetCarryingBabe, SetTouchedEnemyBabe2;

	// Pos:0x00B
	reliable if(__NFUN_173__(int(Role), int(ROLE_Authority)))
		StartSlapping;

	// Pos:0x016
	reliable if(__NFUN_173__(int(Role), int(ROLE_Authority)))
		CheckRevolverReload, SavedAmmo, 
		SavedWeapon, bButtSlap, 
		bCarryingBabe, carriedbabe, 
		carrierShrinking;

	// Pos:0x021
	reliable if(__NFUN_173__(int(Role), int(ROLE_Authority)))
		ClientDropBabeBecauseAlone, clientPrepRevolverForRemoval;
}

simulated delegate clientPrepRevolverForRemoval(Weapon Weap)
{
	Weap.bDeactivationAllowed = true;
	return;
}

simulated function ChangeToWeapon(Weapon NewWeapon)
{
	// End:0x34
	if(__NFUN_148__(__NFUN_148__(__NFUN_340__(CarriedActor, none), __NFUN_340__(dnCaptureTheBabe_Babe(CarriedActor), none)), __NFUN_339__(dnCaptureTheBabe_BabeRevolver(NewWeapon), none)))
	{
		return;
	}
	// End:0x91
	if(__NFUN_148__(bOnSteroids, __NFUN_148__(__NFUN_340__(NewWeapon.Class, class'MP_MightyFoot'), __NFUN_340__(NewWeapon.Class, class'dnCaptureTheBabe_BabeRevolver'))))
	{
		// End:0x91
		if(__NFUN_340__(NewWeapon.Class, class'MP_Holoduke'))
		{
			return;
		}
	}
	super(DukeMultiPlayer).ChangeToWeapon(NewWeapon);
	return;
}

simulated function DoButtSlap()
{
	return;
}

simulated function GiveBabeRevolver2()
{
	// End:0x35
	if(IsLocallyControlled())
	{
		UseWeapon("dnGame.dnCaptureTheBabe_BabeRevolver");
	}
	return;
}

simulated function NotifyReloading()
{
	bReloading = true;
	super(DukePlayer).NotifyReloading();
	return;
}

simulated function NotifyReloadingEnd()
{
	bReloading = false;
	super(DukePlayer).NotifyReloadingEnd();
	return;
}

exec function UseWeapon(string WeaponString)
{
	// End:0x10E
	if(__NFUN_150__(__NFUN_150__(__NFUN_150__(__NFUN_308__(WeaponString, "dnGame.PipeBomb"), __NFUN_308__(WeaponString, "dnGame.TripMine")), __NFUN_308__(WeaponString, "dnGame.FortyOunceBeer")), __NFUN_308__(WeaponString, "dnGame.Steroids")))
	{
		// End:0xED
		if(__NFUN_150__(__NFUN_308__(WeaponString, "dnGame.TripMine"), __NFUN_308__(WeaponString, "dnGame.PipeBomb")))
		{
			// End:0xD8
			if(__NFUN_201__(__NFUN_198__(BusyTime, MinBusyTime), Level.TimeSeconds))
			{
				return;
			}
			BusyTime = Level.TimeSeconds;
		}
		// End:0x10E
		if(__NFUN_148__(__NFUN_340__(CarriedActor, none), __NFUN_340__(dnCaptureTheBabe_Babe(CarriedActor), none)))
		{
			return;
		}
	}
	// End:0x161
	if(__NFUN_308__(WeaponString, "dnGame.Steroids"))
	{
		// End:0x14C
		if(__NFUN_201__(__NFUN_198__(BusyTime, MinBusyTime), Level.TimeSeconds))
		{
			return;
		}
		BusyTime = Level.TimeSeconds;
	}
	super(DukeMultiPlayer).UseWeapon(WeaponString);
	return;
}

exec function UseDown()
{
	// End:0x22
	if(__NFUN_201__(__NFUN_198__(BusyTime, MinBusyTime), Level.TimeSeconds))
	{
		return;
	}
	BusyTime = Level.TimeSeconds;
	super(PlayerPawn).UseDown();
	return;
}

simulated function GivePreviousWeapon()
{
	// End:0x21
	if(IsLocallyControlled())
	{
		Weapon.bDeactivationAllowed = true;
		SwapWeaponsDown();
	}
	return;
}

exec function DoHoloDuke()
{
	// End:0x2A
	if(__NFUN_148__(__NFUN_340__(CarriedActor, none), __NFUN_339__(CarriedActor.Class, class'dnCaptureTheBabe_Babe')))
	{
		return;
	}
	super(DukeMultiPlayer).DoHoloDuke();
	return;
}

simulated function bool DropCarriedActor(optional float Force, optional bool bForceDrop, optional bool bDropBehind, optional bool bNoSound, optional bool bSkipPositioning, optional float HeldTime)
{
	DropCarriedActor3(dnCaptureTheBabe_Babe(CarriedActor), Force, bForceDrop, bDropBehind, bNoSound, bSkipPositioning, HeldTime);
	return;
}

simulated function bool DropCarriedActor3(dnCaptureTheBabe_Babe babe, optional float Force, optional bool bForceDrop, optional bool bDropBehind, optional bool bNoSound, optional bool bSkipPositioning, optional float HeldTime)
{
	// End:0x25
	if(__NFUN_340__(hand, none))
	{
		hand.SetHandHidden(true);
		bGrabUsable = false;
	}
	// End:0x42
	if(__NFUN_340__(babe, none))
	{
		babe.SetHideFakeHand(true);
	}
	// End:0x78
	if(__NFUN_148__(__NFUN_148__(__NFUN_340__(babe, none), __NFUN_146__(babe.DoNotDropMe, true)), __NFUN_145__(IsDead())))
	{
		return false;		
	}
	else
	{
		// End:0xC8
		if(__NFUN_148__(__NFUN_340__(babe, none), __NFUN_146__(babe.DropShouldDestroyWeapon, false)))
		{
			return DropCarriedActor(Force, bForceDrop, bDropBehind, bNoSound, bSkipPositioning, HeldTime);			
		}
		else
		{
			return DropCarriedActor(Force, bForceDrop, bDropBehind, bNoSound, bSkipPositioning, HeldTime);
		}
	}
	return;
}

exec function NextWeapon()
{
	// End:0x2A
	if(__NFUN_148__(__NFUN_340__(CarriedActor, none), __NFUN_339__(CarriedActor.Class, class'dnCaptureTheBabe_Babe')))
	{
		return;
	}
	super(DukeMultiPlayer).NextWeapon();
	return;
}

function ServerUse()
{
	super(DukeMultiPlayer).ServerUse();
	return;
}

event Actor UpdateLookHitActor(optional Actor NonTraceBaseActor)
{
	local Pawn P;
	local dnCaptureTheBabe_Babe babe;

	babe = dnCaptureTheBabe_Babe(NonTraceBaseActor);
	// End:0x3E
	if(__NFUN_148__(__NFUN_340__(babe, none), babe.IsPlayerWithinUseRange(self)))
	{
		return super(DukeMultiPlayer).UpdateLookHitActor(babe);
	}
	babe = dnCaptureTheBabe_Babe(LookHitActor);
	// End:0x7C
	if(__NFUN_148__(__NFUN_340__(babe, none), babe.IsPlayerWithinUseRange(self)))
	{
		return super(DukeMultiPlayer).UpdateLookHitActor(babe);
	}
	P = Level.PawnList;
	J0x91:

	// End:0xF3 [Loop If]
	if(__NFUN_340__(P, none))
	{
		babe = dnCaptureTheBabe_Babe(P);
		// End:0xDB
		if(__NFUN_148__(__NFUN_340__(babe, none), babe.IsPlayerWithinUseRange(self)))
		{
			return super(DukeMultiPlayer).UpdateLookHitActor(babe);
		}
		P = P.NextPawn;
		// [Loop Continue]
		goto J0x91;
	}
	return super(DukeMultiPlayer).UpdateLookHitActor(NonTraceBaseActor);
	return;
}

function ReturnedBabe()
{
	PlayerProgress.Stat_ReturnedBabe();
	return;
}

simulated function CheckRevolverReload()
{
	// End:0x1E
	if(Level.__NFUN_1161__().__NFUN_994__())
	{
		Reload();
	}
	return;
}

function ServerUseDown()
{
	local bool bCigarCandidate;

	// End:0xD8
	if(__NFUN_148__(__NFUN_340__(CarriedActor, none), __NFUN_339__(CarriedActor.Class, class'dnCaptureTheBabe_Babe')))
	{
		// End:0xD2
		if(__NFUN_148__(__NFUN_148__(__NFUN_148__(__NFUN_148__(__NFUN_148__(__NFUN_148__(__NFUN_145__(bButtSlap), __NFUN_342__(Weapon.__NFUN_399__(), 'Reloading')), __NFUN_342__(Weapon.__NFUN_399__(), 'Firing')), __NFUN_342__(Weapon.__NFUN_399__(), 'Activating')), bCanSlap), dnCaptureTheBabe_Babe(CarriedActor).bGrabUsable), __NFUN_148__(__NFUN_174__(int(FrozenState), int(1)), __NFUN_174__(int(FrozenState), int(2)))))
		{
			SetButtSlap(true);
			return;			
		}
		else
		{
			CheckRevolverReload();
		}
	}
	// End:0xEC
	if(__NFUN_339__(CigarAttachment, none))
	{
		bCigarCandidate = true;
	}
	super(DukeMultiPlayer).ServerUseDown();
	// End:0x117
	if(bCigarCandidate)
	{
		// End:0x117
		if(__NFUN_340__(CigarAttachment, none))
		{
			PlayerProgress.Stat_UseCigar();
		}
	}
	return;
}

exec function SwapWeaponsDown()
{
	// End:0x2A
	if(__NFUN_148__(__NFUN_340__(CarriedActor, none), __NFUN_339__(CarriedActor.Class, class'dnCaptureTheBabe_Babe')))
	{
		return;
	}
	super(DukeMultiPlayer).SwapWeaponsDown();
	return;
}

exec function SelectNextWeapon()
{
	SwapWeaponsDown();
	return;
}

exec function SelectPrevWeapon()
{
	SwapWeaponsDown();
	return;
}

simulated function bool CanBeExecutedBy(Pawn TestPawn)
{
	// End:0x1A
	if(dnCaptureTheBabe_Player(TestPawn).IsCarryingBabe())
	{
		return false;
	}
	return super(DukeMultiPlayer).CanBeExecutedBy(TestPawn);
	return;
}

exec function UsePrimaryWeapon1()
{
	// End:0x0B
	if(IsCarryingBabe())
	{
		return;
	}
	super(DukeMultiPlayer).UsePrimaryWeapon1();
	return;
}

simulated function bool IsCarryingBabe()
{
	// End:0x2A
	if(__NFUN_148__(__NFUN_340__(CarriedActor, none), __NFUN_339__(CarriedActor.Class, class'dnCaptureTheBabe_Babe')))
	{
		return true;
	}
	return false;
	return;
}

simulated event bool CanDuck()
{
	// End:0x13
	if(IsCarryingBabe())
	{
		bCrouchOn = false;
		return false;
	}
	return super(PlayerPawn).CanDuck();
	return;
}

exec function UsePrimaryWeapon2()
{
	// End:0x0B
	if(IsCarryingBabe())
	{
		return;
	}
	super(DukeMultiPlayer).UsePrimaryWeapon2();
	return;
}

event bool CanPickupWeapon()
{
	local bool ret;

	ret = super(DukeMultiPlayer).CanPickupWeapon();
	// End:0x1E
	if(IsCarryingBabe())
	{
		ret = false;
	}
	return ret;
	return;
}

function bool PawnAllowPickup(class<Inventory> InvClass)
{
	// End:0x3F
	if(__NFUN_145__(InvClass.default.bStoredInInventory))
	{
		// End:0x3F
		if(__NFUN_148__(__NFUN_340__(CarriedActor, none), __NFUN_339__(CarriedActor.Class, class'dnCaptureTheBabe_Babe')))
		{
			return false;
		}
	}
	return super(DukeMultiPlayer).PawnAllowPickup(InvClass);
	return;
}

function StartSizeChange(bool bInstantChange, optional bool bShrunkByPod)
{
	// End:0x71
	if(__NFUN_148__(__NFUN_340__(CarriedActor, none), __NFUN_339__(CarriedActor.Class, class'dnCaptureTheBabe_Babe')))
	{
		// End:0x38
		if(bShrunkByPod)
		{
			LastInstigator = none;
		}
		PlayerProgress.Stat_ShrunkWithBabe();
		MarkedForSquish = true;
		dnCaptureTheBabe_Babe(CarriedActor).DoNotDropMe = false;
		SetCarrierShrinking(true);		
	}
	else
	{
		MarkedForSquish = false;
	}
	super(PlayerPawn).StartSizeChange(bInstantChange, bShrunkByPod);
	return;
}

function SetCarryingBabe(bool boCarrying)
{
	bCarryingBabe = boCarrying;
	NU_SetClientCarryingBabe(boCarrying);
	return;
}

function SetButtSlap(bool boButtSlapping)
{
	// End:0x0B
	if(bReloading)
	{
		return;
	}
	// End:0x32
	if(__NFUN_173__(int(Role), int(ROLE_Authority)))
	{
		bButtSlap = boButtSlapping;
		NU_SetClientButtSlap(boButtSlapping);
	}
	return;
}

function SetTouchedEnemyBabe2(Pawn babe)
{
	carriedbabe = babe;
	NU_SetClientTouchedEnemyBabe2(babe);
	return;
}

simulated event Destroyed()
{
	// End:0x77
	if(__NFUN_148__(__NFUN_340__(CarriedActor, none), CarriedActor.__NFUN_358__('dnCaptureTheBabe_Babe')))
	{
		bCarryingBabe = false;
		dnCaptureTheBabe_Babe(CarriedActor).SetHideFakeHand(true);
		dnCaptureTheBabe_Babe(CarriedActor).bCarrierWasDestroyed = true;
		dnCaptureTheBabe_Babe(CarriedActor).DoNotDropMe = false;
		DropCarriedActor(, true);
	}
	super(DukeMultiPlayer).Destroyed();
	return;
}

simulated function DiedActivity(optional Pawn Killer, optional int Damage, optional Vector DamageOrigin, optional Vector DamageDirection, optional class<DamageType> DamageType, optional name HitBoneName)
{
	// End:0x41
	if(__NFUN_340__(CarriedActor, none))
	{
		dnCaptureTheBabe_Babe(CarriedActor).DoNotDropMe = false;
		bCarryingBabe = false;
		dnCaptureTheBabe_Babe(CarriedActor).SetHideFakeHand(true);
	}
	super(DukeMultiPlayer).DiedActivity(Killer, Damage, DamageOrigin, DamageDirection, DamageType, HitBoneName);
	// End:0x81
	if(__NFUN_201__(CollisionModifierWithBabe, 0))
	{
		__NFUN_620__(default.CollisionRadius, default.CollisionHeight);
	}
	MarkedForSquish = false;
	bReloading = false;
	return;
}

function BecameAlone()
{
	local dnCaptureTheBabe_Babe babe;

	super(DukeMultiPlayer).BecameAlone();
	// End:0x61
	if(__NFUN_148__(__NFUN_340__(CarriedActor, none), CarriedActor.__NFUN_358__('dnCaptureTheBabe_Babe')))
	{
		babe = dnCaptureTheBabe_Babe(CarriedActor);
		babe.bForceDropBecauseAlone = true;
		ClientDropBabeBecauseAlone();
		babe.SetUnGrabbedByEnemy2();
	}
	return;
}

simulated delegate ClientDropBabeBecauseAlone()
{
	local dnCaptureTheBabe_Babe babe;

	babe = dnCaptureTheBabe_Babe(CarriedActor);
	// End:0x2E
	if(__NFUN_340__(babe, none))
	{
		babe.bForceDropBecauseAlone = true;
	}
	return;
}

simulated function NU_SetClientButtSlap(bool boButtSlap)
{
	// End:0x42
	if(boButtSlap)
	{
		dnCaptureTheBabe_Babe(CarriedActor).__NFUN_607__(0.3, false, 'buttSlapped');
		StartSlapping();
		dnCaptureTheBabe_Babe(CarriedActor).SetHideFakeHand(true);
	}
	return;
}

simulated function NU_SetClientGiveBabeRevolver(bool boGiveBabeRevolver)
{
	// End:0x14
	if(boGiveBabeRevolver)
	{
		SetAnimControllerState('BabeGunIdle');
	}
	return;
}

simulated function NU_SetClientTouchedEnemyBabe2(Pawn babe)
{
	local name WeaponName, IdleAnim;

	// End:0x8D
	if(__NFUN_340__(babe, none))
	{
		// End:0x37
		if(MeshInstance.__NFUN_544__(0, 'UpperBody'))
		{
			AnimationController.EmptyAnimChannels_ByBlock('UpperBodyBlock');
		}
		bDisplayThrowDropMessage = false;
		bGrabbing = true;
		bCarryingBabe = true;
		dnCaptureTheBabe_Babe(babe).DoNotDropMe = true;
		SetAnimControllerState('BabeGunIdle');
		bGrabbing = false;
		GiveBabeRevolver2();
		SetAnimControllerState('BabeGunIdle');		
	}
	else
	{
		AnimEnd_ButtSlap();
		bDisplayThrowDropMessage = false;
		bGrabbing = false;
		bCarryingBabe = false;
	}
	return;
}

simulated function AnimStart_ButtSlap()
{
	__NFUN_605__(1, false, 'EnsureButtslapEnds');
	return;
}

simulated function EnsureButtslapEnds()
{
	local dnCaptureTheBabe_Babe babe;

	babe = dnCaptureTheBabe_Babe(CarriedActor);
	// End:0x2D
	if(__NFUN_148__(__NFUN_340__(babe, none), bButtSlap))
	{
		AnimEnd_ButtSlap();
	}
	return;
}

simulated function AnimEnd_ButtSlap()
{
	// End:0x10
	if(bButtSlap)
	{
		SetButtSlap(false);
	}
	AnimationController.EmptyAnimChannels_ByBlock('UpperBodyBlock');
	return;
}

noexport simulated delegate StartSlapping()
{
	local Rotator DesiredView;
	local int R;

	AnimationController.EmptyAnimChannels_ByBlock('UpperBodyBlock');
	TickSlapp();
	R = __NFUN_187__(string(ButtSlapSound));
	FindAndPlaySound(ButtSlapSound[R], 1);
	MaybeFadeInChannelBlock('UpperBodyBlock', WeaponBlendInTime);
	return;
}

simulated function TickSlapp()
{
	local int ViewPitch;
	local float GridY, AnimFrame;
	local name AnimName;

	// End:0x6F
	if(bButtSlap)
	{
		AnimFrame = 0;
		// End:0x48
		if(MeshInstance.__NFUN_544__(0, 'UpperBodyBlock'))
		{
			AnimFrame = MeshInstance.__NFUN_552__(0, 'UpperBodyBlock').FrameScale;
		}
		// End:0x6F
		if(__NFUN_201__(AnimFrame, 0))
		{
			MeshInstance.__NFUN_550__(0, AnimFrame, 'UpperBodyBlock');
		}
	}
	return;
}

simulated event UpdateAdditionalAnimationState()
{
	local float GridY, AnimFrame;
	local name AnimName;
	local class<InteractiveActor> HeldItemClass;
	local InteractiveActor HeldItem;

	// End:0x21
	if(__NFUN_150__(__NFUN_145__(bCarryingBabe), __NFUN_145__(bButtSlap)))
	{
		super(PlayerPawn).UpdateAdditionalAnimationState();		
	}
	else
	{
		// End:0x46
		if(__NFUN_148__(bGrabbing, __NFUN_339__(HandFocusActor, none)))
		{
			bGrabbing = false;
			LostCarriedActor();
		}
		// End:0x75
		if(__NFUN_340__(CarriedActor, none))
		{
			HeldItemClass = CarriedActor.Class;
			HeldItem = CarriedActor;			
		}
		else
		{
			HeldItemClass = class'Weapon';
			HeldItem = Weapon;
		}
		// End:0xC3
		if(__NFUN_148__(__NFUN_148__(bAttachedToUsableSomething, __NFUN_339__(HeldItem, none)), bWeaponsActive))
		{
			HeldItemClass = class'Weapon';
			HeldItem = PreviousWeapon;
		}
		GetLookAnimGrid(HeldItemClass, HeldItem, __NFUN_175__(__NFUN_165__(ViewRotation.Pitch, 65536), 65535), AnimName, GridY);
		// End:0x10A
		if(bButtSlap)
		{
			AnimName = 'ButtSlap';			
		}
		HeldItemClass = CarriedActor.Class;
		// End:0x16D
		if(__NFUN_148__(__NFUN_148__(__NFUN_339__(HandFocusActor, self), __NFUN_339__(HandFocusActor.Class, self.Class)), __NFUN_342__(LastQuickAction, 'None')))
		{
			AnimName = LastQuickAction;			
		}
		else
		{
			// End:0x18F
			if(__NFUN_148__(bGrabbing, __NFUN_340__(HandFocusActor, none)))
			{
				AnimName = 'HandGrab';
			}
		}
		// End:0x261
		if(__NFUN_148__(__NFUN_342__(AnimName, 'None'), __NFUN_174__(AnimationController.__NFUN_1307__(AnimName), -1)))
		{
			// End:0x261
			if(__NFUN_150__(__NFUN_342__(LastUpperBodyState, AnimName), __NFUN_174__(int(LastUpperBodyPostureState), int(PostureStateEx))))
			{
				// End:0x226
				if(__NFUN_148__(__NFUN_341__(LastUpperBodyState, AnimName), MeshInstance.__NFUN_544__(0, 'UpperBody')))
				{
					AnimFrame = MeshInstance.__NFUN_552__(0, 'UpperBody').FrameScale;
				}
				AnimationController.SetAnimState(AnimName);
				// End:0x261
				if(__NFUN_201__(AnimFrame, 0))
				{
					AnimationController.__NFUN_1320__('UpperBody', AnimFrame);
				}
			}
		}
		AnimationController.SetChannelGridState('UpperBody', 0, GridY);
		// End:0x2BE
		if(__NFUN_148__(__NFUN_148__(__NFUN_342__(CarriedActorMountPose, 'None'), IsMP()), __NFUN_145__(IsLocallyControlled())))
		{
			SetAnimControllerState(CarriedActorMountPose);
			CarriedActorMountPose = 'None';
		}
		LastUpperBodyState = AnimName;
		LastUpperBodyPostureState = PostureStateEx;
		// End:0x2E8
		if(__NFUN_173__(int(LowerBodyOverrideState), int(3)))
		{
			TickKick();
		}
		// End:0x2F1
		if(bButtSlap)
		{
		}
	}
	return;
}

simulated function NU_SetClientCarryingBabe(bool boCarryingBabe)
{
	bDisplayThrowDropMessage = false;
	bGrabbing = true;
	return;
}

function OnFinishShrink()
{
	super(DukeMultiPlayer).OnFinishShrink();
	SetCarrierShrinking(false);
	return;
}

function OnStartShrink(optional bool bShrunkByPod)
{
	SetCarrierShrinking(true);
	super(DukeMultiPlayer).OnStartShrink(bShrunkByPod);
	return;
}

simulated function UpdateShrinkScale(float ShrinkSizeScale)
{
	local Vector vNormal;

	// End:0x9E
	if(__NFUN_172__(int(Role), int(ROLE_Authority)))
	{
		// End:0x9E
		if(__NFUN_148__(__NFUN_200__(ShrinkSizeScale, 1), MarkedForSquish))
		{
			vNormal.X = 1;
			vNormal.Y = 0.5;
			vNormal.Z = -1;
			TakeDamage(LastInstigator, 5000, Location, __NFUN_253__(vNormal), class'CrushingDamage');
			PlayerProgress.Stat_KilledBabeCarrier(self, LastInstigator);
			LastInstigator = none;
			MarkedForSquish = false;
		}
	}
	super(DukeMultiPlayer).UpdateShrinkScale(ShrinkSizeScale);
	return;
}

event TakeDamage(Pawn Instigator, float Damage, Vector DamageOrigin, Vector DamageDirection, class<DamageType> DamageType, optional name HitBoneName, optional Vector DamageStart)
{
	// End:0x1E
	if(__NFUN_339__(DamageType, class'ShrinkerDamage'))
	{
		LastInstigator = Instigator;		
	}
	else
	{
		// End:0x35
		if(__NFUN_340__(DamageType, class'CrushingDamage'))
		{
			LastInstigator = self;
		}
	}
	super(DukeMultiPlayer).TakeDamage(Instigator, Damage, DamageOrigin, DamageDirection, DamageType, HitBoneName, DamageStart);
	return;
}

function SetCarrierShrinking(bool bShrinking)
{
	carrierShrinking = bShrinking;
	NU_SetClientCarrierShrinking(bShrinking);
	return;
}

simulated function NU_SetClientCarrierShrinking(bool bShrinking)
{
	// End:0x09
	if(bShrinking)
	{
	}
	return;
}

simulated function AnimEnd_ActivateBabeGun()
{
	Weapon.bDeactivationAllowed = false;
	bCanSlap = true;
	return;
}

exec function DebugBabes()
{
	// End:0x3E
	if(__NFUN_340__(MetagameHUD(MyHUD), none))
	{
		MetagameHUD(MyHUD).bDebugBabes = __NFUN_145__(MetagameHUD(MyHUD).bDebugBabes);
	}
	return;
}

exec function DebugFakeHand()
{
	// End:0x3E
	if(__NFUN_340__(MetagameHUD(MyHUD), none))
	{
		MetagameHUD(MyHUD).bDebugFakeHand = __NFUN_145__(MetagameHUD(MyHUD).bDebugFakeHand);
	}
	return;
}

function MaybePlayKillVO()
{
	// End:0x89
	if(__NFUN_169__(PlayerProgress.MultiKillCount, 2))
	{
		// End:0x72
		if(__NFUN_148__(__NFUN_340__(LastKiller.CarriedActor, none), LastKiller.CarriedActor.__NFUN_358__('dnCaptureTheBabe_Babe')))
		{
			dnCaptureTheBabe_Babe(LastKiller.CarriedActor).PlayBabeVO(3, true);			
		}
		else
		{
			LastKiller.MaybeTriggerEventVO(0, StandardVOChance);
		}
	}
	return;
}

function MaybePlayGibbedVO()
{
	// End:0x89
	if(__NFUN_169__(PlayerProgress.MultiKillCount, 2))
	{
		// End:0x72
		if(__NFUN_148__(__NFUN_340__(LastKiller.CarriedActor, none), LastKiller.CarriedActor.__NFUN_358__('dnCaptureTheBabe_Babe')))
		{
			dnCaptureTheBabe_Babe(LastKiller.CarriedActor).PlayBabeVO(3, true);			
		}
		else
		{
			LastKiller.MaybeTriggerEventVO(2, StandardVOChance);
		}
	}
	return;
}

simulated function Restart()
{
	// End:0x1C
	if(__NFUN_201__(CollisionModifierWithBabe, 0))
	{
		__NFUN_620__(default.CollisionRadius, default.CollisionHeight);
	}
	super(DukeMultiPlayer).Restart();
	// End:0x3A
	if(__NFUN_340__(dnCaptureTheBabe_Babe(LookHitActor), none))
	{
		LookHitActor = none;
	}
	return;
}

function ClientRestart_Normal(optional bool bForceShrunk)
{
	local SMountPrefab MountInfo;

	// End:0x25
	if(__NFUN_148__(__NFUN_339__(hand, none), IsLocallyControlled()))
	{
		hand = __NFUN_615__(class'dnCaptureTheBabe_Hand');
	}
	super(DukeMultiPlayer).ClientRestart_Normal(bForceShrunk);
	// End:0xFA
	if(__NFUN_340__(hand, none))
	{
		MountInfo.MountType = 2;
		MountInfo.MountOrigin.X = 2.25;
		MountInfo.MountOrigin.Y = 4;
		MountInfo.MountOrigin.Z = -39.2;
		MountInfo.MountAngles.Pitch = 0;
		MountInfo.MountAngles.Yaw = 0;
		MountInfo.MountAngles.Roll = 32768;
		MountInfo.MountMeshItem = 'mount_camera';
		hand.__NFUN_633__(MountInfo, self);
		hand.SetHandHidden(true);
		bGrabUsable = false;
	}
	// End:0x112
	if(__NFUN_340__(dnCaptureTheBabe_Babe(LookHitActor), none))
	{
		LookHitActor = none;
	}
	return;
}

function ClientBecomeDead(float inRespawnCountdown)
{
	super(PlayerPawn).ClientBecomeDead(inRespawnCountdown);
	// End:0x30
	if(__NFUN_340__(hand, none))
	{
		hand.SetHandHidden(true);
		bGrabUsable = false;
	}
	return;
}

simulated function bool CanPressUse()
{
	// End:0x16
	if(__NFUN_150__(IsCountdown(), IsEndOfRound()))
	{
		return false;
	}
	return super(PlayerPawn).CanPressUse();
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	local int i;

	super.RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1279__(class'CrushingDamage');
	PrecacheIndex.__NFUN_1266__(class'dnCaptureTheBabe_Hand');
	i = __NFUN_166__(string(ButtSlapSound), 1);
	J0x3E:

	// End:0x70 [Loop If]
	if(__NFUN_172__(i, 0))
	{
		PrecacheIndex.__NFUN_1277__(VoicePack, ButtSlapSound[i]);
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0x3E;
	}
	return;
}

defaultproperties
{
	bCanSlap=true
	ButtSlapSound(0)=ST_Getup_Pat_01
	ButtSlapSound(1)=ST_Getup_Pat_02
	ButtSlapSound(2)=ST_Getup_Pat_03
	ButtSlapSound(3)=ST_Getup_Pat_03_Ex
	CollisionModifierWithBabe=-1
	MinBusyTime=0.2
	bIsCaptureTheBabePlayer=true
	MountType=2
}