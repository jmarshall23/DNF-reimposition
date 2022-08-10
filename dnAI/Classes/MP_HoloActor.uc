/*******************************************************************************
 * MP_HoloActor generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MP_HoloActor extends HoloActor
	config;

simulated function MagicVoodoo()
{
	local name temp;

	// End:0x1B
	if(__NFUN_341__(temp, 'Anim_Reload'))
	{
		temp = temp;
	}
	return;
}

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	__NFUN_607__(1, false, 'SetOverrideSoundPitch');
	return;
}

simulated function SetOverrideSoundPitch()
{
	SoundPitchDrawScaleOverride = Level.__NFUN_1161__().SoundPitchDrawScaleOverride;
	return;
}

event PhysicsVolumeChange(PhysicsVolume NewVolume)
{
	super(AIActor).PhysicsVolumeChange(NewVolume);
	// End:0x31
	if(NewVolume.bKillAI)
	{
		Died(,, Location,, class'FatalFallingVolumeDamage');
	}
	return;
}

function DiedActivity(optional Pawn Killer, optional int Damage, optional Vector DamageOrigin, optional Vector DamageDirection, optional class<DamageType> DamageType, optional name HitBoneName)
{
	DestroyHoloActor();
	return;
}

simulated event Destroyed()
{
	ClearGlobalPathingCache();
	super.Destroyed();
	return;
}

simulated function SaySomething()
{
	// End:0x10
	if(__NFUN_174__(int(Role), int(ROLE_Authority)))
	{
		return;
	}
	// End:0x28
	if(__NFUN_200__(HoloLifeTime, __NFUN_199__(SpeakInterval, SpeakIntervalVariance)))
	{
		return;
	}
	FindSoundAndSpeak('HoloDuke_Voice');
	// End:0x53
	if(__NFUN_145__(IsDead()))
	{
		__NFUN_607__(__NFUN_226__(SpeakInterval, SpeakIntervalVariance), false, 'SaySomething');
	}
	return;
}

defaultproperties
{
	WalkSpeedScale=0.65
	LandingThresh=9999
	HeavyLandingThresh=99999
	bDisableThrowAttack=true
	bPerformLipSync=false
	FootstepCategory=8
	GroundSpeed=260
	bAnimateOffscreen=true
	Physics=1
	bTickOnlyZoneRecent=false
	bCastStencilShadows=false
	bAlwaysRelevant=true
	bDontUseMeqonPhysics=true
	TickStyle=1
	Mesh='c_characters.duke_mp'
}