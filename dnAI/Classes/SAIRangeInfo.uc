struct SAIRangeInfo
{
	var() noexport float ActionPointClosestMaxTravelDist "How far are we willing to go when wanting to go to closest action point";
	var() noexport float ActionPointClosestMaxTargetDist "Max distance we are willing to be from target when going to an AP";
	var() noexport float ActionPointClosestJumpableMaxTravelDist "How far are we willing to go when wanting to go to closest action point";
	var() noexport float ActionPointClosestFlyerMaxTravelDist "How far are we willing to go when wanting to go to closest action point";
};