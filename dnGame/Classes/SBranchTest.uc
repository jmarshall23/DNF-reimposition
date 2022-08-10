struct SBranchTest
{
	var() noexport class<Actor> SearchClass "The class of the actor you're looking for a property in.";
	var() noexport deprecated name SearchTag "The tag of the actor you're looking for the property in.";
	var() noexport string SearchProperty "The name of the property (ie., Health, Weapon, etc.).";
	var() noexport int SearchPropertyIndex "If the property name is an array, use this to access the Nth element.";
	var() noexport BTriggerProperty.EBranchVarType SearchType "What type is the variable we're comparing?";
	var() noexport string SearchCompare "What value are we going to be comparing to?" "" "(For classes, just use the straight name of the class, like \"Shotgun\" or \"DukePlayer\".)";
	var() noexport BTriggerProperty.EBranchTestType test "What is the test condition?";
	var() noexport BTriggerProperty.EBranchJoin Join "If doing multiple tests, how should we join the result of this test with the result of the next?";
};