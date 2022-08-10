/*******************************************************************************
 * MP_Announcer generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MP_Announcer extends Actor
	collapsecategories
	notplaceable;

struct VOInfo
{
	var name voSoundName;
	var Pawn voPlayer;
	var Pawn voVictim;
	var int Data;
};

var array<VOInfo> QueuedEvents;
var VOInfo LastPlayedEvent;
var float updateStep;
var bool PrevPlayingSound;
var float remainingPlayTime;
var float AdditionalDelayTime;
var int declareCaptureDistance;

replication
{
	// Pos:0x000
	reliable if(__NFUN_173__(int(Role), int(ROLE_Authority)))
		ClientAnnounceEndTeamGame, ClientPlayBeginGameVO, 
		ClientTriggerQueueAnnounce;
}

simulated event PostBeginPlay()
{
	__NFUN_607__(updateStep, true, 'UpdateAnnouncing');
	super.PostBeginPlay();
	return;
}

simulated function bool AllowExternalVO()
{
	// End:0x11
	if(__NFUN_170__(string(QueuedEvents), 0))
	{
		return false;		
	}
	else
	{
		return true;
	}
	return;
}

function TriggerQueueAnnounce(name queueEvent, optional Pawn data_actor, optional Pawn data_actor2, optional int Data)
{
	local VOInfo voi;

	voi.voSoundName = queueEvent;
	voi.voPlayer = data_actor;
	voi.voVictim = data_actor2;
	voi.Data = Data;
	QueueAnnounce(voi);
	ClientTriggerQueueAnnounce(voi);
	return;
}

simulated delegate ClientTriggerQueueAnnounce(VOInfo queueEvent)
{
	QueueAnnounce(queueEvent);
	return;
}

simulated function QueueAnnounce(VOInfo queueEvent)
{
	// End:0x12
	if(__NFUN_145__(CheckSpecificEventLegality(queueEvent)))
	{
		return;
	}
	QueuedEvents[QueuedEvents.Add(1)] = queueEvent;
	return;
}

simulated function bool CheckSpecificEventLegality(VOInfo queueEvent)
{
	local DukeMultiPlayer dmp;

	dmp = DukeMultiPlayer(Level.__NFUN_1161__());
	// End:0x26
	if(__NFUN_339__(dmp, none))
	{
		return false;
	}
	// End:0x97
	if(__NFUN_150__(__NFUN_150__(__NFUN_341__(queueEvent.voSoundName, 'Announce_Headshot'), __NFUN_341__(queueEvent.voSoundName, 'Announce_MeleeKill')), __NFUN_341__(queueEvent.voSoundName, 'Announce_Execution')))
	{
		// End:0x97
		if(__NFUN_148__(__NFUN_340__(dmp, queueEvent.voPlayer), __NFUN_340__(dmp, queueEvent.voVictim)))
		{
			return false;
		}
	}
	// End:0x11F
	if(__NFUN_150__(__NFUN_150__(__NFUN_150__(__NFUN_150__(__NFUN_341__(queueEvent.voSoundName, 'Announce_Invincible'), __NFUN_341__(queueEvent.voSoundName, 'Announce_DoubleDamage')), __NFUN_341__(queueEvent.voSoundName, 'Announce_Overdrive')), __NFUN_341__(queueEvent.voSoundName, 'Announce_YouWin')), __NFUN_341__(queueEvent.voSoundName, 'Announce_YouLose')))
	{
		// End:0x11F
		if(__NFUN_340__(dmp, queueEvent.voPlayer))
		{
			return false;
		}
	}
	// End:0x192
	if(__NFUN_150__(__NFUN_341__(queueEvent.voSoundName, 'Announce_BabeCapture_Blue'), __NFUN_341__(queueEvent.voSoundName, 'Announce_BabeCapture_Red')))
	{
		// End:0x192
		if(__NFUN_148__(__NFUN_340__(queueEvent.voPlayer, none), __NFUN_200__(__NFUN_252__(__NFUN_239__(queueEvent.voPlayer.Location, dmp.Location)), float(declareCaptureDistance))))
		{
			return false;
		}
	}
	return true;
	return;
}

simulated function UpdateAnnouncing()
{
	local bool playingsound;

	// End:0x16
	if(__NFUN_339__(Level.__NFUN_1161__(), none))
	{
		return;
	}
	playingsound = __NFUN_150__(__NFUN_148__(__NFUN_340__(Level.__NFUN_1161__(), none), Level.__NFUN_1161__().__NFUN_684__(5)), __NFUN_684__(5));
	// End:0xA5
	if(__NFUN_145__(playingsound))
	{
		// End:0x93
		if(__NFUN_170__(string(QueuedEvents), 0))
		{
			// End:0x90
			if(AnnounceEvent(QueuedEvents[0]))
			{
				LastPlayedEvent = QueuedEvents[0];
				QueuedEvents.Remove(0, 1);
			}			
		}
		else
		{
			// End:0xA2
			if(PrevPlayingSound)
			{
				CheckAndTriggerFinishEvent();
			}
		}		
	}
	PrevPlayingSound = playingsound;
	return;
}

simulated function bool AnnounceEvent(VOInfo EventInfo)
{
	remainingPlayTime = FindAndPlaySound(EventInfo.voSoundName, 1);
	// End:0x34
	if(__NFUN_204__(remainingPlayTime, 0))
	{
		remainingPlayTime = AdditionalDelayTime;
		return false;
	}
	__NFUN_209__(remainingPlayTime, AdditionalDelayTime);
	return true;
	return;
}

simulated function CheckAndTriggerFinishEvent()
{
	local DukeMultiPlayer dmp;

	dmp = DukeMultiPlayer(Level.__NFUN_1161__());
	// End:0x39A
	if(__NFUN_340__(dmp, none))
	{
		// End:0x5D
		if(__NFUN_341__(LastPlayedEvent.voSoundName, 'Announce_MatchStart'))
		{
			dmp.PlayLocalVO_Maybe(16, dmp.StandardVOChance);			
		}
		else
		{
			// End:0xF1
			if(__NFUN_150__(__NFUN_341__(LastPlayedEvent.voSoundName, 'Announce_Lead_Blue'), __NFUN_341__(LastPlayedEvent.voSoundName, 'Announce_LeadSteal_Blue')))
			{
				// End:0xCD
				if(__NFUN_174__(int(dmp.PlayerReplicationInfo.Team), 0))
				{
					dmp.PlayLocalVO_Maybe(20, dmp.StandardVOChance);					
				}
				else
				{
					dmp.PlayLocalVO_Maybe(19, dmp.StandardVOChance);
				}				
			}
			else
			{
				// End:0x185
				if(__NFUN_150__(__NFUN_341__(LastPlayedEvent.voSoundName, 'Announce_Lead_Red'), __NFUN_341__(LastPlayedEvent.voSoundName, 'Announce_LeadSteal_Red')))
				{
					// End:0x161
					if(__NFUN_174__(int(dmp.PlayerReplicationInfo.Team), 1))
					{
						dmp.PlayLocalVO_Maybe(20, dmp.StandardVOChance);						
					}
					else
					{
						dmp.PlayLocalVO_Maybe(19, dmp.StandardVOChance);
					}					
				}
				else
				{
					// End:0x219
					if(__NFUN_150__(__NFUN_341__(LastPlayedEvent.voSoundName, 'Announce_Dominate_Blue'), __NFUN_341__(LastPlayedEvent.voSoundName, 'Announce_Winner_Blue')))
					{
						// End:0x1F5
						if(__NFUN_174__(int(dmp.PlayerReplicationInfo.Team), 1))
						{
							dmp.PlayLocalVO_Maybe(21, dmp.StandardVOChance);							
						}
						else
						{
							dmp.PlayLocalVO_Maybe(22, dmp.StandardVOChance);
						}						
					}
					else
					{
						// End:0x2AD
						if(__NFUN_150__(__NFUN_341__(LastPlayedEvent.voSoundName, 'Announce_Dominate_Red'), __NFUN_341__(LastPlayedEvent.voSoundName, 'Announce_Winner_Red')))
						{
							// End:0x289
							if(__NFUN_174__(int(dmp.PlayerReplicationInfo.Team), 1))
							{
								dmp.PlayLocalVO_Maybe(21, dmp.StandardVOChance);								
							}
							else
							{
								dmp.PlayLocalVO_Maybe(22, dmp.StandardVOChance);
							}							
						}
						else
						{
							// End:0x2FD
							if(__NFUN_148__(__NFUN_341__(LastPlayedEvent.voSoundName, 'Announce_Headshot'), __NFUN_339__(dmp, LastPlayedEvent.voPlayer)))
							{
								dmp.PlayLocalVO_Maybe(3, dmp.StandardVOChance);								
							}
							else
							{
								// End:0x34D
								if(__NFUN_148__(__NFUN_341__(LastPlayedEvent.voSoundName, 'Announce_MeleeKill'), __NFUN_339__(dmp, LastPlayedEvent.voPlayer)))
								{
									dmp.PlayLocalVO_Maybe(1, dmp.StandardVOChance);									
								}
								else
								{
									// End:0x39A
									if(__NFUN_148__(__NFUN_341__(LastPlayedEvent.voSoundName, 'Announce_Execution'), __NFUN_339__(dmp, LastPlayedEvent.voPlayer)))
									{
										dmp.PlayLocalVO_Maybe(4, dmp.StandardVOChance);
									}
								}
							}
						}
					}
				}
			}
		}
	}
	LastPlayedEvent.voSoundName = 'None';
	LastPlayedEvent.voPlayer = none;
	LastPlayedEvent.voVictim = none;
	LastPlayedEvent.Data = 0;
	return;
}

function AnnounceEndTeamGame(int WinningTeam)
{
	PlayEndTeamGameVO(WinningTeam);
	ClientAnnounceEndTeamGame(WinningTeam);
	return;
}

simulated delegate ClientAnnounceEndTeamGame(int WinningTeam)
{
	PlayEndTeamGameVO(WinningTeam);
	return;
}

simulated function PlayEndTeamGameVO(int WinningTeam)
{
	local DukeMultiPlayer dmp;

	dmp = DukeMultiPlayer(Level.__NFUN_1161__());
	// End:0x51
	if(__NFUN_173__(int(dmp.PlayerReplicationInfo.Team), WinningTeam))
	{
		dmp.TriggerEventVO(22);		
	}
	else
	{
		dmp.TriggerEventVO(21);
	}
	return;
}

simulated function AnnounceEndFFA(DukeMultiPlayer dmp, bool won)
{
	local VOInfo voi;

	// End:0x1C
	if(won)
	{
		voi.voSoundName = 'Announce_YouWin';		
	}
	else
	{
		voi.voSoundName = 'Announce_YouLose';
	}
	voi.voPlayer = dmp;
	voi.voVictim = none;
	QueueAnnounce(voi);
	ClientTriggerQueueAnnounce(voi);
	return;
}

function PlayBeginGameVO()
{
	FindAndPlaySound('Announce_MatchStart', 1,,, Level.__NFUN_1161__());
	ClientPlayBeginGameVO();
	return;
}

simulated delegate ClientPlayBeginGameVO()
{
	FindAndPlaySound('Announce_MatchStart', 1,,, Level.__NFUN_1161__());
	return;
}

function PlayCTBDroppedVO()
{
	FindAndPlaySound('Sound_ManDown', 1,,, Level.__NFUN_1161__());
	ClientPlayCTBDroppedVO();
	return;
}

simulated function ClientPlayCTBDroppedVO()
{
	FindAndPlaySound('Sound_ManDown', 1,,, Level.__NFUN_1161__());
	return;
}

function AnnounceLeadSwitch(int WinningTeam)
{
	local Pawn P;
	local DukeMultiPlayer dmp;

	P = Level.PawnList;
	J0x15:

	// End:0xA0 [Loop If]
	if(__NFUN_340__(P, none))
	{
		dmp = DukeMultiPlayer(P);
		// End:0x88
		if(__NFUN_340__(dmp, none))
		{
			// End:0x76
			if(__NFUN_173__(int(dmp.PlayerReplicationInfo.Team), WinningTeam))
			{
				dmp.TriggerEventVO(19);				
			}
			else
			{
				dmp.TriggerEventVO(20);
			}
		}
		P = P.NextPawn;
		// [Loop Continue]
		goto J0x15;
	}
	return;
}

defaultproperties
{
	updateStep=0.1
	AdditionalDelayTime=0.3
	declareCaptureDistance=9001
	TickStyle=0
	DrawType=0
	VoicePack='SoundConfig.NPCs.VoicePack_MP_Announcer'
}