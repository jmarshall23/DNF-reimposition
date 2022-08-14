struct SAnimInfo
{
	var() noexport SAnimFlags Flags "Various extra properties that can be applied to the animation.";
	var() noexport anim name Animation "The specific animation to play. If left blank, will stop animation on the specified channel.";
	var() noexport int Channel "The channel to play the animation on. 0 is default.";
	var() noexport float Rate "Rate to play the animation at. If left as 0.0, will default to 1.0";
	var() noexport float TweenTime "Tween time to use to transition from the previous anim to this one. 0.0 will instantly snap to the new animation.";
};