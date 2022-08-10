/*******************************************************************************
 * AlienQueen_Claw_Squirt_Sensor generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AlienQueen_Claw_Squirt_Sensor extends KSphereSensor;

const kDistFactor = 1.5f;
const kSquirtFactor = 1000.0f;

var bool SensorEnabled;

simulated function bool VerifySelf()
{
	return super(Actor).VerifySelf();
	return;
}

function CopyOwnerProperties()
{
	return;
}

event BeginSenseObject(KarmaActor Actor)
{
	super(KSensor).BeginSenseObject(Actor);
	bNoNativeTick = false;
	TickStyle = 3;
	return;
}

event EndSenseObject(KarmaActor Actor)
{
	super(KSensor).EndSenseObject(Actor);
	// End:0x27
	if(__NFUN_339__(__NFUN_1122__(false, false), none))
	{
		TickStyle = 0;
		bNoNativeTick = true;
	}
	return;
}

simulated event Tick(float DeltaSeconds)
{
	local array<SKarmaInteraction> SensedActors;
	local int i;
	local Vector Offset, Direction;
	local float Dist, Intensity, CurrentVel, DesiredVel;
	local PlayerPawn P;

	super(Actor).Tick(DeltaSeconds);
	// End:0x18
	if(__NFUN_145__(SensorEnabled))
	{
		return;
	}
	SensedActors = __NFUN_1123__();
	i = __NFUN_166__(string(SensedActors), 1);
	J0x30:

	// End:0x16C [Loop If]
	if(__NFUN_172__(i, 0))
	{
		// End:0x162
		if(__NFUN_148__(__NFUN_340__(SensedActors[i].Actor, none), SensedActors[i].Actor.bIsPlayerPawn))
		{
			P = PlayerPawn(SensedActors[i].Actor);
			Offset = __NFUN_239__(P.Location, Location);
			// End:0xCD
			if(__NFUN_200__(Offset.Z, 0))
			{
				Offset.Z = 0;
			}
			Dist = __NFUN_251__(Offset);
			Intensity = __NFUN_196__(__NFUN_199__(1.5, __NFUN_227__(__NFUN_196__(Dist, SphereSensorRadius), 0, 1.5)), 1.5);
			DesiredVel = __NFUN_195__(Intensity, 1000);
			Direction = __NFUN_253__(Offset);
			// End:0x162
			if(__NFUN_200__(__NFUN_244__(P.Velocity, Direction), DesiredVel))
			{
				__NFUN_249__(P.GameplayDesiredPhysicsVelocity, __NFUN_235__(DesiredVel, Direction));
			}
		}
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0x30;
	}
	return;
}

defaultproperties
{
	SphereSensorRadius=96
	OnlySenseClasses=/* Array type was not detected. */
}