/*******************************************************************************
 * dnControl_Turret_SuperTurret generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnControl_Turret_SuperTurret extends dnControl_Turret
	collapsecategories;

const kSuperTurretExit_Left = 0;
const kSuperTurretExit_Right = 1;
const kSuperTurretExit_Kaboom = 2;

struct SSuperTurretExitAnims
{
	var() name EnterName;
	var() name ExitName;
};

struct STurretProjectileHitEffect
{
	var() array<name> HitTags;
	var() array< class<dnFriendFX_Spawners> > ParticleSpawners;
};

var() noexport bool bUseLowIdle "If true, user will have to trigger SE_PowerUp to bring user into final idle.";
var(dnTurret) noexport int ShotDistance "Max distance shot will travel";
var(dnTurret) noexport name EjectPlayerTag "Trigger this to eject the player";
var(dnTurret) noexport float DirectDamage "Damage from a direct single shot.";
var(dnTurret) noexport float RadialDamage "Max damage from an indirect single shot.";
var(dnTurret) noexport float RadialDamageRadius "Max radius for indirect damage.";
var(dnTurret) noexport float ExhaustTime "Seconds for exhaust to be enabled after a shot";
var(dnTurret) noexport float LightTime "Seconds to wait before turning off the muzzle light";
var(dnTurret) class<Actor> ExplosionClass;
var(dnTurret) class<TraceDamageType> TraceDamageType;
var(dnTurret) noexport int MaxTracePenetrationCount "maximum number of times the trace can penetrate things.";
var(dnTurretEvents) deprecated name SE_Kaboom;
var(dnTurretEvents) noexport deprecated name SE_Damaged "Trigger this to cause the damage effect on the user of the turret.  Does nothing if there is no user.";
var(dnTurretEvents) noexport deprecated name SE_PowerUp "Trigger this to cause the player to play the power up animation for the turret.";
var(dnTurretEffects) array<STurretProjectileHitEffect> ProjectileHitEffects;
var bool bFireLeft;
var array<SSuperTurretExitAnims> MyExitAnimNames;
var class<dnFriendFX_Spawners> FireEffectClass;
var SoftParticleSystem FireFX[6];
var SoftParticleSystem FireEffect;
var LightEx MuzzleLight;
var LightEx HeatLight[3];
var RenderActor MuzzleFlash;
var dnFriendFX_Spawners TracerEffect;
var DecoActivities_Spawn TracerInfo[2];
var Rotator ProjectileRotation;

simulated function Rotator GetProjectileRotation()
{
	return ProjectileRotation;
	return;
}

simulated event Actor GetIKActor(name LimbID)
{
	return self;
	return;
}

simulated event PreBeginPlay()
{
	__NFUN_718__('Kaboom', SE_Kaboom);
	__NFUN_718__('ScriptedDamage', SE_Damaged);
	__NFUN_718__('PowerUp', SE_PowerUp);
	super.PreBeginPlay();
	return;
}

simulated event PostBeginPlay()
{
	local int i;

	super(dnUsableSomething).PostBeginPlay();
	i = 0;
	J0x0D:

	// End:0x7B [Loop If]
	if(__NFUN_169__(i, 6))
	{
		FireFX[i] = SoftParticleSystem(FindMountedActor(__NFUN_343__(__NFUN_302__("ExhaustFX", string(i)))));
		// End:0x71
		if(__NFUN_340__(FireFX[i], none))
		{
			FireFX[i].DestroyOnDismount = false;
		}
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x0D;
	}
	i = 0;
	J0x82:

	// End:0x162 [Loop If]
	if(__NFUN_169__(i, 3))
	{
		HeatLight[i] = LightEx(FindMountedActor(__NFUN_343__(__NFUN_302__("HeatLight", string(i)))));
		// End:0x158
		if(__NFUN_340__(HeatLight[i], none))
		{
			HeatLight[i].DestroyOnDismount = false;
			HeatLight[i].bCastStencilShadows = false;
			HeatLight[i].LightColor = NewColorBytes(0, 0, 0, 255);
			HeatLight[i].LightRadius = 96;
			HeatLight[i].LightIntensity = 3;
		}
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x82;
	}
	DisableExhaust();
	MuzzleLight = LightEx(FindMountedActor('MuzzleLight'));
	// End:0x1A2
	if(__NFUN_340__(MuzzleLight, none))
	{
		MuzzleLight.DestroyOnDismount = false;
		LightOff();
	}
	MuzzleFlash = RenderActor(FindMountedActor('MuzzleFlash'));
	// End:0x1E4
	if(__NFUN_340__(MuzzleFlash, none))
	{
		MuzzleFlash.__NFUN_590__(true);
		MuzzleFlash.DestroyOnDismount = false;
	}
	TracerEffect = dnFriendFX_Spawners(FindStaticActor(class'SuperTurret_Tracer_Spawner'));
	// End:0x22D
	if(__NFUN_173__(int(Level.Game.Difficulty), 3))
	{
		DirectDamage = __NFUN_207__(DirectDamage, 1.5);
	}
	return;
}

simulated function EnableExhaust()
{
	local int i;

	return;
}

simulated function DisableExhaust()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x35 [Loop If]
	if(__NFUN_169__(i, 6))
	{
		FireFX[i].Enabled = false;
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x07;
	}
	return;
}

simulated function LightOff()
{
	MuzzleLight.LightStyle = 0;
	return;
}

function TriggerFunc_Kaboom()
{
	local int stateIndex;

	// End:0x0E
	if(__NFUN_339__(User, none))
	{
		return;
	}
	bManipulateViewOnDetach = false;
	FindStateIndex('DetachUser', stateIndex);
	UsableExits[0].bEnabled = false;
	UsableExits[1].bEnabled = false;
	UsableExits[2].bEnabled = true;
	bExitAssumeValid = true;
	// End:0x87
	if(__NFUN_340__(dnControlRemapperEx_Turret(InternalControlRemapper), none))
	{
		dnControlRemapperEx_Turret(InternalControlRemapper).CRViewAlphaFadeTime = 0.13;
	}
	DetachAlphaRate = 5;
	DetachPawn(true);
	CriticalDamage();
	return;
}

function TriggerFunc_ScriptedDamage()
{
	// End:0x0E
	if(__NFUN_339__(User, none))
	{
		return;
	}
	ControlEvent(, 'ScriptedDamage');
	return;
}

function TriggerFunc_PowerUp()
{
	// End:0x0E
	if(__NFUN_339__(User, none))
	{
		return;
	}
	ControlEvent(, 'PowerUp');
	return;
}

k2call simulated function AnimEvent_TurretActivate(optional EventInfo AnimEventInfo)
{
	FindAndPlaySound('SuperTurret_Activate', 1);
	return;
}

k2call simulated function AnimEvent_TurretHitGround(optional EventInfo AnimEventInfo)
{
	DecoActivity(0, 'SuperTurret_HitGround');
	return;
}

simulated event float GetBaseDamage(Actor Victim, optional Pawn Instigator, optional class<DamageType> DamageType, optional Vector HitDirection, optional Vector HitLocation, optional name BoneName, optional Vector SourceTraceOrigin)
{
	return DirectDamage;
	return;
}

simulated function FireShot()
{
	local Vector TraceStart, TraceEnd, TraceDir, MuzzleLoc;
	local Rotator MuzzleRot;
	local int i, Idx;
	local Actor HitActor;
	local STraceHitResult Result;

	super.FireShot();
	FindAndPlaySound('SuperTurret_Fire', 1);
	EnableExhaust();
	__NFUN_607__(ExhaustTime, false, 'DisableExhaust');
	MuzzleLight.LightStyle = MuzzleLight.default.LightStyle;
	__NFUN_607__(LightTime, false, 'LightOff');
	// End:0x84
	if(__NFUN_148__(__NFUN_339__(FireEffect, none), __NFUN_340__(FireEffectClass, none)))
	{
		FireEffect = SoftParticleSystem(FindStaticActor(FireEffectClass));
	}
	// End:0x141
	if(__NFUN_340__(FireEffect, none))
	{
		FireEffect.__NFUN_645__(MeshInstance.__NFUN_533__('mount_beam', true, false));
		FireEffect.__NFUN_652__(MeshInstance.__NFUN_534__('mount_beam', true, false));
		FireEffect.SystemSizeScale = __NFUN_196__(__NFUN_195__(FireEffect.default.SystemSizeScale, DrawScale), default.DrawScale);
		// End:0x12B
		if(FireEffect.bIsFriendSpawner)
		{
			dnFriendFX_Spawners(FireEffect).ExecuteEffect(true);			
		}
		else
		{
			FireEffect.Trigger(self, User);
		}
	}
	MuzzleLoc = MeshInstance.__NFUN_533__('mount_beam', true, false);
	MuzzleRot = MeshInstance.__NFUN_534__('mount_beam', true);
	// End:0x1E9
	if(__NFUN_340__(PlayerUser, none))
	{
		MuzzleRot.Pitch = PlayerUser.CalcedViewRotation.Pitch;
		TraceDir = Vector(MuzzleRot);
		TraceStart = __NFUN_238__(PlayerUser.CalcedViewLocation, __NFUN_235__(__NFUN_244__(__NFUN_239__(MuzzleLoc, PlayerUser.CalcedViewLocation), TraceDir), TraceDir));		
	}
	else
	{
		TraceStart = MuzzleLoc;
	}
	TraceEnd = __NFUN_238__(TraceStart, __NFUN_235__(float(ShotDistance), Vector(MuzzleRot)));
	// End:0x2AF
	if(__NFUN_340__(GetTraceTarget(TraceStart, TraceEnd, Result), none))
	{
		ProjectileRotation = Rotator(__NFUN_253__(__NFUN_239__(Result.Location, MuzzleLoc)));
		ProjectileRotation = __NFUN_283__(__NFUN_270__(ProjectileRotation, MuzzleRot));
		ProjectileRotation.Pitch = __NFUN_191__(ProjectileRotation.Pitch, -1000, 1000);
		ProjectileRotation.Yaw = __NFUN_191__(ProjectileRotation.Yaw, -1000, 1000);
		ProjectileRotation = __NFUN_269__(ProjectileRotation, MuzzleRot);		
	}
	else
	{
		ProjectileRotation = MuzzleRot;
	}
	DecoActivity(0, 'SuperTurret_FireProjectile');
	// End:0x3CE
	if(__NFUN_148__(__NFUN_340__(TracerEffect, none), __NFUN_628__('mount_beam', MuzzleLoc, MuzzleRot)))
	{
		TracerEffect.__NFUN_652__(ProjectileRotation);
		Idx = int(bFireLeft);
		// End:0x3CE
		if(__NFUN_340__(TracerInfo[Idx], none))
		{
			i = __NFUN_166__(string(TracerInfo[Idx].MountedSpawns), 1);
			J0x33A:

			// End:0x3CE [Loop If]
			if(__NFUN_172__(i, 0))
			{
				TracerEffect.__NFUN_645__(__NFUN_238__(MuzzleLoc, __NFUN_263__(TracerInfo[Idx].MountedSpawns[i].MountPrefab.MountOrigin, MuzzleRot)));
				TracerEffect.SystemSizeScale = __NFUN_196__(__NFUN_195__(TracerEffect.default.SystemSizeScale, DrawScale), default.DrawScale);
				TracerEffect.ExecuteEffect(true);
				__NFUN_185__(i);
				// [Loop Continue]
				goto J0x33A;
			}
		}
	}
	bFireLeft = __NFUN_145__(bFireLeft);
	return;
}

simulated event TraceFireMaterialHit(class<DamageType> TraceDamageType, Actor HitActor, Vector HitLocation, Vector HitNormal, class<Material> HitMaterial, bool bNoDecal)
{
	super(Actor).TraceFireMaterialHit(TraceDamageType, HitActor, HitLocation, HitNormal, HitMaterial, bNoDecal);
	Instigator = User;
	HurtRadius(RadialDamage, HitLocation, RadialDamageRadius, 0, class'CannonDamage', Location);
	__NFUN_615__(ExplosionClass, self,, HitLocation, Rotator(HitNormal));
	return;
}

simulated function bool OverrideExplosionEffect(Projectile Proj, Vector HitLocation, optional Vector HitNormal, optional Actor HitActor)
{
	local int i, j, K;
	local dnFriendFX_Spawners Spawner;

	// End:0x159
	if(__NFUN_340__(HitActor, none))
	{
		i = 0;
		J0x13:

		// End:0x159 [Loop If]
		if(__NFUN_169__(i, string(ProjectileHitEffects)))
		{
			j = 0;
			J0x2A:

			// End:0x14F [Loop If]
			if(__NFUN_169__(j, string(ProjectileHitEffects[i].HitTags)))
			{
				// End:0x145
				if(__NFUN_148__(__NFUN_342__(ProjectileHitEffects[i].HitTags[j], 'None'), __NFUN_341__(ProjectileHitEffects[i].HitTags[j], HitActor.Tag)))
				{
					K = 0;
					J0x9A:

					// End:0x143 [Loop If]
					if(__NFUN_169__(K, string(ProjectileHitEffects[i].ParticleSpawners)))
					{
						// End:0xD5
						if(__NFUN_339__(ProjectileHitEffects[i].ParticleSpawners[K], none))
						{
							// [Explicit Continue]
							goto J0x139;
						}
						Spawner = FindFriendSpawner(ProjectileHitEffects[i].ParticleSpawners[K]);
						// End:0x139
						if(__NFUN_340__(Spawner, none))
						{
							Spawner.__NFUN_645__(HitLocation);
							Spawner.__NFUN_652__(Rotator(HitNormal));
							Spawner.ExecuteEffect(true);
						}
						J0x139:

						__NFUN_184__(K);
						// [Loop Continue]
						goto J0x9A;
					}
					return true;
				}
				__NFUN_184__(j);
				// [Loop Continue]
				goto J0x2A;
			}
			__NFUN_184__(i);
			// [Loop Continue]
			goto J0x13;
		}
	}
	return super.OverrideExplosionEffect(Proj, HitLocation, HitNormal, HitActor);
	return;
}

simulated function bool CanFire()
{
	return __NFUN_148__(bFiringEnabled, __NFUN_145__(bOverheated));
	return;
}

simulated function StartOverheatedState()
{
	super.StartOverheatedState();
	FindAndPlaySound('MachinegunTurret_Overheat', 1);
	return;
}

simulated function MaybeFireShot()
{
	return;
}

simulated function AnimCallback_UserAttached()
{
	super(dnControl).AnimCallback_UserAttached();
	// End:0x1E
	if(bUseLowIdle)
	{
		ControlEvent(, 'IdleLow');		
	}
	else
	{
		ControlEvent(, 'idle');
	}
	return;
}

event EnumerateRawAnimationSequences(out array<SAnimationEnumeration> References)
{
	local int i;

	super(dnControl).EnumerateRawAnimationSequences(References);
	i = 0;
	J0x12:

	// End:0xA2 [Loop If]
	if(__NFUN_169__(i, string(MyExitAnimNames)))
	{
		// End:0x5D
		if(__NFUN_342__(MyExitAnimNames[i].EnterName, 'None'))
		{
			AddAnimationEnumeration(References, MyExitAnimNames[i].EnterName, Mesh);
		}
		// End:0x98
		if(__NFUN_342__(MyExitAnimNames[i].ExitName, 'None'))
		{
			AddAnimationEnumeration(References, MyExitAnimNames[i].ExitName, Mesh);
		}
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x12;
	}
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	local int i, j;

	super.RegisterPrecacheComponents(PrecacheIndex);
	i = __NFUN_166__(string(ProjectileHitEffects), 1);
	J0x1A:

	// End:0x81 [Loop If]
	if(__NFUN_172__(i, 0))
	{
		j = __NFUN_166__(string(ProjectileHitEffects[i].ParticleSpawners), 1);
		J0x3F:

		// End:0x77 [Loop If]
		if(__NFUN_172__(j, 0))
		{
			PrecacheIndex.__NFUN_1266__(ProjectileHitEffects[i].ParticleSpawners[j]);
			__NFUN_185__(j);
			// [Loop Continue]
			goto J0x3F;
		}
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0x1A;
	}
	i = __NFUN_166__(string(MyExitAnimNames), 1);
	J0x90:

	// End:0xE9 [Loop If]
	if(__NFUN_172__(i, 0))
	{
		PrecacheIndex.__NFUN_1284__(Mesh, MyExitAnimNames[i].EnterName);
		PrecacheIndex.__NFUN_1284__(Mesh, MyExitAnimNames[i].ExitName);
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0x90;
	}
	PrecacheIndex.__NFUN_1266__(FireEffectClass);
	PrecacheIndex.__NFUN_1266__(class'SuperTurret_Tracer_Spawner');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'SuperTurret_Activate');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'SuperTurret_Fire');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'MachinegunTurret_Overheat');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'SuperTurret_NoFire');
	return;
}

state() FireDown
{
	simulated event BeginState()
	{
		super.BeginState();
		MaybeFireShot();
		return;
	}

	simulated function AnimCallback_UserAnimEnd()
	{
		global.AnimCallback_UserAnimEnd();
		MaybeFireShot();
		return;
	}

	simulated function MaybeFireShot()
	{
		// End:0x12
		if(CanFire())
		{
			FireShot();			
		}
		else
		{
			ControlEvent(, 'CantFire');
		}
		return;
	}
	stop;
}

state() FiringStop
{	stop;
}

state() ScriptedDamage
{	stop;
}

state() PowerUp
{	stop;
}

state() AttachUserAnim
{
	function BeginState()
	{
		super(Object).BeginState();
		__NFUN_577__('RenderProperties', 'Power', 1,, 5);
		return;
	}

	function PlayMyAnim()
	{
		// End:0x32
		if(__NFUN_174__(string(UsableExits), 1))
		{
			States[CurrentStateIndex].MyAnim.Animation = MyExitAnimNames[ActiveUsableExit].EnterName;
		}
		global.PlayMyAnim();
		return;
	}

	function EndState()
	{
		super.EndState();
		DecoActivity(0, 'SuperTurret_Engage');
		return;
	}
	stop;
}

state() DetachUser
{
	function BeginState()
	{
		super.BeginState();
		DecoActivity(0, 'SuperTurret_Disengage');
		__NFUN_577__('RenderProperties', 'Power', 0,, 5);
		return;
	}

	function PlayMyAnim()
	{
		// End:0x32
		if(__NFUN_174__(string(UsableExits), 1))
		{
			States[CurrentStateIndex].MyAnim.Animation = MyExitAnimNames[ActiveUsableExit].ExitName;
		}
		global.PlayMyAnim();
		return;
	}
	stop;
}

state() AttachUserAnimInstant
{
	function EndState()
	{
		super(Object).EndState();
		__NFUN_577__('RenderProperties', 'Power', 1,, 5);
		DecoActivity(0, 'SuperTurret_Engage');
		AttachUserAnimEndState();
		return;
	}
	stop;
}

state() IdleLow extends idle
{	stop;
}

defaultproperties
{
	ShotDistance=50000
	DirectDamage=50
	RadialDamage=50
	RadialDamageRadius=100
	ExhaustTime=0.5
	LightTime=0.1
	ExplosionClass='dnParticles.dnTurret_Cannon'
	MyExitAnimNames(0)=(Z=/* Unknown default property type! */,ExitName=a_superturret_deactivateleft)
	MyExitAnimNames(1)=(EnterName=a_superturret_activateright,ExitName=a_superturret_deactivateright)
	MyExitAnimNames(2)=(EnterName=None,ExitName=a_superturret_boom)
	MyExitAnimNames(3)=(FireEffectClass='p_Weapons.SuperTurret_MuzzleFlash.SuperTurret_MuzzleFlash_Spawner',TracerInfo=DecoActivities_Spawn'dnControl_Turret_SuperTurret.DA_Spawn_SuperTurret_RocketA',TracerInfo[1]=DecoActivities_Spawn'dnControl_Turret_SuperTurret.DA_Spawn_SuperTurret_RocketB',MinPitch=-4096,MaxPitch=8192,MinYaw=-16384,MaxYaw=16384,ShotRate=0.7,PitchAimRate=8192,YawAimRate=8192,RotatePitchAdjust=-4096,RotationSoundName=SuperTurret_Rotation,RotationSoundModSideways=(Min=0,Max=0),RotationSoundModUpDown=(Min=0,Max=0),FireHeightBoneName=mount_beam,Crosshair='dt_hud.crosshairs.SuperTurret_Crosshair_fb',FireViewShake=(bNoLerp=false,bToggleSign=true,Style=3,Function=0,FalloffActor=none,FalloffDistance=0,ShakeDuration=0.5,ShakeFrequency=0.05,ShakeMagnitude=1000,ShakeFullMagnitude=0,ShakeFullMagnitudeTime=0,ShakeName=SuperTurret_Fire_Shake),FireRumble=(RumbleName=SuperTurret_Rumble,RumbleDuration=0.19,RumbleLeftMagnitude=0.55,RumbleRightMagnitude=0.18,FalloffActor=none,FalloffDistance=0),OverheatMaxTime=5,CoolDownTime=3,CoolDownLevel=50,HeatPerShot=1.5,OverheatNoFireSound=SuperTurret_NoFire,OverheatWarnTimePCT=0.8,OverheatSmokeClass='p_Weapons.MG42_MuzzleFlash.MG42_Overheat_Main',OverheatMountName=mount_beam,OverheatScale=10,CrosshairIndex=15,States=/* Array type was not detected. */,Flags=/* Unknown default property type! */,DrawScale=/* Unknown default property type! */,X=/* Array type was not detected. */)
	MyExitAnimNames(4)=(Transitions=/* Array type was not detected. */,Y=
/* Exception thrown while deserializing Y
System.ArgumentOutOfRangeException: startIndex cannot be larger than length of string.
Parameter name: startIndex
   at System.String.Substring(Int32 startIndex, Int32 length)
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 578 */,CustomName=None,NewState=AttachUserLERP)
	MyExitAnimNames(5)=(UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=/* Array type was not detected. */),SlotPriority=0,VolumePrefab=0,Slots=/* Array type was not detected. */)
	MyExitAnimNames(6)=(Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0),Velocity3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0)
	MyExitAnimNames(7)=none
	MyExitAnimNames(8)=(Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=/* Array type was not detected. */)
	MyExitAnimNames(9)=(Filters=/* Array type was not detected. */)
	MyExitAnimNames(10)=none
	MyExitAnimNames(11)=(MySoundName=None,SubAnims=/* Array type was not detected. */)
	MyExitAnimNames(12)=none
	MyExitAnimNames(13)=(StateName=AttachUserLERP,OutEvents=/* Array type was not detected. */)
	MyExitAnimNames(14)=(Transitions=/* Array type was not detected. */,Y=
/* Exception thrown while deserializing Y
System.ArgumentOutOfRangeException: startIndex cannot be larger than length of string.
Parameter name: startIndex
   at System.String.Substring(Int32 startIndex, Int32 length)
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 578 */,CustomName=None,NewState=AttachUserAnim)
	MyExitAnimNames(15)=(UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=/* Array type was not detected. */),SlotPriority=0,VolumePrefab=0,Slots=/* Array type was not detected. */)
	MyExitAnimNames(16)=(Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0),Velocity3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0)
	MyExitAnimNames(17)=none
	MyExitAnimNames(18)=(Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=/* Array type was not detected. */)
	MyExitAnimNames(19)=(Filters=/* Array type was not detected. */)
	MyExitAnimNames(20)=none
	MyExitAnimNames(21)=(MySoundName=None,SubAnims=/* Array type was not detected. */)
	MyExitAnimNames(22)=none
	MyExitAnimNames(23)=(StateName=AttachUserAnim,OutEvents=/* Array type was not detected. */)
	MyExitAnimNames(24)=(Transitions=/* Array type was not detected. */,X=
/* Exception thrown while deserializing X
System.ArgumentOutOfRangeException: startIndex cannot be larger than length of string.
Parameter name: startIndex
   at System.String.Substring(Int32 startIndex, Int32 length)
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 578 */,CustomName=idle,NewState=idle)
	MyExitAnimNames(25)=(ControlEvent=0,CustomName=IdleLow,NewState=IdleLow)
	MyExitAnimNames(26)=(UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=/* Array type was not detected. */),SlotPriority=0,VolumePrefab=0,Slots=/* Array type was not detected. */)
	MyExitAnimNames(27)=(Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0),Velocity3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0)
	MyExitAnimNames(28)=none
	MyExitAnimNames(29)=(Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=/* Array type was not detected. */)
	MyExitAnimNames(30)=(Filters=/* Array type was not detected. */)
	MyExitAnimNames(31)=none
	MyExitAnimNames(32)=(MySoundName=None,SubAnims=/* Array type was not detected. */)
	MyExitAnimNames(33)=none
	MyExitAnimNames(34)=(StateName=DetachUser,OutEvents=/* Array type was not detected. */)
	MyExitAnimNames(35)=(Transitions=/* Array type was not detected. */,Y=
/* Exception thrown while deserializing Y
System.ArgumentOutOfRangeException: startIndex cannot be larger than length of string.
Parameter name: startIndex
   at System.String.Substring(Int32 startIndex, Int32 length)
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 578 */,CustomName=None,NewState=DetachUserLERP)
	MyExitAnimNames(36)=(UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=/* Array type was not detected. */),SlotPriority=0,VolumePrefab=0,Slots=/* Array type was not detected. */)
	MyExitAnimNames(37)=(Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0),Velocity3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0)
	MyExitAnimNames(38)=none
	MyExitAnimNames(39)=(Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=/* Array type was not detected. */)
	MyExitAnimNames(40)=(Filters=/* Array type was not detected. */)
	MyExitAnimNames(41)=none
	MountOrigin="~j#}i#u?~Vu?}h#u?p.?&Om8O?p8K\" ???I\"    E\" ???D\" @  f7$333?C\"    B\"    j7\" ???Ay4@ZHo$    p$    u?ZHo$    p$    u?{zy?&uZCFtS s? QU M
 N
$    i$   ?h$??L=a\"?  _\"    ]$    [g#u?rZA(f#~$\\?B>}$???|$?Q8>M
 N
$    u?i$  ?@|7$  @@n$  HBg$  ??lHk$??L?i?hzC8$   AX\"   @i0PlU	 RY'LVu?Ksu?SVu?WVu?VZNEZ|#MS {S zS yS vS ES xS FS u? Vu?}\"    &$    w$    u?Qjb@fS iS JVu?j !	 n C p	 H$    I$    B$    A$    ?$    G$    $    D$    Zl?sS PS eS YS dS @S ]S `S cS mS aS _S ^S \\S [S u?rZQCOS qS X UZ$    $    $    u?NZ$    $    $    u?u?\"    >$    t\"    \"\"    oZZ&W$    V$    T$    SVu?RVu?u?kVu?h	 g	 u?XVu?T	 u?PsU	 RY'LVu?Ktu?SVu?WVu?VZNEZ|#MS {S zS yS vS ES xS FS u? Vu?}\"    &$    w$    u?Qjb@fS iS JVu?j !	 n C p	 H$    I$    B$    A$    ?$    G$    $    D$    Zl?sS PS eS YS dS @S ]S `S cS mS aS _S ^S \\S [S u?rZQCOS qS X UZ$    $    $    u?NZ$    $    $    u?u?\"    >$    t\"    \"\"    oZZ&W$    V$    T$    SVu?RVu?u?kVu?h	 g	 u?XVu?T	 u?PtU	 RY!' LtKtu?' LO
KO
u?SVu?WVu?VZNEZ|#MS {S zS yS vS ES xS FS u? Vu?}\"    &$    w$    u?Qjb@fS iS JVu?j !	 n C p	 H$    I$    B$    A$    ?$    G$    $    D$    Zl?sS PS eS YS dS @S ]S `S cS mS aS _S ^S \\S [S u?rZQCOS qS X UZ$    $    $    u?NZ$    $    $    u?u?\"    >$    t\"    \"\"    oZZ&W$    V$    T$    SVu?RVu?u?kVu?h	 g	 u?XVu?T	 u?PZU	 RY'LVu?Kiu?SVu?WVu?VZNEZ|#MS {S zS yS vS ES xS FS u? Vu?}\"    &$    w$    u?Qjb@fS iS JVu?j !	 n C p	 H$    I$    B$    A$    ?$    G$    $    D$    Zl?sS PS eS YS dS @S ]S `S cS mS aS _S ^S \\S [S u?rZQCOS qS X UZ$    $    $    u?NZ$    $    $    u?u?\"    >$    t\"    \"\"    oZZ&W$    V$    T$    SVu?RVu?u?kVu?h	 g	 u?XVu?T	 u?PiU	 RY'LVu?Klu?SVu?WVu?VZNEZ|#MS {S zS yS vS ES xS FS u? Vu?}\"    &$    w$    u?Qjb@fS iS JVu?j !	 n C p	 H$    I$    B$    A$    ?$    G$    $    D$    Zl?sS PS eS YS dS @S ]S `S cS mS aS _S ^S \\S [S u?rZQCOS qS X UZ$    $    $    u?NZ$    $    $    u?u?\"    >$    t\"    \"\"    oZZ&W$    V$    T$    SVu?RVu?u?kVu?h	 g	 u?XVu?T	 u?PtU	 RYE'LVu?Ku?'LVu?KZu?' L]K]u?' LoKou?ScWVu?VZNCZ|#M? {S zS yS vS ES xS FS u? f}\"    &$    w$    u?Qjb@fS iS JVu?j !	 n C p	 H$    I$    B$    A$    ?$    G$    $    D$    Zl?sS PS eS YS dS @S ]S `S cS mS aS _S ^S \\S [S u?rZQCOS qS X UZ$    $    $    u?NZ$    $    $    u?u?\"    >$    t\"    \"\"    oZZ&W$    V$    T$    SVu?RVu?u?kVu?h	 g	 u?XVu?T	 u?PU	 RYC'LVu?Kh	u?' LHKtu?' LoKh	u?' L]K]u?SYWVu?VZNCZ|#M? {S zS yS vS ES xS FS u? e#}\"    &$   @w$    u?Qjb@fS iS JVu?j !	 n C p	 H$    I$    B$    A$    ?$    G$    $    D$    Zl?sS PS eS YS dS @S ]S `S cS mS aS _S ^S \\S [S u?rZQCOS qS X UZ$    $    $    u?NZ$    $    $    u?u?\"    >$    t\"    \"\"    oZZ&W$    V$    T$    SVu?RVu?u?kVu?h	 g	 u?XVu?T	 u?PoU	 RY3'LVu?KZu?' LXKtu?' L]K]u?ScWVu?VZNCZ|#M? {S zS yS vS ES xS FS u? f}\"    &$    w$    u?Qjb@fS iS JVu?j !	 n C p	 H$    I$    B$    A$    ?$    G$    $    D$    Zl?sS PS eS YS dS @S ]S `S cS mS aS _S ^S \\S [S u?rZQCOS qS X UZ$    $    $    u?NZ$    $    $    u?u?\"    >$    t\"    \"\"    oZZ&W$    V$    T$    SVu?RVu?u?kVu?h	 g	 u?XVu?T	 u?PO
U	 RY' LGKGu?Sg>WVu?VZNCZ|#M? {S zS yS vS ES xS FS u? f}\"    &$    w$    u?Qjb@fS iS JVu?j !	 n C p	 H$    I$    B$    A$    ?$    G$    $    D$    Zl?sS PS eS YS dS @S ]S `S cS mS aS _S ^S \\S [S u?rZQCOS qS X UZ$    $    $    u?NZ$    $    $    u?u?\"    >$    t\"    \"\"    oZZ&W$    V$    T$    SVu?RVu?u?kVu?h	 g	 u?XVu?T	 u?Ph	U	 RY#'	LVu?Ktu?' L]K]u?SVu?WVu?VZNEZ|#MS {S zS yS vS ES xS FS u? Vu?}\"    &$    w$    u?Qjb@fS iS JVu?j !	 n C p	 H$    I$    B$    A$    ?$    G$    $    D$    Zl?sS PS eS YS dS @S ]S `S cS mS aS _S ^S \\S [S u?rZQCOS qS X UZ$    $    $    u?NZ$    $    $    u?u?\"    >$    t\"    \"\"    oZZ&W$    V$    T$    SVu?RVu?u?kVu?h	 g	 u?XVu?T	 u?P]U	 RY'	LVu?Ktu?Si>WVu?VZNEZ|#MS {S zS yS vS ES xS FS u? Vu?}\"    &$    w$    u?Qjb@fS iS JVu?j !	 n C p	 H$    I$    B$    A$    ?$    G$    $    D$    Zl?sS PS eS YS dS @S ]S `S cS mS aS _S ^S \\S [S u?rZQCOS qS X UZ$    $    $    u?NZ$    $    $    u?u?\"    >$    t\"    \"\"    oZZ&W$    V$    T$    SVu?RVu?u?kVu?h	 g	 u?XVu?T	 u?PGU	 RY'	LVu?Ktu?Se>WVu?VZNCZ|#M? {S zS yS vS ES xS FS u? f}\"    &$    w$    u?Qjb@fS iS JVu?j !	 n C p	 H$    I$    B$    A$    ?$    G$    $    D$    Zl?sS PS eS YS dS @S ]S `S cS mS aS _S ^S \\S [S u?rZQCOS qS X UZ$    $    $    u?NZ$    $    $    u?u?\"    >$    t\"    \"\"    oZZ&W$    V$    T$    SVu?RVu?u?kVu?h	 g	 u?XVu?T	 u?PlU	 RY!' LtKtu?' LO
KO
u?Sh>WVu?VZNCZ|#MS {S zS yS vS ES xS FS u? d#}\"    &$    w$    u?Qjb@fS iS JVu?j !	 n C p	 H$    I$    B$    A$    ?$    G$    $    D$    Zl?sS PS eS YS dS @S ]S `S cS mS aS _S ^S \\S [S u?rZQCOS qS X UZ$    $    $    u?NZ$    $    $    u?u?\"    >$    t\"    \"\"    oZZ&W$    V$    T$    SVu?RVu?u?kVu?h	 g	 u?XVu?T	 u?p5$   Bq5$  HBu5lsi?W? [ZH@Z$?9?$?LP?$?Q??u?FZ\"    
\" @  	\"    u? tytu?aZH@Z$??3?$ffP?$????u?FZ\"    
\" ?  	\"    u? SySu?_ZHDZ$    $    $    u?FZ\"    
\"    	\"    u? Vu?yVu?u?u?W? [ZH@Z$?9?$??<B$?Q??u?FZ\"    
\" ???	\"    u? xyxu?aZH@Z$??<?$?w3B$????u?FZ\"    
\" ?  	\"    u? yyyu?_ZHDZ$    $    $    u?FZ\"    
\"    	\"    u? Vu?yVu?u?u?WS [ZHDZ$    $    $    u?FZ\"    
\"    	\"    u? Vu?yVu?u?aZH@Z$Nb??$
W6?$??u?FZ\"    
\"    	\"    u? TyTu?_ZHDZ$    $    $    u?FZ\"    
\"    	\"    u? Vu?yVu?u?u?RZ*?)S 1S =S +S -S .S /? ? S 0S 6S 9S :? ;Vu?<$    8Vu?7Vu?5Vu?4G#Z$    $    $    u?3Z$    $    $    u?$Z\"    
\"    	\"    u?2Z\"    
\"    	\"    u?,( u?v? RR7EVu?MiAkZ`cS g\"    h$    l$    u?jYuPb	 i f	 e	 d aYV_	 ^Ylq[ZS S \"    \"    $    u?]	 \\ZS S \"    \"    $    u?u?S u?kZ`cS g\"    h$    l$    u?jYuWb	 i f	 e	 d aYX_	 ^Y?mq[ZS S \"    \"    $    u?]	 \\ZS S \"    \"    $    u?u?S u?kZ`cS g\"    h$    l$    u?jYujb	 i f	 e	 d aY?_	 ^Ym8[ZS S \"    \"    $    u?]	 \\ZS S \"    \"    $    u?u?_	 ^Yp8[ZS S \"    \"    $    u?]	 \\ZS S \"    \"    $    u?u?S u?uY ???}i	ZS ?$    YZ*?)S 1S =S +S -S .S /S S S 0S 6S 9S :S ;Vu?<$    8Vu?7c#5Vu?4b##Z$    $    $    u?3Z$    $    $    u?$Z\"    
\"    	\"    u?2Z\"    
\"    	\"    u?,( u?"
}