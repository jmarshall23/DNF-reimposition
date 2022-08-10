/*******************************************************************************
 * Ammo generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Ammo extends Inventory
	abstract
	native
	notplaceable;

var StaticMesh AmmoCasingMesh;
var class<PhysicsMaterial> AmmoCasingMaterial;

function AddAmmo(int NewAmmoAmmount)
{
	Charge = float(__NFUN_191__(int(__NFUN_198__(Charge, float(NewAmmoAmmount))), 0, int(MaxCharge)));
	return;
}

function bool UseAmmo(int UsedAmmo)
{
	// End:0x12
	if(__NFUN_200__(Charge, float(UsedAmmo)))
	{
		return false;
	}
	Charge = float(__NFUN_189__(0, int(__NFUN_199__(Charge, float(UsedAmmo)))));
	return true;
	return;
}

event float GiveTo(Pawn Other, optional bool bTravel)
{
	__NFUN_1069__(Other, bTravel);
	return Charge;
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super(InteractiveActor).RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1267__(AmmoCasingMesh);
	return;
}

defaultproperties
{
	MultiplePickupBehavior=2
}