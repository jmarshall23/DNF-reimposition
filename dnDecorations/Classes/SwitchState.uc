struct SwitchState
{
	var() noexport bool bAfterSequence "Don't do the changes until after the animation sequence has finished playing. Also disables the trigger ability until the animation is complete.";
	var noexport name Sequence "DEPRECATED PROPERTY... DON'T USE! Use SwitchAnimInfo instead.";
	var() noexport SAnimInfo SwitchAnimInfo "Animation information to play.";
	var() noexport SAnimInfo DisabledSwitchAnimInfo "Animation to play when disabled";
	var SSoundInfo Sound;
	var SSoundInfo DisabledSound;
	var() noexport name SoundName "Name of the VoicePack entry we want to use when enabled.";
	var() noexport name DisabledSoundName "Name of the VoicePack entry we want to use when disabled.";
	var() noexport array<SUpdateMaterialEx> SwitchSkins "Materials to swap out on the switch when this state is engaged.";
	var() noexport name PlayerAnim "Anim Controller name to execute on player";
	var() noexport name DisabledPlayerAnim "Anim Controller name to execute on player when switch is disabled";
	var() noexport array<SActorColor> SwitchActorColors "Actor colors to apply after the switch";
};