/*******************************************************************************
 * DecoActivityRules generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class DecoActivityRules extends Object
	abstract
	native
	exportstructs
	hidecategories(Object);

cpptext
{
// Stripped
}

var() bool bDebugRules;

// Export UDecoActivityRules::execCheckRulesNative(FFrame&, void* const)
native final function bool CheckRulesNative(dnDecoration dnDeco)
{
	//native.dnDeco;	
}

event bool CheckRules(dnDecoration dnDeco)
{
	__NFUN_354__(bool(dnDeco), "Activity Rule requires a valid dnDecoration to check, but dnDeco was NULL.");
	// End:0xA0
	if(bDebugRules)
	{
		dnDeco.BroadcastLog(__NFUN_302__(__NFUN_302__(string(Name), ".CheckScriptRules() called by "), string(dnDeco)));
	}
	return CheckRulesNative(dnDeco);
	return;
}
