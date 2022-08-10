struct SDesiredLocation
{
	var const bool bTemporal;
	var const bool bComplete;
	var() noexport bool bRelativeMotion "When true, the motion will be relative to the rotation of the actor. When mounted, uses MountAngles, otherwise simply the rotation of the actor." "NOTE: Incompatible with KeyframeDispatch. Use built in functionality of that class instead.";
	var() noexport Vector Target "Desired location to move to.";
	var() noexport Vector TargetVariance "Amount of random variance to apply to this target when we set it for real.";
	var const Vector RealTarget;
	var const Vector Start;
	var() noexport SFloatVariance Speed "When the Value parameter in this is > 0, then calculate TimeTotal based on the distance we need to go, and use TimeMid as a scaling value instead of a literal value. TimeTotal is completely ignored.";
	var() noexport Vector Rate "How fast to move to the desired location (use in place of specifying a time).";
	var() noexport float Exponent "Exponent value to use with DESIRED_Parabolic. 0-1 gives a bowl shape, 1+ gives a hill shape.";
	var() noexport float TimeTotal "How long to perform the DesiredLocation move.  if <= 0, will teleport instead of move.";
	var() noexport float TimeMid "Indicates what time is the 'middle' of the DesiredLocation time period. Used with Parabolic. When using Speed, this should be a value from 0-1 instead of a literal time.";
	var const float RealTimeMid;
	var const float Timer;
	var() noexport Object.EDesiredStyle Style "What method of movement to use when doing a DesiredLocation movement. Read KeyframeDispatch.UC for full description of Styles.";
	var() noexport Object.EDesiredStopStyle StyleStopped "How you want the actor doing this movement to react if it gets blocked by something in the middle of a move.";
	var() noexport SDesiredCrush CrushDamage "Crushing damage to inflict on anything being blocked by this actor during a move.";
	var() noexport deprecated name Event "Event you want to fire when this DesiredLocation finishes moving. This only happens when the move successfully completes.";
	var() noexport deprecated name EventAbort "Event you want to fire when this DesiredLocation aborts moving. This only happens when the move is aborted via the StleStopped methods.";
	var() noexport name FunctionComplete "Function to call when the movement is completed properly. Like a CallbackTimer, no parameters allowed. This is highly unlikely to be useful to non-programmers.";
	var() noexport name FunctionAbort "Function to call when the movement is aborted. Like a CallbackTimer, no paramters allowed. This is highly unlikely to be useful to non-programmers.";
};