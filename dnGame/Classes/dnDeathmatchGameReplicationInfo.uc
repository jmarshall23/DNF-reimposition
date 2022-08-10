/*******************************************************************************
 * dnDeathmatchGameReplicationInfo generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnDeathmatchGameReplicationInfo extends MPGameReplicationInfo
	native
	config
	collapsecategories
	dependson(dnCTBHUD)
	hidecategories(movement,Collision,Lighting,LightColor);

enum EBabeState
{
	EBS_Standing,
	EBS_Carried,
	EBS_Dropped,
	EBS_Scored
};

var int TimeLimit;
var int FragLimit;
var int RoundTimeLimit;
var int GoalTeamScore;
var int MinPlayers;
var bool bOffenseDefenseGame;
var int OffensiveTeam;
var InteractiveActor Cylinder;
var float HillCountdown;
var dnDeathmatchGameReplicationInfo.EBabeState Team0BabeState;
var dnDeathmatchGameReplicationInfo.EBabeState Team1BabeState;
var float StandingTimeStamp;

replication
{
	// Pos:0x000
	reliable if(__NFUN_173__(int(Role), int(ROLE_Authority)))
		FragLimit, GoalTeamScore, 
		HillCountdown, MinPlayers, 
		OffensiveTeam, RoundTimeLimit, 
		Team0BabeState, Team1BabeState, 
		TimeLimit, bOffenseDefenseGame;
}

function SetBabe0State(dnDeathmatchGameReplicationInfo.EBabeState NewState)
{
	// End:0x27
	if(__NFUN_174__(int(NewState), int(Team0BabeState)))
	{
		Team0BabeState = NewState;
		NU_Babe0StateChange(NewState);
	}
	return;
}

function SetBabe1State(dnDeathmatchGameReplicationInfo.EBabeState NewState)
{
	// End:0x27
	if(__NFUN_174__(int(NewState), int(Team1BabeState)))
	{
		Team1BabeState = NewState;
		NU_Babe1StateChange(NewState);
	}
	return;
}

simulated function NU_Babe0StateChange(dnDeathmatchGameReplicationInfo.EBabeState BabeState)
{
	local string strMsg;

	// End:0x23
	if(__NFUN_173__(int(BabeState), int(0)))
	{
		StandingTimeStamp = Level.TimeSeconds;
	}
	strMsg = PrepareCTBMessageString(BabeState, 0);
	dnCTBHUD(Level.__NFUN_1161__().MyHUD).SetBabeState(0, BabeState, strMsg);
	return;
}

simulated function bool JustStoodUp()
{
	// End:0x22
	if(__NFUN_201__(__NFUN_199__(Level.TimeSeconds, StandingTimeStamp), 1))
	{
		return false;
	}
	return true;
	return;
}

simulated function NU_Babe1StateChange(dnDeathmatchGameReplicationInfo.EBabeState BabeState)
{
	local string strMsg;

	// End:0x23
	if(__NFUN_173__(int(BabeState), int(0)))
	{
		StandingTimeStamp = Level.TimeSeconds;
	}
	strMsg = PrepareCTBMessageString(BabeState, 1);
	dnCTBHUD(Level.__NFUN_1161__().MyHUD).SetBabeState(1, BabeState, strMsg);
	return;
}

simulated function string PrepareCTBMessageString(dnDeathmatchGameReplicationInfo.EBabeState BabeState, int Team)
{
	local array<string> ColourStr;
	local string strMsg;

	// End:0x42
	if(__NFUN_173__(Team, 0))
	{
		ColourStr[ColourStr.Add(1)] = dnCTBHUD(Level.__NFUN_1161__().MyHUD).RedStr;		
	}
	else
	{
		ColourStr[ColourStr.Add(1)] = dnCTBHUD(Level.__NFUN_1161__().MyHUD).BlueStr;
	}
	// End:0x242
	if(__NFUN_340__(dnCTBHUD(Level.__NFUN_1161__().MyHUD), none))
	{
		// End:0xD6
		if(__NFUN_173__(int(BabeState), int(1)))
		{
			strMsg = dnCTBHUD(Level.__NFUN_1161__().MyHUD).strMsgBabeCarried;			
		}
		else
		{
			// End:0x113
			if(__NFUN_173__(int(BabeState), int(3)))
			{
				strMsg = dnCTBHUD(Level.__NFUN_1161__().MyHUD).strMsgBabeScored;				
			}
			else
			{
				// End:0x150
				if(__NFUN_173__(int(BabeState), int(2)))
				{
					strMsg = dnCTBHUD(Level.__NFUN_1161__().MyHUD).strMsgBabeDropped;					
				}
				else
				{
					// End:0x209
					if(__NFUN_173__(int(BabeState), int(0)))
					{
						ColourStr.Empty();
						// End:0x1A6
						if(__NFUN_173__(Team, 0))
						{
							ColourStr[ColourStr.Add(1)] = dnCTBHUD(Level.__NFUN_1161__().MyHUD).BlueStr;							
						}
						else
						{
							ColourStr[ColourStr.Add(1)] = dnCTBHUD(Level.__NFUN_1161__().MyHUD).RedStr;
						}
						strMsg = dnCTBHUD(Level.__NFUN_1161__().MyHUD).strMsgBabeStanding;						
					}
					else
					{
						strMsg = "ERROR!!!";
					}
				}
			}
		}
		__NFUN_355__(__NFUN_303__(__NFUN_303__("MIGUEL: MSG RECEIVED", "Msg"), strMsg));
	}
	return __NFUN_328__(strMsg, ColourStr);
	return;
}
