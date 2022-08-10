struct SMuzzleInfo
{
	var() name MuzzleFireStartAnim;
	var() name MuzzleFireAnim;
	var() name MuzzleFireStopAnim;
	var() class<SoftParticleSystem> MuzzleFlashClass;
	var() name MuzzleBoneName;
	var() Rotator MuzzleMountAngles;
	var name ShellEjectionBoneName;
	var Vector ShellEjectionDir;
	var Vector ShellEjectionVariance;
	var float ShellEjectionForce;
};