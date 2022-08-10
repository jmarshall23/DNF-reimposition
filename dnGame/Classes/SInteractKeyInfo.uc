struct SInteractKeyInfo
{
	var() noexport float OffsetX "X-offset from HUDAnchor.";
	var() noexport float OffsetY "Base Y-offset from HUDAnchor.";
	var() noexport float Alpha "Current alpha of this key info box";
	var() noexport float TargetAlpha "Target alpha of this key info box";
	var() noexport SInteractKeyInfoText Text "Current text that could be fading in.";
	var() noexport array<SInteractKeyInfoText> OldTexts "Old texts that are fading out.";
	var() noexport bool bTap "Tap bounce?  Makes the info bounce up and down to indicate that tapping is needed.";
	var() noexport bool bHighlight "Are we highlighted?";
	var() noexport bool bAttachToHUD "If true, the alpha for this SInteractKeyInfo will be controlled by HUDAlpha.";
	var() noexport float DrawScale "If non zero, this will be used to scale the image drawn.";
	var() noexport Engine.Actor.EHUDAnchor HUDAnchor "Position that Offset X and Y are relative to.";
};