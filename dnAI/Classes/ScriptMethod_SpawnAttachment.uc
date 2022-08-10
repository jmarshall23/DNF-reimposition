/*******************************************************************************
 * ScriptMethod_SpawnAttachment generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ScriptMethod_SpawnAttachment extends ScriptMethod
	native
	exportstructs
	hidecategories(Object);

cpptext
{
// Stripped
}

var() noexport name AttachmentClassName "Class name of object to spawn.";
var() noexport SMountPrefab AttachmentPrefab "Mount prefab for the attachment.";

event string GetMethodString()
{
	return __NFUN_302__(__NFUN_302__("SpawnAttachment (", string(AttachmentClassName)), ")");
	return;
}