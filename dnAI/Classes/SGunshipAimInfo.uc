struct SGunshipAimInfo
{
	var dnGunship_Base.EGunship_GunPosition GunPosition;
	var() dnGunship_Base.EGunshipGun_GunType GunType;
	var() name BoneName;
	var() bool bDebug;
	var() bool bFiringDisabled;
	var() array<name> MuzzleNames;
	var int MuzzleIndex;
	var bool bFireThisFrame;
	var float FireGate;
	var float MinFOVDot;
	var Vector MaxFOVDir;
	var() float MaxDist;
	var() bool bCheckLOS;
	var float LOSGate;
	var bool bLastLOS;
	var Vector PosThisFrame;
	var Actor TargetActor;
	var name TargetTag;
};