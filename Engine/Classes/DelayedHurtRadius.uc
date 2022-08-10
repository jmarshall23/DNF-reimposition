struct DelayedHurtRadius
{
	var Actor Victim;
	var Actor DamageInstigator;
	var float DamageAmount;
	var Vector RelativeDamageOrigin;
	var float DamageRadius;
	var float DamageFalloffStart;
	var class<DamageType> DamageType;
	var Vector DamageStart;
	var bool bIgnoreDrawScale;
	var float RelativeScale;
	var int DamageTime;
};