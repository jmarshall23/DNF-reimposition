struct SChannelInfo
{
	var() noexport MaterialEx ShowSmack "Actual show to have playing when the player first switches to this channel. If nothing here, it will simply play the ShowOffTex. Doesn't have to be a SmackerTexture anymore, can be any MaterialEx.";
	var() noexport SSoundInfo ShowSound "Soundtrack for the show.";
	var() noexport SAmbientSoundInfo ShowSoundAmbient "Ambient Soundtrack for the show.";
	var() noexport Color ShowColor "Color to apply to the TVLight that is associated with thise TV. If left black, it will use the default color of the light you targetted.";
	var() noexport SSoundInfo ShowOffSound "Sound to play when the show is off.";
	var() noexport SAmbientSoundInfo ShowOffSoundAmbient "Amient Sound to play when the show is off.";
	var() noexport MaterialEx ShowOffTex "Texture to display when the show has gone off the air. DOES NOTHING USEFUL CURRENTLY, WAITING ON SMACKER FUNCTIONALITY FOR THIS TO BE USEFUL.";
	var() noexport Color ShowOffColor "Color to apply to the TVLight when the show is off the air.";
	var() noexport deprecated name StationEvent "Event to fire off whenever this station is activated.";
	var() noexport name StationTag "Call this tag to force the TV to immediately jump to this channel.";
	var int StationSpecialEventID;
	var() noexport deprecated Actor StationCamera "Override CameraActor in Display with this actor instead for displaying a live footage scene using RenderTargets.";
	var() noexport float StationFOV "FOV to apply when the CameraActor is updated. If left as 0, will use the value of the TV's CameraFOV instead.";
	var() noexport RenderTarget RenderTargetTexture "RenderTargetTexture to use for the StationCamera rendering.";
	var() noexport Vector RenderTargetNormal "When RenderTargetTexture isn't None, use this Normal instead of the default. If left as (0,0,0) will use the TV's default instead.";
};