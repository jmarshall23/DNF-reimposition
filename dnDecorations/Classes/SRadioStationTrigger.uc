struct SRadioStationTrigger
{
	var() noexport float Frequency "This will be the frequency we change to when this StationTrigger is triggered.";
	var() noexport name Tag "Trigger this event to trigger this StationTrigger.";
	var int SpecialEventID;
};