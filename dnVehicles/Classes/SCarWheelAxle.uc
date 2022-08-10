struct SCarWheelAxle
{
	var() class<VDifferential> DifferentialClass;
	var() noexport class<VWheel> WheelClass "What class should the wheels attached this axle be?";
	var() name AxleBaseTag;
	var() noexport float AxleWidth "How wide should this axle be? (This is the distance from one wheel to the other.";
	var() noexport float AxleOffset "How far from the center of the vehicle (along the direction the vehicle is facing) should this axle be located?" "" "(Positive numbers will push it closer to the front; negative numbers will shift it backwards.)";
	var() noexport float AxleHeight "How far from the center of the vehicle (along the Z axis) should the wheel be in its rest position.";
	var() float DifferentialLock;
	var() SVehiclePhysicsAxleProperties AxleProps;
	var() SVehiclePhysicsWheelProperties WheelProps;
	var() SVehiclePhysicsWheelProperties HandbrakeWheelProps;
	var VDifferential AxleDifferential;
	var VWheel Wheels[2];
};