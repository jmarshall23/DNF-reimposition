/*******************************************************************************
 * dnKotHGameReplicationInfo generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnKotHGameReplicationInfo extends dnDeathmatchGameReplicationInfo
	config
	collapsecategories
	dependson(dnKingOfTheHill_Marker)
	dependson(dnKingOfTheHill_Projector)
	hidecategories(movement,Collision,Lighting,LightColor);

var int TimeLimit;
var int FragLimit;
var int RoundTimeLimit;
var int GoalTeamScore;
var dnTeamInfo Teams[4];
var int MinPlayers;
var bool bOffenseDefenseGame;
var int OffensiveTeam;
var dnKingOfTheHill_Projector Projector;

replication
{
	// Pos:0x000
	reliable if(__NFUN_173__(int(Role), int(ROLE_Authority)))
		FragLimit, GoalTeamScore, 
		MinPlayers, OffensiveTeam, 
		RoundTimeLimit, Teams, 
		TimeLimit, bOffenseDefenseGame;
}

simulated function dnKingOfTheHill_Projector GetProjector()
{
	// End:0x76
	if(__NFUN_339__(Projector, none))
	{
		Projector = __NFUN_615__(class'dnKingOfTheHill_Projector');
		Projector.Group[0] = __NFUN_615__(class'dnKingOfTheHill_ProjectorTeam0');
		Projector.Group[1] = __NFUN_615__(class'dnKingOfTheHill_ProjectorTeam1');
		Projector.Group[2] = Projector;
		Projector.TurnOffGroup();
	}
	// End:0xBA
	if(__NFUN_339__(Cylinder, none))
	{
		Cylinder = __NFUN_615__(class'dnKingOfTheHill_Cylinder');
		Cylinder.__NFUN_595__(class'DukeMultiplayerAssets'.default.CylinderMesh);
		Cylinder.__NFUN_590__(true);
	}
	return Projector;
	return;
}

simulated function PostBeginPlay()
{
	super(GameReplicationInfo).PostBeginPlay();
	GetProjector();
	return;
}

simulated function PostNetInitial()
{
	local dnKingOfTheHill_Marker marker;

	super(GameReplicationInfo).PostNetInitial();
	// End:0x16
	if(__NFUN_172__(int(Role), int(ROLE_Authority)))
	{
		return;
	}
	// End:0x4E
	foreach __NFUN_747__(class'dnKingOfTheHill_Marker', marker)
	{
		// End:0x4D
		if(marker.bActive)
		{
			marker.SetActive(true);
			// End:0x4E
			break;
		}		
	}	
	return;
}
