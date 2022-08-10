struct SCorpseDestroyableBone
{
	var() name BoneName;
	var bool bAddToLimbCount;
	var() class<Corpse_LimbCap> LimbCapClass;
	var() SMountPrefab LimbCapMountInfo;
	var() class<dnHitFX_Spawners> DestroyedEffect;
	var() class<dnFriendFX_Spawners> FrozenDestroyedEffect;
	var() name ExplodeSound;
	var() name FrozenExplodeSound;
};