struct SSwitchUserState
{
	var() noexport string UsePhrase "UsePhrase to display in this state.";
	var() noexport float SwitchAgainTime "If this is greater than 0, then the switch will automatically go to the next state after the specified amount of time has passed. The switch is disabled during this time and unable to do anything until the time has expired.";
	var() noexport float SwitchPauseTime "Amount of time to pause after switching states before the switch can be hit again.";
	var() noexport name Event "Event to call when this state is engaged.";
};