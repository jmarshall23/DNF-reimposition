struct SCorpseGib
{
	var() name BoneName;
	var() array<name> ReqBones;
	var() Object RenderObject;
	var() float DrawScale;
	var() float DrawScaleVariance;
	var() Vector LocOffset;
	var() Rotator RotOffset;
	var() float Mass;
	var() float GibChance;
	var() bool bKDNoPawnInteractions;
	var() bool bExplodeOut;
	var() bool bNoBloodyMess;
	var() bool bIgnorePawnAirCushion;
	var() bool bStaticGib;
	var() class<SoftParticleSystem> GibBloodyMess;
};