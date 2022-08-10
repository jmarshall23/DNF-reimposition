/*******************************************************************************
 * dnMutatorList generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnMutatorList extends UWindowListBoxItem;

var string MutatorName;
var string MutatorClass;

function int Compare(UWindowList t, UWindowList B)
{
	// End:0x3A
	if(__NFUN_304__(__NFUN_319__(dnMutatorList(t).MutatorName), __NFUN_319__(dnMutatorList(B).MutatorName)))
	{
		return -1;
	}
	return 1;
	return;
}

function dnMutatorList FindMutator(string FindMutatorClass)
{
	local dnMutatorList i;

	i = dnMutatorList(Next);
	J0x10:

	// End:0x59 [Loop If]
	if(__NFUN_340__(i, none))
	{
		// End:0x3C
		if(__NFUN_310__(i.MutatorClass, FindMutatorClass))
		{
			return i;
		}
		i = dnMutatorList(i.Next);
		// [Loop Continue]
		goto J0x10;
	}
	return none;
	return;
}
