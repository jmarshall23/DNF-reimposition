/*******************************************************************************
 * dnRocket_EDFWasp_Proxy generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnRocket_EDFWasp_Proxy extends RenderActor
	collapsecategories;

var float TimeUntilRocketSpawn;

simulated function Fire()
{
	// End:0x1F
	if(__NFUN_340__(MountParent, none))
	{
		__NFUN_631__();
		__NFUN_621__(true, true, true, true, true);
		__NFUN_642__(18);
		__NFUN_817__();
	}
	__NFUN_607__(TimeUntilRocketSpawn, false, 'SpawnRocket');
	return;
}

function SpawnRocket()
{
	__NFUN_615__(class'dnRocket_EDFWasp', self,, Location, Rotation);
	__NFUN_614__();
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super(Actor).RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1266__(class'dnRocket_EDFWasp');
	return;
}

defaultproperties
{
	TimeUntilRocketSpawn=0.7
	PhysicsEntityGroup=EDFWasp
	bCollisionAssumeValid=true
	bBlockKarma=true
	bTickOnlyZoneRecent=true
	Mass=19
	DrawType=8
	StaticMesh='sm_class_decorations.EDF_Wasp_Rockets.EDFWasp_Small_Rocket'
}