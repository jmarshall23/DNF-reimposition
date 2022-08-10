/*******************************************************************************
 * dnRockemSockem generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnRockemSockem extends dnDeathmatchGame_TeamDM
	config(Multiplayer)
	collapsecategories
	hidecategories(movement,Collision,Lighting,LightColor);

defaultproperties
{
	TeamNames[0]="<?int?dnGame.dnRockemSockem.TeamNames?>"
	TeamNames[1]="<?int?dnGame.dnRockemSockem.TeamNames?>"
	TeamMesh[0]='c_characters.Duke'
	TeamMesh[1]='c_characters.edf_soldierA'
	GoalTeamScore=30
	RoundTimeLimit=300
	MapPrefix="RS-"
	GameName="<?int?dnGame.dnRockemSockem.GameName?>"
}