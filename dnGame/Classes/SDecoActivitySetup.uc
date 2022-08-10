struct SDecoActivitySetup
{
	var const bool bDisabled;
	var const bool bPerformedThisRound;
	var const int PerformedCounter;
	var() noexport int LoopCount "How many times this activity can occur before it disables itself forever. 0 means go forever.";
	var() noexport float PerformAgainDelay "How much time has to pass before an activity from our group can happen again.";
};