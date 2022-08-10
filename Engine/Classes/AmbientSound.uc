/*******************************************************************************
 * AmbientSound generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AmbientSound extends Keypoint
	collapsecategories
	notplaceable;

var() Object.ESoundVolumePrefab VolumePrefab;

simulated function PostBeginPlay()
{
	super(Actor).PostBeginPlay();
	// End:0x90
	if(__NFUN_174__(int(VolumePrefab), int(0)))
	{
		SoundVolume = byte(__NFUN_195__(255, Level.VolumePrefabTable[int(VolumePrefab)].Volume));
		// End:0x90
		if(__NFUN_201__(Level.VolumePrefabTable[int(VolumePrefab)].VolumeVariance, 0))
		{
			__NFUN_153__(SoundVolume, byte(__NFUN_187__(int(byte(__NFUN_195__(255, Level.VolumePrefabTable[int(VolumePrefab)].VolumeVariance))))));
		}
	}
	return;
}

defaultproperties
{
	bNeverMeshAccurate=true
	bCollisionAssumeValid=true
	bUnlisted=true
	bTickOnlyRecent=true
	bTickOnlyZoneRecent=true
	bTickOnlyNearby=true
	CollisionRadius=0
	CollisionHeight=0
	TickNearbyRadius=0
	Texture=Texture'S_Ambient'
	SoundVolume=190
	SoundRadius=1600
	SoundInnerRadius=800
}