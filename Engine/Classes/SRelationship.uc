struct SRelationship
{
	var() noexport class<Actor> m_aClass "The class we're setting up a relationship for.";
	var() noexport Actor.EAIAttitude m_eAttitude "Initial attitude towards this class.";
	var() noexport float m_fDamageThreshold "How much damage an actor of this class has to do to us to move us to the next lower attitude level.  This is in % of our max health, not actual health points.";
};