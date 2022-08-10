struct SAIAmbientSoundInfo
{
	var() bool bDebug;
	var() float TargetAquiredMinInterval;
	var() float NoTargetIdleInterval;
	var() float NoTargetIdleRnd;
	var() float BattleIdleInterval;
	var() float BattleIdleRnd;
	var name TargetAquiredSoundName;
	var name TargetLostSoundName;
	var name NoTargetSoundName;
	var name TargetVisibleSoundName;
	var name TargetNotVisibleSoundName;
};