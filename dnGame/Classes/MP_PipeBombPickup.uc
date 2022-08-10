/*******************************************************************************
 * MP_PipeBombPickup generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MP_PipeBombPickup extends MP_WeaponPickup
	collapsecategories;

defaultproperties
{
	ItemName="<?int?dnGame.MP_PipeBombPickup.ItemName?>"
	InventoryType='MP_PipeBomb'
	RespawnTime=20
	bAllowUsePickup=false
	PhysicsMaterial='dnMaterial.dnPhysicsMaterial_PipeBomb'
	Density=2.8
	PhysicsSoundOverrides=/* Array type was not detected. */
}