struct STankTreadInfo
{
	var() noexport SWheelInfo WheelInfo[4] "Offset from origin of vehicle to place virtual wheel. 0 - front, 1 - mid, 2 - back.";
	var() noexport SVehiclePhysicsWheelProperties WheelProps "Properties to apply to all the wheels.";
	var() noexport SVehiclePhysicsAxleProperties WheelAxleProps "Axle properties to apply to all the wheels.";
	var() noexport SVehiclePhysicsAxleProperties PrimaryAxleProps "Axle properties to apply to the primary axle for this tread.";
	var() noexport SVehiclePhysicsMotorProperties MotorProps "Properties to apply to the motor.";
	var() noexport SVehiclePhysicsAxleProperties MotorAxleProps "Axle properties to apply to all the wheels.";
	var() noexport SVehiclePhysicsGearboxProperties GearboxProps "Properties to apply to the gearbox.";
	var() noexport STankTreadMaterialProperties MaterialProps "Properties about the material for this tread.";
	var array<VehicleComponent> Components;
	var TexPanner TreadPanner;
};