struct SDamageEffect
{
	var Vector DamageEffectOffset;
	var Rotator DamageEffectRotation;
	var array< class<Actor> > EffectClassList;
	var array<Actor> EffectList;
	var float DrawScale;
	var bool bOn;
	var bool bTwoStageEffect;
	var array<SSecondStageEffect> SecondStageList;
};