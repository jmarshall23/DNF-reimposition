struct SPhysicsSoundOverride
{
	var() noexport Object.EPhysicsImpactType SoundType "Acceptable types are PHYSIMPACT_Crash, PHYSIMPACT_Roll, and PHYSIMPACT_Slide";
	var() noexport array< class<PhysicsMaterial> > OtherMaterialTypes "Acceptable other material types.  Leave empty to accept all types.";
	var() noexport array<Object.EPhysicsMassType> OtherMassTypes "Acceptable other mass types.  Leave empty to accept all types.";
	var() noexport array<Sound> Sounds "List of sounds we could play.";
	var() noexport SPhysicsEffectSoundInfo SoundInfo "Input range for velocity, output ranges for pitch and volume.";
	var() noexport bool bDisableSoundInWater "If true, this sound won't play in water.";
};