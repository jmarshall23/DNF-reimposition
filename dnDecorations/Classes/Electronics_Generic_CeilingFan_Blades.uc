/*******************************************************************************
 * Electronics_Generic_CeilingFan_Blades generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Electronics_Generic_CeilingFan_Blades extends Electronics_Generic;

var KAngularMotorAffector motor;

event Trigger(Actor Other, Pawn EventInstigator)
{
	super(dnDecoration).Trigger(Other, EventInstigator);
	// End:0x36
	if(__NFUN_340__(motor, none))
	{
		motor.Trigger(Other, EventInstigator);
	}
	return;
}

function KarmaSetConstraintProperties(KConstraint ConstraintActor)
{
	local KAngularMotorAffector LocalMotor;

	// End:0x26
	if(__NFUN_340__(Owner, none))
	{
		ConstraintActor.KConstraintActor2 = KarmaActor(Owner);
	}
	LocalMotor = KAngularMotorAffector(ConstraintActor);
	// End:0x5D
	if(__NFUN_340__(LocalMotor, none))
	{
		motor = LocalMotor;
		SetMotorInfo(90000, 50);
	}
	return;
}

function SetMotorInfo(float MotorSpeed, float MotorMaxTorque)
{
	// End:0x0E
	if(__NFUN_339__(motor, none))
	{
		return;
	}
	motor.__NFUN_1110__(MotorSpeed);
	motor.__NFUN_1111__(MotorMaxTorque);
	// End:0x5F
	if(__NFUN_340__(motor.KConstraintActor1, none))
	{
		motor.KConstraintActor1.__NFUN_817__();
	}
	return;
}