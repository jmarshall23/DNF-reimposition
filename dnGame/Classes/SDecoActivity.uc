struct SDecoActivity
{
	var() noexport array<export DecoActivityRules> ActivityRules "All information that controls how this activity is supposed to perform.";
	var() noexport array<export DecoActivities> ActivityElements "List of dnDecorationActivities that make up what happens when this activity is executed.";
	var() noexport SDecoActivitySetup ActivitySetup "Setup information for how this activity is basically supposed to opperate. Looping, delays, etc.";
	var() noexport array<export DecoActivities> FailureActivityElements "List of dnDecorationActivities that occur when the rule results fail.";
	var() noexport SDecoActivitySetup FailureActivitySetup "Setup information for how this activity is basically supposed to opperate. Looping, delays, etc.";
};