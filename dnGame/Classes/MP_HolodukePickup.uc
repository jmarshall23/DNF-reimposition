/*******************************************************************************
 * MP_HolodukePickup generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MP_HolodukePickup extends MP_WeaponPickup
	collapsecategories;

var bool bOnlyOneHolodukeMode;
var int netIntialForceState;

replication
{
	// Pos:0x000
	reliable if(__NFUN_173__(int(Role), int(ROLE_Authority)))
		SetForceState;

	// Pos:0x00B
	reliable if(__NFUN_148__(bNetInitial, __NFUN_173__(int(Role), int(ROLE_Authority))))
		netIntialForceState;
}

simulated function NU_ForceState(int NewState)
{
	// End:0x38
	if(__NFUN_174__(NewState, dnRespawnMarker(RespawnMarkerActor).ForceState))
	{
		dnRespawnMarker(RespawnMarkerActor).SetForceState(NewState);
	}
	return;
}

function WakeUp()
{
	// End:0x1B
	if(__NFUN_145__(CanRespawn()))
	{
		__NFUN_607__(RespawnTime, false, 'WakeUp');
		return;
	}
	// End:0x4C
	if(__NFUN_174__(dnRespawnMarker(RespawnMarkerActor).ForceState, 0))
	{
		__NFUN_607__(RespawnTime, false, 'WakeUp');
		SetForceState(0);
		return;
	}
	super(Pickup).WakeUp();
	return;
}

noexport simulated delegate SetForceState(int S)
{
	netIntialForceState = S;
	// End:0x44
	if(__NFUN_148__(__NFUN_340__(RespawnMarkerActor, none), __NFUN_340__(dnRespawnMarker(RespawnMarkerActor), none)))
	{
		dnRespawnMarker(RespawnMarkerActor).SetForceState(S);
	}
	return;
}

function bool CanRespawn()
{
	local Pawn P;

	// End:0x0D
	if(__NFUN_145__(bOnlyOneHolodukeMode))
	{
		return true;
	}
	P = Level.PawnList;
	J0x22:

	// End:0xA7 [Loop If]
	if(__NFUN_340__(P, none))
	{
		// End:0x8F
		if(__NFUN_340__(DukeMultiPlayer(P), none))
		{
			// End:0x8F
			if(__NFUN_150__(__NFUN_150__(__NFUN_340__(P.__NFUN_918__('MP_Holoduke'), none), __NFUN_340__(DukeMultiPlayer(P).ActiveHoloActor, none)), __NFUN_340__(P.ActiveHoloDuke, none)))
			{
				return false;
			}
		}
		P = P.NextPawn;
		// [Loop Continue]
		goto J0x22;
	}
	return true;
	return;
}

state Sleeping
{
	function BeginState()
	{
		super.BeginState();
		// End:0x56
		if(__NFUN_148__(__NFUN_148__(__NFUN_340__(RespawnMarkerActor, none), __NFUN_340__(dnRespawnMarker(RespawnMarkerActor), none)), Level.Game.bRespawnMarkers))
		{
			// End:0x56
			if(__NFUN_145__(CanRespawn()))
			{
				SetForceState(1);
			}
		}
		return;
	}
	stop;
}

defaultproperties
{
	bOnlyOneHolodukeMode=true
	ItemName="<?int?dnGame.MP_HolodukePickup.ItemName?>"
	InventoryType='MP_Holoduke'
	RespawnTime=10
	bAcceptsDecalProjectors=false
	CollisionHeight=10
	StaticMesh='sm_class_dukeitems.HoloDukeDisc.HoloDukeDisc'
}