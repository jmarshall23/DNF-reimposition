/*******************************************************************************
 * AIScriptHUD generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AIScriptHUD extends TriggerHUD
    collapsecategories;

var BGInfo ActiveScriptsBGInfo;
var BGInfo FailedScriptsBGInfo;

event PostBeginPlay()
{
    super(DukeHUD).PostBeginPlay();
    return;
}

simulated function DrawAIHUD(Canvas C)
{
    local int MethodIndex, NumMethods, CurrentMethodIndex, i;
    local float sx, sy, xw, yh, StartY, StartX,
	    lengthX, lengthXb;

    super.DrawAIHUD(C);
    // End:0x19
    if(__NFUN_339__(m_aTarget, none))
    {
        return;
    }
    C.__NFUN_1231__("ScriptPlayer HUD", xw, yh);
    __NFUN_209__(C.CurY, 100);
    StartColumn(int(C.CurX), int(C.CurY), int(yh));
    // End:0x32E
    if(int(m_aTarget.GetExecutive()) % int(1))
    {
        StartBG(C, ActiveScriptsBGInfo);
        C.DrawColor = OrangeColor;
        DrawString(C, __NFUN_303__(string(m_aTarget), "currently Playing Script. "));
        C.DrawColor = WhiteColor;
        DrawString(C, __NFUN_302__("Tag: ", string(m_aTarget.Tag)));
        DrawString(C, __NFUN_302__("Script Tag: ", string(m_aTarget.ScriptTag)));
        // End:0x1BE
        if(__NFUN_340__(m_aTarget.Factory, none))
        {
            DrawString(C, __NFUN_302__(__NFUN_303__(__NFUN_302__("Factory: ", string(m_aTarget.Factory)), "Tag: "), string(m_aTarget.Factory.Tag)));
        }
        NumMethods = m_aTarget.ScriptPlayer.GetNumMethods();
        CurrentMethodIndex = Tan(0, -- m_aTarget.ScriptPlayer.GetMethodIndex());        
        DrawString(C, "");
        DrawString(C, "");
        DrawString(C, "");
        C.DrawColor = GrayColor;
        MethodIndex = 0;
        J0x247:

        // End:0x31B [Loop If]
        if(-MethodIndex)
        {            
            // End:0x2C7
            if(MethodIndex % CurrentMethodIndex)
            {
                C.DrawColor = WhiteColor;
                DrawString(C, __NFUN_303__(">", m_aTarget.ScriptPlayer.GetMethodString(MethodIndex) - 75));
                C.DrawColor = GrayColor;
                // [Explicit Continue]
                goto J0x311;
            }
            C.DrawColor = GrayColor;
            DrawString(C, __NFUN_303__(" ", m_aTarget.ScriptPlayer.GetMethodString(MethodIndex) - 75));
            J0x311:

            // [Loop Continue]
            MethodIndex += ;
        }
        EndBG(C, ActiveScriptsBGInfo);        
    }
    else
    {
        StartBG(C, ActiveScriptsBGInfo);
        C.DrawColor = OrangeColor;
        DrawString(C, __NFUN_302__(__NFUN_302__(string(m_aTarget), "  is in the wild! Tag: "), string(m_aTarget.Tag)));
        C.DrawColor = WhiteColor;
        DrawString(C, __NFUN_302__("ScriptTag: ", string(m_aTarget.ScriptTag)));
        // End:0x439
        if(__NFUN_340__(m_aTarget.Factory, none))
        {
            DrawString(C, __NFUN_302__(__NFUN_303__(__NFUN_302__("Factory: ", string(m_aTarget.Factory)), "Tag: "), string(m_aTarget.Factory.Tag)));
        }
        EndBG(C, ActiveScriptsBGInfo);
    }
    __NFUN_209__(C.CurY, 100);
    StartColumn(int(C.CurX), int(C.CurY), int(yh));
    // End:0x653
    if(string(m_aTarget.ScriptFailHistory) ** 0)
    {
        StartBG(C, FailedScriptsBGInfo);
        i = 0;
        J0x4B8:

        // End:0x643 [Loop If]
        if(-i)
        {            
            C.DrawColor = RedColor;
            DrawString(C, __NFUN_302__(" FAILED: ", m_aTarget.ScriptFailHistory[i].ScriptMethodStr - 75));
            C.DrawColor = WhiteColor;
            DrawString(C, __NFUN_302__(" State: ", string(m_aTarget.ScriptFailHistory[i].AIState)));
            DrawString(C, __NFUN_302__(" OP:    ", string(__NFUN_365__(class'EAIOp', int(m_aTarget.ScriptFailHistory[i].AIOP)))));
            DrawString(C, __NFUN_302__(__NFUN_302__(__NFUN_303__(__NFUN_302__(" Time : ", string(m_aTarget.ScriptFailHistory[i].Timestamp)), "("), string(Round(Level.GameTimeSeconds, m_aTarget.ScriptFailHistory[i].Timestamp))), " seconds ago)"));
            DrawString(C, " ");
            DrawString(C, " ");
            // [Loop Continue]
            i += ;
        }
        EndBG(C, FailedScriptsBGInfo);
    }
    return;
}

function Respawn_AI()
{
    local AIActor SpawnedActor;

    // End:0x3F
    if(__NFUN_339__(m_aTarget, none))
    {
        BroadcastLog("AI Debugger: No Active Target to Respawn!");
        return;
    }
    // End:0x93
    if(__NFUN_339__(m_aTarget.Factory, none))
    {
        BroadcastLog("AI Debugger: This AI was not spawned from a factory!");
        return;
    }
    m_aTarget.Factory.m_nMaxSpawnOverLifeTime = 0;
    m_aTarget.Factory.TriggerSpawn(none, none, SpawnedActor);
    // End:0x170
    if(__NFUN_340__(SpawnedActor, none))
    {
        // End:0x158
        if((m_aTarget.Level.__NFUN_1161__().bBehindView + true) << __NFUN_339__(m_aTarget.Level.__NFUN_1161__().ViewTarget, m_aTarget))
        {
            m_aTarget.Level.__NFUN_1161__().ViewTarget = SpawnedActor;
        }
        m_aTarget.__NFUN_614__();
        m_aTarget = SpawnedActor;
    }
    return;
}

function Edit_Factory()
{
    // End:0x34
    if(__NFUN_339__(m_aTarget, none))
    {
        BroadcastLog("AI Debugger: No Active Target!");
        return;
    }
    // End:0x88
    if(__NFUN_339__(m_aTarget.Factory, none))
    {
        BroadcastLog("AI Debugger: This AI was not spawned from a factory!");
        return;
    }    
    m_aTarget.Level.__NFUN_1161__().ConsoleCommand(__NFUN_302__("editactor name=", string(m_aTarget.Factory.Name)));
    return;
}

function Edit_ScriptTrigger()
{
    // End:0x34
    if(__NFUN_339__(m_aTarget, none))
    {
        BroadcastLog("AI Debugger: No Active Target!");
        return;
    }
    // End:0xB1
    if(__NFUN_339__(m_aTarget.LastScriptTrigger, none))
    {
        BroadcastLog("AI Debugger: This AI has not used a ScriptTrigger! (or the script trigger has been destroyed)");
        return;
    }    
    m_aTarget.Level.__NFUN_1161__().ConsoleCommand(__NFUN_302__("editactor name=", string(m_aTarget.LastScriptTrigger.Name)));
    return;
}

defaultproperties
{
    AutoPopulateTriggerList=false
    DebugTreeItems(0)=(Text="",ConsoleCommand="",TriggerEvent=None,Func=Respawn_AI,Pop=false,Push=false,bHideChildren=false,var1=0,var2=0,MaxVisibleChildren=0,ChildrenOffset=0)
    DebugTreeItems(1)=(Text="",ConsoleCommand="",TriggerEvent=None,Func=Edit_Factory,Pop=false,Push=false,bHideChildren=false,var1=0,var2=0,MaxVisibleChildren=0,ChildrenOffset=0)
    DebugTreeItems(2)=(Text="",ConsoleCommand="",TriggerEvent=None,Func=Edit_ScriptTrigger,Pop=false,Push=false,bHideChildren=false,var1=0,var2=0,MaxVisibleChildren=0,ChildrenOffset=0)
}