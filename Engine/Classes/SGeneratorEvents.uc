struct SGeneratorEvents
{
	var() name DestroyedEvent;
	var() name ResumeEvent;
	var() array<SGeneratorEvent> ChargeEvents;
	var() array<SGeneratorEvent> DamageEvents;
};