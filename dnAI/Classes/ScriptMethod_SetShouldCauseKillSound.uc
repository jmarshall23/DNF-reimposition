/*******************************************************************************
 * ScriptMethod_SetShouldCauseKillSound generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ScriptMethod_SetShouldCauseKillSound extends ScriptMethod
	native
	exportstructs
	hidecategories(Object);

cpptext
{
// Stripped
}

var() noexport bool bShouldCauseKillSound "Controls whether or not Duke should try to say something when killing this AI.";

event string GetMethodString()
{
	return __NFUN_302__(__NFUN_302__("SetShouldCauseKillSound (", string(bShouldCauseKillSound)), ")");
	return;
}
