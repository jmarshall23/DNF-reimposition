struct SExitWoundInfo
{
	var() noexport class<DamageType> DamageType "Which damagetype should cause this sort of exit wound? (If None, will accept all damagetypes.)";
	var() noexport float MinimumDamage "We must take at least this much damage before we consider spawning our effects for an exit wound.";
	var() noexport float RandomChance "If non-zero, this is the change (0.0 - 1.0) that if our other criteria are met, we'll spawn this decal.";
	var() noexport class<Decal> ExitWoundDecalClass "Spawn this type decal type (facing the direction the damage would exit the actor from) when damage of the correct type is taken.";
};