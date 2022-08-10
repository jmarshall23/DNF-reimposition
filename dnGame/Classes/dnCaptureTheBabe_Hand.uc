/*******************************************************************************
 * dnCaptureTheBabe_Hand generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnCaptureTheBabe_Hand extends Pawn
	config
	collapsecategories
	dependson(dnAnimationControllerEx_Hand);

var name curanimname;

replication
{
	// Pos:0x000
	reliable if(__NFUN_169__(int(Role), int(ROLE_Authority)))
		SetAnimation;

	// Pos:0x00B
	reliable if(__NFUN_173__(int(Role), int(ROLE_Authority)))
		curanimname;
}

function DiedActivity(optional Pawn Killer, optional int Damage, optional Vector DamageOrigin, optional Vector DamageDirection, optional class<DamageType> DamageType, optional name HitBoneName)
{
	return;
}

function InitPlayerReplicationInfo()
{
	super.InitPlayerReplicationInfo();
	// End:0x2F
	if(__NFUN_148__(__NFUN_340__(PlayerReplicationInfo, none), IsMP()))
	{
		PlayerReplicationInfo.bIsABot = true;
	}
	return;
}

simulated function NU_SetClientAnim(name newname)
{
	local bool bIsLocallyControlled, bFirstPerson;
	local name AnimName;

	AnimName = newname;
	// End:0x1D
	if(__NFUN_339__(AnimationController, none))
	{
		InitializeAnimation();
	}
	dnAnimationControllerEx_Hand(AnimationController).SetAnimState(AnimName);
	return;
}

function SetAnimation(name AnimName)
{
	curanimname = AnimName;
	NU_SetClientAnim(AnimName);
	return;
}

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	InitializeAnimation();
	SetAnimation('Anim_Idle');
	SetHandHidden(true);
	return;
}

simulated function PostNetInitial()
{
	super.PostNetInitial();
	InitBabe();
	return;
}

simulated function InitBabe()
{
	return;
}

simulated function SetHandHidden(bool boHidden)
{
	__NFUN_590__(boHidden);
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super.RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1283__('Anim_Idle', AnimationControllerClass, Mesh);
	return;
}

defaultproperties
{
	bIgnoreAimAssist=true
	bUsable=true
	bGrabUsable=true
	bGrabbable=true
	UsePhrase="<?int?dnGame.dnCaptureTheBabe_Hand.UsePhrase?>"
	GrabUsePhrase="<?int?dnGame.dnCaptureTheBabe_Hand.GrabUsePhrase?>"
	AnimationControllerClass='dnAnimationControllerEx_Hand'
	bBlockActors=false
	bBlockPlayers=false
	bBlockKarma=false
	bAcceptsDecalProjectors=true
	bLowerByCollision=true
	bAlwaysRelevant=true
	bCollideActors=false
	bCollideWorld=false
	CollisionRadius=1
	MountType=2
	Style=0
	DrawType=2
	Mesh='c_characters.npc_girl_hand'
	OwnerSeeStyle=1
	RemoteRole=0
}