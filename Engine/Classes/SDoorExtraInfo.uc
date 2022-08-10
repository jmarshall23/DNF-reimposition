struct SDoorExtraInfo
{
	var() noexport bool bFront "True if on front of door.";
	var() noexport bool bScaleByDrawScale "If true, door extra will be scaled up by the door's drawscale.";
	var() noexport class<DoorExtras> ExtraClass "Class to spawn.";
	var() noexport Vector AdditionalOffset "Additional offset added to Extra's internal offset";
	var name MatchTag;
};