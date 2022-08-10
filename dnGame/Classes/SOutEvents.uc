struct SOutEvents
{
	var() noexport bool bPlayerUserOnly "When true, this event is only considered when the User is a player.";
	var() noexport dnControl.EFirePoint FirePoint "When does the eventfire? (FPSTATE_Begin -> occurs once on state begin, FPSTATE_Tick -> every tick, FPSTATE_End -> once on state end.)";
	var() noexport deprecated name EventName "The event to fire on the FirePoint.";
};