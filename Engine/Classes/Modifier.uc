/*******************************************************************************
 * Modifier generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Modifier extends MaterialEx
	abstract
	native
	exportstructs
	hidecategories(Object,MaterialEx);

cpptext
{
// Stripped
}

var() MaterialEx Material;

simulated function class<Material> GetCurrentMaterial()
{
	local class<Material> Result;

	// End:0x12
	if(__NFUN_340__(MaterialClass, none))
	{
		return MaterialClass;
	}
	// End:0x34
	if(__NFUN_340__(Material, none))
	{
		Result = Material.GetCurrentMaterial();
	}
	// End:0x46
	if(__NFUN_340__(Result, none))
	{
		return Result;
	}
	return super.GetCurrentMaterial();
	return;
}

function Reset()
{
	// End:0x1C
	if(__NFUN_340__(Material, none))
	{
		Material.Reset();
	}
	// End:0x38
	if(__NFUN_340__(FallbackMaterial, none))
	{
		FallbackMaterial.Reset();
	}
	return;
}

function Trigger(Actor Other, Actor EventInstigator)
{
	// End:0x26
	if(__NFUN_340__(Material, none))
	{
		Material.Trigger(Other, EventInstigator);
	}
	// End:0x4C
	if(__NFUN_340__(FallbackMaterial, none))
	{
		FallbackMaterial.Trigger(Other, EventInstigator);
	}
	return;
}

defaultproperties
{
	bModifier=true
}