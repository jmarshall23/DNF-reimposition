struct SSwitchStateTags
{
	var() noexport bool CurrentState "Current state for the switch.";
	var() noexport bool DesiredState "Desired On/Off state for the switch. On=True, Off=False.";
	var() noexport name ToggleSwitch "When called, this toggles the state of the switch.";
	var int SpecialEventID;
};