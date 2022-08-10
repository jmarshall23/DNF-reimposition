struct SPhysicsEffectUserEntry
{
	var() array<Object.EPhysicsImpactType> ImpactTypes;
	var() array< class<PhysicsMaterial> > LocalMaterialTypes;
	var() array<Object.EPhysicsMassType> LocalMassTypes;
	var() array< class<PhysicsMaterial> > OtherMaterialTypes;
	var() array<Object.EPhysicsMassType> OtherMassTypes;
	var() array<Sound> Sounds;
	var() SPhysicsEffectSoundInfo SoundInfo;
	var() bool bDisableSoundInWater;
	var() class<dnPhysicsFX_Spawners> EffectClass;
	var() dnPhysicsFX_Spawners Effect;
};