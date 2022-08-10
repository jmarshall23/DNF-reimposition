struct STriggerableAnims
{
	var() noexport name Sequence "Raw animation sequence name to play when AnimTag is triggered.";
	var() noexport name Tag "Trigger this event to make this animation play.";
	var() noexport bool bLoopAnim "If true, this animation will loop.";
	var() noexport float Frame "Frame to start animation on.";
	var() noexport float Rate "Rate to use for animation playback.  If left as 0.0, rate will automatically become 1.0.";
	var() noexport bool bNoInterrupt "If true and animation is already playing, will not attempt to play again.";
	var() noexport name AnimEndEvent "Event to trigger when this animation finishes.";
	var int SpecialEventID;
};