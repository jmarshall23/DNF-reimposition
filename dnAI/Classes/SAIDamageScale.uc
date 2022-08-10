struct SAIDamageScale
{
	var class<Actor> QualifierClass;
	var float DamageScale;
	var array< class<DamageType> > QualifierDamageTypes;
	var array< class<DamageType> > QualifierNotDamageTypes;
};