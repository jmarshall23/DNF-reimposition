/*******************************************************************************
 * Bugball_WallSocket_Sensor generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Bugball_WallSocket_Sensor extends KSphereSensor
	dependson(Bugball_WallSocket);

var Bugball_sphere CurrentBugball;
var Bugball_WallSocket WallSocketOwner;

event PostLoadMap()
{
	super(Actor).PostLoadMap();
	WallSocketOwner = Bugball_WallSocket(Owner);
	return;
}

event BeginSenseObject(KarmaActor Actor)
{
	super(KSensor).BeginSenseObject(Actor);
	CurrentBugball = Bugball_sphere(Actor);
	// End:0x3C
	if(__NFUN_340__(CurrentBugball, none))
	{
		WallSocketOwner.OnSenseBugball(CurrentBugball);
	}
	return;
}

event EndSenseObject(KarmaActor Actor)
{
	super(KSensor).EndSenseObject(Actor);
	CurrentBugball = Bugball_sphere(Actor);
	// End:0x37
	if(__NFUN_340__(CurrentBugball, none))
	{
		WallSocketOwner.OnUnsenseBugball();
	}
	return;
}

defaultproperties
{
	StaticInteractionClassification=8
	bAITransparent=true
	bTickOnlyWhenOwnerShould=true
	TickStyle=2
}