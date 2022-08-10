struct SScreenFlash
{
	var() noexport bool bAlwaysTick "By default flashes won't update if the game is currently paused. If TRUE, this flash will continue even in a paused game.";
	var() noexport bool bOnlyReplace "This flash will only allow itself to be added if it's replacing an existing one.";
	var() noexport bool bResumeFlash "When true, the flash will set it's start color to the current color of the Flash it's replacing. Nothing is done if it's not replacing anything.";
	var() noexport int Priority "Specifies the priority of a flash. In order of increasing importance, thus drawing higher values 'last'.";
	var() noexport int ReplaceMin "Flashes must have a ReplaceMin >= to the current flashes's ReplaceMin in order to replace the current flash. If 0, it will automatically replace";
	var() noexport name FlashID "Unique ID so you can access this flash directly (for removal, etc).";
	var() noexport Object.EScreenFlash FlashType "If the flash has a liftime, dictates what it does once the lifetime has exprired.";
	var() noexport Object.ERenderStyle FlashStyle "Drawing style to use for the screenflash. If a style is unsupported, it defaults to Alpha.";
	var() noexport Color ColorStart "Initial Color of the flash when applied.";
	var() noexport Color ColorMid "Color of the flash when it's reached the midpoint in it's lifetime.";
	var() noexport Color ColorEnd "Color of the flash when it's reached the end of it's lifetime.";
	var() noexport float Lifetime "How long the color takes to flash.";
	var() noexport float LifetimeMid "Midpoint time of the lifetime. If 0.0, ColorMid is ignored.";
	var float LifetimeCurrent;
	var Color ColorCurrent;
	var() noexport deprecated name FlashEvent "Event to trigger when the flash reaches the end of it's lifetime properly.";
	var() noexport name FlashFunction "Function to call when the flash reaches the end of it's lifetime properly.";
	var() noexport deprecated Actor FlashFuncActor "Actor to call the FlashFunction on. Defaults to the player if no actor specified.";
};