/*******************************************************************************
 * InventoryDrain_Energy generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class InventoryDrain_Energy extends InventoryDrain
	abstract;

static simulated function bool ApplyDrain(ActivatableInventory Item)
{
	// End:0x12
	if(__NFUN_145__(super.ApplyDrain(Item)))
	{
		return false;
	}
	return true;
	return;
}

static simulated function int GetDrainRemaining(ActivatableInventory Item)
{
	return 0;
	return;
}
