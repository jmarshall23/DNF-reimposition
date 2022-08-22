/*******************************************************************************
 * ScriptMethod_SetAimAssist generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ScriptMethod_SetAimAssist extends ScriptMethod
    native
    exportstructs
    hidecategories(Object);

cpptext
{
// Stripped
}

var() noexport bool EnableAimAssist "If true, the AI will be considered for AimAssist (includes RPG lockon and 360 controller assist)";

event string GetMethodString()
{
    return __NFUN_302__(__NFUN_302__("EnableAimAssist (", string(EnableAimAssist)), ")");
    return;
}
