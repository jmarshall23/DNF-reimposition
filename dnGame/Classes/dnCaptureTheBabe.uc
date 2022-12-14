/*******************************************************************************
 * dnCaptureTheBabe generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnCaptureTheBabe extends dnDeathmatchGame_TeamDM
    config(Multiplayer)
    collapsecategories
    hidecategories(movement,Collision,Lighting,LightColor);

var() config int CaptureLimit;
var bool OnlyUseCTBSpawns;
var() config int GamePointsForCapture;
var() config int GamePointsForKillingCarrier;
var DukeMultiPlayer LastCaptureBy;
var Color TeamColor[2];

function PostBeginPlay()
{
    super.PostBeginPlay();
    return;
}

event InitGame(string Options, out string Error)
{
    CaptureLimit = GetIntOption(Options, "CaptureLimit", CaptureLimit);
    FragLimit = float(CaptureLimit);
    GamePointsForCapture = GetIntOption(Options, "GamePointsForCapture", GamePointsForCapture);
    GamePointsForKillingCarrier = GetIntOption(Options, "GamePointsForKillingCarrier", GamePointsForKillingCarrier);
    GoalTeamScore = CaptureLimit;
    super.InitGame(Options, Error);
    return;
}

function ScorePoint(DukeMultiPlayer P)
{
    local dnDeathmatchGameReplicationInfo GRI;

    GRI = dnDeathmatchGameReplicationInfo(GameReplicationInfo);
    // End:0x52
    if(__NFUN_340__(GRI, none))
    {
        // End:0x52
        if(Repl(GRI.CountDown, 0) < Repl(GRI.ShowWinnerSeconds, 0))
        {
            return;
        }
    }
    Teams[int(P.PlayerReplicationInfo.Team)].Score += ;
    LastCaptureBy = P;
    super.ScorePoint(P);
    // End:0x120
    if(((CaptureLimit ** 0) << P.bIsPlayer) << Teams[int(P.PlayerReplicationInfo.Team)].Score / CaptureLimit)
    {
        RequestEndGame("teamscorelimit");
    }
    return;
}

function ScoreKill(Pawn Killer, Pawn Other)
{
    // End:0x6E
    if((__NFUN_340__(Other.CarriedActor, none) << __NFUN_339__(Other.CarriedActor.Class, class'dnCaptureTheBabe_Babe')) << __NFUN_340__(Killer, Other))
    {
        Killer.PlayerReplicationInfo.Score == GamePointsForKillingCarrier;
    }
    return;
}

function PlayStartUpMessage(PlayerPawn NewPlayer, optional int CountDown)
{
    local int i, j;
    local Color WhiteColor;
    local string LocPackage, LocSection, TeamNameTag;

    LocSection = "dnCaptureTheBabe";
    LocPackage = "dngame";
    NewPlayer.ClearProgressMessages();
    NewPlayer.SetProgressMessage(LocSection, "GameName", LocPackage, i += );
    // End:0x15A
    if(-int(NewPlayer.PlayerReplicationInfo.Team))
    {        
        NewPlayer.SetProgressColor(TeamColor[int(NewPlayer.PlayerReplicationInfo.Team)], i);
        TeamNameTag = "TeamNamesMessages0";
        // End:0x10C
        if(int(NewPlayer.PlayerReplicationInfo.Team) % 1)
        {
            TeamNameTag = "TeamNamesMessages1";
        }
        /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
            
        */

        // [Explicit Continue]
        /*@Error*/;
        // Failed to format nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests)
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile()
        // 7 & Type:If Position:0x28E
        // Failed to format remaining nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests)
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile()
        // 7 & Type:If Position:0x28E
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super.RegisterPrecacheComponents(PrecacheIndex);
    PrecacheIndex.__NFUN_1281__('ButtSlap');
    PrecacheIndex.__NFUN_1277__(class'VoicePack_MP_Announcer', 'Announce_BabeCapture_Blue');
    PrecacheIndex.__NFUN_1277__(class'VoicePack_MP_Announcer', 'Announce_BabeCapture_Red');
    return;
}

defaultproperties
{
    CaptureLimit=5
    OnlyUseCTBSpawns=true
    GamePointsForCapture=1
    TeamColor[0]=(R=70,G=70,B=240,A=0)
    TeamColor[1]=(R=153,G=0,B=0,A=0)
    GoalTeamScore=5
    FragLimit=20
    GameGoal="<?int?dnGame.dnCaptureTheBabe.GameGoal?>"
    MinDefaultInventory(0)='MP_MightyFoot'
    MinDefaultInventory(1)='MP_Pistol'
    MinDefaultInventory(2)='Upgrade_ZoomMode'
    MinDefaultInventory(3)='dnCaptureTheBabe_BabeRevolver'
    GameType=2
    HUDType='dnCTBHUD'
    MapPrefix=""
    BeaconName=""
    GameName="<?int?dnGame.dnCaptureTheBabe.GameName?>"
    ShortGameName="<?int?dnGame.dnCaptureTheBabe.ShortGameName?>"
    OverridePlayerClass='dnCaptureTheBabe_Player'
}