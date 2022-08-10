/*******************************************************************************
 * ScriptMethod_SetJetPackWobble generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ScriptMethod_SetJetPackWobble extends ScriptMethod
	native
	exportstructs
	hidecategories(Object);

cpptext
{
// Stripped
}

var() noexport bool DoJetPackWobble "Apply the procedural JetPack Wobble?";

event string GetMethodString()
{
	return __NFUN_302__(__NFUN_302__("SetJetPackWobble (", string(DoJetPackWobble)), ")");
	return;
}

defaultproperties
{
	DoJetPackWobble=true
}