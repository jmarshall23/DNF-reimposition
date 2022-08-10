struct SVehiclePart
{
	var() noexport bool bDamagePart "Whether to damage this part upon startup or not.";
	var() noexport bool bCanBlowOff "If true, part can be blown off the car when it explodes.";
	var() noexport bool bDestroyOnExplosion "If true, this part will be destroyed on explosion of the vehicle.";
	var() const editconst noexport name VehiclePartID "Identifier for this vehicle part.";
	var() noexport Vehicles_Deco_Bodies.EVehiclePartStyle VehiclePartStyle "How to use this vehicle part on the vehicle. Not all parts are designed to be detached.";
	var Vehicles_Deco_Parts VehiclePartActor;
};