struct SStompInfo
{
	var() noexport float StompRadius "The range at which we attempt to stomp. Should be slightly larger than StompDamageRadius";
	var() name AnimName;
	var() name BoneName;
	var() float StompDamageAmount;
	var() float StompDamageRadius;
	var() float StompDamageVel;
	var() float StompDamageLift;
	var() bool bDebug;
	var() noexport float SafeHeight "If we are this many units height than where the stomp happens, we dont take damage";
	var() noexport bool bCanStompShrunk "Can we stomp full sized pawns?";
	var() SViewShakeInfo ShakeInfo;
	var() float ShakeRadius;
	var() class<dnFriendFX_Spawners> ParticleEffectClass;
	var() array<name> AdditionalEffectBones;
	var Vector StompLocation;
	var() bool bDontFaceTarget;
	var() bool bLightRumbleOnDamage;
};