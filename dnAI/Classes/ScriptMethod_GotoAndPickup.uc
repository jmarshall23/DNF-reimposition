/*******************************************************************************
 * ScriptMethod_GotoAndPickup generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ScriptMethod_GotoAndPickup extends ScriptMethod_GotoBase
	native
	exportstructs
	hidecategories(Object);

cpptext
{
// Stripped
}

var() noexport deprecated name TargetTag "Tag of the object to pickup.";
var() noexport bool Run "Run or walk to the object?";

event string GetMethodString()
{
	return __NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__("GotoAndPickup (", string(TargetTag)), ", "), string(Run)), ")");
	return;
}

defaultproperties
{
	Latent=true
}