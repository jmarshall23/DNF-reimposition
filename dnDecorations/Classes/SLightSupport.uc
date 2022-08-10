struct SLightSupport
{
	var() Details_Generic_SwingingLight_Support Support;
	var() Vector AttachPoint;
	var() float Length;
	var() Details_Generic_SwingingLight_Node Node;
	var() KBSJoint Joint;
	var() KAngularJointLimit Limit;
	var() KAngularMotorAffector motor;
	var() KAngularMotorAffector SwingingMotor;
};