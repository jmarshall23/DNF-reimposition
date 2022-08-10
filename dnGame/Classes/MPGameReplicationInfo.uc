/*******************************************************************************
 * MPGameReplicationInfo generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MPGameReplicationInfo extends GameReplicationInfo
	native
	config
	collapsecategories
	hidecategories(movement,Collision,Lighting,LightColor);

var int EORCountDownTime;
var int EORTimeoutTime;
var dnTeamInfo Teams[4];
var int EORTimeoutMaxTime;
var int EORCountTime;
var delegate<EORComplete> __EORComplete__Delegate;
var delegate<EORBeep> __EORBeep__Delegate;
var delegate<EORKillMsgBoxes> __EORKillMsgBoxes__Delegate;

replication
{
	// Pos:0x000
	reliable if(__NFUN_173__(int(Role), int(ROLE_Authority)))
		EORCountTime, Teams;
}

function EORComplete()
{
	return;
}

function EORBeep()
{
	return;
}

function EORKillMsgBoxes()
{
	return;
}

simulated function NU_EORCountTime(int NewTime)
{
	EORCountTime = NewTime;
	// End:0x21
	if(__NFUN_171__(EORCountTime, 5))
	{
		EORBeep();
	}
	// End:0x36
	if(__NFUN_171__(EORCountTime, 1))
	{
		EORKillMsgBoxes();
	}
	return;
}

simulated function StartEORCountDown(int Time)
{
	// End:0x37
	if(__NFUN_148__(__NFUN_173__(int(Role), int(ROLE_Authority)), __NFUN_173__(EORCountTime, 0)))
	{
		EORCountTime = Time;
		__NFUN_607__(1, true, 'UpdateEORTime');		
	}
	else
	{
		// End:0x4B
		if(__NFUN_174__(int(Role), int(ROLE_Authority)))
		{
			StartEORTimeout();
		}
	}
	return;
}

function UpdateEORTime()
{
	local OnlineAgent agent;

	__NFUN_355__(__NFUN_303__(__NFUN_303__(string(self), "::UpdateEORTime::EORCountTime:"), string(EORCountTime)));
	EORCountTime = __NFUN_189__(0, __NFUN_166__(EORCountTime, 1));
	// End:0x5F
	if(__NFUN_171__(EORCountTime, 0))
	{
		__NFUN_608__('UpdateEORTime');
		EORComplete();
	}
	// End:0x75
	if(__NFUN_171__(EORCountTime, 5))
	{
		EORBeep();
	}
	// End:0x8A
	if(__NFUN_171__(EORCountTime, 1))
	{
		EORKillMsgBoxes();
	}
	agent = OnlineAgent(class'Engine'.static.__NFUN_503__());
	// End:0xC3
	if(__NFUN_340__(agent, none))
	{
		agent.EORCountTime = EORCountTime;
	}
	return;
}

simulated function StartEORTimeout()
{
	// End:0x34
	if(__NFUN_148__(__NFUN_174__(int(Role), int(ROLE_Authority)), __NFUN_173__(EORTimeoutTime, 0)))
	{
		EORTimeoutTime = EORTimeoutMaxTime;
		__NFUN_607__(1, true, 'UpdateEORTimeout');
	}
	return;
}

simulated function UpdateEORTimeout()
{
	local OnlineAgent agent;

	__NFUN_183__(EORTimeoutTime);
	// End:0x46
	if(__NFUN_171__(EORTimeoutTime, 0))
	{
		agent = OnlineAgent(class'Engine'.static.__NFUN_503__());
		// End:0x46
		if(__NFUN_340__(agent, none))
		{
			agent.LeaveGame();
		}
	}
	return;
}

defaultproperties
{
	EORCountDownTime=30
	EORTimeoutMaxTime=40
}