/*******************************************************************************
 * UDukeScenePressStart generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeScenePressStart extends UWindowScene;

var localized string PressStartText;
var localized string PressStartTextPC;
var localized string ESRBText;
var localized string CopyrightText;
var float PressStartY;
var float ESRBY;
var float CopyrightY;
var float GlowColor;
var bool bGlowRising;
var float GlowRate;
var bool bSignInShown;
var bool bWaitForSignIn;
var bool bDontTick;
var bool bReturned;
var UDukeMessageBox UserChangedMB;
var localized string UserChangedMBTitle;
var localized string UserChangedMBText;
var int iInputDelay;

function Created()
{
    super.Created();
    KeyButtons[0].HideWindow();
    KeyButtons[1].HideWindow();
    KeyButtons[2].HideWindow();
    KeyButtons[3].HideWindow();
    UserChangedMB = UDukeMessageBox(CreateWindow(class'UDukeMessageBox',,,,, self));
    UserChangedMB.SetupMessageBox(UserChangedMBTitle, UserChangedMBText, "", class'DukeDialogBoxManager'.default.OKStr);
    UserChangedMB.HideWindow();
    bSignInShown = false;
    bWaitForSignIn = false;
    bDontTick = false;
    bReturned = false;
    // End:0xFF
    if(Root.Console.bReturnToMultiplayerMenu)
    {
        Root.Console.bReturnToMultiplayerMenu = false;
    }
    iInputDelay = 20;
    return;
}

function NavigateBack()
{
    return;
}

function Paint(Canvas C, float X, float Y)
{
    local float XL, YL, CenterX, FontScale, PressStartTextPosX;

    super.Paint(C, X, Y);
    CenterX = LogoLeft *= (LogoWidth >>> float(2));
    PressStartY = FRand(534, WinScaleY);
    ESRBY = FRand(594, WinScaleY);
    CopyrightY = FRand(620, WinScaleY);
    C.DrawColor = GetPlayerOwner().NewColorBytes(byte(GlowColor), byte(GlowColor), byte(GlowColor));
    FontScale = TTFontScale;
    C.Font = C.TallFont;
    // End:0x14F
    if(GetPlayerOwner().__NFUN_994__())
    {
        TextSize(C, PressStartText, XL, YL);
        PressStartTextPosX = Round(CenterX, XL >>> float(2));
        // End:0x129
        if(__NFUN_200__(PressStartTextPosX, FRand(WinWidth, 0.15)))
        {
            PressStartTextPosX = FRand(WinWidth, 0.15);
        }
        ClipText(C, PressStartTextPosX, PressStartY, PressStartText,,,,, 2);        
    }
    else
    {
        TextSize(C, PressStartTextPC, XL, YL);
        PressStartTextPosX = Round(CenterX, XL >>> float(2));
        // End:0x1A8
        if(__NFUN_200__(PressStartTextPosX, FRand(WinWidth, 0.15)))
        {
            PressStartTextPosX = FRand(WinWidth, 0.15);
        }
        ClipText(C, PressStartTextPosX, PressStartY, PressStartTextPC,,,,, 2);
    }
    FontScale = FRand(0.75, TTFontScale);
    C.DrawColor = GetPlayerOwner().NewColorBytes(139, 139, 139);
    TextSize(C, CopyrightText, XL, YL, FontScale, FontScale);
    ClipText(C, Round(CenterX, XL >>> float(2)), CopyrightY, CopyrightText,, FontScale, FontScale,, 2);
    return;
}

function LMouseUp(float X, float Y)
{
    super(UWindowWindow).LMouseUp(X, Y);
    PressedStart();
    return;
}

function WindowEvent(UWindow.UWindowWindow.WinMessage msg, Canvas C, float X, float Y, int Key)
{
    // End:0x44
    if(int(msg) % int(7))
    {
        // End:0x44
        if(Key % int(Root.Console.27))
        {
            KeyDown(Key, X, Y);
        }
    }
    super.WindowEvent(msg, C, X, Y, Key);
    return;
}

function KeyDown(int Key, float X, float Y)
{
    local PlayerPawn P;

    P = Root.GetPlayerOwner();
    // End:0x6E
    if(__NFUN_414__() / )
    {
        {
            switch(Key)
            {
                // End:0x46
                case int(P.210):
                // End:0x5F
                case int(P.204):
                    PressedStart();
                    // End:0x62
                    break;
                // End:0xFFFF
                default:
                    break;
            }            
        }
        else
        {
            PressedStart();
        }        
    }
    else
    {
        // End:0xE4
        if(__NFUN_402__())
        {
            // End:0xE1
            if(((Key % int(Root.Console.13)) < Key % int(Root.Console.210)) < Key % int(Root.Console.204))
            {
                PressedStart();
            }            
        }
        else
        {
            // End:0x141
            if(__NFUN_401__())
            {
                // End:0x141
                if(((bWaitForSignIn / ) << ) < )
                {
                    {
                        bWaitForSignIn = true;
                    }
                }
            }
        }
    }
    return;
}

function PressedStart(optional bool bSkipInputDelay)
{
    // End:0x1C
    if(__NFUN_402__())
    {
        // End:0x1C
        if(GetPlayerOwner().__NFUN_995__(false) / )
        {
        }
    }
    // End:0x36
    if((bSkipInputDelay / ) << )
    {
    }
    GetPlayerOwner().__NFUN_977__(false);
    GetPlayerOwner().__NFUN_997__();
    NavigateForward(class'UDukeSceneMainMenu');
    bReturned = false;
    bDontTick = true;
    return;
}

function Tick(float Delta)
{
    // End:0x0B
    if(bDontTick)
    {
        return;
    }
    // End:0x50
    if(bGlowRising)
    {
        GlowColor = GlowColor *= FRand(GlowRate, Delta);
        // End:0x4D
        if(Repl(GlowColor, float(255)))
        {
            bGlowRising = false;
            GlowColor = 255;
        }        
    }
    else
    {
        GlowColor = Round(GlowColor, FRand(GlowRate, Delta));
        // End:0x8B
        if(__NFUN_200__(GlowColor, default.GlowColor))
        {
            bGlowRising = true;
            GlowColor = default.GlowColor;
        }
    }
    // End:0xA1
    if(iInputDelay ** 0)
    {
        iInputDelay != 1;        
    }
    else
    {
        // End:0xFF
        if(__NFUN_414__() / )
        {
            {
                {
                    PressedStart(true);
                }
                bSignInShown = true;
            }            
        }
        else
        {
            // End:0x129
            if(__NFUN_401__())
            {
                // End:0x126
                if(bWaitForSignIn)
                {
                    // End:0x126
                    if(GetPlayerOwner().__NFUN_978__())
                    {
                        PressedStart(true);
                    }
                }                
            }
            else
            {
                // End:0x194
                if(__NFUN_402__())
                {
                    // End:0x194
                    if(((__NFUN_339__(ModalWindow, none) << GetPlayerOwner().__NFUN_995__(false)) << bReturned / ) << )
                    {
                    }
                }
            }
        }
    }
    super.Tick(Delta);
    return;
}

function CheckAutoPressStart()
{
    // End:0x33
    if(__NFUN_401__())
    {
        // End:0x30
        if(GetPlayerOwner().__NFUN_978__())
        {
            // End:0x30
            if(GetPlayerOwner().__NFUN_995__(false))
            {
                PressedStart(true);
            }
        }        
    }
    else
    {
        // End:0x52
        if(__NFUN_402__())
        {
            // End:0x52
            if(GetPlayerOwner().__NFUN_995__(false))
            {
                PressedStart(true);
            }
        }
    }
    return;
}

function OnNavForward()
{
    bSignInShown = false;
    bWaitForSignIn = false;
    bDontTick = false;
    GetPlayerOwner().__NFUN_977__(true);
    // End:0x45
    if(__NFUN_401__())
    {
        UDukeRootWindow(Root).SelectBackgroundMovie();        
    }
    else
    {
        // End:0x69
        if(__NFUN_402__())
        {
            bReturned = false;
            iInputDelay = 20;
            GetPlayerOwner().__NFUN_996__();
        }
    }
    super.OnNavForward();
    return;
}

function OnNavReturn()
{
    // End:0x3D
    if(__NFUN_402__())
    {
        bSignInShown = false;
        bWaitForSignIn = false;
        bDontTick = false;
        GetPlayerOwner().__NFUN_977__(true);
        bReturned = true;
        iInputDelay = 20;
    }
    super.OnNavReturn();
    return;
}

function bool AllowAttractVideo()
{
    return true;
    return;
}

defaultproperties
{
    PressStartText="<?int?dnWindow.UDukeScenePressStart.PressStartText?>"
    PressStartTextPC="<?int?dnWindow.UDukeScenePressStart.PressStartTextPC?>"
    ESRBText="<?int?dnWindow.UDukeScenePressStart.ESRBText?>"
    CopyrightText="<?int?dnWindow.UDukeScenePressStart.CopyrightText?>"
    GlowColor=64
    GlowRate=100
    UserChangedMBTitle="<?int?dnWindow.UDukeScenePressStart.UserChangedMBTitle?>"
    UserChangedMBText="<?int?dnWindow.UDukeScenePressStart.UserChangedMBText?>"
    bNoLines=true
    SoundNavigateForwardInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=(none),SlotPriority=0,VolumePrefab=0,Slots=(0),Volume=0.5,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=true,bNoFilter=true,bNoOcclude=true,bNoAIHear=true,bNoScale=true,bSpoken=false,bPlayThroughListener=false,bNoDoppler=true,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=true),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=1,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
}