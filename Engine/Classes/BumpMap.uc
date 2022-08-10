struct BumpMap
{
	var() MaterialEx NormalMap;
	var() MaterialEx HeightMap;
	var() float BumpScale;
	var() int NumSmoothPasses;
	var() bool bHiResNormals;
	var() bool bInvertBumps;
};