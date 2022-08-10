struct SState
{
	var() editconst name StateName;
	var() noexport array<SOutEvents> OutEvents "A list of events to fire during this states execution.";
	var array<STransition> Transitions;
	var() noexport name UserAnimName "User anim to play when the state begins.";
	var() noexport name UserSoundName "User sound (via the VoicePack) to play when the state begins.";
	var() noexport SAnimInfo MyAnim "Anim to play when the state begins.";
	var noexport SSoundInfo MySound "DEPRECATED:  Do Not Use.";
	var() noexport name MySoundName "VoicePack entry to play when the state begins.";
	var noexport array<SSubAnim> SubAnims "DEPRECATED";
};