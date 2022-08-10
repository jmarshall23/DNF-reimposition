/*******************************************************************************
 * dnControlHelper_Pinball_Spacer generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnControlHelper_Pinball_Spacer extends dnControlHelper_Pinball
	collapsecategories;

var() float ValidOffset;
var() float BounceImpulse;
var() dnControlHelper_Pinball_Light FlashingLights[2];

simulated function bool AllowKImpact(dnControlHelper_Pinball_Ball Ball)
{
	return __NFUN_148__(super.AllowKImpact(Ball), __NFUN_202__(__NFUN_211__(__NFUN_244__(__NFUN_239__(Ball.Location, Location), Vector(Rotation))), __NFUN_195__(__NFUN_195__(DrawScale, DrawScale3D.X), ValidOffset)));
	return;
}

simulated function KImpactInternal(dnControlHelper_Pinball_Ball Ball)
{
	local Vector ToBall, Impulse;
	local float DotVal;
	local int i;

	super.KImpactInternal(Ball);
	ToBall = __NFUN_239__(Ball.Location, Location);
	ToBall.Z = 0;
	ToBall = __NFUN_253__(ToBall);
	Impulse = __NFUN_241__(__NFUN_232__(0, 1, 0), Rotation);
	DotVal = __NFUN_244__(ToBall, Impulse);
	// End:0x92
	if(__NFUN_201__(DotVal, 0))
	{
		__NFUN_246__(Impulse, BounceImpulse);		
	}
	else
	{
		__NFUN_246__(Impulse, __NFUN_194__(BounceImpulse));
	}
	Ball.Bounce(self, Impulse);
	OwnerMachine.AwardPoints(PointsAwarded);
	i = 0;
	J0xD2:

	// End:0x110 [Loop If]
	if(__NFUN_169__(i, 2))
	{
		// End:0x106
		if(__NFUN_340__(FlashingLights[i], none))
		{
			FlashingLights[i].Activate();
		}
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0xD2;
	}
	FindAndPlaySound('Pinball_Jetpack');
	__NFUN_607__(0.5, false, 'TurnOffLights');
	return;
}

simulated function TurnOffLights()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x45 [Loop If]
	if(__NFUN_169__(i, 2))
	{
		// End:0x3B
		if(__NFUN_340__(FlashingLights[i], none))
		{
			FlashingLights[i].Deactivate();
		}
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x07;
	}
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super.RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Pinball_Jetpack');
	return;
}

defaultproperties
{
	ValidOffset=2.5
	BounceImpulse=160
	KImpactNoiseName=Pinball_Spacer
	PointsAwarded=500
	HealthPrefab=0
	bBlockKarma=true
	bTickOnlyRecent=false
	CollisionRadius=0
	CollisionHeight=0
	DrawType=8
	StaticMesh='sm_class_decorations.Arcades.Pinball_Spacer'
}