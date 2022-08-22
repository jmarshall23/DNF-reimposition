/*******************************************************************************
 * WallBomb generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
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
    AutoRegisterIKClasses(0)='IKSystemInfo_Shotgun'
    Mesh='c_hands.Wall_Bomb'
    VoicePack='SoundConfig.Inventory.VoicePack_WallBomb'
}