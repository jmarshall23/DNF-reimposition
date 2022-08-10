struct HUDDisplayMessage
{
	var noexport bool bUserDisabled "If true, the user has disabled this message through a menu option.";
	var noexport bool bDropShadow "If true, this message will be drawn with a drop shadow.";
	var noexport bool bRenderInPause "If true, this message will be drawn even when the game is paused.";
	var noexport bool bRenderWhileDead "If true, this message will be drawn even when the player is dead.";
	var noexport Font Font "Font to use for this message.";
	var noexport Color DrawColor "Color to use for this message.";
	var noexport float Scale "Scale to apply to this message.";
	var noexport Actor.EHUDAnchor Anchor "Defines where message will be anchored on the HUD.";
	var noexport float XPos "Horizontal adjustment for anchor point.";
	var noexport float YPos "Vertical adjustment for anchor point.";
	var noexport HUD.ETextHorizontalAlign HAlign "Horizontal alignment of message relative to adjusted anchor point.";
	var noexport HUD.ETextVerticalAlign VAlign "Vertical alignment of message relative to adjusted anchor point.";
	var noexport HUD.ETextHorizontalAlign LineHAlign "When wrapping is enabled, this is the horizontal alignment to apply to the individual lines.";
	var noexport float WrapXL "When > 0, this is the max width of a message before it needs to wrap.";
	var noexport float FadeInRate "Rate at which Alpha increases toward TargetAlpha when fading in.";
	var noexport float FadeOutRate "Rate at which Alpha increases toward TargetAlpha when fading out.";
	var noexport float HoldTime "Amount of time to display message after it has completely faded in.";
	var string Message;
	var float Alpha;
	var float TargetAlpha;
	var float HoldTimer;
	var MaterialEx Icon;
	var float IconXL;
	var float IconYL;
};