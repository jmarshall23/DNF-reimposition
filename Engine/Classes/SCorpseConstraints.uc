struct SCorpseConstraints
{
	var() name BoneName;
	var() KarmaActor Other;
	var() name OtherBoneName;
	var() class<KConstraint> ConstraintClass;
	var KConstraint Constraint;
};