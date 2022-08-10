struct SGaugeState
{
	var() name AnimIdle;
	var() name AnimLeft;
	var() name AnimRight;
	var() noexport name OutEvent "Event to fire when entering this state.";
};