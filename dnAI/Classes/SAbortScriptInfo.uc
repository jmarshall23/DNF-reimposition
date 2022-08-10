struct SAbortScriptInfo
{
	var SAbortScriptMotive_SeeActor MotiveSeeActor;
	var SAbortScriptMotive_HearSound MotiveHearSound;
	var SAbortScriptMotive_Damaged MotiveDamaged;
	var SAbortScriptMotive_Bumped MotiveBumped;
	var SAbortScriptMotive_Triggered MotiveTriggered;
	var SAbortScriptMotive_Shrunk MotiveShrunk;
	var bool ShouldAbort;
	var int EgoChange;
	var name OtherActorTag;
	var name AbortEvent;
	var noexport bool bUseAbortEventStuck "Set to true and we will use AbortEventStuck when stuck. if false, stuck aborts just fire off AbortEvents like normal";
	var noexport name AbortEventStuck "An event to trigger if I abort because I was stuck. If none we will still fire AbortEvent if stuck";
	var bool ChangeScriptTag;
	var name ChangedScriptTag;
	var bool KeepProp;
	var bool CanFall;
	var noexport bool PlayPainDontAbort "If true we will play pain animations BUT WONT ABORT the script. If false we wont pain. If true we will. Either way we will only abort if MotiveDamage is met";
};