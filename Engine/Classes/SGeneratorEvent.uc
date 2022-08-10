struct SGeneratorEvent
{
	var() noexport name Event "Event to call when the Percentage is reached.";
	var() noexport float Percent "Percentage of the property to reach before firing the event.";
};