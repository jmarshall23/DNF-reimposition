/*******************************************************************************
 * AmmoCasing generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AmmoCasing extends RenderActor
	native
	collapsecategories
	notplaceable;

var int Bounces;

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	__NFUN_362__('Tick');
	return;
}

// Export UAmmoCasing::execNativeHitWall(FFrame&, void* const)
native function NativeHitWall(Vector HitNormal, Actor HitWall)
{
	//native.HitNormal;
	//native.HitWall;	
}

event HitWall(Vector HitNormal, Actor HitWall)
{
	super(Actor).HitWall(HitNormal, HitWall);
	NativeHitWall(HitNormal, HitWall);
	return;
}

final simulated function DoneRotating()
{
	// End:0x16
	if(__NFUN_173__(int(Physics), int(0)))
	{
		TickStyle = 0;
	}
	return;
}

function CopyOwnerProperties()
{
	return;
}

defaultproperties
{
	bClientSidePhysics=true
	bIgnorePawnAirCushion=true
	DynamicInteractionClassification=8
	KFriction=0.8
	Density=5
	EnableDisableThreshold=8
	bBlockCamera=false
	bIsAmmoCasing=true
	bCanExistOutOfWorld=true
	bTickOnlyZoneRecent=true
	bTickOnlyNearby=true
	bBounce=true
	bCastStencilShadows=false
	bCollideActors=true
	bCollideWorld=true
	CollisionRadius=0
	CollisionHeight=0
	TickNearbyRadius=1024
	Mass=5
	DrawType=8
	StaticMesh='sm_class_dukeitems.pistol_shell_casing.pistol_shell_casing'
	RemoteRole=0
}