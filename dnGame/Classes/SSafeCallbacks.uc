struct SSafeCallbacks
{
	var() noexport float Delay "Amount of time that should pass before the Callback event will go off.";
	var() noexport float DelayVariance "Amount of time to vary the delay by when we set one.";
	var() noexport bool bLoop "Whether the event should loop when called.";
	var() noexport bool bEnforceLoop "Whether to make the callback happen multiple times in a single frame if the frame took longer than the delay period.";
	var() noexport bool bDontOverwrite "Whether the event should overwrite another callback of the same type when it gets created.";
	var() noexport bool bIndependent "Whether this callback is independent or not. If it isn't independent and one is already going, it will be ignored.";
	var() noexport DecoActivities_Events.ESafeCallbacks Callback "Action to make happen on this actor once this activity is complete.";
	var name CallbackScript;
};