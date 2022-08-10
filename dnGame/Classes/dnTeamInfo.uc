/*******************************************************************************
 * dnTeamInfo generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnTeamInfo extends Info
	native
	collapsecategories
	dependson(dnDeathmatchGame_TeamDM)
	hidecategories(movement,Collision,Lighting,LightColor);

var string TeamName;
var int Size;
var int Score;
var int TeamIndex;
var class<dnDeathmatchGame_TeamDM> GameInfoClass;

replication
{
	// Pos:0x000
	reliable if(__NFUN_173__(int(Role), int(ROLE_Authority)))
		GameInfoClass, Score, 
		Size, TeamIndex;
}

simulated function NU_TeamIndexChanged(int new_TeamIndex)
{
	TeamIndex = new_TeamIndex;
	TeamName = GameInfoClass.default.TeamNames[TeamIndex];
	return;
}

defaultproperties
{
	TeamIndex=-1
	GameInfoClass='dnDeathmatchGame_TeamDM'
	bAlwaysRelevant=true
}