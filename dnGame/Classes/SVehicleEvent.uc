struct SVehicleEvent
{
	var() VehicleBase.EVehicleEventType EventType;
	var() Engine.Object.ECompare CompareType;
	var() float Comparison;
	var() bool bOnlyFireEventOnce;
	var() name Event;
};