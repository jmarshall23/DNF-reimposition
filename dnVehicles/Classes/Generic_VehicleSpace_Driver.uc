/*******************************************************************************
 * Generic_VehicleSpace_Driver generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Generic_VehicleSpace_Driver extends VehicleSpaceBase
	collapsecategories;

var() noexport name SteerGridName "AnimationController entry name for the steering animation grid for this vehicle.";

simulated function VehicleSpaceTick_FullyEntered(float DeltaTime)
{
	local Vehicle_MeqonWheeled WheeledVehicle;
	local float SteerAlpha, GridY;
	local name DriverAnimName;

	super.VehicleSpaceTick_FullyEntered(DeltaTime);
	WheeledVehicle = Vehicle_MeqonWheeled(Vehicle);
	// End:0x3B
	if(__NFUN_150__(__NFUN_339__(WheeledVehicle, none), __NFUN_341__(SteerGridName, 'None')))
	{
		return;
	}
	// End:0x9A
	if(__NFUN_148__(__NFUN_340__(User, none), __NFUN_340__(User.AnimationController, none)))
	{
		User.AnimationController.SetAnimGridState(SteerGridName, __NFUN_195__(-1, WheeledVehicle.SteerAlpha), VehicleSpace_GetSteerGridY());
	}
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super(dnControl).RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1281__(SteerGridName);
	return;
}

state AttachUserAnimSecondary
{
	simulated function BeginState()
	{
		// End:0x24
		if(__NFUN_145__(Vehicle.bIgnition))
		{
			ControlEvent(, 'IgnitionOff');			
		}
		else
		{
			ControlEvent(, 'IgnitionOn');
		}
		return;
	}
	stop;
}

state() HandsOnWheel
{	stop;
}

state() TurnIgnition
{
	simulated function BeginState()
	{
		Vehicle.TurnIgnitionOn();
		return;
	}
	stop;
}

defaultproperties
{
	States=/* Array type was not detected. */
}