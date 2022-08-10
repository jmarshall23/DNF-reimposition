struct SConstraintInfo
{
	var() noexport bool bConstraintDisabledOnDeath "If this is true, then the actor will disable the constraint when it is destroyed. (Requires bSurviveDeath=true to do anything)";
	var() noexport bool bConstraintOnDeath "This constraint will attempt to be applied when the actor is destroyed, otherwise it will do it upon startup. (Requires bSurviveDeath=true to do anything)";
	var() noexport name BoneName "Name of the bone on this actor to use for constraining the decoration.";
	var() noexport SMountPrefab ConstraintMounting "Information for mounting this constraint to ourself.";
	var() deprecated KarmaActor OtherConstraintActor;
	var() name OtherConstraintBone;
	var() noexport class<KConstraint> ConstraintClass "A constraint of this class will be used to constrain this actor relative to its Owner if it has one, or the world otherwise.";
	var KConstraint ConstraintActor;
};