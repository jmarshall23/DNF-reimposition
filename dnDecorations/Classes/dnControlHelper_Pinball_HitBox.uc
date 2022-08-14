/*******************************************************************************
 * dnControlHelper_Pinball_HitBox generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnControlHelper_Pinball_HitBox extends dnControlHelper_Pinball
	collapsecategories;

var dnControlHelper_Pinball_HitBoxSet HitBoxSet;
var dnControlHelper_Pinball_Light Light;
var anim name UpAnim;
var anim name DownAnim;

simulated event PostBeginPlay()
{
	super(dnDecoration).PostBeginPlay();
	HitBoxSet = dnControlHelper_Pinball_HitBoxSet(Owner);
	return;
}

function Destroyed()
{
	Light.__NFUN_614__();
	super(dnDecoration).Destroyed();
	return;
}

final simulated function Reset()
{
	__NFUN_621__(,,, true);
	DecoPlayAnim(UpAnim);
	bActivated = false;
	// End:0x9E
	if(__NFUN_340__(Light, none))
	{
		Light.ActorColorList[0].ActorColor.R = 0;
		Light.ActorColorList[0].ActorColor.G = 0;
		Light.ActorColorList[0].ActorColor.B = 0;
		Light.ActorColorList[0].ActorColor.A = 255;
	}
	return;
}

final simulated function Score()
{
	__NFUN_621__(,,, false);
	DecoPlayAnim(DownAnim);
	FindAndPlaySound('Pinball_Hitbox');
	bActivated = true;
	// End:0xA9
	if(__NFUN_340__(Light, none))
	{
		Light.ActorColorList[0].ActorColor.R = 17;
		Light.ActorColorList[0].ActorColor.G = 4;
		Light.ActorColorList[0].ActorColor.B = 255;
		Light.ActorColorList[0].ActorColor.A = 255;
	}
	OwnerMachine.AwardPoints(PointsAwarded);
	return;
}

event KImpact(name SelfBoneName, KarmaActor Other, name OtherBoneName, Vector Position, Vector ImpactVelocity, Vector ImpactNormal)
{
	// End:0x28
	if(__NFUN_340__(dnControlHelper_Pinball_Ball(Other), none))
	{
		Score();
		HitBoxSet.HitBoxActivate(self);
	}
	super.KImpact(SelfBoneName, Other, OtherBoneName, Position, ImpactVelocity, ImpactNormal);
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super.RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1284__(Mesh, UpAnim);
	PrecacheIndex.__NFUN_1284__(Mesh, DownAnim);
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Pinball_Hitbox');
	return;
}

defaultproperties
{
	UpAnim=a_up
	DownAnim=a_down
	PointsAwarded=300
	HealthPrefab=0
	PhysicsEntityGroup=PinballTable
	bBlockKarma=true
	bTickOnlyRecent=false
	CollisionRadius=0
	CollisionHeight=0
	Mesh='c_generic.Pinball_Hitbox'
}