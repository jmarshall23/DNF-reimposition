struct TriggerInfo
{
	var Card Cards[5];
	var VideoPoker.EVPState VPState;
	var int CurrentBet;
	var byte Hold[5];
	var bool Covering;
	var bool DrawWin;
	var bool FlashWin;
};