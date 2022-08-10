struct SMicrowaveInfo
{
	var() noexport float TimeToMicrowave "How long it takes for this item to get microwaved. Set to > 0 to enable micrwavability.";
	var InteractiveActor MicrowaveActor;
	var float LastMicrowaveTime;
};