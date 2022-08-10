/*******************************************************************************
 * ScriptMethod_Anim generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
interface ScriptMethod_Anim extends ScriptMethod
	native
	parseconfig
	exportstructs
	hidecategories(Object);

cpptext
{
// Stripped
}

var() noexport Engine.BaseAI.EAIAnimXType AnimType "Type of behaviour for animation.";
var() noexport name AnimName "Anim to play.";
var() noexport bool UseExactAnimName "Use the name exactly as specified (dont append weapon/prop)?";
var() noexport float ExitTime "Duration to play animation for.  Set to <= 0.0 to play one animation cycle.";
var() noexport deprecated name FaceActorTag "Optional actor to face during animation.";
var() noexport Vector FacePos "Optional position to face during animation.";

event string GetMethodString()
{
	return __NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__("ExplicitAnim (", string(__NFUN_365__(class'EAIAnimXType', int(AnimType)))), ", "), string(AnimName)), ", "), string(UseExactAnimName)), ", "), string(ExitTime)), ", "), string(FaceActorTag)), ", ("), string(FacePos)), ")"), ")");
	return;
}

defaultproperties
{
	AnimType=1
	AnimName=Anim_Walk
	Latent=true
}