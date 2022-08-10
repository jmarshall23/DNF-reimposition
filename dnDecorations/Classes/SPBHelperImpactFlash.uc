struct SPBHelperImpactFlash
{
	var() noexport name ActorColorId "Actor Color Id.";
	var() noexport float TimeTotal "Total time of the flash.";
	var() noexport Color ColorStart "Color to use at the start of the flash.";
	var() noexport Color ColorEnd "Color to use at the end of the flash.";
	var() noexport bool bUseMid "When true, effect will be broken up into two phases, seperated by TimeMid.";
	var() noexport float TimeMid "Defines the middle of the effect when bUseMid is true.";
	var() noexport Color ColorMid "Color to use at the middle of the flash.";
	var float Timer;
};