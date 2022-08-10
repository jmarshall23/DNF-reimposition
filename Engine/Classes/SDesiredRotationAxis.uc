struct SDesiredRotationAxis
{
	var const bool bTemporal;
	var const bool bComplete;
	var const bool bLinked;
	var() const bool bShortestDist;
	var() noexport int Target "Desired rotation axis value to rotate to.";
	var const int RealTarget;
	var const int Start;
	var const int Delta;
	var() noexport int Rate "Rate to move towards the DesiredRotation(use in place of specifying a time).";
	var() noexport float Exponent "Exponent value to use with DESIRED_Parabolic. 0-1 gives a bowl shape, 1+ gives a hill shape.";
	var() noexport float TimeTotal "How long to perform the DesiredRotation move.";
	var() noexport float TimeMid "Indicates what time is the 'middle' of the DesiredRotation time period. Used with Parabolic.";
	var const float Timer;
	var() noexport Object.EDesiredStyle Style "What method of movement to use when doing a DesiredRotation movement. Read KeyframeDispatch.UC for full description of Styles. READ IT!! NOW!!";
	var() noexport Object.EDesiredRotationStopStyle StyleStopped "How you want the actor doing this movement to react if it gets blocked by something in the middle of a move.";
	var() noexport SDesiredCrush CrushDamage "Crushing damage to inflict on anything being blocked by this actor during a move.";
	var() noexport deprecated name Event "Event you want to fire when this DesiredRotation finishes moving. This only happens when the move successfully completes.";
	var() noexport name FunctionComplete "Function to call when the movement is completed properly. Like a CallbackTimer, no parameters allowed. This is highly unlikely to be useful to non-programmers.";
	var() noexport deprecated name EventAbort "Event you want to fire when this DesiredRotation aborts moving.  This only happens when the StyleStopped == DESIREDSTOP_Abort and the Actor is blocked during the move.";
	var() noexport name FunctionAbort "Function to call when the movement is aborted. Like a CallbackTimer, no paramters allowed. This is highly unlikely to be useful to non-programmers.";
};