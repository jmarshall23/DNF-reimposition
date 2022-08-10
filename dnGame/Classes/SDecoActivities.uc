struct SDecoActivities
{
	var SDecoActivitiesData ActivityData;
	var() noexport array<name> ActivityIDScript "Hand defined identifications for this activity. This is used to force an Activity to occur outside the standard 'events' of a decoration. Either by a coder, or via ActivityTriggers setup by the mapper.";
	var() noexport array<dnDecoration.EDecoActivityID> ActivityID "Identification for when these activities should be performed based on standard decoration 'events' (Used, Triggered, Etc).";
	var() noexport dnDecoration.EDecoActivityMethod ActivityMethod "How to pick the next activity.";
	var() noexport array<dnDecoration.EDecoState> ActivityStates_Success "The Decoration must be in at least *one* of these states for the State check to succeed.";
	var() noexport array<dnDecoration.EDecoState> ActivityStates_Failure "The Decoration can not be in any of these states for the State Check to succeed.";
	var() noexport string ActivityDebugID "Set this to something unique to print out useful messages to debug these activities. This number will identify it.";
	var() noexport array<SDecoActivity> Activities "List of activities to be performed each time this event occurs (one per event).";
	var bool bDisabled;
};