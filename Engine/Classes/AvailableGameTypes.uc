struct AvailableGameTypes
{
	var int id;
	var string EntryName;
	var int PlayerStep;
	var bool bUseWinCondition;
	var int WinConditionMin;
	var int WinConditionMax;
	var int WinConditionStep;
	var int WinConditionDefault;
	var string WinConditionText;
	var string WinConditionOptionName;
	var array<string> ExcludedMutators;
	var bool bUIExclude;
};