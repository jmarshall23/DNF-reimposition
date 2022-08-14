/*******************************************************************************
 * RPG generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class RPG extends Weapon;

var bool bLockOnSuccess;
var Actor LookActor;
var name LookActorMeshBone;
var() float LostLockTimeout;
var() float WaitingForLockTime;
var MaterialEx TargetUL;
var MaterialEx TargetLL;
var MaterialEx TargetUR;
var MaterialEx TargetLR;

replication
{
	// Pos:0x000
	reliable if(__NFUN_173__(int(Owner.RemoteRole), int(ROLE_AutonomousProxy)))
		LookActor, WaitingForLockTime, 
		bLockOnSuccess;
}

function PostBeginPlay()
{
	super(ActivatableInventory).PostBeginPlay();
	LostLockTimeout = 0;
	return;
}

simulated event int GetCrosshairIndex()
{
	// End:0x34
	if(__NFUN_340__(LookActor, none))
	{
		// End:0x1B
		if(bLockOnSuccess)
		{
			return 13;			
		}
		else
		{
			// End:0x34
			if(__NFUN_200__(WaitingForLockTime, __NFUN_196__(default.WaitingForLockTime, 2)))
			{
				return 12;
			}
		}
	}
	return 11;
	return;
}

simulated event DrawCrosshairHUD(Canvas C, float CenterScale)
{
	local float EnemyX, EnemyY;
	local Vector EnemyLocation;
	local PlayerPawn PlayerOwner;
	local float Mirror, EnemyDistance;
	local Color crosshairColor;
	local DukePlayer Player;

	Mirror = 1;
	PlayerOwner = PlayerPawn(Owner);
	// End:0x43
	if(bLockOnSuccess)
	{
		C.DrawColor = NewColorBytes(234, 19, 19);		
	}
	else
	{
		// End:0x78
		if(__NFUN_200__(WaitingForLockTime, __NFUN_196__(default.WaitingForLockTime, 2)))
		{
			C.DrawColor = NewColorBytes(234, 201, 19);			
		}
		else
		{
			crosshairColor = NewColorBytes(255, 255, 255);
			Player = DukePlayer(Level.__NFUN_1161__());
			// End:0x110
			if(__NFUN_148__(__NFUN_148__(__NFUN_340__(Player, none), __NFUN_172__(Player.crosshairColorIdx, 0)), __NFUN_169__(Player.crosshairColorIdx, string(Player.crosshairColors))))
			{
				crosshairColor = Player.crosshairColors[Player.crosshairColorIdx];
			}
			C.DrawColor = crosshairColor;
		}
	}
	// End:0x663
	if(__NFUN_340__(LookActor, none))
	{
		// End:0x14C
		if(Level.__NFUN_1164__())
		{
			Mirror = -1;
		}
		EnemyLocation = LookActor.Location;
		__NFUN_249__(EnemyLocation, __NFUN_241__(__NFUN_232__(0, 0, LookActor.CollisionHeight), PlayerOwner.CalcedViewRotation));
		__NFUN_250__(EnemyLocation, __NFUN_241__(__NFUN_234__(__NFUN_232__(0, __NFUN_195__(1.2, LookActor.CollisionRadius), 0), Mirror), PlayerOwner.CalcedViewRotation));
		EnemyDistance = __NFUN_225__(1, __NFUN_251__(__NFUN_239__(EnemyLocation, PlayerOwner.Location)));
		// End:0x2B9
		if(C.__NFUN_1244__(EnemyLocation, EnemyX, EnemyY))
		{
			C.__NFUN_1250__(__NFUN_199__(EnemyX, __NFUN_195__(float(TargetUL.__NFUN_1191__()), CenterScale)), EnemyY);
			C.__NFUN_1234__(TargetUL, __NFUN_195__(float(TargetUL.__NFUN_1191__()), CenterScale), __NFUN_195__(float(TargetUL.__NFUN_1192__()), CenterScale), 0, 0, float(TargetUL.__NFUN_1191__()), float(TargetUL.__NFUN_1192__()),,,,, 1,,, EnemyDistance);
		}
		EnemyLocation = LookActor.Location;
		__NFUN_249__(EnemyLocation, __NFUN_241__(__NFUN_232__(0, 0, LookActor.CollisionHeight), PlayerOwner.CalcedViewRotation));
		__NFUN_249__(EnemyLocation, __NFUN_241__(__NFUN_234__(__NFUN_232__(0, __NFUN_195__(1.2, LookActor.CollisionRadius), 0), Mirror), PlayerOwner.CalcedViewRotation));
		// End:0x3EA
		if(C.__NFUN_1244__(EnemyLocation, EnemyX, EnemyY))
		{
			C.__NFUN_1250__(EnemyX, EnemyY);
			C.__NFUN_1234__(TargetUR, __NFUN_195__(float(TargetUR.__NFUN_1191__()), CenterScale), __NFUN_195__(float(TargetUR.__NFUN_1192__()), CenterScale), 0, 0, float(TargetUR.__NFUN_1191__()), float(TargetUR.__NFUN_1192__()),,,,, 1,,, EnemyDistance);
		}
		EnemyLocation = LookActor.Location;
		__NFUN_250__(EnemyLocation, __NFUN_241__(__NFUN_232__(0, 0, LookActor.CollisionHeight), PlayerOwner.CalcedViewRotation));
		__NFUN_250__(EnemyLocation, __NFUN_241__(__NFUN_234__(__NFUN_232__(0, __NFUN_195__(1.2, LookActor.CollisionRadius), 0), Mirror), PlayerOwner.CalcedViewRotation));
		// End:0x532
		if(C.__NFUN_1244__(EnemyLocation, EnemyX, EnemyY))
		{
			C.__NFUN_1250__(__NFUN_199__(EnemyX, __NFUN_195__(float(TargetLL.__NFUN_1191__()), CenterScale)), EnemyY);
			C.__NFUN_1234__(TargetLL, __NFUN_195__(float(TargetLL.__NFUN_1191__()), CenterScale), __NFUN_195__(float(TargetLL.__NFUN_1192__()), CenterScale), 0, 0, float(TargetLL.__NFUN_1191__()), float(TargetLL.__NFUN_1192__()),,,,, 1,,, EnemyDistance);
		}
		EnemyLocation = LookActor.Location;
		__NFUN_250__(EnemyLocation, __NFUN_241__(__NFUN_232__(0, 0, LookActor.CollisionHeight), PlayerOwner.CalcedViewRotation));
		__NFUN_249__(EnemyLocation, __NFUN_241__(__NFUN_234__(__NFUN_232__(0, __NFUN_195__(1.2, LookActor.CollisionRadius), 0), Mirror), PlayerOwner.CalcedViewRotation));
		// End:0x663
		if(C.__NFUN_1244__(EnemyLocation, EnemyX, EnemyY))
		{
			C.__NFUN_1250__(EnemyX, EnemyY);
			C.__NFUN_1234__(TargetLR, __NFUN_195__(float(TargetLR.__NFUN_1191__()), CenterScale), __NFUN_195__(float(TargetLR.__NFUN_1192__()), CenterScale), 0, 0, float(TargetLR.__NFUN_1191__()), float(TargetLR.__NFUN_1192__()),,,,, 1,,, EnemyDistance);
		}
	}
	return;
}

function FindLookActorMeshBone()
{
	// End:0x3E
	if(__NFUN_148__(__NFUN_340__(LookActor, none), LookActor.bIsPawn))
	{
		LookActorMeshBone = Pawn(LookActor).LockOnBone;		
	}
	else
	{
		LookActorMeshBone = 'None';
	}
	return;
}

function Tick(float DeltaSeconds)
{
	local Actor NewLookActor;

	// End:0x2A
	if(__NFUN_148__(__NFUN_339__(LookActor, none), bLockOnSuccess))
	{
		FindAndStopSound('Target_Lock');
		bLockOnSuccess = false;
	}
	// End:0x1F1
	if(__NFUN_148__(Owner.bIsPlayerPawn, __NFUN_150__(__NFUN_145__(IsCompletelyOutOfAmmo()), PlayerPawn(Owner).bInfiniteAmmo)))
	{
		NewLookActor = FindLookActor(LookActor, __NFUN_201__(LostLockTimeout, 0), 150);
		// End:0x192
		if(__NFUN_340__(NewLookActor, LookActor))
		{
			WaitingForLockTime = default.WaitingForLockTime;
			// End:0x183
			if(__NFUN_202__(LostLockTimeout, float(0)))
			{
				bLockOnSuccess = false;
				LookActor = none;
				LookActorMeshBone = 'None';
				// End:0x16A
				if(__NFUN_148__(__NFUN_340__(NewLookActor, none), __NFUN_150__(__NFUN_148__(NewLookActor.bIsPawn, PlayerPawn(Owner).IsEnemyTo(Pawn(NewLookActor))), __NFUN_148__(NewLookActor.bIsDecoration, Decoration(NewLookActor).bEnemy))))
				{
					LookActor = NewLookActor;
					LookActorMeshBone = 'None';
					FindAndStopSound('Target_Lock');
					FindAndPlaySound('Target_Acquiring');					
				}
				else
				{
					FindAndStopSound('Target_Acquiring');
					FindAndStopSound('Target_Lock');
				}				
			}
			else
			{
				__NFUN_210__(LostLockTimeout, DeltaSeconds);
			}			
		}
		else
		{
			// End:0x1F1
			if(__NFUN_340__(LookActor, none))
			{
				// End:0x1B9
				if(__NFUN_201__(WaitingForLockTime, float(0)))
				{
					__NFUN_210__(WaitingForLockTime, DeltaSeconds);					
				}
				else
				{
					// End:0x1D7
					if(__NFUN_145__(bLockOnSuccess))
					{
						FindAndPlaySound('Target_Lock');
						bLockOnSuccess = true;
					}
				}
				// End:0x1F1
				if(bLockOnSuccess)
				{
					LostLockTimeout = default.LostLockTimeout;
					FindLookActorMeshBone();
				}
			}
		}
	}
	super.Tick(DeltaSeconds);
	return;
}

event Projectile ProjectileFire(class<Projectile> ProjClass)
{
	local dnRocket_RPG_Homing rocket;

	rocket = dnRocket_RPG_Homing(super.ProjectileFire(ProjClass));
	// End:0x88
	if(__NFUN_148__(__NFUN_340__(rocket, none), bLockOnSuccess))
	{
		rocket.SeekTimeLimit = rocket.default.SeekTimeLimit;
		rocket.bHomingMode = true;
		rocket.Target = LookActor;
		rocket.TargetBone = LookActorMeshBone;
	}
	ResetLockOn();
	return;
}

function ResetLockOn()
{
	LookActor = none;
	LookActorMeshBone = 'None';
	LostLockTimeout = 0;
	WaitingForLockTime = default.WaitingForLockTime;
	bLockOnSuccess = false;
	FindAndStopSound('Target_Acquiring');
	FindAndStopSound('Target_Lock');
	return;
}

simulated function bool BringUp()
{
	ResetLockOn();
	return super.BringUp();
	return;
}

simulated function bool PutDown()
{
	ResetLockOn();
	return super.PutDown();
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super(InteractiveActor).RegisterPrecacheComponents(PrecacheIndex);
	// End:0x152
	if(PrecacheIndex.__NFUN_1285__(self))
	{
		PrecacheIndex.__NFUN_1269__(class'crosshair_rpg');
		PrecacheIndex.__NFUN_1269__(class'crosshair_rpg2');
		PrecacheIndex.__NFUN_1269__(class'crosshair_rpg3');
		PrecacheIndex.__NFUN_1269__(TargetUL);
		PrecacheIndex.__NFUN_1269__(TargetLL);
		PrecacheIndex.__NFUN_1269__(TargetUR);
		PrecacheIndex.__NFUN_1269__(TargetLR);
		PrecacheIndex.__NFUN_1277__(VoicePack, 'Activate');
		PrecacheIndex.__NFUN_1277__(VoicePack, 'Deactivate');
		PrecacheIndex.__NFUN_1277__(VoicePack, 'Target_Acquiring');
		PrecacheIndex.__NFUN_1277__(VoicePack, 'Target_Lock');
		PrecacheIndex.__NFUN_1277__(VoicePack, 'Fire');
		PrecacheIndex.__NFUN_1277__(VoicePack, 'Reload_Open');
		PrecacheIndex.__NFUN_1277__(VoicePack, 'Reload_Close');
		PrecacheIndex.__NFUN_1277__(class'VoicePack_Duke', 'rpg_melee');
	}
	return;
}

defaultproperties
{
	LostLockTimeout=1
	WaitingForLockTime=1
	TargetUL='dt_hud.crosshairs.crosshair_rpglock_1'
	TargetLL='dt_hud.crosshairs.crosshair_rpglock_4'
	TargetUR='dt_hud.crosshairs.crosshair_rpglock_2'
	TargetLR='dt_hud.crosshairs.crosshair_rpglock_3'
	WeaponConfig='RPGWeaponConfig'
	HUDAmmoClipIcon=5
	DOFWeapDist=9.5
	CrosshairIndex=-2
	dnInventoryCategory=4
	CommandAlias="UseWeapon dnGame.RPG"
	InventoryReferenceClass='RPG'
	PickupClass='RPGPickup'
	bIsPrimaryWeapon=true
	HUDPickupEventIcon=3
	AutoRegisterIKClasses(0)='IKSystemInfo_Shotgun'
	AnimationControllerClass='dnAnimationControllerEx_RPG'
	Mesh='c_dnWeapon.RPG'
	SoundVolume=200
	SoundRadius=1600
	SoundInnerRadius=800
	VoicePack='SoundConfig.Inventory.VoicePack_RPG'
}