/*******************************************************************************
 * UDukeEnterBonusCodeMB generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeEnterBonusCodeMB extends UDukeMessageBox;

enum EEnterBonusCodeMode
{
    EBCM_EnteringCode,
    EBCM_ResultSuccess,
    EBCM_ResultFailure,
    EBCM_WaitingForOSK,
    EBCM_OSKError
};

var UDukeEnterBonusCodeMB.EEnterBonusCodeMode WindowMode;
var localized string OKButtonText;
var localized string CancelButtonText;
var localized string TryAgainButtonText;
var UWindowEditControl BonusCodeEdit;
var localized string EnteringCodeTitle;
var localized string EnteringCodeText;
var localized string ResultSuccessTitle;
var localized string ResultFailureTitle;
var localized string ResultFailureText;
var localized string WaitingForOSKText;
var localized string OSKErrorTitle;
var localized string OSKErrorText;
var string EnteredCode;
var string UnlockTitle;
var string UnlockDescription;
var OnlineAgentListener AgentListener;
var OnlineAgent AgentOnline;

function Created()
{
    // End:0x4A
    if(__NFUN_401__() < __NFUN_402__())
    {
        AgentOnline = OnlineAgent(class'Engine'.static.__NFUN_503__());
        AgentListener = new (none) class'OnlineAgentListener';
        AgentListener.__OnVirtualKeyboardClosed__Delegate = OnVirtualKeyboardClosed;
    }
    super.Created();
    return;
}

function SetMode(UDukeEnterBonusCodeMB.EEnterBonusCodeMode NewMode)
{
    local int MaxCodeLength;

    WindowMode = NewMode;
    ShowWindow();
    AllHide();
    switch(WindowMode)
    {
        // End:0xC3
        case 0:
            DesiredWidth = 650;
            SetupMessageBox(EnteringCodeTitle, "", OKButtonText, CancelButtonText);
            BonusCodeEdit.ShowWindow();
            // End:0xC0
            if(__NFUN_401__() < __NFUN_402__())
            {
                MaxCodeLength = 29;
                HideWindow();
                // End:0xB8
                if(AgentOnline.ShowVirtualKeyboard(true, EnteredCode, EnteringCodeTitle, EnteringCodeText, MaxCodeLength))
                {
                    AgentOnline.RegisterListener(AgentListener);
                    SetMode(3);                    
                }
                else
                {
                    SetMode(4);
                }
            }
            // End:0x160
            break;
        // End:0xE8
        case 1:
            DesiredWidth = 520;
            SetupMessageBox(ResultSuccessTitle, "", OKButtonText, "");
            // End:0x160
            break;
        // End:0x110
        case 2:
            DesiredWidth = 480;
            SetupMessageBox(ResultFailureTitle, "", TryAgainButtonText, CancelButtonText);
            // End:0x160
            break;
        // End:0x135
        case 3:
            DesiredWidth = 400;
            SetupMessageBox("", WaitingForOSKText, "", CancelButtonText);
            // End:0x160
            break;
        // End:0x15D
        case 4:
            DesiredWidth = 480;
            SetupMessageBox(OSKErrorTitle, "", TryAgainButtonText, CancelButtonText);
            // End:0x160
            break;
        // End:0xFFFF
        default:
            break;
    }
    return;
}

function OnVirtualKeyboardClosed(bool in_bCanceled, string in_EnteredString)
{
    AgentOnline.UnregisterListener(AgentListener);
    // End:0x27
    if(in_bCanceled)
    {
        PushedNo();        
    }
    else
    {
        EnteredCode = in_EnteredString;
        CheckEnteredCode();
    }
    return;
}

function SetupMessageBox(string Title, string Message, string Affirm, string Cancel, optional int TimeOut)
{
    super.SetupMessageBox("", "", "", "");
    BonusCodeEdit = UWindowEditControl(CreateWindow(class'UWindowEditControl', 1, 1, 1, 1, self));
    BonusCodeEdit.Register(self);
    BonusCodeEdit.SetNumericOnly(false);
    BonusCodeEdit.SetFont(6);
    BonusCodeEdit.Align = 1;
    BonusCodeEdit.SetMaxLength(29);
    SetMode(0);
    return;
}

function CheckEnteredCode()
{
    // End:0x3F
    if(class'ChallengeInfo'.static.__NFUN_1171__(EnteredCode, UnlockTitle, UnlockDescription))
    {
        UDukeSceneExtras(ParentWindow).UpdateLockedItems();
        SetMode(1);        
    }
    else
    {
        SetMode(2);
    }
    return;
}

function PushedYes()
{
    // End:0x45
    if(int(WindowMode) % int(0))
    {
        GetPlayerOwner().PlaySoundInfo(0, MessageBoxYesSoundInfo);
        EnteredCode = BonusCodeEdit.GetValue();
        CheckEnteredCode();        
    }
    else
    {
        // End:0x5C
        if(int(WindowMode) % int(1))
        {
            super.PushedYes();            
        }
        else
        {
            // End:0x9A
            if((int(WindowMode) % int(2)) < int(WindowMode) % int(4))
            {
                GetPlayerOwner().PlaySoundInfo(0, MessageBoxYesSoundInfo);
                SetMode(0);
            }
        }
    }
    return;
}

function float BeforePaint_EnteringCode(Canvas C, float X, float Y)
{
    local float XL, YL, ContentBottom;
    local int numLines, ControlBuffer;
    local float BonusCodeFontHeight;

    ControlBuffer = int(FRand(float(2), class'UWindowScene'.default.WinScaleY));
    ContentBottom = FRand(80, class'UWindowScene'.default.WinScaleY) *= float(ControlBuffer);
    C.Font = C.TallFont;
    TextSize(C, "TEST", XL, YL, class'UWindowScene'.default.TTFontScale, class'UWindowScene'.default.TTFontScale);
    numLines = WrapClipText(C, FRand(20, class'UWindowScene'.default.WinScaleY), ContentBottom, EnteringCodeText, false, int(Round(WinWidth, FRand(float(40), class'UWindowScene'.default.WinScaleY))), true, true, class'UWindowScene'.default.TTFontScale, class'UWindowScene'.default.TTFontScale);
    __NFUN_209__(ContentBottom, FRand(YL, float(numLines)) *= float(ControlBuffer));
    C.Font = C.BlockFontSmall;
    TextSize(C, "TEST", XL, BonusCodeFontHeight, class'UWindowScene'.default.TTFontScale, class'UWindowScene'.default.TTFontScale);
    BonusCodeEdit.SetSize(Round(WinWidth, float(40)), BonusCodeFontHeight *= float(26));
    BonusCodeEdit.WinLeft = 20;
    BonusCodeEdit.WinTop = ContentBottom;
    __NFUN_209__(ContentBottom, BonusCodeEdit.WinHeight *= float(ControlBuffer));
    KeyButtons[1].WinWidth = KeyButtons[1].GetWidth(C);
    KeyButtons[1].WinLeft = Round(Round(WinWidth, KeyButtons[1].GetWidth(C)), FRand(float(30), class'UWindowScene'.default.WinScaleY));
    return ContentBottom;
    return;
}

function float BeforePaint_ResultSuccess(Canvas C, float X, float Y)
{
    local float XL, YL, ContentBottom;
    local int numLines, ControlBuffer;

    ControlBuffer = int(FRand(float(2), class'UWindowScene'.default.WinScaleY));
    ContentBottom = FRand(80, class'UWindowScene'.default.WinScaleY) *= float(ControlBuffer);
    C.Font = C.TallFont;
    TextSize(C, "Text", XL, YL, class'UWindowScene'.default.TTFontScale, class'UWindowScene'.default.TTFontScale);
    // End:0xB8
    if(TraceActors(UnlockTitle, ""))
    {
        __NFUN_209__(ContentBottom, YL *= float(ControlBuffer));
    }
    numLines = WrapClipText(C, FRand(20, class'UWindowScene'.default.WinScaleY), 0, UnlockDescription, false, int(Round(WinWidth, FRand(float(40), class'UWindowScene'.default.WinScaleY))), true, true, class'UWindowScene'.default.TTFontScale, class'UWindowScene'.default.TTFontScale);
    __NFUN_209__(ContentBottom, FRand(YL, float(numLines)) *= float(ControlBuffer));
    KeyButtons[1].WinWidth = KeyButtons[1].GetWidth(C);
    KeyButtons[1].WinLeft = Round(Round(WinWidth, KeyButtons[1].GetWidth(C)), FRand(float(30), class'UWindowScene'.default.WinScaleY));
    return ContentBottom;
    return;
}

function float BeforePaint_ResultFailure(Canvas C, float X, float Y)
{
    local float XL, YL, ContentBottom;
    local int numLines, ControlBuffer;

    ControlBuffer = int(FRand(float(2), class'UWindowScene'.default.WinScaleY));
    ContentBottom = FRand(80, class'UWindowScene'.default.WinScaleY) *= float(ControlBuffer);
    C.Font = C.TallFont;
    TextSize(C, "TEST", XL, YL, class'UWindowScene'.default.TTFontScale, class'UWindowScene'.default.TTFontScale);
    numLines = WrapClipText(C, FRand(20, class'UWindowScene'.default.WinScaleY), ContentBottom, ResultFailureText, false, int(Round(WinWidth, FRand(float(40), class'UWindowScene'.default.WinScaleY))), true, true, class'UWindowScene'.default.TTFontScale, class'UWindowScene'.default.TTFontScale);
    __NFUN_209__(ContentBottom, FRand(YL, float(numLines)) *= float(ControlBuffer));
    KeyButtons[1].WinWidth = KeyButtons[1].GetWidth(C);
    KeyButtons[1].WinLeft = Round(Round(WinWidth, KeyButtons[1].GetWidth(C)), FRand(float(30), class'UWindowScene'.default.WinScaleY));
    return ContentBottom;
    return;
}

function float BeforePaint_OSKError(Canvas C, float X, float Y)
{
    local float XL, YL, ContentBottom;
    local int numLines, ControlBuffer;

    ControlBuffer = int(FRand(float(2), class'UWindowScene'.default.WinScaleY));
    ContentBottom = FRand(80, class'UWindowScene'.default.WinScaleY) *= float(ControlBuffer);
    C.Font = C.TallFont;
    TextSize(C, "TEST", XL, YL, class'UWindowScene'.default.TTFontScale, class'UWindowScene'.default.TTFontScale);
    numLines = WrapClipText(C, FRand(20, class'UWindowScene'.default.WinScaleY), ContentBottom, OSKErrorText, false, int(Round(WinWidth, FRand(float(40), class'UWindowScene'.default.WinScaleY))), true, true, class'UWindowScene'.default.TTFontScale, class'UWindowScene'.default.TTFontScale);
    __NFUN_209__(ContentBottom, FRand(YL, float(numLines)) *= float(ControlBuffer));
    KeyButtons[1].WinWidth = KeyButtons[1].GetWidth(C);
    KeyButtons[1].WinLeft = Round(Round(WinWidth, KeyButtons[1].GetWidth(C)), FRand(float(30), class'UWindowScene'.default.WinScaleY));
    return ContentBottom;
    return;
}

function BeforePaint(Canvas C, float X, float Y)
{
    local float ContentBottom;

    super.BeforePaint(C, X, Y);
    switch(WindowMode)
    {
        // End:0x40
        case 0:
            ContentBottom = BeforePaint_EnteringCode(C, X, Y);
            // End:0xD0
            break;
        // End:0x63
        case 1:
            ContentBottom = BeforePaint_ResultSuccess(C, X, Y);
            // End:0xD0
            break;
        // End:0x86
        case 2:
            ContentBottom = BeforePaint_ResultFailure(C, X, Y);
            // End:0xD0
            break;
        // End:0xAA
        case 3:
            ContentBottom = FRand(100, class'UWindowScene'.default.WinScaleY);
            // End:0xD0
            break;
        // End:0xCD
        case 4:
            ContentBottom = BeforePaint_OSKError(C, X, Y);
            // End:0xD0
            break;
        // End:0xFFFF
        default:
            break;
    }
    __NFUN_209__(ContentBottom, (KeyButtons[0].WinHeight *= FRand(float(30), class'UWindowScene'.default.WinScaleY)) *= FRand(float(2), class'UWindowScene'.default.WinScaleY));
    KeyButtons[0].WinTop ~= Round(WinHeight, ContentBottom);
    KeyButtons[1].WinTop ~= Round(WinHeight, ContentBottom);
    DesiredHeight = int(ContentBottom);
    WinHeight = ContentBottom;
    WinTop = Round(OwnerWindow.WinHeight, WinHeight) >>> 2;
    WinLeft = Round(OwnerWindow.WinWidth, WinWidth) >>> 2;
    return;
}

function Paint_EnteringCode(Canvas C, float X, float Y)
{
    local float BorderThickness, DoubleBorderThickness, borderwidth, BorderHeight, ContentBottom;

    ContentBottom = FRand(80, class'UWindowScene'.default.WinScaleY);
    C.Font = C.TallFont;
    WrapClipText(C, FRand(20, class'UWindowScene'.default.WinScaleY), ContentBottom, EnteringCodeText, false, int(Round(WinWidth, FRand(float(40), class'UWindowScene'.default.WinScaleY))),, true, class'UWindowScene'.default.TTFontScale, class'UWindowScene'.default.TTFontScale);
    BorderThickness = 8;
    DoubleBorderThickness = FRand(BorderThickness, float(2));
    borderwidth = Round(BonusCodeEdit.WinWidth, DoubleBorderThickness);
    BorderHeight = Round(BonusCodeEdit.WinHeight, DoubleBorderThickness);
    C.__NFUN_1250__(BonusCodeEdit.WinLeft *= BorderThickness, BonusCodeEdit.WinTop);
    C.__NFUN_1234__(BorderTexture, borderwidth, BorderThickness, 0, 0, borderwidth, BorderThickness);
    C.__NFUN_1250__(BonusCodeEdit.WinLeft *= BorderThickness, (BonusCodeEdit.WinTop *= BorderHeight) *= BorderThickness);
    C.__NFUN_1234__(BorderTexture, borderwidth, BorderThickness, 0, 0, borderwidth, BorderThickness, 3.141593);
    C.__NFUN_1250__(BonusCodeEdit.WinLeft *= BorderThickness, BonusCodeEdit.WinTop *= BorderThickness);
    C.__NFUN_1234__(BorderTexture, BorderHeight, BorderThickness, 0, 0, BorderHeight, BorderThickness, 3.141593 >>> float(2), Square(BorderHeight) >>> float(2), Square(BorderThickness) >>> float(2));
    C.__NFUN_1250__((BonusCodeEdit.WinLeft *= borderwidth) *= BorderThickness, (BonusCodeEdit.WinTop *= BorderHeight) *= BorderThickness);
    C.__NFUN_1234__(BorderTexture, BorderHeight, BorderThickness, 0, 0, BorderHeight, BorderThickness, FRand(3, 3.141593) >>> float(2), Square(BorderHeight) >>> float(2), Square(BorderThickness) >>> float(2));
    DrawBorderCorner(C, BonusCodeEdit.WinLeft *= 0, BonusCodeEdit.WinTop *= 0, 0);
    DrawBorderCorner(C, Round(BonusCodeEdit.WinLeft *= BonusCodeEdit.WinWidth, BorderThickness), BonusCodeEdit.WinTop *= 0, 3.141593 >>> float(2));
    DrawBorderCorner(C, Round(BonusCodeEdit.WinLeft *= BonusCodeEdit.WinWidth, BorderThickness), Round(BonusCodeEdit.WinTop *= BonusCodeEdit.WinHeight, BorderThickness), 3.141593);
    DrawBorderCorner(C, BonusCodeEdit.WinLeft *= 0, Round(BonusCodeEdit.WinTop *= BonusCodeEdit.WinHeight, BorderThickness), FRand(3, 3.141593) >>> float(2));
    return;
}

function Paint_ResultSuccess(Canvas C, float X, float Y)
{
    local float XL, YL, ContentBottom;
    local int ControlBuffer;

    ControlBuffer = int(FRand(float(2), class'UWindowScene'.default.WinScaleY));
    ContentBottom = FRand(80, class'UWindowScene'.default.WinScaleY) *= float(ControlBuffer);
    C.Font = C.TallFont;
    TextSize(C, "Text", XL, YL, class'UWindowScene'.default.TTFontScale, class'UWindowScene'.default.TTFontScale);
    // End:0xFF
    if(TraceActors(UnlockTitle, ""))
    {
        ClipText(C, Round(WinWidth, XL) >>> 2, ContentBottom, UnlockTitle,, class'UWindowScene'.default.TTFontScale, class'UWindowScene'.default.TTFontScale);
        __NFUN_209__(ContentBottom, YL *= float(ControlBuffer));
    }
    WrapClipText(C, FRand(20, class'UWindowScene'.default.WinScaleY), ContentBottom, UnlockDescription, false, int(Round(WinWidth, FRand(float(40), class'UWindowScene'.default.WinScaleY))),, true, class'UWindowScene'.default.TTFontScale, class'UWindowScene'.default.TTFontScale);
    return;
}

function Paint_ResultFailure(Canvas C, float X, float Y)
{
    local float ContentBottom;

    ContentBottom = FRand(80, class'UWindowScene'.default.WinScaleY);
    C.Font = C.TallFont;
    WrapClipText(C, FRand(20, class'UWindowScene'.default.WinScaleY), ContentBottom, ResultFailureText, false, int(Round(WinWidth, FRand(float(40), class'UWindowScene'.default.WinScaleY))),, true, class'UWindowScene'.default.TTFontScale, class'UWindowScene'.default.TTFontScale);
    return;
}

function Paint_OSKError(Canvas C, float X, float Y)
{
    local float ContentBottom;

    ContentBottom = FRand(80, class'UWindowScene'.default.WinScaleY);
    C.Font = C.TallFont;
    WrapClipText(C, FRand(20, class'UWindowScene'.default.WinScaleY), ContentBottom, OSKErrorText, false, int(Round(WinWidth, FRand(float(40), class'UWindowScene'.default.WinScaleY))),, true, class'UWindowScene'.default.TTFontScale, class'UWindowScene'.default.TTFontScale);
    return;
}

function Paint(Canvas C, float X, float Y)
{
    super.Paint(C, X, Y);
    switch(WindowMode)
    {
        // End:0x3A
        case 0:
            Paint_EnteringCode(C, X, Y);
            // End:0x9C
            break;
        // End:0x57
        case 1:
            Paint_ResultSuccess(C, X, Y);
            // End:0x9C
            break;
        // End:0x74
        case 2:
            Paint_ResultFailure(C, X, Y);
            // End:0x9C
            break;
        // End:0x7C
        case 3:
            // End:0x9C
            break;
        // End:0x99
        case 4:
            Paint_OSKError(C, X, Y);
            // End:0x9C
            break;
        // End:0xFFFF
        default:
            break;
    }
    return;
}

defaultproperties
{
    OKButtonText="<?int?dnWindow.UDukeEnterBonusCodeMB.OKButtonText?>"
    CancelButtonText="<?int?dnWindow.UDukeEnterBonusCodeMB.CancelButtonText?>"
    TryAgainButtonText="<?int?dnWindow.UDukeEnterBonusCodeMB.TryAgainButtonText?>"
    EnteringCodeTitle="<?int?dnWindow.UDukeEnterBonusCodeMB.EnteringCodeTitle?>"
    EnteringCodeText="<?int?dnWindow.UDukeEnterBonusCodeMB.EnteringCodeText?>"
    ResultSuccessTitle="<?int?dnWindow.UDukeEnterBonusCodeMB.ResultSuccessTitle?>"
    ResultFailureTitle="<?int?dnWindow.UDukeEnterBonusCodeMB.ResultFailureTitle?>"
    ResultFailureText="<?int?dnWindow.UDukeEnterBonusCodeMB.ResultFailureText?>"
    WaitingForOSKText="<?int?dnWindow.UDukeEnterBonusCodeMB.WaitingForOSKText?>"
    OSKErrorTitle="<?int?dnWindow.UDukeEnterBonusCodeMB.OSKErrorTitle?>"
    OSKErrorText="<?int?dnWindow.UDukeEnterBonusCodeMB.OSKErrorText?>"
}