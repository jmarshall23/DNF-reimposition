struct Scale
{
	enum ESheerAxis
	{
		SHEER_None,
		SHEER_XY,
		SHEER_XZ,
		SHEER_YX,
		SHEER_YZ,
		SHEER_ZX,
		SHEER_ZY
	};

	var() config Vector Scale;
	var() config float SheerRate;
	var() config Object.Scale.ESheerAxis SheerAxis;
};