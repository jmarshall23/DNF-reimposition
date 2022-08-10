struct SShootingInfo
{
	var() noexport dnDecoration_Characters.EShootingStyle ShotStyle "Method of shots this character will fire. Faked shots are faster, but don't do any checks against geometry, etc. to make sure they would actually make it.";
	var() noexport float ShotDamage "How much damage this character is capable of issuing to the enemy.";
	var() float ShotDamageVariance;
	var() noexport float ShotLength "How far the character will trace out for shots.";
	var() noexport Vector ShotTargetVariance "How much of an area around the target to vary the shots up by. Makes it so each shot isn't perfectly accurate. (only valid when ShotStyle = VSSTYLE_Trace)";
};