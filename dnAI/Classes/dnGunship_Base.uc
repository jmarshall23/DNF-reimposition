/*******************************************************************************
 * dnGunship_Base generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnGunship_Base extends dnDecoration
	collapsecategories;

enum EGunship_GunPosition
{
	EGUNSHIP_ALL,
	EGUNSHIP_Center,
	EGUNSHIP_LeftFront,
	EGUNSHIP_LeftBack,
	EGUNSHIP_RightFront,
	EGUNSHIP_RightBack,
	EGUNSHIP_CenterBack
};

enum EGunshipGun_GunType
{
	EGUNSHIPGUN_Rockets,
	EGUNSHIPGUN_Bullets
};

struct SGunshipAimInfo
{
	var dnGunship_Base.EGunship_GunPosition GunPosition;
	var() dnGunship_Base.EGunshipGun_GunType GunType;
	var() name BoneName;
	var() bool bDebug;
	var() bool bFiringDisabled;
	var() array<name> MuzzleNames;
	var int MuzzleIndex;
	var bool bFireThisFrame;
	var float FireGate;
	var float MinFOVDot;
	var Vector MaxFOVDir;
	var() float MaxDist;
	var() bool bCheckLOS;
	var float LOSGate;
	var bool bLastLOS;
	var Vector PosThisFrame;
	var Actor TargetActor;
	var name TargetTag;
};

struct SGunshipGunInfo
{
	var() dnGunship_Base.EGunshipGun_GunType GunType;
	var() float FireInterval;
	var() class<dnProjectile> ProjectileClass;
	var() float TraceChance;
	var() class<BeamSystem> TracerBeamSystemClass;
	var() class<SoftParticleSystem> TracerBubblesClass;
	var() int HorizShotError;
	var() int VertShotError;
	var() name FireSound;
};

struct SGunshipEventInfo
{
	var() noexport name EventTag "Trigger this to execute this.";
	var() noexport array<dnGunship_Base.EGunship_GunPosition> GunPositions "Which guns are we affecting? Use EGUNSHIP_ALL to set target for all.";
	var() noexport bool bChangeTarget "Must set to TRUE to change target.";
	var() noexport name NewTargetTag "Tag of the new target. Setting to None will clear target and hold fire.";
	var() noexport bool bChangeGunType "If TRUE we will change the gun type on the affected turrets.";
	var() noexport dnGunship_Base.EGunshipGun_GunType NewGunType "New guntype. Only used if bChangeGunType is true";
};

var() noexport bool bDebugFiring "When true we will output firing debug info";
var() noexport array<SGunshipEventInfo> TriggeredEvents "Use this array to change the ships target from InitialTargetTag or to change the gun type of an individual turret. Theres a hard cap of 10 entries in this array. If you need more, please see a programmer.";
var() array<SGunshipGunInfo> GunInfo;
var() noexport name HoldFireTag "Stop firing.";
var() noexport name ResumeFireTag "Enabled firing.";
var() noexport name RemoveAimAssistTag "Stop rpg autolockon and crosshair turning red";
var() noexport bool bStartFireEnabled "If true we'll start firing at InitialTargetTag without being told to with ResumeFireTag";
var() array<SGunshipAimInfo> AimInfo;
var() name InitialTargetTag;
var() float BulletDamage;
var Actor GlobalTargetActor;
var float TargetSearchInterval;
var bool bFiringEnabled;
var float LOSGate;
var float LOSMinInterval;
var bool bSearchingTargets;
var dnShipThrusterEffect LeftThruster;
var dnShipThrusterEffect RightThruster;
var SoftParticleSystem GroundDust;
var() float MaxSpeed;
var() float MaxIdleSpeed;
var bool bIsIdle;
var float Speeds[5];
var bool bSetCallback;
var bool bOn;
var int TraceFireIndex;

function PostVerifySelf()
{
	super.PostVerifySelf();
	__NFUN_718__('PowerOn', PowerOnTag);
	__NFUN_718__('PowerOff', PowerOffTag);
	// End:0x32
	if(bStartupOff)
	{
		TriggerFunc_PowerOff();		
	}
	else
	{
		TriggerFunc_PowerOn();
	}
	return;
}

function TriggerFunc_PowerOn()
{
	// End:0x0B
	if(DecorationIsDead())
	{
		return;
	}
	bOn = true;
	bSetCallback = true;
	// End:0x35
	if(__NFUN_340__(LeftThruster, none))
	{
		LeftThruster.__NFUN_590__(false);
	}
	// End:0x4F
	if(__NFUN_340__(RightThruster, none))
	{
		RightThruster.__NFUN_590__(false);
	}
	// End:0x68
	if(__NFUN_340__(GroundDust, none))
	{
		GroundDust.__NFUN_1055__();
	}
	return;
}

function TriggerFunc_PowerOff()
{
	// End:0x0B
	if(DecorationIsDead())
	{
		return;
	}
	bOn = false;
	EndIdle();
	EndAccel();
	// End:0x39
	if(__NFUN_340__(LeftThruster, none))
	{
		LeftThruster.__NFUN_590__(true);
	}
	// End:0x53
	if(__NFUN_340__(RightThruster, none))
	{
		RightThruster.__NFUN_590__(true);
	}
	// End:0x6C
	if(__NFUN_340__(GroundDust, none))
	{
		GroundDust.__NFUN_1054__();
	}
	return;
}

event PostBeginPlay()
{
	local int i;
	local dnShipThrusterEffect Thruster;

	super.PostBeginPlay();
	InitSpecialEvents();
	InitAimers();
	// End:0x23
	if(bStartFireEnabled)
	{
		bFiringEnabled = true;
	}
	// End:0x39
	if(__NFUN_342__(InitialTargetTag, 'None'))
	{
		SearchTarget();
	}
	LeftThruster = dnShipThrusterEffect(FindMountedActor('Left_Thruster'));
	RightThruster = dnShipThrusterEffect(FindMountedActor('Right_Thruster'));
	GroundDust = SoftParticleSystem(FindMountedActor('GroundDust'));
	// End:0x99
	if(__NFUN_340__(GroundDust, none))
	{
		GroundDust.DestroyWhenEmptyAfterSpawn = false;
	}
	// End:0xBA
	if(__NFUN_340__(LeftThruster, none))
	{
		LeftThruster.MaxSpeed = MaxSpeed;
	}
	// End:0xDB
	if(__NFUN_340__(RightThruster, none))
	{
		RightThruster.MaxSpeed = MaxSpeed;
	}
	// End:0x101
	foreach __NFUN_753__(class'dnShipThrusterEffect', Thruster)
	{
		Thruster.MaxSpeed = MaxSpeed;		
	}	
	FindAndPlaySound('idle', 2, true, true);
	// End:0x14E
	if(bDebugFiring)
	{
		i = 0;
		J0x121:

		// End:0x14E [Loop If]
		if(__NFUN_169__(i, string(AimInfo)))
		{
			AimInfo[i].bDebug = true;
			__NFUN_184__(i);
			// [Loop Continue]
			goto J0x121;
		}
	}
	return;
}

event Tick(float DeltaSeconds)
{
	local float Avg;
	local int i;

	Avg = 0;
	super(Actor).Tick(DeltaSeconds);
	Speeds[4] = Speeds[3];
	Speeds[3] = Speeds[2];
	Speeds[2] = Speeds[1];
	Speeds[1] = Speeds[0];
	Speeds[0] = __NFUN_251__(Velocity);
	i = 0;
	J0x6D:

	// End:0x95 [Loop If]
	if(__NFUN_169__(i, 5))
	{
		__NFUN_209__(Avg, Speeds[i]);
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x6D;
	}
	__NFUN_207__(Avg, 0.2);
	// End:0xB2
	if(__NFUN_145__(bSearchingTargets))
	{
		CheckOnTargets();
	}
	// End:0xC4
	if(bFiringEnabled)
	{
		DoFiring();		
	}
	else
	{
		// End:0x10B
		if(bDebugFiring)
		{
			BroadcastLog(__NFUN_303__(string(self), " Firing is DISABLED. Use ResumeFireTag to enable!"));
		}
	}
	// End:0x118
	if(__NFUN_145__(bOn))
	{
		return;
	}
	// End:0x14D
	if(__NFUN_148__(__NFUN_202__(__NFUN_251__(Velocity), MaxIdleSpeed), bSetCallback))
	{
		__NFUN_607__(0.15, false, 'StartIdle');
		bSetCallback = false;		
	}
	else
	{
		// End:0x17F
		if(__NFUN_148__(__NFUN_201__(__NFUN_251__(Velocity), MaxIdleSpeed), bSetCallback))
		{
			__NFUN_607__(0.15, false, 'StartAccel');
			bSetCallback = false;
		}
	}
	return;
}

function Destroyed()
{
	// End:0x1E
	if(__NFUN_340__(GroundDust, none))
	{
		GroundDust.DestroyWhenEmptyAfterSpawn = true;
	}
	super.Destroyed();
	return;
}

function StartIdle()
{
	// End:0x0D
	if(__NFUN_145__(bOn))
	{
		return;
	}
	// End:0x60
	if(__NFUN_202__(__NFUN_251__(Velocity), MaxIdleSpeed))
	{
		// End:0x53
		if(__NFUN_145__(bIsIdle))
		{
			FindAndFadeSound('Accel', 0.5,,, 'EndAccel');
			FindAndStopSound('idle');
			bIsIdle = true;
		}
		FindAndPlaySound('idle', 1);
	}
	bSetCallback = true;
	return;
}

function StartAccel()
{
	// End:0x0D
	if(__NFUN_145__(bOn))
	{
		return;
	}
	// End:0x5E
	if(__NFUN_201__(__NFUN_251__(Velocity), MaxIdleSpeed))
	{
		// End:0x51
		if(bIsIdle)
		{
			FindAndFadeSound('idle', 0.5,,, 'EndIdle');
			FindAndStopSound('Accel');
			bIsIdle = false;
		}
		FindAndPlaySound('Accel', 1);
	}
	bSetCallback = true;
	return;
}

function EndAccel()
{
	FindAndStopSound('Accel');
	return;
}

function EndIdle()
{
	FindAndStopSound('idle');
	return;
}

simulated event bool OnEvalBonesHelper()
{
	// End:0x0F
	if(bFiringEnabled)
	{
		DoAiming();
	}
	return true;
	return;
}

final function TriggerFunc_HoldFire()
{
	bFiringEnabled = false;
	return;
}

final function TriggerFunc_ResumeFire()
{
	bFiringEnabled = true;
	return;
}

event InitAimers()
{
	local int i;
	local Vector Loc;
	local Rotator Rot;

	__NFUN_568__();
	i = 0;
	J0x0A:

	// End:0xF1 [Loop If]
	if(__NFUN_169__(i, string(AimInfo)))
	{
		Loc = MeshInstance.__NFUN_533__(AimInfo[i].BoneName, true, false);
		Rot = MeshInstance.__NFUN_534__(AimInfo[i].BoneName, true);
		// End:0xA2
		if(__NFUN_204__(__NFUN_252__(AimInfo[i].MaxFOVDir), 0))
		{
			AimInfo[i].MaxFOVDir = __NFUN_253__(__NFUN_241__(Vector(Rot), Rotation));			
		}
		else
		{
			AimInfo[i].MaxFOVDir = __NFUN_253__(AimInfo[i].MaxFOVDir);
		}
		__NFUN_207__(AimInfo[i].MaxDist, AimInfo[i].MaxDist);
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x0A;
	}
	return;
}

function InitSpecialEvents()
{
	local int i;

	__NFUN_718__('HoldFire', HoldFireTag);
	__NFUN_718__('ResumeFire', ResumeFireTag);
	__NFUN_718__('RemoveAimAssist', RemoveAimAssistTag);
	i = 0;
	J0x2E:

	// End:0x6D [Loop If]
	if(__NFUN_169__(i, string(TriggeredEvents)))
	{
		__NFUN_718__(__NFUN_343__(__NFUN_302__(string('SetTarget'), string(i))), TriggeredEvents[i].EventTag);
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x2E;
	}
	return;
}

function RemoveAimAssist()
{
	bIgnoreAimAssist = true;
	return;
}

event DebugDrawBone(name TrackBone)
{
	local Vector Start;
	local Rotator Rot;

	__NFUN_568__();
	Start = MeshInstance.__NFUN_533__(TrackBone, true, false);
	Rot = MeshInstance.__NFUN_534__(TrackBone, true);
	__NFUN_673__(Start, Vector(Rot), NewColorBytes(255, 255, 0), 100, 0.001);
	return;
}

function SearchTarget()
{
	local int i;

	// End:0x19
	foreach __NFUN_747__(class'Actor', GlobalTargetActor, InitialTargetTag)
	{
		// End:0x19
		break;		
	}	
	// End:0x37
	if(__NFUN_339__(GlobalTargetActor, none))
	{
		__NFUN_605__(TargetSearchInterval, false, 'SearchTarget');		
	}
	else
	{
		i = 0;
		J0x3E:

		// End:0x84 [Loop If]
		if(__NFUN_169__(i, string(AimInfo)))
		{
			AimInfo[i].TargetActor = GlobalTargetActor;
			AimInfo[i].TargetTag = InitialTargetTag;
			__NFUN_184__(i);
			// [Loop Continue]
			goto J0x3E;
		}
	}
	return;
}

function SetNewTarget(name NewTarget)
{
	GlobalTargetActor = none;
	InitialTargetTag = NewTarget;
	SearchTarget();
	return;
}

function SetNewTargetInfo(out SGunshipEventInfo TargetInfo)
{
	local int i, j;
	local Actor NewTarget;

	i = 0;
	J0x07:

	// End:0x12F [Loop If]
	if(__NFUN_169__(i, string(TargetInfo.GunPositions)))
	{
		// End:0x3B
		if(__NFUN_341__(TargetInfo.NewTargetTag, 'None'))
		{
			NewTarget = none;			
		}
		else
		{
			// End:0x59
			foreach __NFUN_747__(class'Actor', NewTarget, TargetInfo.NewTargetTag)
			{
				// End:0x59
				break;				
			}			
		}
		j = 0;
		J0x61:

		// End:0x125 [Loop If]
		if(__NFUN_169__(j, string(AimInfo)))
		{
			// End:0x11B
			if(__NFUN_150__(__NFUN_173__(int(TargetInfo.GunPositions[i]), int(0)), __NFUN_173__(int(TargetInfo.GunPositions[i]), int(AimInfo[j].GunPosition))))
			{
				// End:0xF2
				if(TargetInfo.bChangeTarget)
				{
					AimInfo[j].TargetActor = NewTarget;
					AimInfo[j].TargetTag = TargetInfo.NewTargetTag;
				}
				// End:0x11B
				if(TargetInfo.bChangeGunType)
				{
					AimInfo[j].GunType = TargetInfo.NewGunType;
				}
			}
			__NFUN_184__(j);
			// [Loop Continue]
			goto J0x61;
		}
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x07;
	}
	return;
}

function CheckOnTargets()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x63 [Loop If]
	if(__NFUN_169__(i, string(AimInfo)))
	{
		// End:0x59
		if(__NFUN_148__(__NFUN_339__(AimInfo[i].TargetActor, none), __NFUN_342__(AimInfo[i].TargetTag, 'None')))
		{
			bSearchingTargets = true;
			RefreshAllTargets();
		}
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x07;
	}
	return;
}

function RefreshAllTargets()
{
	local int i;
	local bool MissingTarget;

	i = 0;
	J0x07:

	// End:0xA4 [Loop If]
	if(__NFUN_169__(i, string(AimInfo)))
	{
		// End:0x9A
		if(__NFUN_148__(__NFUN_339__(AimInfo[i].TargetActor, none), __NFUN_342__(AimInfo[i].TargetTag, 'None')))
		{
			// End:0x7A
			foreach __NFUN_747__(class'Actor', AimInfo[i].TargetActor, AimInfo[i].TargetTag)
			{
				// End:0x7A
				break;				
			}			
			// End:0x9A
			if(__NFUN_339__(AimInfo[i].TargetActor, none))
			{
				MissingTarget = true;
			}
		}
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x07;
	}
	// End:0xBE
	if(MissingTarget)
	{
		__NFUN_605__(TargetSearchInterval, false, 'RefreshAllTargets');		
	}
	else
	{
		bSearchingTargets = false;
	}
	return;
}

final simulated function Actor GetTargetActor(out SGunshipAimInfo AimInfo)
{
	local Actor Target;
	local PlayerPawn PlayerTarget;

	Target = AimInfo.TargetActor;
	// End:0x8B
	if(__NFUN_148__(__NFUN_340__(Target, none), Target.bIsPlayerPawn))
	{
		PlayerTarget = PlayerPawn(Target);
		// End:0x8B
		if(__NFUN_148__(__NFUN_340__(PlayerTarget.ActiveHoloDuke, none), PlayerTarget.ActiveHoloDuke.bIsPawn))
		{
			Target = PlayerTarget.ActiveHoloDuke;
		}
	}
	return Target;
	return;
}

function DoAiming()
{
	local int i;
	local Vector Start;
	local Actor Target;

	__NFUN_568__();
	i = 0;
	J0x0A:

	// End:0x11A [Loop If]
	if(__NFUN_169__(i, string(AimInfo)))
	{
		// End:0x34
		if(__NFUN_339__(AimInfo[i].TargetActor, none))
		{
			// [Explicit Continue]
			goto J0x110;
		}
		Target = GetTargetActor(AimInfo[i]);
		// End:0x69
		if(__NFUN_145__(CanAim(AimInfo[i], Target)))
		{
			// [Explicit Continue]
			goto J0x110;
		}
		MeshInstance.__NFUN_531__(AimInfo[i].BoneName, __NFUN_232__(1, 0, 0), Target.Location);
		// End:0x110
		if(__NFUN_148__(__NFUN_148__(__NFUN_145__(AimInfo[i].bFiringDisabled), __NFUN_200__(AimInfo[i].FireGate, Level.GameTimeSeconds)), CanFire(AimInfo[i], Target)))
		{
			AimInfo[i].bFireThisFrame = true;
		}
		J0x110:

		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x0A;
	}
	return;
}

function DoFiring()
{
	local int i;

	__NFUN_568__();
	i = 0;
	J0x0A:

	// End:0x49 [Loop If]
	if(__NFUN_169__(i, string(AimInfo)))
	{
		// End:0x3F
		if(AimInfo[i].bFireThisFrame)
		{
			Fire(AimInfo[i]);
		}
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x0A;
	}
	return;
}

function bool CanFire(out SGunshipAimInfo AimInfo, optional Actor TargetOverride)
{
	local float DistToTarget;
	local Actor Target;

	// End:0x1A
	if(__NFUN_340__(TargetOverride, none))
	{
		Target = TargetOverride;		
	}
	else
	{
		Target = GetTargetActor(AimInfo);
	}
	// End:0x39
	if(__NFUN_339__(Target, none))
	{
		return false;
	}
	// End:0x26E
	if(__NFUN_148__(__NFUN_145__(AimInfo.bFiringDisabled), __NFUN_200__(AimInfo.FireGate, Level.GameTimeSeconds)))
	{
		// End:0x14F
		if(__NFUN_201__(AimInfo.MaxDist, 0))
		{
			DistToTarget = __NFUN_252__(__NFUN_239__(Target.Location, AimInfo.PosThisFrame));
			// End:0x14F
			if(__NFUN_201__(DistToTarget, AimInfo.MaxDist))
			{
				// End:0x14D
				if(AimInfo.bDebug)
				{
					BroadcastLog(__NFUN_302__(__NFUN_303__(__NFUN_302__(__NFUN_303__(__NFUN_302__(__NFUN_303__(string(self), "gun "), string(__NFUN_365__(Enum'EGunshipGun_GunType', int(AimInfo.GunType)))), " cannot fire due to distance check. DistToTarget: "), string(DistToTarget)), "AimInfo.MaxDist="), string(AimInfo.MaxDist)));
				}
				return false;
			}
		}
		// End:0x26C
		if(AimInfo.bCheckLOS)
		{
			// End:0x1E7
			if(__NFUN_148__(CheckLOSGate(AimInfo), __NFUN_145__(CheckLOS(AimInfo, Target))))
			{
				// End:0x1E5
				if(AimInfo.bDebug)
				{
					BroadcastLog(__NFUN_303__(__NFUN_302__(__NFUN_303__(string(self), "gun "), string(__NFUN_365__(Enum'EGunshipGun_GunType', int(AimInfo.GunType)))), " cannot fire due LOS FAIL (Just checked)"));
				}
				return false;
			}
			// End:0x260
			if(__NFUN_148__(AimInfo.bDebug, __NFUN_145__(AimInfo.bLastLOS)))
			{
				BroadcastLog(__NFUN_303__(__NFUN_302__(__NFUN_303__(string(self), "gun "), string(__NFUN_365__(Enum'EGunshipGun_GunType', int(AimInfo.GunType)))), " cannot fire due LOS FAIL (didnt just check)"));
			}
			return AimInfo.bLastLOS;
		}
		return true;
	}
	// End:0x30E
	if(AimInfo.bDebug)
	{
		BroadcastLog(__NFUN_302__(__NFUN_303__(__NFUN_302__(__NFUN_303__(__NFUN_302__(__NFUN_303__(string(self), "gun "), string(__NFUN_365__(Enum'EGunshipGun_GunType', int(AimInfo.GunType)))), " cannot fire due to firing gate. Can fire at: "), string(Level.GameTimeSeconds)), "AimInfo.FireGate="), string(AimInfo.FireGate)));
	}
	return false;
	return;
}

function bool CheckLOSGate(out SGunshipAimInfo AimInfo)
{
	// End:0x76
	if(__NFUN_200__(LOSGate, Level.GameTimeSeconds))
	{
		// End:0x76
		if(__NFUN_200__(AimInfo.LOSGate, Level.GameTimeSeconds))
		{
			LOSGate = __NFUN_198__(Level.GameTimeSeconds, 0.5);
			AimInfo.LOSGate = __NFUN_198__(Level.GameTimeSeconds, 1.5);
			return true;
		}
	}
	return false;
	return;
}

function bool CheckLOS(out SGunshipAimInfo AimInfo, optional Actor TargetOverride)
{
	local Actor Target;
	local STraceFlags TraceFlags;
	local STraceHitResult TraceHitResult;

	// End:0x1A
	if(__NFUN_340__(TargetOverride, none))
	{
		Target = TargetOverride;		
	}
	else
	{
		Target = GetTargetActor(AimInfo);
	}
	// End:0x39
	if(__NFUN_339__(Target, none))
	{
		return false;
	}
	TraceFlags.bTraceActors = false;
	TraceFlags.bAbortFirstHit = true;
	TraceFlags.bNoParticles = true;
	TraceFlags.bShotTrace = true;
	__NFUN_736__(AimInfo.PosThisFrame, Target.Location, TraceFlags, TraceHitResult,, Target);
	// End:0xF4
	if(__NFUN_339__(TraceHitResult.Actor, none))
	{
		// End:0xE5
		if(AimInfo.bDebug)
		{
			__NFUN_676__(AimInfo.PosThisFrame, Target.Location, NewColorBytes(0, 255, 0), 3);
		}
		AimInfo.bLastLOS = true;
		return true;
	}
	// End:0x12F
	if(AimInfo.bDebug)
	{
		__NFUN_676__(AimInfo.PosThisFrame, Target.Location, NewColorBytes(255, 0, 0), 3);
	}
	AimInfo.bLastLOS = false;
	return false;
	return;
}

function bool CanAim(out SGunshipAimInfo AimInfo, optional Actor TargetOverride)
{
	local Vector Dir, Start, DirToTarget;
	local float DotToTarget;
	local Actor Target;
	local float f1;

	// End:0x1A
	if(__NFUN_340__(TargetOverride, none))
	{
		Target = TargetOverride;		
	}
	else
	{
		Target = GetTargetActor(AimInfo);
	}
	// End:0x39
	if(__NFUN_339__(Target, none))
	{
		return false;
	}
	Dir = __NFUN_241__(AimInfo.MaxFOVDir, Rotation);
	Start = MeshInstance.__NFUN_533__(AimInfo.BoneName, true, false);
	DirToTarget = __NFUN_239__(Target.Location, Start);
	DotToTarget = __NFUN_244__(DirToTarget, Dir);
	AimInfo.PosThisFrame = Start;
	// End:0x145
	if(__NFUN_201__(__NFUN_196__(__NFUN_195__(DotToTarget, DotToTarget), __NFUN_252__(DirToTarget)), __NFUN_195__(AimInfo.MinFOVDot, AimInfo.MinFOVDot)))
	{
		// End:0x143
		if(AimInfo.bDebug)
		{
			__NFUN_676__(Start, __NFUN_238__(Start, __NFUN_234__(DirToTarget, 100)), NewColorBytes(0, 255, 0), 0.0001);
			__NFUN_676__(Start, __NFUN_238__(Start, __NFUN_234__(Dir, 100)), NewColorBytes(0, 0, 255), 0.0001);
		}
		return true;
	}
	// End:0x22D
	if(AimInfo.bDebug)
	{
		BroadcastLog(__NFUN_302__(__NFUN_303__(__NFUN_302__(__NFUN_303__(__NFUN_302__(__NFUN_303__(string(self), " gun "), string(__NFUN_365__(Enum'EGunship_GunPosition', int(AimInfo.GunPosition)))), "target not in FOV range. DotToTarget: "), string(DotToTarget)), "AimInfo.MinFOVDot="), string(AimInfo.MinFOVDot)));
		__NFUN_676__(Start, __NFUN_238__(Start, __NFUN_234__(DirToTarget, 100)), NewColorBytes(255, 0, 0), 0.0001);
		__NFUN_676__(Start, __NFUN_238__(Start, __NFUN_234__(Dir, 100)), NewColorBytes(0, 0, 255), 0.0001);
	}
	return false;
	return;
}

function Fire(out SGunshipAimInfo AimInfo)
{
	local Vector From, Vel, End;
	local Rotator Rot;
	local dnFriendFX_Spawners MuzzleFlash;
	local Actor Target;

	Target = GetTargetActor(AimInfo);
	// End:0x60
	if(__NFUN_339__(Target, none))
	{
		// End:0x5E
		if(bDebugFiring)
		{
			BroadcastLog(__NFUN_302__(__NFUN_303__(string(self), " gun has no target: "), string(__NFUN_365__(Enum'EGunshipGun_GunType', int(AimInfo.GunType)))));
		}
		return;
	}
	From = MeshInstance.__NFUN_533__(AimInfo.MuzzleNames[AimInfo.MuzzleIndex], true, false);
	Rot = MeshInstance.__NFUN_534__(AimInfo.MuzzleNames[AimInfo.MuzzleIndex], true);
	End = __NFUN_238__(From, __NFUN_234__(Vector(Rot), float(10000)));
	FireTrace(AimInfo, From, End);
	FireProjectile(AimInfo, From, Rot);
	FindAndPlaySound(GunInfo[int(AimInfo.GunType)].FireSound, 2, true, true);
	MuzzleFlash = __NFUN_615__(class'Alien_Gunship_MuzzleFlash_Spawner',,, From, Rot);
	// End:0x14D
	if(__NFUN_340__(MuzzleFlash, none))
	{
		MuzzleFlash.ExecuteEffect(true);
	}
	AimInfo.FireGate = __NFUN_198__(Level.GameTimeSeconds, GunInfo[int(AimInfo.GunType)].FireInterval);
	AimInfo.bFireThisFrame = false;
	__NFUN_184__(AimInfo.MuzzleIndex);
	// End:0x1BE
	if(__NFUN_172__(AimInfo.MuzzleIndex, string(AimInfo.MuzzleNames)))
	{
		AimInfo.MuzzleIndex = 0;
	}
	return;
}

function FireProjectile(out SGunshipAimInfo AimInfo, Vector From, Rotator Rot)
{
	local dnProjectile Projectile;

	// End:0x1F
	if(__NFUN_339__(GunInfo[int(AimInfo.GunType)].ProjectileClass, none))
	{
		return;
	}
	Projectile = __NFUN_615__(GunInfo[int(AimInfo.GunType)].ProjectileClass, self,, From, Rot);
	return;
}

function FireTrace(out SGunshipAimInfo AimInfo, Vector Start, Vector End)
{
	local Rotator ShotRotation;

	// End:0x41
	if(__NFUN_150__(__NFUN_200__(GunInfo[int(AimInfo.GunType)].TraceChance, 0), __NFUN_339__(GunInfo[int(AimInfo.GunType)].TracerBeamSystemClass, none)))
	{
		return;
	}
	// End:0x15F
	if(__NFUN_150__(__NFUN_174__(GunInfo[int(AimInfo.GunType)].HorizShotError, 0), __NFUN_174__(GunInfo[int(AimInfo.GunType)].VertShotError, 0)))
	{
		ShotRotation = Rotator(__NFUN_239__(End, Start));
		// End:0xC1
		if(__NFUN_201__(__NFUN_222__(), 0.5))
		{
			__NFUN_180__(ShotRotation.Pitch, __NFUN_187__(GunInfo[int(AimInfo.GunType)].VertShotError));			
		}
		else
		{
			__NFUN_181__(ShotRotation.Pitch, __NFUN_187__(GunInfo[int(AimInfo.GunType)].VertShotError));
		}
		// End:0x118
		if(__NFUN_201__(__NFUN_222__(), 0.5))
		{
			__NFUN_180__(ShotRotation.Yaw, __NFUN_187__(GunInfo[int(AimInfo.GunType)].HorizShotError));			
		}
		else
		{
			__NFUN_181__(ShotRotation.Yaw, __NFUN_187__(GunInfo[int(AimInfo.GunType)].HorizShotError));
		}
		End = __NFUN_238__(Start, __NFUN_235__(__NFUN_251__(__NFUN_239__(End, Start)), Vector(ShotRotation)));
	}
	TraceFireIndex = int(AimInfo.GunType);
	__NFUN_616__(Start, End, class'BulletDamage', 0);
	return;
}

event PerformTraceFireEffects(class<TraceDamageType> TraceDamageType, Vector TraceStart, Vector TraceEnd, Actor HitActor)
{
	super(Actor).PerformTraceFireEffects(TraceDamageType, TraceStart, TraceEnd, HitActor);
	SpawnWeaponTracer(TraceStart, TraceEnd, GunInfo[TraceFireIndex].TraceChance, GunInfo[TraceFireIndex].TracerBeamSystemClass, GunInfo[TraceFireIndex].TracerBubblesClass, HitActor);
	return;
}

simulated event float GetBaseDamage(Actor Victim, optional Pawn Instigator, optional class<DamageType> DamageType, optional Vector HitDirection, optional Vector HitLocation, optional name BoneName, optional Vector SourceTraceOrigin)
{
	return BulletDamage;
	return;
}

final function TriggerFunc_SetTarget0()
{
	SetNewTargetInfo(TriggeredEvents[0]);
	return;
}

final function TriggerFunc_SetTarget1()
{
	SetNewTargetInfo(TriggeredEvents[1]);
	return;
}

final function TriggerFunc_SetTarget2()
{
	SetNewTargetInfo(TriggeredEvents[2]);
	return;
}

final function TriggerFunc_SetTarget3()
{
	SetNewTargetInfo(TriggeredEvents[3]);
	return;
}

final function TriggerFunc_SetTarget4()
{
	SetNewTargetInfo(TriggeredEvents[4]);
	return;
}

final function TriggerFunc_SetTarget5()
{
	SetNewTargetInfo(TriggeredEvents[5]);
	return;
}

final function TriggerFunc_SetTarget6()
{
	SetNewTargetInfo(TriggeredEvents[6]);
	return;
}

final function TriggerFunc_SetTarget7()
{
	SetNewTargetInfo(TriggeredEvents[7]);
	return;
}

final function TriggerFunc_SetTarget8()
{
	SetNewTargetInfo(TriggeredEvents[8]);
	return;
}

final function TriggerFunc_SetTarget9()
{
	SetNewTargetInfo(TriggeredEvents[9]);
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	local int i;

	super.RegisterPrecacheComponents(PrecacheIndex);
	i = __NFUN_166__(string(GunInfo), 1);
	J0x1A:

	// End:0xA8 [Loop If]
	if(__NFUN_172__(i, 0))
	{
		PrecacheIndex.__NFUN_1266__(GunInfo[i].TracerBeamSystemClass);
		PrecacheIndex.__NFUN_1266__(GunInfo[i].TracerBubblesClass);
		PrecacheIndex.__NFUN_1266__(GunInfo[i].ProjectileClass);
		PrecacheIndex.__NFUN_1277__(VoicePack, GunInfo[i].FireSound);
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0x1A;
	}
	PrecacheIndex.__NFUN_1277__(VoicePack, 'idle');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Accel');
	PrecacheIndex.__NFUN_1266__(class'Alien_Gunship_MuzzleFlash_Spawner');
	PrecacheIndex.__NFUN_1279__(class'BulletDamage');
	return;
}

defaultproperties
{
	GunInfo(0)=(GunType=0,FireInterval=1,ProjectileClass='dnGame.dnRocket_Gunship',TraceChance=0,TracerBeamSystemClass=none,TracerBubblesClass=none,HorizShotError=0,VertShotError=0,FireSound=Fire_Rocket)
	GunInfo(1)=(GunType=1,FireInterval=0.25,ProjectileClass=none,TraceChance=1,TracerBeamSystemClass='dnGame.dnTracerFX_BeamSegment',TracerBubblesClass='p_Weapons.Generic.WaterBubblesTracer',HorizShotError=0,VertShotError=0,FireSound=Fire_Gun)
	BulletDamage=2
	TargetSearchInterval=1
	MaxSpeed=8500
	MaxIdleSpeed=2150
	bIsIdle=true
	bSetCallback=true
	HealthPrefab=5
	DamageTypesAcceptedOnly(0)='Engine.ExplosionDamage'
	DamageTypesAcceptedOnly(1)='dnGame.LargeCaliberBulletDamage'
	bEnemy=true
	bCanShowSelf=true
	Health=1200
	HealthCap=1200
	Physics=9
	bBlockKarma=true
	bHasEvalBonesHelper=true
	Mass=10000
}