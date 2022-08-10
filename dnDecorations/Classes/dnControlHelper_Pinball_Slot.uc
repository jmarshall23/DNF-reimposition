/*******************************************************************************
 * dnControlHelper_Pinball_Slot generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnControlHelper_Pinball_Slot extends dnControlHelper_Pinball
	collapsecategories;

var Vector SensorSize;
var dnControlHelper_Pinball_SlotSet SlotSet;
var KBoxSensor Sensor;

simulated event PostBeginPlay()
{
	super(dnDecoration).PostBeginPlay();
	Sensor = __NFUN_615__(class'KBoxSensor', self,, Location, Rotation);
	// End:0x91
	if(__NFUN_340__(Sensor, none))
	{
		Sensor.__NFUN_1125__(SensorSize);
		Sensor.BeginSenseEvent = __NFUN_343__(__NFUN_302__(string(Name), "BoxSensorHit"));
		Sensor.__NFUN_1120__(class'dnControlHelper_Pinball_Ball');
		__NFUN_718__('BallHitSlot', Sensor.BeginSenseEvent);
	}
	SlotSet = dnControlHelper_Pinball_SlotSet(Owner);
	return;
}

simulated function TriggerFunc_BallHitSlot()
{
	FindAndPlaySound('Pinball_SlotLight');
	// End:0x51
	if(__NFUN_145__(bActivated))
	{
		Activate();
		OwnerMachine.AwardPoints(PointsAwarded);
		// End:0x4E
		if(__NFUN_340__(SlotSet, none))
		{
			SlotSet.HitSlot(self);
		}		
	}
	else
	{
		Deactivate();
	}
	return;
}

simulated function Activate()
{
	bActivated = true;
	ActorColorList[0].ActorColor.R = 255;
	ActorColorList[0].ActorColor.G = 4;
	ActorColorList[0].ActorColor.B = 4;
	ActorColorList[0].ActorColor.A = 255;
	return;
}

simulated function Deactivate()
{
	bActivated = false;
	ActorColorList[0].ActorColor.R = 0;
	ActorColorList[0].ActorColor.G = 0;
	ActorColorList[0].ActorColor.B = 0;
	ActorColorList[0].ActorColor.A = 255;
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super.RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1266__(class'KBoxSensor');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Pinball_SlotLight');
	return;
}

defaultproperties
{
	SensorSize=(X=1.291717E-41,Y=2.802663E-17,Z=2)
	PointsAwarded=750
	DrawType=8
	PrePivot=(X=1.291717E-41,Y=2.797242E-17,Z=0)
	StaticMesh='sm_class_decorations.Arcades.Pinball_Light_Circle'
	ActorColorList=/* Array type was not detected. */
	Z=false
	Y=/* Unknown default property type! */
	Z=0
	B=0
	A=0
}