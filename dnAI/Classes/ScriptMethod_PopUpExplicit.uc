/*******************************************************************************
 * ScriptMethod_PopUpExplicit generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ScriptMethod_PopUpExplicit extends ScriptMethod
	native
	exportstructs
	hidecategories(Object);

cpptext
{
// Stripped
}

var() noexport array<export PopUpCfg> Popups "A list of the popups we can do.";
var() noexport class<PopUpCfg> PopUpCfgBase "If not none we'll use the first popup in our popupcfg list that extends off this class. else we use the Popups array in this script method.";

event string GetMethodString()
{
	local string PopUpInfosString;
	local int i, Max;

	Max = string(Popups);
	i = 0;
	J0x13:

	// End:0x9B [Loop If]
	if(__NFUN_169__(i, Max))
	{
		PopUpInfosString = __NFUN_302__(__NFUN_302__(__NFUN_302__(PopUpInfosString, string(__NFUN_365__(class'EAIAnimController', int(Popups[i].AnimCtrler)))), "/"), Popups[i].AnimExtension);
		// End:0x91
		if(__NFUN_169__(__NFUN_165__(i, 1), Max))
		{
			PopUpInfosString = __NFUN_302__(PopUpInfosString, ", ");
		}
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x13;
	}
	return __NFUN_302__(__NFUN_302__("PopUpExplicit ((", PopUpInfosString), "))");
	return;
}

defaultproperties
{
	Latent=true
}