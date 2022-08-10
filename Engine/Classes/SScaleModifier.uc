struct SScaleModifier
{
	var() noexport Actor.EScaleModifier Style "How to ramp the modifier, either in a straight line or slowly ramp up and down smoothly.";
	var() noexport name Identifier "Unique ID for the modifier that allows you to link different effects together. Also required if you want to hand remove the modifier.";
	var() noexport float ScaleStart "Where we want the scaler to start out. If left as 0, and replacing an existing modifier with the same ID, will start where the existing modifier currently is.";
	var() noexport float ScaleTarget "Where we want the scaler to wind up when it is finished transitioning.";
	var() noexport float TimeRamp "Amount of time the modifier takes to transition from start to target.";
	var() noexport name FunctionComplete "Function to call on the actor when this modifier finishes a TimeRamp.";
	var() noexport Actor FunctionCompleteActor "If None, [FunctionComplete] will be called on the actor with the scale modifier. Otherwise, the function will be called on this actor.";
	var() noexport deprecated name EventComplete "Event to trigger when this modifier finishes a TimeRamp.";
	var float Scale;
	var float Timer;
	var float LastUpdateGTS;
	var float Velocity;
	var float Priority;
	var bool bActive;
};