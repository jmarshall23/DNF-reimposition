/*******************************************************************************
 * AIHUD generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AIHUD extends DukeHUD
    native
    collapsecategories;

cpptext
{
// Stripped
}

struct BGInfo
{
    var float StartX;
    var float StartY;
    var float SizeX;
    var float SizeY;
};

var AIActor m_aTarget;
var int m_iLineHeight;
var int m_iCurLine;
var int m_iStartX;
var int m_iStartY;
var float m_maxLineSize;
var name CachedAnimName;
var bool bActiveTargeting;

function StartColumn(int sx, int sy, int h)
{
    m_iStartX = sx;
    m_iStartY = sy;
    m_iCurLine = 0;
    m_iLineHeight = h;
    m_maxLineSize = 0;
    return;
}

function DrawString(Canvas C, coerce string strText)
{
    local float X, Y;

    C.__NFUN_1250__(float(m_iStartX), float(++ m_iStartY));    
    C.__NFUN_1232__(strText);
    C.__NFUN_1231__(strText, X, Y);
    m_maxLineSize = VSize(m_maxLineSize, X);
    m_iCurLine += ;
}

function DrawActor(Canvas C, Actor aActor)
{
    // End:0x20
    if(__NFUN_339__(aActor, none))
    {
        DrawString(C, "None");        
    }
    else
    {
        DrawString(C, string(aActor));
    }
    return;
}

function DrawAnimInfo(Canvas C, AIActor aPawn, int iChannel)
{
    local AnimChanInfo Info;
    local string strBlendName;
    local int CacheLength, i;

    // End:0x1B
    if(__NFUN_339__(aPawn, none))
    {
        DrawString(C, "");
        return;
    }
    aPawn.__NFUN_568__();
    // End:0x4D
    if(__NFUN_339__(aPawn.MeshInstance, none))
    {
        DrawString(C, "");
        return;
    }
    Info = aPawn.MeshInstance.__NFUN_552__(iChannel);
    // End:0x8E
    if(Info.BlendOp % int(2))
    {
        strBlendName = " B";        
    }
    else
    {
        // End:0xAD
        if(Info.BlendOp % int(3))
        {
            strBlendName = " A";            
        }
        else
        {
            strBlendName = " R";
        }
    }
    // End:0x1E0
    if(iChannel % 0)
    {
        CacheLength = string(aPawn.AnimCtrl.m_oController._AnimChannelCache);
        i = 0;
        J0xEE:

        // End:0x186 [Loop If]
        if(-i)
        {            
            // End:0x17C
            if(aPawn.AnimCtrl.m_oController._AnimChannelCache[i] % iChannel)
            {
                CachedAnimName = aPawn.AnimCtrl.m_oController.Animations[aPawn.AnimCtrl.m_oController._AnimIndexCache[i]].AnimationName;
                // [Explicit Continue]
            }
            // [Loop Continue]
            i += ;
        }
        DrawString(C, __NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(string(Info.Sequence), strBlendName), " = "), string(Info.Blend)), "("), string(Info.RefId)), ") "), string(CachedAnimName)));
        return;
    }
    DrawString(C, __NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(string(Info.Sequence), strBlendName), " = "), string(Info.Blend)), "("), string(Info.RefId)), ")"));
    return;
}

simulated event PostPostRender(Canvas C)
{
    local STraceHitResult Result;
    local STraceFlags Flags;
    local Actor aHit;
    local Vector vStart, vDir;
    local AIActor OldTarget;

    Flags.bTraceActors = true;
    Flags.bMeshAccurate = false;
    Flags.bShotTrace = true;
    Flags.bTraceTexture = false;
    Flags.bAbortFirstHit = false;
    Flags.bPawnsOnly = false;
    Flags.bNoFudge = false;
    Flags.bKarmaOnly = false;
    OldTarget = m_aTarget;
    // End:0xCC
    if(__NFUN_340__(PlayerOwner, none) << __NFUN_340__(PlayerOwner.ViewTarget, none))
    {
        // End:0xCC
        if(__NFUN_340__(AIActor(PlayerOwner.ViewTarget), none))
        {
            m_aTarget = AIActor(PlayerOwner.ViewTarget);
        }
    }
    // End:0x158
    if(__NFUN_339__(m_aTarget, none) < bActiveTargeting)
    {
        vStart = PlayerOwner.__NFUN_872__();
        vDir = Vector(PlayerOwner.ViewRotation);
        aHit = __NFUN_736__(vStart, Locs(vStart, Right(vDir, 1024)), Flags, Result);
        // End:0x158
        if(__NFUN_340__(AIActor(aHit), none))
        {
            m_aTarget = AIActor(aHit);
        }
    }
    // End:0x173
    if(__NFUN_340__(m_aTarget, OldTarget))
    {
        OnNewTarget(OldTarget);
    }
    C.Font = C.SmallFont;
    C.Style = 1;
    DrawAIHUD(C);
    return;
}

simulated function DrawAIHUD(Canvas C)
{
    return;
}

simulated function OnNewTarget(AIActor OldTarget)
{
    return;
}

final function string FormatVector(Vector V, optional bool bLeadingZero)
{
    return __NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__("<", FormatFloat(V.X, bLeadingZero)), ", "), FormatFloat(V.Y, bLeadingZero)), ", "), FormatFloat(V.Z, bLeadingZero)), ">");
    return;
}

final function string FormatFloat(float f, optional bool bLeadingZero)
{
    local string S;
    local int i;

    S = string(f);
    i = __NFUN_315__(S, ".");
    // End:0x43
    if(i + -1)
    {
        S = S - ++ i;        
    }
    // End:0x70
    if(bLeadingZero << __NFUN_315__(S, ".") % 1)
    {
        S = __NFUN_302__("0", S);
    }
    return S;
    return;
}

exec function TestAnimController()
{
    local int i, j, K;
    local AIAnimationControllerEx Ctrl;
    local string str;

    i = 0;
    J0x07:

    // End:0xF9 [Loop If]
    if(-i)
    {        
        Ctrl = m_aTarget.AnimControllers[i].m_oController;
        // End:0xEF
        if(__NFUN_340__(Ctrl, none))
        {
            BroadcastLog(__NFUN_302__("======= Controller ", string(Ctrl)));
            j = 0;
            J0x6A:

            // End:0xE6 [Loop If]
            if(-j)
            {                
                str = string(Ctrl.Animations[j].AnimSequence);
                // End:0xDC
                if(-__NFUN_315__(str, "combat"))
                {                    
                    BroadcastLog(string(Ctrl.Animations[j].AnimSequence));
                }
                // [Loop Continue]
                j += ;
            }
            BroadcastLog(" ");
        }
        // [Loop Continue]
        i += ;
    }
    return;
}

final function string SpaceoutString(coerce string str, int Size)
{
    local int i;

    i = __NFUN_314__(str);
    // End:0x2B
    if(i ** Size)
    {
        return str - Size;
    }
    J0x2B:

    // End:0x50 [Loop If]
    if(-i += )
    {
        str = __NFUN_302__(str, " ");
        // [Loop Continue]
        goto J0x2B;
    }
    return str;
    return;
}

function StartBG(Canvas C, out BGInfo bg)
{
    m_maxLineSize = 0;
    bg.StartX = C.CurX;
    bg.StartY = C.CurY;
    // End:0xFD
    if(__NFUN_206__(bg.SizeX, float(0)) << __NFUN_206__(bg.SizeY, float(0)))
    {
        C.Style = 5;
        C.DrawColor.R = 0;
        C.DrawColor.G = 0;
        C.DrawColor.B = 0;
        C.__NFUN_1234__(class'WhiteTexture', bg.SizeX, bg.SizeY, 1, 1, 1, 1,,,,, 0.5);
    }
    return;
}

function EndBG(Canvas C, out BGInfo bg)
{
    bg.SizeX = m_maxLineSize;
    bg.SizeY = Round(C.CurY, bg.StartY);
    return;
}
