/*******************************************************************************
 * VegasStrip_StreetDetail_FireHydrant generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class VegasStrip_StreetDetail_FireHydrant extends VegasStrip_Decorations
	collapsecategories;

var VegasStrip_StreetDetail_FireHydrant_Cap MyCap;

function PostVerifySelf()
{
	super(dnDecoration).PostVerifySelf();
	MyCap = VegasStrip_StreetDetail_FireHydrant_Cap(FindMountedActor('Cap'));
	return;
}

function Destroyed()
{
	local dnHUDEffects_WaterSplatter_Medium Splatter;

	super(dnDecoration).Destroyed();
	// End:0x22
	if(__NFUN_340__(MyCap, none))
	{
		MyCap.CriticalDamage();
	}
	Splatter = __NFUN_615__(class'dnHUDEffects_WaterSplatter_Medium', self,, __NFUN_238__(Location, __NFUN_263__(__NFUN_232__(0, 0, 100), Rotation)));
	Splatter.StartEffect();
	FindAndPlaySound('FireHydrant_Spray');
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super(dnDecoration).RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1277__(VoicePack, 'FireHydrant_Spray');
	return;
}

defaultproperties
{
	DecoActivities_Default=/* Array type was not detected. */
	X=/* Unknown default property type! */
	
/* Exception thrown while deserializing Engine
System.ArgumentOutOfRangeException: Length cannot be less than zero.
Parameter name: length
   at System.String.Substring(Int32 startIndex, Int32 length)
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 578 */
}