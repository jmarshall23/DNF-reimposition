struct STeleport
{
	var Vector Destination;
	var Rotator DestinationRotation;
	var class<SoftParticleSystem> StartParticleSystem;
	var class<SoftParticleSystem> EndParticleSystem;
	var Weapon_LightEx StartLight;
	var Weapon_LightEx EndLight;
	var name StartSound;
	var name EndSound;
	var ActionPoint EndActionPoint;
	var name StartAnimName;
	var name EndAnimName;
	var MaterialEx StartOverlay;
	var bool bFaceTarget;
	var bool bValid;
	var int Mode;
	var float MinTeleportDist;
	var float MaxTeleportDist;
	var float Delay;
	var bool bCantDie;
	var bool bForceLandOnFinish;
	var bool bForceJetpackOnFinish;
	var bool bSkipStartEffects;
};