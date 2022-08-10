struct SNAVInfo
{
	var() name PathID;
	var() float PathRadius;
	var() float PathHeight;
	var() bool bFlyPortals;
	var() bool bPrecomputeAP;
	var() array<SNAVStatItem> Items;
};