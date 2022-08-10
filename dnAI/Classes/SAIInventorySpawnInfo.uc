struct SAIInventorySpawnInfo
{
	var() noexport Engine.BaseAI.EAIInventory m_eInventoryType "Type of inventory to give the AI.";
	var() noexport bool m_bStartActivated "Start with this item activated.";
	var() noexport bool m_bStartEquipped "Start with this item equipped / mounted.";
	var() noexport bool m_bUseable "If TRUE, the AI can actually use this item... if FALSE, he's just holding it for Duke or something.";
	var() noexport SAIInventoryInfo m_Overrides "Options that you can override for an inventory item.";
	var Inventory m_aSpawnedItem;
};