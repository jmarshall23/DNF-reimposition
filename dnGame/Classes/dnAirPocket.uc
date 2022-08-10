/*******************************************************************************
 * dnAirPocket generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnAirPocket extends RenderActor
	collapsecategories;

var() bool bInitiallyActive;
var() float BubbleSpawnPeriod;
var() int BubbleSpawnNumber;
var SoftParticleSystem AirBubbles;

simulated function PostVerifySelf()
{
	local float MaxVelZ, MaxLifetime, MinLifetime;

	super.PostVerifySelf();
	AirBubbles = SoftParticleSystem(FindMountedActor(, class'dnAirPocket_Bubbles'));
	// End:0x19B
	if(__NFUN_340__(AirBubbles, none))
	{
		MaxVelZ = __NFUN_198__(AirBubbles.InitialVelocity.Z, __NFUN_195__(0.5, AirBubbles.MaxVelocityVariance.Z));
		MaxLifetime = __NFUN_196__(__NFUN_195__(2, CollisionHeight), MaxVelZ);
		MinLifetime = __NFUN_195__(0.3, MaxLifetime);
		AirBubbles.Lifetime = __NFUN_198__(MinLifetime, __NFUN_195__(0.5, __NFUN_199__(MaxLifetime, MinLifetime)));
		AirBubbles.LifetimeVariance = __NFUN_199__(MaxLifetime, MinLifetime);
		AirBubbles.MaxVelocityVariance.X = __NFUN_196__(CollisionRadius, MaxLifetime);
		AirBubbles.MaxVelocityVariance.Y = AirBubbles.MaxVelocityVariance.X;
		AirBubbles.__NFUN_620__(CollisionRadius, 0);
		AirBubbles.SpawnNumber = __NFUN_189__(1, BubbleSpawnNumber);
		AirBubbles.SpawnPeriod = __NFUN_225__(0.01, BubbleSpawnPeriod);
		AirBubbles.SpawnOffset.Z = __NFUN_194__(CollisionHeight);
		AirBubbles.__NFUN_1052__();
		EnableBubbles(bInitiallyActive);
	}
	return;
}

simulated event Trigger(Actor Other, Pawn EventInstigator)
{
	super(Actor).Trigger(Other, EventInstigator);
	// End:0x34
	if(__NFUN_340__(AirBubbles, none))
	{
		EnableBubbles(__NFUN_145__(AirBubbles.Enabled));
	}
	return;
}

simulated event EnableBubbles(bool bEnable)
{
	// End:0x0E
	if(__NFUN_339__(AirBubbles, none))
	{
		return;
	}
	AirBubbles.Enabled = bEnable;
	// End:0x62
	if(bEnable)
	{
		AirBubbles.DisableTickWhenEmpty = false;
		AirBubbles.TickStyle = AirBubbles.default.TickStyle;		
	}
	else
	{
		AirBubbles.DisableTickWhenEmpty = true;
	}
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	PrecacheIndex.__NFUN_1266__(class'dnAirPocket_Bubbles');
	return;
}

defaultproperties
{
	bInitiallyActive=true
	BubbleSpawnPeriod=0.1
	BubbleSpawnNumber=1
	MountOnSpawn=/* Array type was not detected. */
	AnimationName=/* Unknown default property type! */
	bSurviveDismount=false
	bDontScaleByDrawScale=false
	bScaleByDrawScaleNonDefault=false
	bTransformDrawScale3DChange=false
	bTakeParentTag=false
	bTransferToCorpse=false
	bDontSetOwner=false
	MountParentTag=None
	DrawScaleOverride=0
	AppendToTag=None
	ForceTag=None
	ForceEvent=None
	MountMeshItem=None
	MountOrigin=(X=1.292418E-41,Y=2.94903E-17,Z=0)
	MountOriginVariance=(X=1.292418E-41,Y=2.94903E-17,Z=0)
	MountAngles=(Pitch=8741,Yaw=572915712,Roll=0)
	MountAnglesVariance=(Pitch=8741,Yaw=572915712,Roll=0)
	MountType=0
	DismountPhysics=0
}