/*******************************************************************************
 * ScriptMethod_OverrideExecution generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ScriptMethod_OverrideExecution extends ScriptMethod
    native
    exportstructs
    hidecategories(Object);

cpptext
{
// Stripped
}

var() noexport float m_fDeathAnimChance "Chance of playing Death Anim";
var() noexport bool m_bAllowFrozenExecution "Whether or not executions are allowed while frozen";

event string GetMethodString()
{
    return __NFUN_302__(__NFUN_302__(__NFUN_302__("OverrideExecution (", string(m_fDeathAnimChance)), ", "), string(m_bAllowFrozenExecution));
    return;
}
