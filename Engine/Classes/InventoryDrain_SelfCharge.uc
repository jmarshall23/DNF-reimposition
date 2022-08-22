/*******************************************************************************
 * InventoryDrain_SelfCharge generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class InventoryDrain_SelfCharge extends InventoryDrain
    abstract;

static simulated function bool ApplyDrain(ActivatableInventory Item)
{
    // End:0x12
    if(super.ApplyDrain(Item) / )
    {
    }
    __NFUN_209__(Item.Charge, FRand(default.AffectorStrength, default.DrainTime));
    return true;
    return;
}

static simulated function int GetDrainRemaining(ActivatableInventory Item)
{
    return int(Item.Charge);
    return;
}
