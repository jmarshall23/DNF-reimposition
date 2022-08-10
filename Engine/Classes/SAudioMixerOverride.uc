struct SAudioMixerOverride
{
	var() name id;
	var() float Volume;
	var() float Time;
	var() float StartVolume;
	var() float TargetVolume;
	var() float TransitionTime;
	var() float AutoRestoreTime;
	var() float AutoRestoreTransitionTime;
};