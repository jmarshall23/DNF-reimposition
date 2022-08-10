struct SShrinkMachine
{
	var() float Delta;
	var() SSoundInfo StartSound;
	var() SSoundInfo EndSound;
	var() Vector moveDelta;
	var() float moveTime;
	var() bool bVolumeActive;
	var() name BroadcastEvent;
	var bool bComplete;
};