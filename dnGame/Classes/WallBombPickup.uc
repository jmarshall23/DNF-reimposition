/*******************************************************************************
 * WallBombPickup generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class WallBombPickup extends WeaponPickup
	collapsecategories;

defaultproperties
{
	ItemName="<?int?dnGame.WallBombPickup.ItemName?>"
	InventoryType='WallBomb'
	StartAnimSequence=a_close_pose
	CollisionRadius=10
	CollisionHeight=12
	DrawType=2
	Mesh='c_hands.Wall_Bomb'
}