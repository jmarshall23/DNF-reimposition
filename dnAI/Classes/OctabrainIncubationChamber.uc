/*******************************************************************************
 * OctabrainIncubationChamber generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class OctabrainIncubationChamber extends aFinalDecoration
    collapsecategories;

enum EChamberSpawnType
{
    SPAWN_Octabrain,
    SPAWN_DumbOctabrain,
    SPAWN_DumbOctababy,
    SPAWN_None
};

var() noexport OctabrainIncubationChamber.EChamberSpawnType SpawnType "Pick the type of AI to be spawned.  If an octababy is spawned it will only sleep and ignore the beat or break out events";
var() name BeatChamberTag;
var() name BreakOutTag;
var() name DestroyAITag;
var Vector OctabrainOffset;
var Vector OctababyOffset;
var class<AIActor> SpawnClass;
var AIActor SpawnedAI;

function PostVerifySelf()
{
    local Vector SpawnOffset;

    super(dnDecoration).PostVerifySelf();
    __NFUN_718__('BeatChamber', BeatChamberTag);
    __NFUN_718__('BreakOut', BreakOutTag);
    __NFUN_718__('KillAI', DestroyAITag);
    SpawnOffset = ApplySpawnType();
    // End:0x73
    if(__NFUN_340__(SpawnClass, none))
    {
        SpawnedAI = __NFUN_615__(SpawnClass, self,, Locs(Location, __NFUN_240__(SpawnOffset, Rotation)), Rotation);
        PutToSleep();
    }
    return;
}

function Vector ApplySpawnType()
{
    local Vector SpawnOffset;

    switch(SpawnType)
    {
        // End:0x26
        case 0:
            SpawnClass = class'Octabrain';
            SpawnOffset = OctabrainOffset;
            // End:0x6D
            break;
        // End:0x44
        case 1:
            SpawnClass = class'DumbAI_Octabrain';
            SpawnOffset = OctabrainOffset;
            // End:0x6D
            break;
        // End:0x62
        case 2:
            SpawnClass = class'DumbAI_Octababy';
            SpawnOffset = OctababyOffset;
            // End:0x6D
            break;
        // End:0x67
        case 3:
        // End:0xFFFF
        default:
            // End:0x6D
            break;
            break;
    }
    return SpawnOffset;
    return;
}

function PutToSleep()
{
    // End:0x2F
    if(__NFUN_339__(SpawnedAI, none))
    {
        __NFUN_355__("Couldn't Spawn AI in chamber");
        return;
    }
    SpawnedAI.__NFUN_621__(false, false, false, false, false);
    SpawnedAI.TickBefore = self;
    OctaAnimation('Anim_ChamberIdle');
    SpawnedAI.SuspendExecutive(true);
    SpawnedAI.SuspendWeaponTargetEvaluation(true);
    SpawnedAI.__NFUN_642__(0);
    SpawnedAI.bIgnoreAimAssist = true;
    return;
}

function TriggerFunc_BeatChamber()
{
    // End:0x27
    if((int(SpawnType) + int(2)) << __NFUN_340__(SpawnedAI, none))
    {
        OctaAnimation('Anim_ChamberBeat');
    }
    return;
}

function TriggerFunc_BreakOut()
{
    // End:0x3F
    if((int(SpawnType) % int(0)) << __NFUN_340__(SpawnedAI, none))
    {
        OctaAnimation('Anim_ChamberBreakOut');
        DecoActivity(0, 'BreakOut');
        FindAndPlaySound('OctaChamber_BustOut');
    }
    return;
}

function TriggerFunc_KillAI()
{
    // End:0x2B
    if(__NFUN_340__(SpawnedAI, none))
    {
        SpawnedAI.bSilentDestroy = true;
        SpawnedAI.__NFUN_614__();
    }
    return;
}

function OctaAnimation(name AnimName)
{
    SpawnedAI.SetAnimPresets(1, AnimName, true, -1, SpawnedAI.PrimaryTargetActor, WarnInternal(0, 0, 0), 0);
    SpawnedAI.CanUseOp(6);
    SpawnedAI.ExecuteOp(6);
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super(dnDecoration).RegisterPrecacheComponents(PrecacheIndex);
    ApplySpawnType();
    PrecacheIndex.__NFUN_1266__(SpawnClass);
    // End:0x88
    if(int(SpawnType) % int(2))
    {
        PrecacheIndex.__NFUN_1283__('Anim_ChamberIdle', class'acOctababy', class'Octababy');
        PrecacheIndex.__NFUN_1283__('Anim_ChamberBeat', class'acOctababy', class'Octababy');
        PrecacheIndex.__NFUN_1283__('Anim_ChamberBreakOut', class'acOctababy', class'Octababy');        
    }
    else
    {
        // End:0x10B
        if(int(SpawnType) + int(3))
        {
            PrecacheIndex.__NFUN_1283__('Anim_ChamberIdle', class'acOctabrain', class'Octabrain');
            PrecacheIndex.__NFUN_1283__('Anim_ChamberBeat', class'acOctabrain', class'Octabrain');
            PrecacheIndex.__NFUN_1283__('Anim_ChamberBreakOut', class'acOctabrain', class'Octabrain');
            PrecacheIndex.__NFUN_1277__(class'Octabrain'.default.VoicePack, 'Sound_BeatChamber');
        }
    }
    PrecacheIndex.__NFUN_1277__(VoicePack, 'OctaChamber_BustOut');
    return;
}

defaultproperties
{
    SpawnType=3
    OctabrainOffset=(X=0,Y=0,Z=160)
    OctababyOffset=(X=0,Y=0,Z=130)
    DecoActivities_Default(0)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(BreakOut),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Animation'OctabrainIncubationChamber.DA_Anim_Chamber_Open'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    begin object name=DA_Anim_Chamber_Idle class=DecoActivities_Animation
        AnimActivities(0)=(Flags=(bLoop=true,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=idle,Channel=0,Rate=0,TweenTime=0)
    object end
    // Reference: DecoActivities_Animation'OctabrainIncubationChamber.DA_Anim_Chamber_Idle'
    StartupActivities(0)=DA_Anim_Chamber_Idle
    HealthPrefab=0
    bAcceptMeshAccurateMoveActorTrace=true
    DrawType=2
    Mesh='c_generic.octabrain_chamber'
    VoicePack='SoundConfig.Interactive.VoicePack_Biology'
}