struct SAnimTriggers
{
	var() noexport deprecated name AnimEvent "Event you want to trigger when an animation ends on this decoration that matches the specified rule set below.";
	var() noexport name AnimFunction "Function to call when the animation completes. Like a CallbackTimer, no paramters allowed. This is highly unlikely to be useful to non-programmers.";
	var() noexport array<name> AnimActivities "Activities you want to fire off when the animation ends and the rule set below is met.";
	var() noexport anim array<name> TestAnims "Animation name must match one of these in order to fire off the event. If empty, will only check Channels.";
	var() noexport array<int> TestChannels "Channel the animation is completing on must match one of these in order to fire off. If empty, will only check Anims.";
};