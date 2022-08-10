/*******************************************************************************
 * dnDeathmatchGame generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnDeathmatchGame extends dnMultiplayer
	config(Multiplayer)
	collapsecategories
	dependson(DukeMultiPlayerCorpse)
	dependson(dnTeamInfo)
	dependson(MP_Announcer)
	dependson(dnFXSpawner)
	hidecategories(movement,Collision,Lighting,LightColor);

enum EInventoryBuild
{
	INV_Minimal,
	INV_Medium,
	INV_All
};

var() config float FragLimit;
var() config int TimeLimit;
var() config int RoundTimeLimit;
var() int RestartWait;
var() int PreGameWarmupTime;
var() bool bUseMapCycle;
var() config int MinPlayers;
var() config bool bForceSpectateOnJoin;
var() config int NumLives;
var() int OvertimeDuration;
var() int StartupMessageDuration;
var int CountDown;
var int StartCount;
var float EndTime;
var bool bDontRestart;
var bool bAlreadyChanged;
var bool bNetReady;
var bool bFirstBlood;
var bool bDoSpree;
var bool bDoWeaponSpree;
var bool bBroadcastWinner;
var int ScorePenalty;
var int ScoreBonus;
var bool bEORCountStarted;
var localized string StartMessage;
var localized string StartUpMessage;
var localized string CountdownMessage;
var localized string WaitingMessage1;
var localized string WaitingMessage2;
var localized string ReadyMessage;
var localized string NotReadyMessage;
var localized string GameGoalPrefix;
var localized string GameGoal;
var localized string RulesMessage[4];
var localized string TimeLimitMessageStart;
var localized string TimeLimitMessageEnd;
var localized string EndRoundMessage;
var NavigationPoint LastStartSpot;
var localized string GameEndedMessage;
var bool bDisallowOverride;
var() bool bPlayHitNotify;
var int KillingSpreeStart;
var SSoundInfo CountdownSoundInfo;
var class<Inventory> PistolClass;
var class<Inventory> GoldPistolClass;
var DukeMesh DukePlayerMesh;
var bool bPlayedEndingVO;
var dnDeathmatchGame.EInventoryBuild InventoryBuild;
var array< class<Inventory> > MinDefaultInventory;
var array< class<Inventory> > MedDefaultInventory;
var array< class<Inventory> > AllDefaultInventory;
var class<SoftParticleSystem> PlayerSpawnClass;
var class<SoftParticleSystem> ItemSpawnClass;
var MP_Announcer Announcer;
var bool playedTimeWarningMessage;
var float LastSuicideAnnouceTime;
var() float SuicideAnnouceDelayTime;
var float SavedElapsedTime;
var array<PlayerStart> PlayerStarts;

event PlayerPawn Login(string Portal, string Options, out string Error, class<PlayerPawn> SpawnClass)
{
	local PlayerPawn NewPlayer;
	local string InVoice;
	local PlayerStart StartSpot;

	NewPlayer = super.Login(Portal, Options, Error, SpawnClass);
	// End:0x40
	if(bOvertime)
	{
		DukeMultiPlayer(NewPlayer).bOvertime = true;
	}
	DukeMultiPlayer(NewPlayer).LoginTime = int(Level.TimeSeconds);
	DukeMultiPlayer(NewPlayer).HostStartTime = Level.TimeSeconds;
	return NewPlayer;
	return;
}

event PostLogin(PlayerPawn NewPlayer)
{
	super.PostLogin(NewPlayer);
	// End:0x8C
	if(MatchStarted())
	{
		// End:0x44
		if(NewPlayer.PlayerReplicationInfo.bOnlySpectator)
		{
			NewPlayer.ServerJoinSpectator();			
		}
		else
		{
			NewPlayer.ServerRestartPlayer(true);
		}
		PlayStartUpMessage(NewPlayer);
		// End:0x89
		if(bGameOver)
		{
			NewPlayer.ClientGameEnded();
			NewPlayer.ClientShowPostGameLobby();
		}		
	}
	else
	{
		// End:0xB9
		if(NewPlayer.PlayerReplicationInfo.bOnlySpectator)
		{
			NewPlayer.ServerJoinSpectator();
		}
		NewPlayer.ClientShowPreGameLobby();
	}
	return;
}

function PlayStartUpMessage(PlayerPawn NewPlayer, optional int CountDown)
{
	local int i, j;
	local string LocPackage, LocSection;

	LocSection = "dnDeathmatchGame";
	LocPackage = "dngame";
	NewPlayer.ClearProgressMessages();
	NewPlayer.SetProgressMessage(LocSection, "GameName", LocPackage, __NFUN_184__(i), true);
	// End:0xAF
	if(__NFUN_201__(FragLimit, float(0)))
	{
		NewPlayer.SetProgressMessageSplitByNum(LocSection, "GameGoalPrefix", int(FragLimit), "GameGoal", LocPackage, __NFUN_184__(i));
	}
	// End:0x110
	if(__NFUN_170__(RoundTimeLimit, 0))
	{
		NewPlayer.SetProgressMessageSplitByNum(LocSection, "TimeLimitMessageStart", __NFUN_163__(RoundTimeLimit, 60), "TimeLimitMessageEnd", LocPackage, __NFUN_184__(i));
	}
	NewPlayer.SetProgressMessage(LocSection, "RulesMessage0", LocPackage, __NFUN_184__(i));
	NewPlayer.SetProgressTime(float(StartupMessageDuration));
	return;
}

function InitGameReplicationInfo()
{
	super(GameInfo).InitGameReplicationInfo();
	dnDeathmatchGameReplicationInfo(GameReplicationInfo).FragLimit = int(FragLimit);
	dnDeathmatchGameReplicationInfo(GameReplicationInfo).TimeLimit = TimeLimit;
	dnDeathmatchGameReplicationInfo(GameReplicationInfo).RoundTimeLimit = RoundTimeLimit;
	dnDeathmatchGameReplicationInfo(GameReplicationInfo).MinPlayers = MinPlayers;
	return;
}

function PostBeginPlay()
{
	local string NextPlayerClass;
	local int i;
	local DukeMultiPlayer DukePlayer;

	super.PostBeginPlay();
	SetInventoryBuild();
	BaseMutator.ModifyDefaultInventory(Class, DefaultInventory);
	Announcer = __NFUN_615__(class'MP_Announcer');
	bEORCountStarted = false;
	DukePlayer = DukeMultiPlayer(Level.__NFUN_1161__());
	// End:0x72
	if(__NFUN_340__(DukePlayer, none))
	{
		DukePlayer.bHasSubmittedScoresThisRound = false;
	}
	return;
}

function SetInventoryBuild()
{
	switch(InventoryBuild)
	{
		// End:0x1B
		case 2:
			DefaultInventory = AllDefaultInventory;
			// End:0x44
			break;
		// End:0x2E
		case 1:
			DefaultInventory = MedDefaultInventory;
			// End:0x44
			break;
		// End:0x33
		case 0:
		// End:0xFFFF
		default:
			DefaultInventory = MinDefaultInventory;
			// End:0x44
			break;
			break;
	}
	return;
}

function SetGameSpeed(float t)
{
	GameSpeed = __NFUN_225__(t, 0.1);
	Level.TimeDilation = GameSpeed;
	__NFUN_605__(Level.TimeDilation, true, 'GameSpeedCallback');
	return;
}

function DoEffectSpawn(Actor Incoming, class<Actor> ClassName, Vector Offset)
{
	local dnFXSpawner SpawnFX;

	SpawnFX = __NFUN_615__(class'dnFXSpawner',,, Incoming.Location);
	SpawnFX.FXClass = ClassName;
	SpawnFX.SetScaleFactor(Incoming.DrawScale);
	SpawnFX.DoSpawn();
	return;
}

function PlayTeleportEffect(Actor Incoming, bool bOut, bool bSound)
{
	// End:0x3D
	if(__NFUN_340__(DukeMultiPlayer(Incoming), none))
	{
		DukeMultiPlayer(Incoming).PlayTeleportEffect(PlayerSpawnClass, Incoming.Location);		
	}
	else
	{
		DoEffectSpawn(Incoming, PlayerSpawnClass, __NFUN_232__(0, 0, 0));
	}
	return;
}

function float PlaySpawnEffect(Pickup Incoming)
{
	DoEffectSpawn(Incoming, ItemSpawnClass, __NFUN_232__(0, 0, 0));
	return;
}

function bool NeedPlayers()
{
	return __NFUN_148__(__NFUN_145__(bGameEnded), __NFUN_169__(__NFUN_165__(NumPlayers, NumBots), MinPlayers));
	return;
}

function NoTimer()
{
	local Pawn P;

	P = Level.PawnList;
	J0x15:

	// End:0xA0 [Loop If]
	if(__NFUN_340__(P, none))
	{
		// End:0x88
		if(__NFUN_148__(__NFUN_148__(__NFUN_148__(P.bIsPlayerPawn, P.IsDead()), P.bHidden), P.IsActiveInGame()))
		{
			PlayerPawn(P).ServerRestartPlayer();
		}
		P = P.NextPawn;
		// [Loop Continue]
		goto J0x15;
	}
	return;
}

function SetOvertime(bool B)
{
	bOvertime = B;
	return;
}

function GameTimer()
{
	local Pawn P;
	local float RemainingTime, RoundRemainingTime;
	local int highscore, tieCount;
	local MPGameReplicationInfo GRI;

	highscore = -9999;
	P = Level.PawnList;
	J0x20:

	// End:0xC5 [Loop If]
	if(__NFUN_340__(P, none))
	{
		// End:0xAD
		if(__NFUN_148__(P.bIsPlayerPawn, __NFUN_150__(__NFUN_148__(__NFUN_148__(P.IsDead(), P.bHidden), P.IsActiveInGame()), __NFUN_173__(int(P.Physics), int(0)))))
		{
			PlayerPawn(P).ServerRestartPlayer();
		}
		P = P.NextPawn;
		// [Loop Continue]
		goto J0x20;
	}
	// End:0x123
	if(__NFUN_170__(TimeLimit, 0))
	{
		GameReplicationInfo.bStopCountDown = false;
		RemainingTime = float(GameReplicationInfo.GetRemainingMatchTime());
		// End:0x123
		if(__NFUN_148__(__NFUN_202__(RemainingTime, float(0)), __NFUN_145__(bOvertime)))
		{
			RequestEndGame("timelimit");
		}
	}
	// End:0x332
	if(__NFUN_148__(__NFUN_148__(__NFUN_145__(bGameEnded), __NFUN_170__(RoundTimeLimit, 0)), __NFUN_145__(bRoundEnded)))
	{
		RoundRemainingTime = float(GameReplicationInfo.GetRemainingRoundTime());
		TimeWarning(int(RoundRemainingTime));
		// End:0x332
		if(__NFUN_202__(RoundRemainingTime, float(0)))
		{
			P = Level.PawnList;
			J0x18C:

			// End:0x223 [Loop If]
			if(__NFUN_340__(P, none))
			{
				// End:0x1C2
				if(__NFUN_173__(P.PlayerReplicationInfo.Score, highscore))
				{
					__NFUN_184__(tieCount);
				}
				// End:0x20B
				if(__NFUN_170__(P.PlayerReplicationInfo.Score, highscore))
				{
					highscore = P.PlayerReplicationInfo.Score;
					tieCount = 0;
				}
				P = P.NextPawn;
				// [Loop Continue]
				goto J0x18C;
			}
			// End:0x2A8
			if(__NFUN_170__(tieCount, 0))
			{
				// End:0x24E
				if(__NFUN_145__(bOvertime))
				{
					Announcer.TriggerQueueAnnounce('Announce_Overtime');
				}
				SetOvertime(true);
				P = Level.PawnList;
				J0x26A:

				// End:0x2A5 [Loop If]
				if(__NFUN_340__(P, none))
				{
					DukeMultiPlayer(P).bOvertime = true;
					P = P.NextPawn;
					// [Loop Continue]
					goto J0x26A;
				}				
			}
			else
			{
				SetOvertime(false);
				P = Level.PawnList;
				J0x2C4:

				// End:0x2FF [Loop If]
				if(__NFUN_340__(P, none))
				{
					DukeMultiPlayer(P).bOvertime = false;
					P = P.NextPawn;
					// [Loop Continue]
					goto J0x2C4;
				}
			}
			// End:0x321
			if(bOvertime)
			{
				GameReplicationInfo.ExtendRoundTimeLimit(float(OvertimeDuration));				
			}
			else
			{
				RequestEndGame("fraglimit");
			}
		}
	}
	return;
}

function CountDownTimer()
{
	local Pawn P;
	local float oldcountdowntime;

	oldcountdowntime = GameReplicationInfo.CountDown;
	P = Level.PawnList;
	J0x2A:

	// End:0xB5 [Loop If]
	if(__NFUN_340__(P, none))
	{
		// End:0x9D
		if(__NFUN_148__(__NFUN_148__(__NFUN_148__(P.bIsPlayerPawn, P.IsDead()), P.bHidden), P.IsActiveInGame()))
		{
			PlayerPawn(P).ServerRestartPlayer();
		}
		P = P.NextPawn;
		// [Loop Continue]
		goto J0x2A;
	}
	GameReplicationInfo.SetCountdown(__NFUN_210__(GameReplicationInfo.CountDown, Level.TimeDilation));
	// End:0x18F
	if(__NFUN_201__(oldcountdowntime, 0))
	{
		// End:0x165
		if(__NFUN_202__(GameReplicationInfo.CountDown, 0))
		{
			GameReplicationInfo.SetRoundTimeLimit(__NFUN_199__(float(RoundTimeLimit), SavedElapsedTime));
			GameReplicationInfo.SetMatchTimeLimit(__NFUN_195__(60, float(TimeLimit)));
			Announcer.TriggerQueueAnnounce('Announce_MatchStart');
			CountDownDone();			
		}
		else
		{
			GameReplicationInfo.ElapsedTime = 0;
			GameReplicationInfo.LastReplicatedElapsedTime = 0;
		}
	}
	return;
}

function CountDownDone()
{
	local PlayerPawn PP;

	PP = Level.__NFUN_1161__();
	// End:0x2B
	if(__NFUN_339__(PP, none))
	{
		PP = GetAPlayer();
	}
	DukeMultiPlayer(PP).MatchStart();
	GlobalTrigger('resetswitches', none, self);
	return;
}

function GameEndWaitTimer()
{
	__NFUN_210__(GameReplicationInfo.ShowWinnerSeconds, Level.TimeDilation);
	// End:0x44
	if(__NFUN_202__(GameReplicationInfo.ShowWinnerSeconds, 0))
	{
		EndGame(savedEndGameReason);
	}
	return;
}

function GameSpeedCallback()
{
	local Pawn P;

	Timer();
	// End:0x4A
	if(__NFUN_203__(GameReplicationInfo.CountDown, 0))
	{
		__NFUN_355__(__NFUN_302__("CountDown=", string(GameReplicationInfo.CountDown)));
		CountDownTimer();		
	}
	else
	{
		// End:0x96
		if(__NFUN_201__(GameReplicationInfo.ShowWinnerSeconds, 0))
		{
			__NFUN_355__(__NFUN_302__("ShowWinnerSeconds=", string(GameReplicationInfo.ShowWinnerSeconds)));
			GameEndWaitTimer();			
		}
		else
		{
			// End:0xAA
			if(__NFUN_145__(IsAlone()))
			{
				GameTimer();				
			}
			else
			{
				NoTimer();
			}
		}
	}
	return;
}

function EndRound()
{
	local Pawn P;
	local Pickup PickupIter;
	local int OldPlayerRespawnDelay;

	bRoundEnded = true;
	GameReplicationInfo.SetRoundTimeLimit(float(RoundTimeLimit));
	GameReplicationInfo.SetMatchTimeLimit(__NFUN_195__(60, float(TimeLimit)));
	OldPlayerRespawnDelay = int(PlayerRespawnDelay);
	PlayerRespawnDelay = 0;
	P = Level.PawnList;
	J0x67:

	// End:0x10D [Loop If]
	if(__NFUN_340__(P, none))
	{
		// End:0xF5
		if(__NFUN_148__(__NFUN_150__(P.IsActiveInGame(), P.IsDead()), P.bIsPlayerPawn))
		{
			P.DiedActivity();
			P.PlayerReplicationInfo.NumLives = NumLives;
			PlayerPawn(P).ServerRestartPlayer(true);
		}
		P = P.NextPawn;
		// [Loop Continue]
		goto J0x67;
	}
	PlayerRespawnDelay = float(OldPlayerRespawnDelay);
	// End:0x160
	foreach __NFUN_747__(class'Pickup', PickupIter)
	{
		// End:0x14F
		if(__NFUN_200__(PickupIter.RespawnTime, float(0)))
		{
			PickupIter.__NFUN_614__();
			// End:0x15F
			continue;
		}
		PickupIter.WakeUp();		
	}	
	bRoundEnded = false;
	super.EndRound();
	return;
}

function ResetOvertime()
{
	local Pawn P;

	SetOvertime(false);
	P = Level.PawnList;
	J0x1C:

	// End:0x57 [Loop If]
	if(__NFUN_340__(P, none))
	{
		DukeMultiPlayer(P).bOvertime = false;
		P = P.NextPawn;
		// [Loop Continue]
		goto J0x1C;
	}
	return;
}

function BecameAlone()
{
	super.BecameAlone();
	ResetOvertime();
	__NFUN_209__(SavedElapsedTime, GameReplicationInfo.ElapsedTime);
	return;
}

function BecameNotAlone()
{
	super.BecameNotAlone();
	GameReplicationInfo.SetRoundTimeLimit(float(RoundTimeLimit));
	GameReplicationInfo.SetMatchTimeLimit(__NFUN_195__(60, float(TimeLimit)));
	return;
}

function bool PlayerFireDown(PlayerPawn P)
{
	return false;
	return;
}

function TimeWarning(int RemainingSeconds)
{
	// End:0x43
	if(__NFUN_148__(__NFUN_148__(__NFUN_171__(RemainingSeconds, 60), __NFUN_145__(playedTimeWarningMessage)), __NFUN_145__(IsAlone())))
	{
		Announcer.TriggerQueueAnnounce('Announce_1Min');
		playedTimeWarningMessage = true;
	}
	return;
}

function SendStartMessage(PlayerPawn P)
{
	P.ClearProgressMessages();
	P.SetProgressMessage("dnDeathmatchGame", "StartMessage", "dngame", 0);
	P.SetProgressTime(float(StartupMessageDuration));
	P.SetMatchStartTime(-1);
	return;
}

function StartMatch()
{
	local Pawn P;

	__NFUN_355__("********************************Match Started*********************************");
	GameReplicationInfo.SetRoundTimeLimit(float(RoundTimeLimit));
	GameReplicationInfo.SetMatchTimeLimit(__NFUN_195__(60, float(TimeLimit)));
	P = Level.PawnList;
	J0x9B:

	// End:0x16D [Loop If]
	if(__NFUN_340__(P, none))
	{
		// End:0x155
		if(__NFUN_148__(P.bIsPlayer, P.__NFUN_358__('PlayerPawn')))
		{
			PlayerPawn(P).ClientHideLobby();
			// End:0x155
			if(__NFUN_145__(P.PlayerReplicationInfo.bOnlySpectator))
			{
				P.PlayerReplicationInfo.NumLives = NumLives;
				RestartPlayer(P);
				PlayerPawn(P).ServerRestartPlayer(true);
				SendStartMessage(PlayerPawn(P));
			}
		}
		P = P.NextPawn;
		// [Loop Continue]
		goto J0x9B;
	}
	P = Level.PawnList;
	J0x182:

	// End:0x207 [Loop If]
	if(__NFUN_340__(P, none))
	{
		// End:0x1EF
		if(__NFUN_148__(P.bIsPlayer, __NFUN_145__(P.__NFUN_358__('PlayerPawn'))))
		{
			P.Restart();
			// End:0x1EF
			if(P.__NFUN_358__('DukeHumanBot'))
			{
				P.StartMatch();
			}
		}
		P = P.NextPawn;
		// [Loop Continue]
		goto J0x182;
	}
	MatchStartTime = Level.TimeSeconds;
	bStartMatch = true;
	return;
}

function bool PlayerCanRestart(Pawn Player)
{
	// End:0x33
	if(__NFUN_148__(__NFUN_145__(Player.bIsBot), __NFUN_145__(DukeMultiPlayer(Player).bRespawn)))
	{
		return false;
	}
	// End:0x5F
	if(__NFUN_148__(Player.IsActiveInGame(), __NFUN_145__(Player.IsDead())))
	{
		return false;
	}
	// End:0x98
	if(__NFUN_145__(MatchStarted()))
	{
		Player.ClientMessage("Match has not started yet.");
		return false;
	}
	return true;
	return;
}

function bool RestartPlayer(Pawn Player)
{
	local DukeMultiPlayer dmp;

	// End:0x12
	if(__NFUN_145__(super.RestartPlayer(Player)))
	{
		return false;
	}
	dmp = DukeMultiPlayer(Player);
	// End:0x71
	if(__NFUN_340__(dmp, none))
	{
		dmp.DisablePowerups();
		dmp.SetPostSpawnInvicibility();
		// End:0x71
		if(dmp.bOnSteroids)
		{
			dmp.EndSteroids();
		}
	}
	dmp.ViewRotationMode = 0;
	return true;
	return;
}

event AcceptInventory(Pawn PlayerPawn)
{
	// End:0x17
	if(__NFUN_145__(PlayerPawn.IsActiveInGame()))
	{
		return;
	}
	super(GameInfo).AcceptInventory(PlayerPawn);
	return;
}

function AddDefaultInventory(Pawn InventoryPawn)
{
	super(GameInfo).AddDefaultInventory(InventoryPawn);
	return;
}

function GiveInventoryTo(Pawn Other, class<Inventory> InventoryClass, optional bool bForce)
{
	// End:0x3B
	if(__NFUN_148__(__NFUN_339__(InventoryClass, PistolClass), Other.bIsPlayerPawn))
	{
		__NFUN_1167__(Other, GoldPistolClass, bForce);		
	}
	else
	{
		__NFUN_1167__(Other, InventoryClass, bForce);
	}
	return;
}

function float ShrunkenDamageScaler(float Damage, class<DamageType> DamageType, Pawn Injured, Pawn InstigatedBy)
{
	// End:0x20
	if(__NFUN_357__(DamageType, class'TraceDamageType'))
	{
		return InstigatedBy.DrawScale;
	}
	return 1;
	return;
}

function float ModifyDamage(float Damage, class<DamageType> DamageType, Pawn Injured, Pawn Instigator)
{
	Damage = super(GameInfo).ModifyDamage(Damage, DamageType, Injured, Instigator);
	__NFUN_207__(Damage, ShrunkenDamageScaler(Damage, DamageType, Injured, Instigator));
	return Damage;
	return;
}

function BroadcastRegularDeathMessage(Pawn Killer, Pawn Victim, class<DamageType> DamageType)
{
	// End:0x13
	if(__NFUN_339__(DukeMultiPlayer(Victim), none))
	{
		return;
	}
	super(GameInfo).BroadcastRegularDeathMessage(Killer, Victim, DamageType);
	return;
}

function Killed(Pawn Killer, Pawn Victim, class<DamageType> DamageType, float KillingDamage)
{
	local int NextTaunt, i;
	local bool bAutoTaunt, bSpecialDamage;
	local Pawn P, Best;

	super(GameInfo).Killed(Killer, Victim, DamageType, KillingDamage);
	// End:0x25
	if(bRoundEnded)
	{
		return;
	}
	// End:0x4E
	if(__NFUN_172__(Victim.Spree, KillingSpreeStart))
	{
		EndSpree(Killer, Victim);
	}
	Victim.Spree = 0;
	Victim.LastKillDamageType = none;
	Victim.WeaponSpree = 0;
	// End:0xF9
	if(__NFUN_339__(Victim, Killer))
	{
		BroadcastRegularDeathMessage(none, Victim, class'SuicideDamage');
		// End:0xF6
		if(__NFUN_201__(Level.TimeSeconds, LastSuicideAnnouceTime))
		{
			LastSuicideAnnouceTime = __NFUN_198__(Level.TimeSeconds, SuicideAnnouceDelayTime);
			Announcer.TriggerQueueAnnounce('Announce_Suicide', Victim, Killer);
		}		
	}
	else
	{
		// End:0x148
		if(__NFUN_148__(__NFUN_148__(Victim.IsFrozen(), __NFUN_340__(DamageType, class'LaserMineDamage')), __NFUN_340__(DamageType, class'PipeBombDamage')))
		{
			BroadcastRegularDeathMessage(Killer, Victim, class'FrozenShatterDamage');			
		}
		else
		{
			BroadcastRegularDeathMessage(Killer, Victim, DamageType);
		}
	}
	CheckWinLimit(Killer);
	// End:0x184
	if(__NFUN_150__(__NFUN_339__(Killer, none), __NFUN_339__(Victim, none)))
	{
		return;
	}
	// End:0x36C
	if(__NFUN_148__(__NFUN_148__(__NFUN_148__(__NFUN_148__(Victim.bIsPlayer, __NFUN_340__(Killer, none)), Killer.bIsPlayer), __NFUN_340__(Killer, Victim)), __NFUN_150__(__NFUN_145__(bTeamGame), __NFUN_174__(int(Victim.PlayerReplicationInfo.Team), int(Killer.PlayerReplicationInfo.Team)))))
	{
		// End:0x2DF
		if(__NFUN_148__(__NFUN_148__(bDoWeaponSpree, __NFUN_339__(Killer.LastKillDamageType, DamageType)), __NFUN_309__(DamageType.default.WeaponSpreeMessageType, "")))
		{
			__NFUN_184__(Killer.WeaponSpree);
			__NFUN_184__(Killer.Spree);
			// End:0x2A8
			if(__NFUN_170__(Killer.WeaponSpree, 1))
			{
				NotifyWeaponSpree(Killer, Killer.WeaponSpree, DamageType);
			}
			// End:0x2DC
			if(__NFUN_172__(Killer.Spree, KillingSpreeStart))
			{
				NotifySpree(Killer, Killer.Spree, true);
			}			
		}
		else
		{
			// End:0x32C
			if(bDoSpree)
			{
				__NFUN_184__(Killer.Spree);
				// End:0x32C
				if(__NFUN_172__(Killer.Spree, KillingSpreeStart))
				{
					NotifySpree(Killer, Killer.Spree);
				}
			}
		}
		// End:0x36C
		if(__NFUN_340__(Killer.LastKillDamageType, DamageType))
		{
			Killer.WeaponSpree = 1;
			Killer.LastKillDamageType = DamageType;
		}
	}
	return;
}

function NotifySpree(Pawn Other, int Num, optional bool bSkipOther)
{
	local Pawn P;

	return;
	Num = __NFUN_166__(Num, KillingSpreeStart);
	P = Level.PawnList;
	J0x29:

	// End:0x94 [Loop If]
	if(__NFUN_340__(P, none))
	{
		// End:0x53
		if(__NFUN_148__(bSkipOther, __NFUN_339__(P, Other)))
		{			
		}
		else
		{
			P.ReceiveLocalizedMessage(class'dnKillingSpreeMessage', Num, Other.PlayerReplicationInfo);
		}
		P = P.NextPawn;
		// [Loop Continue]
		goto J0x29;
	}
	return;
}

function NotifyWeaponSpree(Pawn Other, int Num, class<DamageType> DamageType)
{
	local Pawn P;
	local class<dnWeaponSpreeMessage> WSC;

	return;
	WSC = class<dnWeaponSpreeMessage>(__NFUN_366__(DamageType.default.WeaponSpreeMessageType, class'Class'));
	Other.ReceiveLocalizedMessage(WSC, 0, Other.PlayerReplicationInfo,,, DamageType);
	return;
}

function EndSpree(Pawn Killer, Pawn Other)
{
	local Pawn P;

	return;
	// End:0x19
	if(__NFUN_145__(Other.bIsPlayer))
	{
		return;
	}
	P = Level.PawnList;
	J0x2E:

	// End:0xEA [Loop If]
	if(__NFUN_340__(P, none))
	{
		// End:0x54
		if(__NFUN_145__(P.__NFUN_358__('DukePlayer')))
		{			
		}
		else
		{
			// End:0x9F
			if(__NFUN_150__(__NFUN_339__(Killer, none), __NFUN_145__(Killer.bIsPlayer)))
			{
				DukePlayer(P).EndSpree(none, Other.PlayerReplicationInfo);				
			}
			else
			{
				DukePlayer(P).EndSpree(Killer.PlayerReplicationInfo, Other.PlayerReplicationInfo);
			}
		}
		P = P.NextPawn;
		// [Loop Continue]
		goto J0x2E;
	}
	return;
}

function ScoreKill(Pawn Killer, Pawn Victim)
{
	local dnDeathmatchGameReplicationInfo GRI;

	GRI = dnDeathmatchGameReplicationInfo(GameReplicationInfo);
	// End:0x52
	if(__NFUN_340__(GRI, none))
	{
		// End:0x52
		if(__NFUN_150__(__NFUN_201__(GRI.CountDown, 0), __NFUN_201__(GRI.ShowWinnerSeconds, 0)))
		{
			return;
		}
	}
	// End:0xCD
	if(__NFUN_145__(IsAlone()))
	{
		// End:0x8B
		if(__NFUN_148__(__NFUN_150__(__NFUN_339__(Killer, Victim), __NFUN_339__(Killer, none)), __NFUN_145__(bRoundEnded)))
		{			
		}
		else
		{
			// End:0xCD
			if(__NFUN_340__(Killer, none))
			{
				// End:0xCD
				if(__NFUN_340__(Killer.PlayerReplicationInfo, none))
				{
					__NFUN_180__(Killer.PlayerReplicationInfo.Score, ScoreBonus);
				}
			}
		}
	}
	BaseMutator.ScoreKill(Killer, Victim);
	return;
}

function PlayerPawn GetAPlayer(optional bool bCheckIfHasGRI)
{
	local Pawn P;

	P = Level.PawnList;
	J0x15:

	// End:0x7F [Loop If]
	if(__NFUN_340__(P, none))
	{
		// End:0x67
		if(P.bIsPlayerPawn)
		{
			// End:0x67
			if(__NFUN_150__(__NFUN_145__(bCheckIfHasGRI), __NFUN_340__(PlayerPawn(P).GameReplicationInfo, none)))
			{
				return PlayerPawn(P);
			}
		}
		P = P.NextPawn;
		// [Loop Continue]
		goto J0x15;
	}
	return;
}

function RequestEndGame(string Reason)
{
	local dnTeamInfo WinningTeam, LosingTeam;
	local dnDeathmatchGameReplicationInfo GRI;
	local DukeMultiPlayer P, winner;
	local Pawn Pawn;
	local int high_score;

	// End:0x2CA
	if(__NFUN_145__(bPlayedEndingVO))
	{
		// End:0x1BA
		if(bTeamGame)
		{
			P = DukeMultiPlayer(GetAPlayer(true));
			// End:0x34
			if(__NFUN_339__(P, none))
			{
				return;
			}
			GRI = dnDeathmatchGameReplicationInfo(P.GameReplicationInfo);
			// End:0x5C
			if(__NFUN_339__(GRI, none))
			{
				return;
			}
			// End:0x10B
			if(__NFUN_170__(GRI.Teams[0].Score, GRI.Teams[1].Score))
			{
				// End:0xF3
				if(__NFUN_201__(__NFUN_196__(float(GRI.Teams[0].Score), 2), float(GRI.Teams[1].Score)))
				{
					Announcer.TriggerQueueAnnounce('Announce_Dominate_Blue');					
				}
				else
				{
					Announcer.TriggerQueueAnnounce('Announce_Winner_Blue');
				}				
			}
			else
			{
				// End:0x1B7
				if(__NFUN_169__(GRI.Teams[0].Score, GRI.Teams[1].Score))
				{
					// End:0x1A2
					if(__NFUN_200__(float(GRI.Teams[0].Score), __NFUN_196__(float(GRI.Teams[1].Score), 2)))
					{
						Announcer.TriggerQueueAnnounce('Announce_Dominate_Red');						
					}
					else
					{
						Announcer.TriggerQueueAnnounce('Announce_Winner_Red');
					}
				}
			}			
		}
		else
		{
			high_score = -100;
			Pawn = Level.PawnList;
			J0x1DA:

			// End:0x26A [Loop If]
			if(__NFUN_340__(Pawn, none))
			{
				P = DukeMultiPlayer(Pawn);
				// End:0x205
				if(__NFUN_339__(P, none))
				{					
				}
				else
				{
					// End:0x252
					if(__NFUN_170__(P.PlayerReplicationInfo.Score, high_score))
					{
						winner = P;
						high_score = P.PlayerReplicationInfo.Score;
					}
				}
				Pawn = Pawn.NextPawn;
				// [Loop Continue]
				goto J0x1DA;
			}
			Pawn = Level.PawnList;
			J0x27F:

			// End:0x2CA [Loop If]
			if(__NFUN_340__(Pawn, none))
			{
				Announcer.AnnounceEndFFA(DukeMultiPlayer(Pawn), __NFUN_339__(Pawn, winner));
				Pawn = Pawn.NextPawn;
				// [Loop Continue]
				goto J0x27F;
			}
		}
	}
	super.RequestEndGame(Reason);
	return;
}

function bool SetEndCams(string Reason)
{
	local Pawn P, Best;
	local PlayerPawn Player;
	local bool bTied;

	P = Level.PawnList;
	J0x15:

	// End:0xEB [Loop If]
	if(__NFUN_340__(P, none))
	{
		// End:0xD3
		if(__NFUN_148__(P.bIsPlayer, __NFUN_150__(__NFUN_339__(Best, none), __NFUN_172__(P.PlayerReplicationInfo.Score, Best.PlayerReplicationInfo.Score))))
		{
			// End:0xC8
			if(__NFUN_148__(__NFUN_340__(Best, none), __NFUN_173__(P.PlayerReplicationInfo.Score, Best.PlayerReplicationInfo.Score)))
			{
				bTied = true;
			}
			Best = P;
		}
		P = P.NextPawn;
		// [Loop Continue]
		goto J0x15;
	}
	// End:0x124
	if(bTied)
	{
		GameReplicationInfo.GameEndedComments = "Match ended in a tie";
		Best = none;		
	}
	else
	{
		GameReplicationInfo.GameEndedComments = __NFUN_303__(Best.PlayerReplicationInfo.PlayerName, GameEndedMessage);
	}
	EndTime = __NFUN_198__(Level.TimeSeconds, 3);
	// End:0x18F
	if(__NFUN_340__(Best, none))
	{
		Best.bAlwaysRelevant = true;
	}
	__NFUN_355__(__NFUN_302__(__NFUN_302__(__NFUN_302__("Game ended at ", string(EndTime)), " Reason:"), Reason));
	P = Level.PawnList;
	J0x1D5:

	// End:0x290 [Loop If]
	if(__NFUN_340__(P, none))
	{
		Player = PlayerPawn(P);
		// End:0x268
		if(__NFUN_340__(Player, none))
		{
			Player.bBehindView = true;
			// End:0x233
			if(__NFUN_339__(Player, Best))
			{
				Player.ViewTarget = none;				
			}
			else
			{
				Player.ViewTarget = Best;
			}
			Player.ClientGameEnded();
			Player.ClientShowPostGameLobby();
		}
		P.EnterStasis();
		P = P.NextPawn;
		// [Loop Continue]
		goto J0x1D5;
	}
	Level.XboxEndMatch();
	return true;
	return;
}

function RestartGame()
{
	local string NextMap;
	local MapList myList;

	// End:0x0B
	if(bDontRestart)
	{
		return;
	}
	// End:0x26
	if(__NFUN_201__(EndTime, Level.TimeSeconds))
	{
		return;
	}
	// End:0xC9
	if(__NFUN_148__(__NFUN_148__(bUseMapCycle, __NFUN_145__(bAlreadyChanged)), __NFUN_340__(MapListType, none)))
	{
		bAlreadyChanged = true;
		myList = __NFUN_615__(MapListType);
		NextMap = myList.GetNextMap();
		myList.__NFUN_614__();
		// End:0xA4
		if(__NFUN_308__(NextMap, ""))
		{
			NextMap = __NFUN_760__(MapPrefix, NextMap, 1);
		}
		// End:0xC9
		if(__NFUN_309__(NextMap, ""))
		{
			Level.ServerTravel(NextMap, false);
			return;
		}
	}
	Level.ServerTravel("?Restart", false);
	bGameOver = false;
	return;
}

event InitGame(string Options, out string Error)
{
	local string InOpt;

	super.InitGame(Options, Error);
	FragLimit = float(GetIntOption(Options, "FragLimit", int(FragLimit)));
	TimeLimit = GetIntOption(Options, "TimeLimit", TimeLimit);
	RoundTimeLimit = GetIntOption(Options, "RoundTimeLimit", RoundTimeLimit);
	SetGameSpeed(GameSpeed);
	bNetReady = true;
	bGameOver = false;
	return;
}

function string GetRules()
{
	local string ResultSet;

	ResultSet = super(GameInfo).GetRules();
	ResultSet = __NFUN_302__(__NFUN_302__(ResultSet, "\\timelimit\\"), string(TimeLimit));
	ResultSet = __NFUN_302__(__NFUN_302__(ResultSet, "\\fraglimit\\"), string(FragLimit));
	ResultSet = __NFUN_302__(__NFUN_302__(ResultSet, "\\minplayers\\"), string(MinPlayers));
	ResultSet = __NFUN_302__(__NFUN_302__(ResultSet, "\\mapcycle\\"), string(bUseMapCycle));
	ResultSet = __NFUN_302__(ResultSet, "\\gamestyle\\Normal");
	return ResultSet;
	return;
}

function DestroyInventory(Pawn Other)
{
	local Inventory Inv;

	Other.Weapon = none;
	Other.SelectedItem = none;
	Inv = Other.InventoryListHead;
	J0x37:

	// End:0x68 [Loop If]
	if(__NFUN_340__(Inv, none))
	{
		Inv.__NFUN_614__();
		Inv = Inv.NextInventory;
		// [Loop Continue]
		goto J0x37;
	}
	return;
}

function bool MatchStarted()
{
	return bStartMatch;
	return;
}

function bool CanStartMatch()
{
	// End:0x11
	if(__NFUN_169__(NumPlayers, MinPlayers))
	{
		return false;
	}
	return true;
	return;
}

function ExecuteVote()
{
	local string NextMap;
	local MapList myList;

	// End:0x55
	if(__NFUN_308__(VoteCmd, "changerules"))
	{
		dnDeathmatchGameReplicationInfo(GameReplicationInfo).FragLimit = int(VoteArgs[0]);
		dnDeathmatchGameReplicationInfo(GameReplicationInfo).TimeLimit = int(VoteArgs[1]);		
	}
	else
	{
		// End:0x10F
		if(__NFUN_308__(VoteCmd, "nextmap"))
		{
			// End:0x10C
			if(__NFUN_148__(__NFUN_148__(bUseMapCycle, __NFUN_145__(bAlreadyChanged)), __NFUN_340__(MapListType, none)))
			{
				bAlreadyChanged = true;
				myList = __NFUN_615__(MapListType);
				NextMap = myList.GetNextMap();
				myList.__NFUN_614__();
				// End:0xE7
				if(__NFUN_308__(NextMap, ""))
				{
					NextMap = __NFUN_760__(MapPrefix, NextMap, 1);
				}
				// End:0x10C
				if(__NFUN_309__(NextMap, ""))
				{
					Level.ServerTravel(NextMap, false);
					return;
				}
			}			
		}
		else
		{
			super(GameInfo).ExecuteVote();
		}
	}
	return;
}

function bool AddBot()
{
	local bool bStoredOverride;
	local PlayerPawn Bot;
	local string Error;

	bStoredOverride = bOverridePlayerClass;
	bOverridePlayerClass = false;
	Bot = Login("", __NFUN_302__("?Name=", EncodeString("DukeBot")), Error, class'DukeBot');
	// End:0x5E
	if(__NFUN_340__(Bot, none))
	{
		PostLogin(Bot);
	}
	bOverridePlayerClass = bStoredOverride;
	Bot.DiedActivity();
	return;
}

function bool ForceAddBot()
{
	// End:0x37
	if(__NFUN_174__(int(Level.NetMode), int(NM_Standalone)))
	{
		MinPlayers = __NFUN_189__(__NFUN_165__(MinPlayers, 1), __NFUN_165__(__NFUN_165__(NumPlayers, NumBots), 1));
	}
	AddBot();
	return;
}

function bool ValidAccuracyHit(Pawn Instigator, Pawn Victim, class<DamageType> DamageType)
{
	local bool bRet;

	bRet = super(GameInfo).ValidAccuracyHit(Instigator, Victim, DamageType);
	// End:0x2E
	if(__NFUN_357__(DamageType, class'MeleeDamage'))
	{
		return false;
	}
	return bRet;
	return;
}

exec function SpawnBot()
{
	ForceAddBot();
	return;
}

exec function AddMutator(string MutatorName)
{
	local class<Mutator> MClass;

	MClass = class<Mutator>(__NFUN_366__(MutatorName, class'Class'));
	// End:0x4D
	if(__NFUN_339__(MClass, none))
	{
		__NFUN_355__(__NFUN_303__(__NFUN_303__("Mutator", MutatorName), "does not exist"));
		return;
	}
	BaseMutator.AddMutator(__NFUN_615__(MClass));
	BroadcastMessage(__NFUN_303__(MutatorName, "mutator enabled"));
	UpdateMutatorURL();
	return;
}

exec function RemoveMutator(string MutatorName)
{
	local Mutator MutatorIter;

	MutatorIter = BaseMutator;
	J0x0B:

	// End:0xCC [Loop If]
	if(__NFUN_340__(MutatorIter.NextMutator, none))
	{
		__NFUN_355__(string(MutatorIter.NextMutator.Class));
		// End:0xB4
		if(__NFUN_310__(string(MutatorIter.NextMutator.Class), MutatorName))
		{
			MutatorIter.NextMutator = MutatorIter.NextMutator.NextMutator;
			BroadcastMessage(__NFUN_303__(MutatorName, "mutator disabled"));
			UpdateMutatorURL();
			return;
		}
		MutatorIter = MutatorIter.NextMutator;
		// [Loop Continue]
		goto J0x0B;
	}
	return;
}

exec function ListMutators()
{
	local Mutator MutatorIter;

	BroadcastMessage("Mutators loaded:");
	MutatorIter = BaseMutator.NextMutator;
	J0x2D:

	// End:0x67 [Loop If]
	if(__NFUN_340__(MutatorIter, none))
	{
		BroadcastMessage(string(MutatorIter.Class));
		MutatorIter = MutatorIter.NextMutator;
		// [Loop Continue]
		goto J0x2D;
	}
	return;
}

function UpdateMutatorURL()
{
	local string MutatorString;
	local Mutator MutatorIter;

	MutatorIter = BaseMutator.NextMutator;
	J0x15:

	// End:0x74 [Loop If]
	if(__NFUN_340__(MutatorIter, none))
	{		
		__NFUN_311__(MutatorString, string(MutatorIter.Class));
		// End:0x5C
		if(__NFUN_340__(MutatorIter.NextMutator, none))
		{			
			__NFUN_311__(MutatorString, ",");
		}
		MutatorIter = MutatorIter.NextMutator;
		// [Loop Continue]
		goto J0x15;
	}
	UpdateURL("Mutator", MutatorString);
	return;
}

function CheckTelefrag(Pawn Player)
{
	local Pawn P;
	local float TelefragDistanceSq;

	// End:0x17
	if(__NFUN_145__(Player.IsActiveInGame()))
	{
		return;
	}
	TelefragDistanceSq = __NFUN_195__(__NFUN_195__(Player.CollisionRadius, Player.CollisionRadius), 3.5);
	P = Level.PawnList;
	J0x59:

	// End:0xEC [Loop If]
	if(__NFUN_340__(P, none))
	{
		// End:0xD4
		if(__NFUN_148__(__NFUN_340__(P, Player), P.IsActiveInGame()))
		{
			// End:0xD4
			if(__NFUN_200__(__NFUN_252__(__NFUN_239__(Player.Location, P.Location)), TelefragDistanceSq))
			{
				P.DiedActivity(Player, 125,,, class'TelefragDamage');
			}
		}
		P = P.NextPawn;
		// [Loop Continue]
		goto J0x59;
	}
	return;
}

exec function SetFragLimit(int NewFragLimit)
{
	FragLimit = float(NewFragLimit);
	dnDeathmatchGameReplicationInfo(GameReplicationInfo).FragLimit = NewFragLimit;
	return;
}

function bool CanSpectate(Pawn Viewer, Actor ViewTarget)
{
	// End:0x1C
	if(__NFUN_150__(__NFUN_339__(ViewTarget, none), __NFUN_339__(Viewer, none)))
	{
		return false;
	}
	// End:0x4F
	if(__NFUN_150__(__NFUN_145__(ViewTarget.bIsPawn), __NFUN_145__(Pawn(ViewTarget).IsActiveInGame())))
	{
		return false;
	}
	// End:0x91
	if(__NFUN_148__(Viewer.PlayerReplicationInfo.IsSpectating(), __NFUN_173__(int(Viewer.PlayerReplicationInfo.Team), 255)))
	{
		return true;
	}
	// End:0xD1
	if(__NFUN_174__(int(Viewer.PlayerReplicationInfo.Team), int(Pawn(ViewTarget).PlayerReplicationInfo.Team)))
	{
		return false;
	}
	// End:0xE6
	if(Viewer.IsDead())
	{
		return true;
	}
	return;
}

exec function ToggleCorpses()
{
	local DukeMultiPlayerCorpse C;

	class'DukeMultiPlayerCorpse'.default.bDontUseMeqonPhysics = __NFUN_145__(class'DukeMultiPlayerCorpse'.default.bDontUseMeqonPhysics);
	// End:0x55
	foreach __NFUN_747__(class'DukeMultiPlayerCorpse', C)
	{
		C.bDontUseMeqonPhysics = class'DukeMultiPlayerCorpse'.default.bDontUseMeqonPhysics;		
	}	
	__NFUN_355__(__NFUN_302__("Using Duke Rag Dolls:", string(__NFUN_145__(class'DukeMultiPlayerCorpse'.default.bDontUseMeqonPhysics))));
	return;
}

function CheckWinLimit(Pawn Killer)
{
	// End:0x69
	if(__NFUN_148__(__NFUN_148__(__NFUN_148__(__NFUN_201__(FragLimit, float(0)), __NFUN_340__(Killer, none)), __NFUN_340__(Killer.PlayerReplicationInfo, none)), __NFUN_203__(float(Killer.PlayerReplicationInfo.Score), FragLimit)))
	{
		RequestEndGame("fraglimit");
	}
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super(Actor).RegisterPrecacheComponents(PrecacheIndex);
	SetInventoryBuild();
	PrecacheIndex.__NFUN_1266__(GoldPistolClass);
	PrecacheIndex.__NFUN_1266__(PlayerSpawnClass);
	PrecacheIndex.__NFUN_1266__(ItemSpawnClass);
	PrecacheIndex.__NFUN_1276__(CountdownSoundInfo);
	PrecacheIndex.__NFUN_1277__(class'VoicePack_MP_Announcer', 'Announce_Overtime');
	PrecacheIndex.__NFUN_1277__(class'VoicePack_MP_Announcer', 'Announce_MatchStart');
	PrecacheIndex.__NFUN_1277__(class'VoicePack_MP_Announcer', 'Announce_1Min');
	PrecacheIndex.__NFUN_1277__(class'VoicePack_MP_Announcer', 'Announce_Suicide');
	PrecacheIndex.__NFUN_1277__(class'VoicePack_MP_Announcer', 'Announce_Dominate_Blue');
	PrecacheIndex.__NFUN_1277__(class'VoicePack_MP_Announcer', 'Announce_Winner_Blue');
	PrecacheIndex.__NFUN_1277__(class'VoicePack_MP_Announcer', 'Announce_Dominate_Red');
	PrecacheIndex.__NFUN_1277__(class'VoicePack_MP_Announcer', 'Announce_Winner_Red');
	return;
}

defaultproperties
{
	FragLimit=20
	RoundTimeLimit=600
	RestartWait=10
	MinPlayers=1
	OvertimeDuration=60
	StartupMessageDuration=3
	CountDown=10
	bDoSpree=true
	bDoWeaponSpree=true
	ScorePenalty=1
	ScoreBonus=1
	StartMessage="<?int?dnGame.dnDeathmatchGame.StartMessage?>"
	StartUpMessage="<?int?dnGame.dnDeathmatchGame.StartUpMessage?>"
	CountdownMessage="<?int?dnGame.dnDeathmatchGame.CountdownMessage?>"
	WaitingMessage1="<?int?dnGame.dnDeathmatchGame.WaitingMessage1?>"
	WaitingMessage2="<?int?dnGame.dnDeathmatchGame.WaitingMessage2?>"
	ReadyMessage="<?int?dnGame.dnDeathmatchGame.ReadyMessage?>"
	NotReadyMessage="<?int?dnGame.dnDeathmatchGame.NotReadyMessage?>"
	GameGoalPrefix="<?int?dnGame.dnDeathmatchGame.GameGoalPrefix?>"
	GameGoal="<?int?dnGame.dnDeathmatchGame.GameGoal?>"
	RulesMessage="<?int?dnGame.dnDeathmatchGame.RulesMessage?>"
	TimeLimitMessageStart="<?int?dnGame.dnDeathmatchGame.TimeLimitMessageStart?>"
	TimeLimitMessageEnd="<?int?dnGame.dnDeathmatchGame.TimeLimitMessageEnd?>"
	EndRoundMessage="<?int?dnGame.dnDeathmatchGame.EndRoundMessage?>"
	GameEndedMessage="<?int?dnGame.dnDeathmatchGame.GameEndedMessage?>"
	bPlayHitNotify=true
	KillingSpreeStart=3
	CountdownSoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=/* Array type was not detected. */,BlendTotalTime[1]=class'DukeMultiPlayer')
	PistolClass='MP_Pistol'
	GoldPistolClass='MP_Pistol_Gold'
	DukePlayerMesh='c_characters.duke_mp'
	MinDefaultInventory(0)=class'User'
	MinDefaultInventory(1)=class'MP_MightyFoot'
	MinDefaultInventory(2)=class'MP_Pistol'
	MinDefaultInventory(3)=class'Upgrade_ZoomMode'
	MinDefaultInventory(4)=class'HasOverheated'
	MinDefaultInventory(5)=class'DukeHUD'
	MinDefaultInventory(6)=class'MP_Spawn_Player'
}