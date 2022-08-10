struct SDestructibleBuildingPart
{
	var() StaticMesh StaticMesh;
	var() Vector Location;
	var() Rotator Rotation;
	var() Vector Scale;
	var() Object.ESkewPitchStyle SkewPitch;
	var() Object.ESkewYawRule SkewYaw;
	var() Object.ESkewRollRule SkewRoll;
	var() int RandomSeed;
	var() float OverrideSurvivalChance;
	var() float OverrideCollisionChance;
	var() float OverrideDensity;
	var() float Mass;
	var() class<PhysicsMaterial> PhysicsMaterial;
	var() bool bDefaultInteractionClass;
};