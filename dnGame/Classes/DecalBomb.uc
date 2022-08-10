/*******************************************************************************
 * DecalBomb generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class DecalBomb extends Info
	native
	collapsecategories
	hidecategories(movement,Collision,Lighting,LightColor);

enum EDecalTexType
{
	DECALTEX_User,
	DECALTEX_Blood,
	DECALTEX_BulletHole
};

var() noexport int RandomSeed "Use this to get identical results from your decal bomb everytime. (must be > 0)";
var() noexport bool bDestroyAfterDeploy "This actor will destroy itself after it spawns the decals.";
var() noexport bool bRandomRotation "Apply a random rotation to the decal once it has attached to a surface.";
var() noexport bool bRandomFlipX "Randomly flip the X orientation of the texture once it has attached to a surface.";
var() noexport bool bRandomFlipY "Randomly flip the Y orientation of the texture once it has attached to a surface.";
var() noexport bool bInstantSpawn "When true, this will spawn decals the moment it is created.";
var() noexport bool bTriggeredSpawn "When true, will spawn decals whenever triggered.";
var() noexport bool bAutoAlignToSurface "Instead of stretching the texture based on the angle of the trace, reorient it so that it is aligned to the surface.";
var() noexport bool bCopyOwnerToDecal "Copy the owner to the decals applied";
var() noexport bool bDecalIgnoreOwner "Do not place decals on the owner";
var() noexport bool bScaleByOwner "Scale the effect and trace distances by the owner's drawscale.";
var noexport DecalBomb.EDecalTexType DecalTextureType "DEPRECATED!!  Used to be prefab textures that you could use instead of hand defining ones.";
var() noexport int TraceNum "Number of traces to send out attempting to attach decals.";
var() noexport int TraceNumVariance "Variance value to apply to TraceNum.";
var() noexport Rotator TraceRotationVariance "Range around the rotation of the decal bomb itself to vary the directions traces go out (32768=180 degrees)";
var() noexport float MinSpawnDistance "Minimum distance a new decal must be from all other decals before it will allow itself to spawn.";
var() noexport float MaxTraceDistance "Distance to trace out from the location of the decal bomb to find something to attach to.";
var() noexport float MaxViewDistance "Distance at which decal will no longer be visible.";
var() noexport float FadeOutStart "Distance at which decal will start fading out.";
var() noexport float DecalSize "Scale of the decals that get spawned.";
var() noexport float DecalSizeVariance "Random variance to apply to the scale of the decals.";
var() noexport float DecalLength "Length of the decals from their points of impact (to allow them to wrap around uneven geometry.";
var() noexport array<MaterialEx> Decals "List of textures to use for the decals to be spawned.";
var() noexport float DecalLifespan "How long the decals should last (depends on what you have set in BehaviorArgument.";
var() noexport float BehaviorArgument "Argument for level decal behavior mode.";
var() noexport Engine.Actor.EBehavior Behavior "How the level decals behave. You will never need to use DB_Normal.";
var() noexport STraceFlags TraceFlags "Flags to use for determining how this decal bomb will trace out. Modify at your own risk.";
var() noexport bool bDecalIgnorePawn "Do not place decals on pawns";
var class<dnDecal> DecalClass;

simulated event PostBeginPlay()
{
	super(Actor).PostBeginPlay();
	// End:0x15
	if(bInstantSpawn)
	{
		DecalBombDeploy();
	}
	return;
}

function bool VerifySelf()
{
	local int i;

	i = __NFUN_166__(string(Decals), 1);
	J0x0F:

	// End:0x42 [Loop If]
	if(__NFUN_172__(i, 0))
	{
		// End:0x38
		if(__NFUN_339__(Decals[i], none))
		{
			Decals.Remove(i, 1);
		}
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0x0F;
	}
	// End:0x81
	if(__NFUN_171__(string(Decals), 0))
	{
		InvalidAlert(__NFUN_302__(__NFUN_302__("Error: ", string(self)), " has no decals to spawn."));
		return false;
	}
	return super(Actor).VerifySelf();
	return;
}

simulated event Trigger(Actor Other, Pawn EventInstigator)
{
	super(Actor).Trigger(Other, EventInstigator);
	// End:0x1F
	if(bTriggeredSpawn)
	{
		DecalBombDeploy();
	}
	return;
}

final simulated function DecalBombDeploy()
{
	Warn(__NFUN_302__("Deprecated DecalBombDeploy (BUCKEYE-23718) Owner=", string(Owner)));
	StaticDeploy(self.Class, Location, Rotation, self, Owner);
	// End:0x6F
	if(bDestroyAfterDeploy)
	{
		__NFUN_614__();
	}
	return;
}

// Export UDecalBomb::execStaticDeploy(FFrame&, void* const)
native static final function StaticDeploy(class<DecalBomb> DecalBombClass, Vector inLocation, Rotator inRotation, Actor TraceActor, optional Actor inOwner)
{
	//native.DecalBombClass;
	//native.inLocation;
	//native.inRotation;
	//native.TraceActor;
	//native.inOwner;	
}

static simulated event CustomInitDefaults(Actor inOwner)
{
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	local int i;

	i = __NFUN_166__(string(Decals), 1);
	J0x0F:

	// End:0x3C [Loop If]
	if(__NFUN_172__(i, 0))
	{
		PrecacheIndex.__NFUN_1269__(Decals[i]);
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0x0F;
	}
	return;
}

defaultproperties
{
	bDestroyAfterDeploy=true
	bRandomRotation=true
	bRandomFlipX=true
	bRandomFlipY=true
	bInstantSpawn=true
	MaxTraceDistance=1000
	MaxViewDistance=1024
	DecalSize=1
	DecalLength=10
	Behavior=1
	TraceFlags=(bTraceActors=true,bMeshAccurate=true,bShotTrace=false,bUseTrace=false,bTraceTexture=false,bAbortFirstHit=false,bPawnsOnly=false,bNoFudge=false,bKarmaOnly=false,bNoParticles=true,bOnlyDynamic=false,bOnlyBlocking=false,bCameraTrace=false,bIgnoreAITransparent=false,bBeamTrace=false,bAntiMeqon=false,bIgnoreWorld=false,bIgnoreOthers=false)
	DecalClass='Engine.dnDecal_DecalBomb'
	bNetTemporary=true
	bDirectional=true
	Style=4
	Texture=Texture'S_DecalBomb'
	RemoteRole=2
}