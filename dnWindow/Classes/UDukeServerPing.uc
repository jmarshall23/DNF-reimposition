/*******************************************************************************
 * UDukeServerPing generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeServerPing extends UdpLink
	transient
	config
	collapsecategories
	hidecategories(movement,Collision,Lighting,LightColor);

var UDukeServerList Server;
var IpAddr ServerIPAddr;
var float RequestSentTime;
var float LastDelta;
var name QueryState;
var bool bInitial;
var bool bJustThisServer;
var bool bNoSort;
var int PingAttempts;
var int AttemptNumber;
var int BindAttempts;
var localized string AdminEmailText;
var localized string AdminNameText;
var localized string MapCycleText;
var localized string MultiplayerBotsText;
var localized string FragLimitText;
var localized string TimeLimitText;
var localized string GameModeText;
var localized string GameTypeText;
var localized string GameVersionText;
var localized string WorldLogText;
var localized string MutatorsText;
var localized string TrueString;
var localized string FalseString;
var localized string ServerAddressText;
var localized string GoalTeamScoreText;
var localized string MinPlayersText;
var localized string PlayersText;
var localized string MaxTeamsText;
var localized string BalanceTeamsText;
var localized string PlayersBalanceTeamsText;
var localized string FriendlyFireText;
var localized string MinNetVersionText;
var localized string BotSkillText;
var localized string TournamentText;
var localized string ServerModeText;
var localized string DedicatedText;
var localized string NonDedicatedText;
var config int MaxBindAttempts;
var config int BindRetryTime;
var config int PingTimeout;

function ValidateServer()
{
	// End:0x2D
	if(__NFUN_340__(Server.ServerPing, self))
	{
		__NFUN_355__(__NFUN_302__("ORPHANED: ", string(self)));
		__NFUN_614__();
	}
	return;
}

function StartQuery(name S, int InPingAttempts)
{
	QueryState = S;
	ValidateServer();
	ServerIPAddr.Port = Server.QueryPort;
	__NFUN_397__('Resolving');
	PingAttempts = InPingAttempts;
	AttemptNumber = 1;
	return;
}

function Resolved(IpAddr Addr)
{
	ServerIPAddr.Addr = Addr.Addr;
	__NFUN_397__('Binding');
	return;
}

function bool GetNextValue(string In, out string Out, out string Result)
{
	local int i;
	local bool bFoundStart;

	Result = "";
	bFoundStart = false;
	i = 0;
	J0x17:

	// End:0xB3 [Loop If]
	if(__NFUN_169__(i, __NFUN_314__(In)))
	{
		// End:0x8A
		if(bFoundStart)
		{
			// End:0x6B
			if(__NFUN_308__(__NFUN_316__(In, i, 1), "\\"))
			{
				Out = __NFUN_318__(In, __NFUN_166__(__NFUN_314__(In), i));
				return true;				
			}
			else
			{
				Result = __NFUN_302__(Result, __NFUN_316__(In, i, 1));
			}
			// [Explicit Continue]
			goto J0xA9;
		}
		// End:0xA9
		if(__NFUN_308__(__NFUN_316__(In, i, 1), "\\"))
		{
			bFoundStart = true;
		}
		J0xA9:

		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x17;
	}
	return false;
	return;
}

function string LocalizeBoolValue(string Value)
{
	// End:0x17
	if(__NFUN_310__(Value, "True"))
	{
		return TrueString;
	}
	// End:0x2F
	if(__NFUN_310__(Value, "False"))
	{
		return FalseString;
	}
	return Value;
	return;
}

function string LocalizeSkin(string SkinName)
{
	local string MeshName, Junk, SkinDesc;

	return SkinDesc;
	return;
}

function string LocalizeTeam(string TeamNum)
{
	// End:0x13
	if(__NFUN_308__(TeamNum, "255"))
	{
		return "";
	}
	return TeamNum;
	return;
}

function AddRule(string Rule, string Value)
{
	local UDukeRulesList RulesList;

	ValidateServer();
	RulesList = UDukeRulesList(Server.RulesList.Next);
	J0x2A:

	// End:0x6F [Loop If]
	if(__NFUN_340__(RulesList, none))
	{
		// End:0x52
		if(__NFUN_308__(RulesList.Rule, Rule))
		{
			return;
		}
		RulesList = UDukeRulesList(RulesList.Next);
		// [Loop Continue]
		goto J0x2A;
	}
	RulesList = UDukeRulesList(Server.RulesList.Append(class'UDukeRulesList'));
	RulesList.Rule = Rule;
	RulesList.Value = Value;
	return;
}

function CallbackDispatch()
{
	BindCallback();
	return;
}

function BindCallback()
{
	return;
}

function string ParseReply(string Text, string Key)
{
	local int i;
	local string temp;

	i = __NFUN_315__(Text, __NFUN_302__(__NFUN_302__("\\", Key), "\\"));
	temp = __NFUN_316__(Text, __NFUN_165__(__NFUN_165__(i, __NFUN_314__(Key)), 2));
	return __NFUN_317__(temp, __NFUN_315__(temp, "\\"));
	return;
}

function AddMutatorRules(string MutatorsIn)
{
	local int NextMut, NumMutators;

	J0x00:
	// End:0x8E [Loop If]
	if(__NFUN_174__(NextMut, -1))
	{
		__NFUN_184__(NumMutators);
		NextMut = __NFUN_315__(MutatorsIn, ",");
		// End:0x54
		if(__NFUN_173__(NextMut, -1))
		{
			AddRule(__NFUN_302__(MutatorsText, string(NumMutators)), MutatorsIn);
			return;			
		}
		else
		{
			AddRule(__NFUN_303__(MutatorsText, string(NumMutators)), __NFUN_317__(MutatorsIn, NextMut));
			MutatorsIn = __NFUN_316__(MutatorsIn, __NFUN_165__(NextMut, 1));
		}
		// [Loop Continue]
		goto J0x00;
	}
	return;
}

state Binding
{Begin:

	// End:0x97
	if(__NFUN_173__(__NFUN_1135__(2000, true), 0))
	{
		__NFUN_355__(__NFUN_302__("UDukeServerPing: Port failed to bind.  Attempt ", string(BindAttempts)));
		__NFUN_184__(BindAttempts);
		ValidateServer();
		// End:0x8C
		if(__NFUN_173__(BindAttempts, MaxBindAttempts))
		{
			Server.PingDone(bInitial, bJustThisServer, false, bNoSort);			
		}
		else
		{
			__NFUN_397__('BindFailed');
		}		
	}
	else
	{
		__NFUN_397__(QueryState);
	}
	stop;				
}

state BindFailed
{
	function BindCallback()
	{
		__NFUN_397__('Binding');
		return;
	}
Begin:

	__NFUN_605__(float(BindRetryTime), false, 'BindCallback');
	stop;				
}

state GetStatus
{
	event ReceivedText(IpAddr Addr, string Text)
	{
		local string Value, In, Out;
		local byte id;
		local bool bOK;
		local UDukePlayerList PlayerEntry;

		ValidateServer();
		In = Text;
		J0x11:

		bOK = GetNextValue(In, Out, Value);
		In = Out;
		// End:0x11E
		if(__NFUN_308__(__NFUN_317__(Value, 7), "player_"))
		{
			id = byte(int(__NFUN_318__(Value, __NFUN_166__(__NFUN_314__(Value), 7))));
			PlayerEntry = Server.PlayerList.FindID(int(id));
			// End:0xC9
			if(__NFUN_339__(PlayerEntry, none))
			{
				PlayerEntry = UDukePlayerList(Server.PlayerList.Append(class'UDukePlayerList'));
			}
			PlayerEntry.PlayerID = int(id);
			bOK = GetNextValue(In, Out, Value);
			In = Out;
			PlayerEntry.PlayerName = Value;			
		}
		else
		{
			// End:0x1B8
			if(__NFUN_308__(__NFUN_317__(Value, 6), "frags_"))
			{
				id = byte(int(__NFUN_318__(Value, __NFUN_166__(__NFUN_314__(Value), 6))));
				bOK = GetNextValue(In, Out, Value);
				In = Out;
				PlayerEntry = Server.PlayerList.FindID(int(id));
				PlayerEntry.PlayerFrags = int(Value);				
			}
			else
			{
				// End:0x25F
				if(__NFUN_308__(__NFUN_317__(Value, 5), "ping_"))
				{
					id = byte(int(__NFUN_318__(Value, __NFUN_166__(__NFUN_314__(Value), 5))));
					bOK = GetNextValue(In, Out, Value);
					In = Out;
					PlayerEntry = Server.PlayerList.FindID(int(id));
					PlayerEntry.PlayerPing = int(__NFUN_318__(Value, __NFUN_166__(__NFUN_314__(Value), 1)));					
				}
				else
				{
					// End:0x2FD
					if(__NFUN_308__(__NFUN_317__(Value, 5), "team_"))
					{
						id = byte(int(__NFUN_318__(Value, __NFUN_166__(__NFUN_314__(Value), 5))));
						bOK = GetNextValue(In, Out, Value);
						In = Out;
						PlayerEntry = Server.PlayerList.FindID(int(id));
						PlayerEntry.PlayerTeam = LocalizeTeam(Value);						
					}
					else
					{
						// End:0x39B
						if(__NFUN_308__(__NFUN_317__(Value, 5), "skin_"))
						{
							id = byte(int(__NFUN_318__(Value, __NFUN_166__(__NFUN_314__(Value), 5))));
							bOK = GetNextValue(In, Out, Value);
							In = Out;
							PlayerEntry = Server.PlayerList.FindID(int(id));
							PlayerEntry.PlayerSkin = LocalizeSkin(Value);							
						}
						else
						{
							// End:0x439
							if(__NFUN_308__(__NFUN_317__(Value, 5), "face_"))
							{
								id = byte(int(__NFUN_318__(Value, __NFUN_166__(__NFUN_314__(Value), 5))));
								bOK = GetNextValue(In, Out, Value);
								In = Out;
								PlayerEntry = Server.PlayerList.FindID(int(id));
								PlayerEntry.PlayerFace = GetItemName(Value);								
							}
							else
							{
								// End:0x4D1
								if(__NFUN_308__(__NFUN_317__(Value, 5), "mesh_"))
								{
									id = byte(int(__NFUN_318__(Value, __NFUN_166__(__NFUN_314__(Value), 5))));
									bOK = GetNextValue(In, Out, Value);
									In = Out;
									PlayerEntry = Server.PlayerList.FindID(int(id));
									PlayerEntry.PlayerMesh = Value;									
								}
								else
								{
									// End:0x4F9
									if(__NFUN_308__(Value, "final"))
									{
										Server.StatusDone(true);
										return;										
									}
									else
									{
										// End:0x53C
										if(__NFUN_310__(Value, "gamever"))
										{
											bOK = GetNextValue(In, Out, Value);
											AddRule(GameVersionText, Value);											
										}
										else
										{
											// End:0x581
											if(__NFUN_310__(Value, "minnetver"))
											{
												bOK = GetNextValue(In, Out, Value);
												AddRule(MinNetVersionText, Value);												
											}
											else
											{
												// End:0x5C5
												if(__NFUN_310__(Value, "gametype"))
												{
													bOK = GetNextValue(In, Out, Value);
													AddRule(GameTypeText, Value);													
												}
												else
												{
													// End:0x60A
													if(__NFUN_310__(Value, "timelimit"))
													{
														bOK = GetNextValue(In, Out, Value);
														AddRule(TimeLimitText, Value);														
													}
													else
													{
														// End:0x64F
														if(__NFUN_310__(Value, "fraglimit"))
														{
															bOK = GetNextValue(In, Out, Value);
															AddRule(FragLimitText, Value);															
														}
														else
														{
															// End:0x6A0
															if(__NFUN_310__(Value, "MultiplayerBots"))
															{
																bOK = GetNextValue(In, Out, Value);
																AddRule(MultiplayerBotsText, LocalizeBoolValue(Value));																
															}
															else
															{
																// End:0x6E5
																if(__NFUN_310__(Value, "AdminName"))
																{
																	bOK = GetNextValue(In, Out, Value);
																	AddRule(AdminNameText, Value);																	
																}
																else
																{
																	// End:0x72B
																	if(__NFUN_310__(Value, "AdminEMail"))
																	{
																		bOK = GetNextValue(In, Out, Value);
																		AddRule(AdminEmailText, Value);																		
																	}
																	else
																	{
																		// End:0x775
																		if(__NFUN_310__(Value, "WorldLog"))
																		{
																			bOK = GetNextValue(In, Out, Value);
																			AddRule(WorldLogText, LocalizeBoolValue(Value));																			
																		}
																		else
																		{
																			// End:0x7B4
																			if(__NFUN_310__(Value, "mutators"))
																			{
																				bOK = GetNextValue(In, Out, Value);
																				AddMutatorRules(Value);																				
																			}
																			else
																			{
																				// End:0x7FD
																				if(__NFUN_310__(Value, "goalteamscore"))
																				{
																					bOK = GetNextValue(In, Out, Value);
																					AddRule(GoalTeamScoreText, Value);																					
																				}
																				else
																				{
																					// End:0x86C
																					if(__NFUN_310__(Value, "minplayers"))
																					{
																						bOK = GetNextValue(In, Out, Value);
																						// End:0x851
																						if(__NFUN_308__(Value, "0"))
																						{
																							AddRule(MultiplayerBotsText, FalseString);																							
																						}
																						else
																						{
																							AddRule(MinPlayersText, __NFUN_303__(Value, PlayersText));
																						}																						
																					}
																					else
																					{
																						// End:0x8B6
																						if(__NFUN_310__(Value, "mapcycle"))
																						{
																							bOK = GetNextValue(In, Out, Value);
																							AddRule(MapCycleText, LocalizeBoolValue(Value));																							
																						}
																						else
																						{
																							// End:0x8FA
																							if(__NFUN_310__(Value, "botskill"))
																							{
																								bOK = GetNextValue(In, Out, Value);
																								AddRule(BotSkillText, Value);																								
																							}
																							else
																							{
																								// End:0x93E
																								if(__NFUN_310__(Value, "maxteams"))
																								{
																									bOK = GetNextValue(In, Out, Value);
																									AddRule(MaxTeamsText, Value);																									
																								}
																								else
																								{
																									// End:0x98C
																									if(__NFUN_310__(Value, "balanceteams"))
																									{
																										bOK = GetNextValue(In, Out, Value);
																										AddRule(BalanceTeamsText, LocalizeBoolValue(Value));																										
																									}
																									else
																									{
																										// End:0x9E1
																										if(__NFUN_310__(Value, "playersbalanceteams"))
																										{
																											bOK = GetNextValue(In, Out, Value);
																											AddRule(PlayersBalanceTeamsText, LocalizeBoolValue(Value));																											
																										}
																										else
																										{
																											// End:0xA2F
																											if(__NFUN_310__(Value, "friendlyfire"))
																											{
																												bOK = GetNextValue(In, Out, Value);
																												AddRule(FriendlyFireText, LocalizeBoolValue(Value));																												
																											}
																											else
																											{
																												// End:0xA74
																												if(__NFUN_310__(Value, "gamestyle"))
																												{
																													bOK = GetNextValue(In, Out, Value);
																													AddRule(GameModeText, Value);																													
																												}
																												else
																												{
																													// End:0xAC0
																													if(__NFUN_310__(Value, "tournament"))
																													{
																														bOK = GetNextValue(In, Out, Value);
																														AddRule(TournamentText, LocalizeBoolValue(Value));																														
																													}
																													else
																													{
																														// End:0xB21
																														if(__NFUN_310__(Value, "listenserver"))
																														{
																															bOK = GetNextValue(In, Out, Value);
																															// End:0xB11
																															if(bool(Value))
																															{
																																AddRule(ServerModeText, NonDedicatedText);																																
																															}
																															else
																															{
																																AddRule(ServerModeText, DedicatedText);
																															}
																														}
																													}
																												}
																											}
																										}
																									}
																								}
																							}
																						}
																					}
																				}
																			}
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
		// End:0x11
		if(!(__NFUN_145__(bOK)))
			goto J0x11;
		return;
	}

	function BindCallback()
	{
		// End:0x5A
		if(__NFUN_169__(AttemptNumber, PingAttempts))
		{
			__NFUN_355__(__NFUN_302__("Timed out getting player replies.  Attempt ", string(AttemptNumber)));
			__NFUN_184__(AttemptNumber);
			__NFUN_397__(QueryState);			
		}
		else
		{
			Server.StatusDone(false);
			__NFUN_355__("Timed out getting player replies.  Giving Up");
		}
		return;
	}
Begin:

	ValidateServer();
	// End:0x36
	if(__NFUN_340__(Server.PlayerList, none))
	{
		Server.PlayerList.DestroyList();
	}
	Server.PlayerList = new (none) class'UDukePlayerList';
	Server.PlayerList.SetupSentinel();
	// End:0x99
	if(__NFUN_340__(Server.RulesList, none))
	{
		Server.RulesList.DestroyList();
	}
	Server.RulesList = new (none) class'UDukeRulesList';
	Server.RulesList.SetupSentinel();
	AddRule(ServerAddressText, __NFUN_302__(__NFUN_302__(Server.IP, ":"), string(Server.GamePort)));
	__NFUN_1136__(ServerIPAddr, "\\status\\");
	__NFUN_605__(float(__NFUN_165__(PingTimeout, __NFUN_163__(__NFUN_187__(200), 100))), false, 'BindCallback');
	stop;	
}

state GetInfo
{
	event ReceivedText(IpAddr Addr, string Text)
	{
		local string temp;
		local float ElapsedTime;

		ValidateServer();
		ElapsedTime = __NFUN_195__(__NFUN_199__(Level.TimeSeconds, RequestSentTime), Level.TimeDilation);
		Server.Ping = float(__NFUN_189__(int(__NFUN_199__(__NFUN_199__(__NFUN_195__(float(1000), ElapsedTime), __NFUN_195__(0.5, LastDelta)), float(10))), 4));
		// End:0x9B
		if(__NFUN_145__(Server.bKeepDescription))
		{
			Server.HostName = Server.IP;
		}
		Server.GamePort = 0;
		Server.MapName = "";
		Server.MapTitle = "";
		Server.MapDisplayName = "";
		Server.GameType = "";
		Server.GameMode = "";
		Server.NumPlayers = 0;
		Server.MaxPlayers = 0;
		Server.NumBots = 0;
		Server.GameVer = 0;
		Server.MinNetVer = 0;
		temp = ParseReply(Text, "hostname");
		// End:0x1AF
		if(__NFUN_148__(__NFUN_309__(temp, ""), __NFUN_145__(Server.bKeepDescription)))
		{
			Server.HostName = temp;
		}
		temp = ParseReply(Text, "hostport");
		// End:0x1ED
		if(__NFUN_309__(temp, ""))
		{
			Server.GamePort = int(temp);
		}
		temp = ParseReply(Text, "mapname");
		// End:0x229
		if(__NFUN_309__(temp, ""))
		{
			Server.MapName = temp;
		}
		temp = ParseReply(Text, "maptitle");
		// End:0x27B
		if(__NFUN_309__(temp, ""))
		{
			Server.MapTitle = temp;
			Server.MapDisplayName = temp;
		}
		// End:0x2D2
		if(__NFUN_150__(__NFUN_308__(Server.MapTitle, ""), __NFUN_310__(Server.MapTitle, "Untitled")))
		{
			Server.MapDisplayName = Server.MapName;
		}
		temp = ParseReply(Text, "gametype");
		// End:0x30F
		if(__NFUN_309__(temp, ""))
		{
			Server.GameType = temp;
		}
		temp = ParseReply(Text, "numplayers");
		// End:0x34F
		if(__NFUN_309__(temp, ""))
		{
			Server.NumPlayers = int(temp);
		}
		temp = ParseReply(Text, "maxplayers");
		// End:0x38F
		if(__NFUN_309__(temp, ""))
		{
			Server.MaxPlayers = int(temp);
		}
		temp = ParseReply(Text, "numbots");
		// End:0x3CC
		if(__NFUN_309__(temp, ""))
		{
			Server.NumBots = int(temp);
		}
		temp = ParseReply(Text, "gamemode");
		// End:0x409
		if(__NFUN_309__(temp, ""))
		{
			Server.GameMode = temp;
		}
		temp = ParseReply(Text, "gamever");
		// End:0x446
		if(__NFUN_309__(temp, ""))
		{
			Server.GameVer = int(temp);
		}
		temp = ParseReply(Text, "minnetver");
		// End:0x485
		if(__NFUN_309__(temp, ""))
		{
			Server.MinNetVer = int(temp);
		}
		// End:0x4C8
		if(Server.DecodeServerProperties(Text))
		{
			Server.PingDone(bInitial, bJustThisServer, true, bNoSort);
			__NFUN_362__('Tick');
		}
		return;
	}

	event Tick(float DeltaTime)
	{
		LastDelta = DeltaTime;
		return;
	}

	function BindCallback()
	{
		ValidateServer();
		// End:0x69
		if(__NFUN_169__(AttemptNumber, PingAttempts))
		{
			__NFUN_355__(__NFUN_302__(__NFUN_302__(__NFUN_302__("Ping Timeout from ", Server.IP), ".  Attempt "), string(AttemptNumber)));
			__NFUN_184__(AttemptNumber);
			__NFUN_397__(QueryState);			
		}
		else
		{
			__NFUN_355__(__NFUN_302__(__NFUN_302__("Ping Timeout from ", Server.IP), " Giving Up"));
			Server.Ping = 9999;
			Server.GamePort = 0;
			Server.MapName = "";
			Server.MapDisplayName = "";
			Server.MapTitle = "";
			Server.GameType = "";
			Server.GameMode = "";
			Server.NumPlayers = 0;
			Server.MaxPlayers = 0;
			Server.NumBots = 0;
			__NFUN_362__('Tick');
			Server.PingDone(bInitial, bJustThisServer, false, bNoSort);
		}
		return;
	}
Begin:

	__NFUN_361__('Tick');
	__NFUN_1136__(ServerIPAddr, "\\info\\");
	RequestSentTime = Level.TimeSeconds;
	__NFUN_605__(float(__NFUN_165__(PingTimeout, __NFUN_163__(__NFUN_187__(200), 100))), false, 'BindCallback');
	stop;	
}

state Resolving
{Begin:

	__NFUN_1129__(Server.IP);
	stop;	
}

defaultproperties
{
	AdminEmailText="<?int?dnWindow.UDukeServerPing.AdminEmailText?>"
	AdminNameText="<?int?dnWindow.UDukeServerPing.AdminNameText?>"
	MapCycleText="<?int?dnWindow.UDukeServerPing.MapCycleText?>"
	MultiplayerBotsText="<?int?dnWindow.UDukeServerPing.MultiplayerBotsText?>"
	FragLimitText="<?int?dnWindow.UDukeServerPing.FragLimitText?>"
	TimeLimitText="<?int?dnWindow.UDukeServerPing.TimeLimitText?>"
	GameModeText="<?int?dnWindow.UDukeServerPing.GameModeText?>"
	GameTypeText="<?int?dnWindow.UDukeServerPing.GameTypeText?>"
	GameVersionText="<?int?dnWindow.UDukeServerPing.GameVersionText?>"
	WorldLogText="<?int?dnWindow.UDukeServerPing.WorldLogText?>"
	MutatorsText="<?int?dnWindow.UDukeServerPing.MutatorsText?>"
	TrueString="<?int?dnWindow.UDukeServerPing.TrueString?>"
	FalseString="<?int?dnWindow.UDukeServerPing.FalseString?>"
	ServerAddressText="<?int?dnWindow.UDukeServerPing.ServerAddressText?>"
	GoalTeamScoreText="<?int?dnWindow.UDukeServerPing.GoalTeamScoreText?>"
	MinPlayersText="<?int?dnWindow.UDukeServerPing.MinPlayersText?>"
	PlayersText="<?int?dnWindow.UDukeServerPing.PlayersText?>"
	MaxTeamsText="<?int?dnWindow.UDukeServerPing.MaxTeamsText?>"
	BalanceTeamsText="<?int?dnWindow.UDukeServerPing.BalanceTeamsText?>"
	PlayersBalanceTeamsText="<?int?dnWindow.UDukeServerPing.PlayersBalanceTeamsText?>"
	FriendlyFireText="<?int?dnWindow.UDukeServerPing.FriendlyFireText?>"
	MinNetVersionText="<?int?dnWindow.UDukeServerPing.MinNetVersionText?>"
	BotSkillText="<?int?dnWindow.UDukeServerPing.BotSkillText?>"
	TournamentText="<?int?dnWindow.UDukeServerPing.TournamentText?>"
	ServerModeText="<?int?dnWindow.UDukeServerPing.ServerModeText?>"
	DedicatedText="<?int?dnWindow.UDukeServerPing.DedicatedText?>"
	NonDedicatedText="<?int?dnWindow.UDukeServerPing.NonDedicatedText?>"
	MaxBindAttempts=5
	BindRetryTime=10
	PingTimeout=5
}