struct BumpMapInfo
{
	var() Texture NormalMap;
	var() Texture HeightMap;
	var() Texture SpecularMap;
	var() float BumpScale;
	var() float SpecularScale;
	var() bool bInvertBumps;
	var() bool bEMBM;
};