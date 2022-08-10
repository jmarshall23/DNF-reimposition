struct DelayedTraceFireDamage
{
	var CorpseBase Corpse;
	var Actor SourceActor;
	var class<TraceDamageType> TraceDamageType;
	var Vector SourceTraceOrigin;
	var Vector HitLocation;
	var Vector HitNormal;
	var name HitBoneName;
	var bool bExtentTrace;
	var int DamageTime;
};