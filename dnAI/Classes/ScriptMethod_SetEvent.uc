/*******************************************************************************
 * ScriptMethod_SetEvent generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ScriptMethod_SetEvent extends ScriptMethod
    native
    exportstructs
    hidecategories(Object);

cpptext
{
// Stripped
}

var() noexport name NewEvent "New Event for this actor.";

event string GetMethodString()
{
    return __NFUN_302__(__NFUN_302__("ScriptMethod_SetEvent (", string(NewEvent)), ")");
    return;
}
