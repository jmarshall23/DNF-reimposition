struct SDesiredCrush
{
	var() noexport Object.ECrushStyle DamageHow "Specifies who and how you want to issue damage to when crushing is being inflicted.";
	var() noexport SFloatVariance Damage "How much damage you want to inflict on an actor that is being crushed.";
	var() noexport SFloatVariance Rate "How frequently you want the damage to be inflicted once it's started.";
	var float Timer;
};