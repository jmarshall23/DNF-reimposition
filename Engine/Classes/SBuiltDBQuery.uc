struct SBuiltDBQuery
{
	var() Object.EPhysicsImpactType ImpactType;
	var() byte MassFlags;
	var() float InvLocalSupportedMasses;
	var() float InvOtherSupportedMasses;
	var() float MaterialScore;
	var() int DBIndex;
};