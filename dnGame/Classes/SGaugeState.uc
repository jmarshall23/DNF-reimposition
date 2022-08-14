struct SGaugeState
{
	var() anim name AnimIdle;
	var() anim name AnimLeft;
	var() anim name AnimRight;
	var() noexport name OutEvent "Event to fire when entering this state.";
};