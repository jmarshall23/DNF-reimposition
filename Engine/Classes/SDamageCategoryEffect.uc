struct SDamageCategoryEffect
{
	var() noexport bool bMountHitFX "If true we will mount the hitFX. Note that the hitFX can not be a friend system.";
	var() noexport class<SoftParticleSystem> Effect "Effect to spawn when this material is shot by a bullet.";
	var() noexport float EffectScale "If greater than 0, this will be used to scale SystemSizeScale of the Effect.";
	var() noexport float FakeLightIntensity "Control the fake light intensity for this particle system and its friends";
	var() noexport float LifetimeOverride "Particle system lifetime override";
	var() noexport class<PhysicsAction> Action "Spawn physics action. Think explosive barrels.";
	var() noexport class<dnDecal_Delayed> EffectDecal "Decal to apply when the surface is shot.";
	var() SSoundInfo Sound;
};