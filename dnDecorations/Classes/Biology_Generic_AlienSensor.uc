/*******************************************************************************
 * Biology_Generic_AlienSensor generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Biology_Generic_AlienSensor extends KSphereSensor;

var Pawn CurrentlySensingPawn;

event BeginSenseObject(KarmaActor Actor)
{
	super(KSensor).BeginSenseObject(Actor);
	CurrentlySensingPawn = __NFUN_1122__(false, true);
	// End:0x34
	if(__NFUN_340__(CurrentlySensingPawn, none))
	{
		MountParent.__NFUN_613__('OnSenseHumanPawn');
	}
	return;
}

event EndSenseObject(KarmaActor Actor)
{
	super(KSensor).EndSenseObject(Actor);
	CurrentlySensingPawn = __NFUN_1122__(false, true);
	// End:0x24
	if(__NFUN_339__(MountParent, none))
	{
		return;
	}
	// End:0x45
	if(__NFUN_339__(CurrentlySensingPawn, none))
	{
		MountParent.__NFUN_613__('OnUnsenseHumanPawn');		
	}
	else
	{
		MountParent.__NFUN_613__('OnSenseHumanPawn');
	}
	return;
}

defaultproperties
{
	StaticInteractionClassification=7
	bAITransparent=true
	bTickOnlyWhenOwnerShould=true
}