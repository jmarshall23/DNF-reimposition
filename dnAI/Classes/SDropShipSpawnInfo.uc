struct SDropShipSpawnInfo
{
	var() name ReleaseTag;
	var() name MountBone;
	var() noexport name FactoryTag "Tag of AIActorFactory to use";
	var() noexport name SpawnTag "Tag to spawn from just this slot";
	var AIActorFactory Factory;
	var AIActor SpawnedActor;
	var ScriptObj NextScriptObj;
	var() name RappelAttachToBone;
	var int SpecialEventID;
};