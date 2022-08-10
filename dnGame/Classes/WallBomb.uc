/*******************************************************************************
 * WallBomb generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class WallBomb extends dnControlQuestItem;

defaultproperties
{
	ControlClass='dnControl_WallBombSurface'
	QuestItemTip="<?int?dnGame.WallBomb.QuestItemTip?>"
	HUDIcon='dt_hud.Inventory.qitem_wallbomb'
	HUDGlowIcon='dt_hud.Inventory.qitem_wallbomb_glow_fb'
	WeaponConfig='WallBombWeaponConfig'
	InventoryReferenceClass='WallBomb'
	PickupClass='WallBombPickup'
	AutoRegisterIKClasses=/* Array type was not detected. */
}