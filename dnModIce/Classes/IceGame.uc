class IceGame extends dnSinglePlayer;

function OnInviteAccepted()
{
	SinglePlayerDuke.ConsoleCommand("set DukePlayer bGodMode false");	
	SinglePlayerDuke.ConsoleCommand("set DukePlayer bInfiniteAmmo false");	
	SinglePlayerDuke.ConsoleCommand("set LevelInfo InstaGib false");
	SinglePlayerDuke.Level.ServerTravel("?entry", false);
}

function bool RestartPlayer(Pawn aPlayer)
{
	return false;
}


event PlayerPawn Login(string Portal, string Options, out string Error, class<PlayerPawn> SpawnClass)
{
	local PlayerPawn	NewPlayer, TestPlayer;
	local Pawn		PawnLink;
	local PlayerStart StartSpot;
	local byte InTeam;

	log("New Login Called!");

	StartSpot = FindPlayerStart(none, InTeam, Portal);

	// Try to match up to existing unoccupied player in level,
	// for savegames and coop level switching.
	for( PawnLink=Level.PawnList; PawnLink!=None; PawnLink=PawnLink.NextPawn )
	{
		TestPlayer = PlayerPawn(PawnLink);
		if
		(	TestPlayer!=None
		&&	TestPlayer.Player==None )
		{
			if(Level.NetMode==NM_Standalone)
			{
				// Found matching unoccupied player, so use this one.
				NewPlayer = TestPlayer;
				break;
			}
		}
	}

	if(NewPlayer == none)
	{
		NewPlayer = Spawn(class'IcePlayer',, ForcedPlayerTag, StartSpot.GetSpawnLocation(), StartSpot.GetSpawnRotation());
		NewPlayer.ViewRotation = StartSpot.Rotation;
	}

	NewPlayer.PlayerReplicationInfo.PlayerID = CurrentID;
	NewPlayer.PlayerReplicationInfo.RoomMemberID = -1;
	SinglePlayerStart = StartSpot;

	SinglePlayerDuke = DukePlayer(NewPlayer);

	if(SinglePlayerDuke != none && HasOption(Options, "NewGame"))
	{
		SinglePlayerDuke.StartedNewGame();
	}	

	Level.ConsoleCommand("r_dofpow 0");
	return NewPlayer;
}


defaultproperties
{
	bPlayDeathSequence=true
	bPlayStartLevelSequence=true
}