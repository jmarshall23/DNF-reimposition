/*******************************************************************************
 * ScriptMethod_DropProp generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ScriptMethod_DropProp extends ScriptMethod
	native
	exportstructs
	hidecategories(Object);

cpptext
{
// Stripped
}

var() noexport bool DestroyProp "Calls destroy on prop if set to true. Otherwise we just dismount and let things work themselves out.";

event string GetMethodString()
{
	return "Drop Prop ()";
	return;
}
