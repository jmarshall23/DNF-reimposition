struct SMultiAnimInfo
{
	var() int AnimIndex;
	var() float MinTime;
	var() float RndTime;
	var() float Gate;
	var() float MinInterval;
	var() bool RequireLOS;
	var() bool RequireLOSFromWeapon;
	var() bool FaceTarget;
	var() name AnimName;
};