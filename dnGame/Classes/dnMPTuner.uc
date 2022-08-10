/*******************************************************************************
 * dnMPTuner generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnMPTuner extends MultiplayerInfo
	native
	collapsecategories
	hidecategories(movement,Collision,Lighting,LightColor,Actor,Advanced,Display,Editor,Events,Filter,Interpolation,Material,Mounting,Network,Sound,Tick,TickRules,VertexFunction,Actor,Advanced,Display,Editor,Events,Filter,Interpolation,Material,Mounting,Network,Sound,Tick,TickRules,VertexFunction);

cpptext
{
// Stripped
}

var() noexport float EgoRecoveryRate "how fast ego recovers";

// Export UdnMPTuner::execLoadDevIni(FFrame&, void* const)
native function LoadDevIni();

function PostBeginPlay()
{
	super(Actor).PostBeginPlay();
	return;
}

function ApplyDevIni()
{
	LoadDevIni();
	ApplyEgo(StartingEgo);
	ApplyHealth(StartingHealth);
	return;
}

function PreRestartPlayer(Pawn Player)
{
	super.PreRestartPlayer(Player);
	return;
}

function PostRestartPlayer(Pawn Player)
{
	local int i;

	super.PostRestartPlayer(Player);
	// End:0x1F
	if(__NFUN_173__(int(Role), int(ROLE_Authority)))
	{
		LoadDevIni();
	}
	return;
}

simulated function ApplyEgo(float f)
{
	local Pawn Player;

	StartingEgo = f;
	// End:0x7A
	foreach __NFUN_747__(class'Pawn', Player)
	{
		Player.EgoCap = StartingEgo;
		Player.Ego = StartingEgo;
		Player.SetHealthCap(StartingHealth);
		Player.RaiseHealthToCap(Player.Location);		
	}	
	return;
}

simulated function ApplyHealth(float f)
{
	local Pawn Player;

	StartingHealth = f;
	// End:0x7A
	foreach __NFUN_747__(class'Pawn', Player)
	{
		Player.EgoCap = StartingEgo;
		Player.Ego = StartingEgo;
		Player.SetHealthCap(StartingHealth);
		Player.RaiseHealthToCap(Player.Location);		
	}	
	return;
}

simulated function ApplyEgoRecoveryRate(float f)
{
	local Pawn Player;

	EgoRecoveryRate = f;
	// End:0x31
	foreach __NFUN_747__(class'Pawn', Player)
	{
		Player.EgoRecoveryRate = EgoRecoveryRate;		
	}	
	return;
}

defaultproperties
{
	EgoRecoveryRate=5
	StartingEgo=80
	WeaponStayTime=5
	ConsoleCommands=/* Array type was not detected. */
}