/*******************************************************************************
 * TriggerKarmaMomentumRadius generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class TriggerKarmaMomentumRadius extends TriggerKarma
	collapsecategories
	notplaceable
	hidecategories(Filter,Interactivity,Karma,Lighting,Networking,Sound);

enum EMomentumFade
{
	MF_None,
	MF_Linear
};

enum ERadiusApplyDirection
{
	RADIR_Outward,
	RADIR_TriggerRotation,
	RADIR_ActorVelocity,
	RADIR_RigidBodyVelocity
};

var() noexport bool bApplyAsForce "Apply 'Momentum' as a force, not an impulse?";
var() noexport TriggerKarmaMomentumRadius.ERadiusApplyDirection ApplyInDirection "How should we figure out which way to push the objects affected by this trigger?";
var() noexport float Momentum "Impart this much momentum. If something isn't flying hard enough, trigger this multiple times to get a buildup effect.";
var() noexport float MomentumVariance "Variances for Momentum.";
var() noexport float VelocityScale "In addition to adding momentum, scale the final output velocity of the rigid body by this value.";
var() noexport float Radius "Affect objects within this distance.";
var() noexport Vector OffsetVariance "Maximum distance that the force will be imparted relative to the object's origin.";
var() noexport TriggerKarmaMomentumRadius.EMomentumFade MomentumFade "How does distance from the trigger affect applied momentum?" "" "MF_None -- ignore distance" "MF_Linear -- momentum applied = Momentum * (1 - (distance / radius))";
var() noexport deprecated name OnlyAffectTagged "Only affect objects with this Tag.";
var() noexport name AffectedBone "When a ragdoll is hit, if it has this bone it will use this. Has no other special effects on non-ragdolls or ragdolls without the specified bone.";

simulated function PostBeginPlay()
{
	super(Actor).PostBeginPlay();
	OffsetVariance = __NFUN_235__(2, __NFUN_239__(__NFUN_237__(OffsetVariance, 2), OffsetVariance));
	return;
}

simulated function Trigger(Actor Other, Pawn EventInstigator)
{
	local KarmaActor A;
	local float MomentumBase;
	local Vector Direction, ApplyLocation;

	// End:0x1A
	if(__NFUN_173__(int(ApplyInDirection), int(1)))
	{
		Direction = Vector(Rotation);
	}
	// End:0x246
	foreach __NFUN_751__(class'KarmaActor', A, Radius,, OnlyAffectTagged)
	{
		MomentumBase = __NFUN_226__(Momentum, MomentumVariance);
		// End:0x92
		if(__NFUN_173__(int(MomentumFade), int(1)))
		{
			MomentumBase = __NFUN_228__(__NFUN_227__(__NFUN_196__(__NFUN_251__(__NFUN_239__(A.Location, Location)), Radius), 0, 1), 0, MomentumBase);
		}
		switch(ApplyInDirection)
		{
			// End:0xC0
			case 0:
				Direction = __NFUN_253__(__NFUN_239__(A.Location, Location));
				// End:0x10E
				break;
			// End:0xEF
			case 3:
				// End:0xEF
				if(A.__NFUN_794__(Direction, AffectedBone))
				{
					Direction = __NFUN_253__(Direction);
					// End:0x10E
					break;
				}
			// End:0x10B
			case 2:
				Direction = __NFUN_253__(A.Velocity);
			// End:0xFFFF
			default:
				break;
		}
		// End:0x177
		if(__NFUN_148__(__NFUN_148__(__NFUN_342__(AffectedBone, 'None'), __NFUN_340__(A.__NFUN_568__(), none)), A.__NFUN_568__().__NFUN_525__(AffectedBone)))
		{
			ApplyLocation = A.__NFUN_568__().__NFUN_533__(AffectedBone, true);			
		}
		else
		{
			ApplyLocation = A.Location;
		}
		__NFUN_249__(ApplyLocation, __NFUN_232__(__NFUN_195__(__NFUN_222__(), OffsetVariance.X), __NFUN_195__(__NFUN_222__(), OffsetVariance.Y), __NFUN_195__(__NFUN_222__(), OffsetVariance.Z)));
		// End:0x1EE
		if(bApplyAsForce)
		{
			A.__NFUN_819__(__NFUN_234__(Direction, MomentumBase), ApplyLocation, AffectedBone);			
		}
		else
		{
			A.__NFUN_820__(__NFUN_234__(Direction, MomentumBase), ApplyLocation, AffectedBone);
		}
		// End:0x245
		if(__NFUN_206__(VelocityScale, 1))
		{
			A.__NFUN_790__(__NFUN_232__(VelocityScale, VelocityScale, VelocityScale), 2, AffectedBone);
		}		
	}	
	return;
}

defaultproperties
{
	VelocityScale=1
	bDirectional=true
}