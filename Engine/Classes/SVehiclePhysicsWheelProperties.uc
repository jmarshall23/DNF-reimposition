struct SVehiclePhysicsWheelProperties
{
	var() float SteerRatio;
	var() float BrakeRatio;
	var() float HandbrakeRatio;
	var() float FrictionStatic;
	var() float FrictionDynamic;
	var() float FrictionRolling;
	var() float StiffnessLateral;
	var() float StiffnessLongitudinal;
	var() float Restitution;
	var() float SuspensionSpringLength;
	var() float SuspensionSpringDamping;
	var() float SuspensionSpringStiffness;
	var() float Radius;
	var() float Mass;
	var() class<Actor> WheelClass;
};