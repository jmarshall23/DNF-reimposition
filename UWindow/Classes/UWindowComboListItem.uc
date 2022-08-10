/*******************************************************************************
 * UWindowComboListItem generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UWindowComboListItem extends UWindowList;

var string Value;
var string Value2;
var int SortWeight;
var float ItemTop;

function int Compare(UWindowList t, UWindowList B)
{
	local UWindowComboListItem TI, BI;
	local string TS, BS;

	TI = UWindowComboListItem(t);
	BI = UWindowComboListItem(B);
	// End:0xA0
	if(__NFUN_173__(TI.SortWeight, BI.SortWeight))
	{
		TS = __NFUN_319__(TI.Value);
		BS = __NFUN_319__(BI.Value);
		// End:0x85
		if(__NFUN_308__(TS, BS))
		{
			return 0;
		}
		// End:0x9B
		if(__NFUN_304__(TS, BS))
		{
			return -1;
		}
		return 1;		
	}
	else
	{
		return __NFUN_166__(TI.SortWeight, BI.SortWeight);
	}
	return;
}