struct SGuardInfo
{
	var bool CanGuard;
	var bool IsGuardingActor;
	var bool IsGuardingPos;
	var Actor GuardedActor;
	var Vector GuardedPos;
	var float InnerRange;
	var float OuterRange;
	var float BaseInnerRange;
	var float BaseOuterRange;
	var bool bDontScaleRangeWithDrawScale;
	var bool AlignWith;
	var float AlignmentOffset;
	var float AbortRange;
	var bool MustBeVisible;
	var bool AllowAvoidDanger;
	var bool AllowDodge;
	var bool bStaticGuardHack;
	var bool bAvoidGuardedPlayer;
};