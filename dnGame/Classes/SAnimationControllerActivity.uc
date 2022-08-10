struct SAnimationControllerActivity
{
	var() noexport name AnimState "Entry in the animation controller of the animation that you want play.";
	var() noexport name Tag "Trigger this tag to play this animation.";
	var() noexport deprecated name AnimEndEvent "Event to trigger when this animation ends.";
	var int SpecialEventID;
};