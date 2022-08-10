/*******************************************************************************
 * dnJumpPad_Collision generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnJumpPad_Collision extends dnDecoration
	dependson(dnJumpPad);

var dnJumpPad ParentJumpPad;
var KarmaActor DeferredLaunchActor;

function PostVerifySelf()
{
	super.PostVerifySelf();
	ParentJumpPad = dnJumpPad(Owner);
	// End:0x50
	if(__NFUN_148__(__NFUN_340__(ParentJumpPad, none), __NFUN_342__(ParentJumpPad.PhysicsEntityGroup, 'None')))
	{
		__NFUN_816__(ParentJumpPad.PhysicsEntityGroup);
	}
	return;
}

simulated event WalkedOn(Pawn Other)
{
	super(KarmaActor).WalkedOn(Other);
	// End:0x2C
	if(__NFUN_340__(ParentJumpPad, none))
	{
		ParentJumpPad.LaunchActor(Other);
	}
	return;
}

simulated event KImpact(name SelfBoneName, KarmaActor Other, name OtherBoneName, Vector Position, Vector ImpactVelocity, Vector ImpactNormal)
{
	// End:0x21
	if(__NFUN_340__(ParentJumpPad, none))
	{
		ParentJumpPad.LaunchActor(Other);
	}
	super.KImpact(SelfBoneName, Other, OtherBoneName, Position, ImpactVelocity, ImpactNormal);
	return;
}

simulated event Bump(Actor Other)
{
	local dnProjectile OtherProjectile;

	OtherProjectile = dnProjectile(Other);
	// End:0x43
	if(__NFUN_148__(__NFUN_340__(ParentJumpPad, none), __NFUN_340__(OtherProjectile, none)))
	{
		SetDeferredLaunchActor(OtherProjectile);
		__NFUN_607__(1E-05, false, 'DelayedTouch');
	}
	super.Bump(Other);
	return;
}

simulated event Touch(Actor Other)
{
	local PlayerPawn OtherPlayer;

	OtherPlayer = PlayerPawn(Other);
	// End:0x58
	if(__NFUN_148__(__NFUN_148__(__NFUN_340__(ParentJumpPad, none), __NFUN_340__(OtherPlayer, none)), OtherPlayer.bDontUseMeqonPhysics))
	{
		SetDeferredLaunchActor(OtherPlayer);
		__NFUN_607__(1E-05, false, 'DelayedTouch');
	}
	return;
}

final function SetDeferredLaunchActor(KarmaActor NewLaunchActor)
{
	// End:0x1E
	if(__NFUN_340__(DeferredLaunchActor, none))
	{
		DeferredLaunchActor.bIsDeferredJumpPadLaunch = false;
	}
	DeferredLaunchActor = NewLaunchActor;
	DeferredLaunchActor.bIsDeferredJumpPadLaunch = true;
	return;
}

final simulated function DelayedTouch()
{
	// End:0x3F
	if(__NFUN_340__(DeferredLaunchActor, none))
	{
		DeferredLaunchActor.bIsDeferredJumpPadLaunch = false;
		// End:0x3F
		if(__NFUN_340__(ParentJumpPad, none))
		{
			ParentJumpPad.LaunchActor(DeferredLaunchActor);
		}
	}
	return;
}

defaultproperties
{
	HealthPrefab=0
	bPlayerFallingDamageExempt=true
	KImpactThreshold=0
	bTraceUsable=false
	bTraceShootable=false
	bAITransparent=true
	bBlockPlayers=false
	bBlockKarma=true
	bBlockParticles=false
	bHidden=true
	TickStyle=0
	DrawType=8
	StaticMesh='sm_class_decorations.alien.JumpPad_Collision'
	RemoteRole=0
}