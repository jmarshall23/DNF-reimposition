/*******************************************************************************
 * dnControl_SplitDoor generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnControl_SplitDoor extends dnControl_TapPowered_DoorBase
	collapsecategories;

var() noexport deprecated InteractiveActor LeftDoor "The left door, left relative to the direction of this dnControl.";
var() noexport deprecated InteractiveActor RightDoor "The right door... the door that is not the left door.";

function TakeControl(bool bFlipDoors)
{
	// End:0x44
	if(bFlipDoors)
	{
		// End:0x25
		if(__NFUN_340__(LeftDoor, none))
		{
			TakeConrolOfDoor(LeftDoor, 'bone_right');
		}
		// End:0x41
		if(__NFUN_340__(RightDoor, none))
		{
			TakeConrolOfDoor(RightDoor, 'bone_left');
		}		
	}
	else
	{
		// End:0x60
		if(__NFUN_340__(LeftDoor, none))
		{
			TakeConrolOfDoor(LeftDoor, 'bone_left');
		}
		// End:0x7C
		if(__NFUN_340__(RightDoor, none))
		{
			TakeConrolOfDoor(RightDoor, 'bone_right');
		}
	}
	return;
}

function ReleaseControl()
{
	// End:0x17
	if(__NFUN_340__(LeftDoor, none))
	{
		ReleaseControlOfDoor(LeftDoor);
	}
	// End:0x2E
	if(__NFUN_340__(RightDoor, none))
	{
		ReleaseControlOfDoor(RightDoor);
	}
	return;
}

k2call function Attach_Sound(optional EventInfo AnimEventInfo)
{
	FindAndPlaySound('SplitDoor_Activate', 1);
	return;
}

k2call function Open_Sound(optional EventInfo AnimEventInfo)
{
	FindAndPlaySound('SplitDoor_FinishOpenDoors', 1);
	return;
}

function DoorPortalsOn()
{
	// End:0x1D
	if(__NFUN_340__(RightDoor, none))
	{
		UpdateDoorPortal(DoorMoverEx(RightDoor), true);
	}
	// End:0x3A
	if(__NFUN_340__(LeftDoor, none))
	{
		UpdateDoorPortal(DoorMoverEx(LeftDoor), true);
	}
	return;
}

function DoorPortalsOff()
{
	// End:0x1D
	if(__NFUN_340__(RightDoor, none))
	{
		UpdateDoorPortal(DoorMoverEx(RightDoor), false);
	}
	// End:0x3A
	if(__NFUN_340__(LeftDoor, none))
	{
		UpdateDoorPortal(DoorMoverEx(LeftDoor), false);
	}
	return;
}

function UpdateAnimGrids()
{
	local Vector2D GridPt;

	User.AnimationController.SetAnimGridState(UserGridAnim, UserLiftVal);
	__NFUN_703__(MyGridAnim);
	// End:0x59
	if(__NFUN_340__(__NFUN_568__(), none))
	{
		GridPt.X = UserLiftVal;
		MeshInstance.__NFUN_548__(0, GridPt);
	}
	return;
}

simulated event AnimEndEx(SAnimEndInfo AnimEndInfo)
{
	super(dnDecoration).AnimEndEx(AnimEndInfo);
	// End:0x3D
	if(__NFUN_150__(__NFUN_341__(AnimEndInfo.AnimName, 'scr_duke_opendoor_deactivate'), __NFUN_341__(AnimEndInfo.AnimName, 'scr_duke_opendoor_opendoors')))
	{
		DoorPortalsOff();
	}
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super.RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1277__(VoicePack, 'SplitDoor_Activate');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'SplitDoor_FinishOpenDoors');
	return;
}

defaultproperties
{
	bStartInControl=true
	UserGridAnim=SplitDoor_OpenGrid
	MyGridAnim=scr_duke_opendoor_idle_grid3d
	PryLoopSoundName=SplitDoor_PryLoop
	RateOfGain=0.2
	UserGruntSoundName=Gen_Grunt
}