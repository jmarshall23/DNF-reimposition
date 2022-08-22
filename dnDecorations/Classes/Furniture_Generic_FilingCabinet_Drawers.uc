/*******************************************************************************
 * Furniture_Generic_FilingCabinet_Drawers generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Furniture_Generic_FilingCabinet_Drawers extends Furniture_Generic_Drawers_Lockable
    abstract
    collapsecategories;

event PreGameInit()
{
    local int ActivityIndex, ElementIndex;
    local DecoActivities_HUDInfo HUDInfoActivity;

    super(dnDecoration).PreGameInit();
    ActivityIndex = -- [-- string(DecoActivities_Default)].ActivityData.CurrentIndex;
    1    
    // End:0x51
    if(-ActivityIndex)
    {        
        ActivityIndex = -- string([-- string(DecoActivities_Default)].Activities);
        1        
    }
    ElementIndex = 0;
    J0x58:

    // End:0xE6 [Loop If]
    if(-ElementIndex)
    {
        DecoActivities_Default        
        HUDInfoActivity = DecoActivities_HUDInfo([-- string(DecoActivities_Default)].Activities[ActivityIndex].ActivityElements[ElementIndex]);
        DecoActivities_Default
        // End:0xDC
        if(__NFUN_340__(HUDInfoActivity, none))
        {
            HUDInfoActivity.ExecuteActivity(self, Level.__NFUN_1161__());
        }
        // [Loop Continue]
        ElementIndex *= ;
    }
    return;
}

function CopyOwnerProperties()
{
    local int i;

    super(Actor).CopyOwnerProperties();
    // End:0x5B
    if(__NFUN_340__(Owner, none))
    {
        ActorColorList.Empty();
        i = 0;
        J0x1F:

        // End:0x5B [Loop If]
        if(-i)
        {            
            __NFUN_602__(Owner.ActorColorList[i]);
            // [Loop Continue]
            i += ;
        }
    }
    return;
}

defaultproperties
{
    DecoActivities_Default(0)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(LockedUsed),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Sound'Furniture_Generic_Drawers_Lockable.DA_Sound_Furniture_Generic_Drawers_Lockable_Locked'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    DecoActivities_Default(1)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(Locked),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_HUDInfo'Furniture_Generic_Drawers_Lockable.DA_HUD_Replace_Locked'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    DecoActivities_Default(2)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(Unlocked),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=('dnGame.DecoActivityDeclarations.DA_HUD_UsePhrase_Open'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    DecoActivities_Default(3)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=none,ActivityID=(3),ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Keyframes'Furniture_Generic_FilingCabinet_Drawers.DA_Keyframes_Furniture_Generic_FilingCabinet_Drawers_Open',DecoActivities_Sound'Furniture_Generic_FilingCabinet_Drawers.DA_Sound_Furniture_Generic_FilingCabinet_Drawers_Open','dnGame.DecoActivityDeclarations.DA_HUD_UsePhrase_Close'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=1.1),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0)),(ActivityRules=none,ActivityElements=(DecoActivities_Keyframes'Furniture_Generic_FilingCabinet_Drawers.DA_Keyframes_Furniture_Generic_FilingCabinet_Drawers_Close',DecoActivities_Sound'Furniture_Generic_FilingCabinet_Drawers.DA_Sound_Furniture_Generic_FilingCabinet_Drawers_Close','dnGame.DecoActivityDeclarations.DA_HUD_UsePhrase_Open'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=1.5),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    HealthPrefab=0
    bForceUsePhrase=true
    bUsable=true
    bBlockPlayers=false
    CollisionHeight=4
    DesiredLocation(0)=(bTemporal=false,bComplete=false,bRelativeMotion=true,Target=(X=14,Y=0,Z=0),TargetVariance=(X=0,Y=0,Z=0),RealTarget=(X=0,Y=0,Z=0),Start=(X=0,Y=0,Z=0),Speed=(Value=0,Variance=0),Rate=(X=0,Y=0,Z=0),Exponent=0,TimeTotal=1,TimeMid=0,RealTimeMid=0,Timer=0,Style=1,StyleStopped=0,CrushDamage=(DamageHow=0,Damage=(Value=0,Variance=0),Rate=(Value=0,Variance=0),Timer=0),Event=None,EventAbort=None,FunctionComplete=None,FunctionAbort=None)
    DesiredLocation(1)=(bTemporal=false,bComplete=false,bRelativeMotion=true,Target=(X=-14,Y=0,Z=0),TargetVariance=(X=0,Y=0,Z=0),RealTarget=(X=0,Y=0,Z=0),Start=(X=0,Y=0,Z=0),Speed=(Value=0,Variance=0),Rate=(X=0,Y=0,Z=0),Exponent=0,TimeTotal=1,TimeMid=0,RealTimeMid=0,Timer=0,Style=1,StyleStopped=0,CrushDamage=(DamageHow=0,Damage=(Value=0,Variance=0),Rate=(Value=0,Variance=0),Timer=0),Event=None,EventAbort=None,FunctionComplete=None,FunctionAbort=None)
}