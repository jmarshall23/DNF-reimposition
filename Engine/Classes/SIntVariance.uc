struct SIntVariance
{
	var() noexport int Value "The basic value which the variance is applied around.";
	var() noexport int Variance "Total amount of variance that can be applied around value. This is +/- half of this value on each side (EX: Variance=10... result is from -5 to 5).";
};