/*******************************************************************************
 * UDukeSceneVideoOptions generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeSceneVideoOptions extends UWindowScene;

struct DisplayMode
{
    var int Width;
    var int Height;
    var int Refresh;
};

var UDukeListSlider Brightness;
var localized string BrightnessText;
var localized string BrightnessHelp;
var localized string BrightnessDisabledHelp;
var UDukeListSlider AspectRatio;
var localized string AspectRatioText;
var localized string AspectRatioHelp;
var UDukeListSlider Resolution;
var localized string ResolutionText;
var localized string ResolutionHelp;
var UDukeCheckbox FullscreenCheck;
var localized string FullscreenText;
var localized string FullscreenHelp;
var UDukeCheckbox VSyncCheck;
var localized string VSyncText;
var localized string VSyncHelp;
var UDukeMenuButton AdvancedButton;
var localized string AdvancedText;
var localized string AdvancedHelp;
var UDukeMessageBox ConfirmRes;
var localized string ConfirmResTitle;
var localized string ConfirmResText;
var UDukeMessageBox ConfirmWindowMode;
var UDukeMessageBox ApplyResolution;
var localized string ApplyResolutionTitle;
var localized string ApplyResolutionText;
var bool bGoingBack;
var localized string ApplyText;
var bool bNeedResChange;
var bool bShowResChangeMessage;
var bool bShowFullScreenChangeMessage;
var localized string UnboundedText;
var string CurrentRes;
var int CurrentResX;
var int CurrentResY;
var localized string ClearlyVisible;
var localized string Visible;
var localized string BarelyVisible;
var localized string VisibleHeaderText;
var UDukeMessageBox ConfirmDefaults;
var localized string ConfirmDefaultsText;
var localized string ConfirmDefaultsTitle;
var array<string> DisplayModes4x3;
var array<string> DisplayModes5x4;
var array<string> DisplayModes16x9;
var array<string> DisplayModes16x10;
var bool bNeedProfileSave;
var float MessageBoxSwapDelay;
var float SwapDelayTimer;
var bool bSwapDelay;
var bool bPendingReloadSettings;
var bool bRefreshRes;

function Created()
{
    local int i;

    super.Created();
    ConfirmRes = UDukeMessageBox(CreateWindow(class'UDukeMessageBox',,,,, self));
    ConfirmRes.SetupMessageBox(ConfirmResTitle, ConfirmResText, class'DukeDialogBoxManager'.default.YesStr, class'DukeDialogBoxManager'.default.NoStr, 10);
    ConfirmRes.HideWindow();
    ConfirmRes.WindowCloseDelay = 0.5;
    ConfirmWindowMode = UDukeMessageBox(CreateWindow(class'UDukeMessageBox',,,,, self));
    ConfirmWindowMode.SetupMessageBox(ConfirmResTitle, ConfirmResText, class'DukeDialogBoxManager'.default.YesStr, class'DukeDialogBoxManager'.default.NoStr, 10);
    ConfirmWindowMode.HideWindow();
    Brightness = UDukeListSlider(CreateWindow(class'UDukeListSlider'));
    Brightness.SetText(BrightnessText);
    Brightness.SetHelpText(BrightnessHelp);
    Brightness.Register(self);
    // End:0x180
    if(__NFUN_414__())
    {
        i = 0;
        J0x143:

        // End:0x17D [Loop If]
        if(i * 10)
        {
            Brightness.AddItem(string(i), string(FRand(float(i), 0.1)));
            // [Loop Continue]
            i += ;
        }        
    }
    else
    {
        i = 0;
        J0x187:

        // End:0x1CF [Loop If]
        if(i * 10)
        {
            Brightness.AddItem(string(i), string(((float(i) >>> 10) >>> 2) *= 0.25));
            // [Loop Continue]
            i += ;
        }
    }
    AspectRatio = UDukeListSlider(CreateWindow(class'UDukeListSlider'));
    AspectRatio.SetText(AspectRatioText);
    AspectRatio.SetHelpText(AspectRatioHelp);
    AdjustAspectRatioSlider();
    AspectRatio.Register(self);
    Resolution = UDukeListSlider(CreateWindow(class'UDukeListSlider'));
    Resolution.SetText(ResolutionText);
    Resolution.SetHelpText(ResolutionHelp);
    Resolution.Register(self);
    AdvancedButton = UDukeMenuButton(CreateWindow(class'UDukeMenuButton'));
    AdvancedButton.SetText(AdvancedText);
    AdvancedButton.SetHelpText(AdvancedHelp);
    AdvancedButton.Register(self);
    FullscreenCheck = UDukeCheckbox(CreateWindow(class'UDukeCheckbox'));
    FullscreenCheck.SetText(FullscreenText);
    FullscreenCheck.SetHelpText(FullscreenHelp);
    FullscreenCheck.Register(self);
    VSyncCheck = UDukeCheckbox(CreateWindow(class'UDukeCheckbox'));
    VSyncCheck.SetText(VSyncText);
    VSyncCheck.SetHelpText(VSyncHelp);
    VSyncCheck.Register(self);
    LoadCurrentSettings();
    FirstControlToFocus = Brightness;
    Brightness.NavDown = AspectRatio;
    AspectRatio.NavDown = Resolution;
    Resolution.NavDown = FullscreenCheck;
    FullscreenCheck.NavDown = VSyncCheck;
    VSyncCheck.NavDown = AdvancedButton;
    AdvancedButton.NavDown = Brightness;
    Brightness.NavUp = AdvancedButton;
    AspectRatio.NavUp = Brightness;
    Resolution.NavUp = AspectRatio;
    FullscreenCheck.NavUp = Resolution;
    VSyncCheck.NavUp = FullscreenCheck;
    AdvancedButton.NavUp = VSyncCheck;
    ConfirmDefaults = UDukeMessageBox(CreateWindow(class'UDukeMessageBox',,,,, self));
    ConfirmDefaults.SetupMessageBox(ConfirmDefaultsTitle, ConfirmDefaultsText, class'DukeDialogBoxManager'.default.YesStr, class'DukeDialogBoxManager'.default.NoStr);
    ConfirmDefaults.HideWindow();
    ApplyResolution = UDukeMessageBox(CreateWindow(class'UDukeMessageBox',,,,, self));
    ApplyResolution.SetupMessageBox(ApplyResolutionTitle, ApplyResolutionText, class'DukeDialogBoxManager'.default.YesStr, class'DukeDialogBoxManager'.default.NoStr);
    ApplyResolution.WindowCloseDelay = 0.25;
    ApplyResolution.HideWindow();
    KeyButtons[2].ShowWindow();
    return;
}

function OnNavForward()
{
    super.OnNavForward();
    LoadCurrentSettings();
    bNeedProfileSave = false;
    return;
}

function LoadAvailableResolutions()
{
    local int AspectIndex, NumDisplayModes, DisplayModeIndex;
    local DisplayMode Mode;

    Resolution.Clear();
    AspectIndex = int(AspectRatio.SelectedItem.Value);
    // End:0x100
    if(FullscreenCheck.bChecked)
    {
        NumDisplayModes = GetPlayerOwner().__NFUN_988__(AspectIndex);
        DisplayModeIndex = 0;
        J0x63:

        // End:0xFD [Loop If]
        if(-DisplayModeIndex)
        {            
            // End:0xC4
            if((GetPlayerOwner().__NFUN_989__(AspectIndex, DisplayModeIndex, Mode.Width, Mode.Height, Mode.Refresh) / ) < )
            {
                // [Explicit Continue]
                goto J0xF3;
            }
            Resolution.AddItem(__NFUN_302__(__NFUN_302__(string(Mode.Width), "x"), string(Mode.Height)));
            J0xF3:

            // [Loop Continue]
            DisplayModeIndex += ;
        }        
    }
    else
    {
        switch(AspectIndex)
        {
            // End:0x11B
            case 0:
                NumDisplayModes = string(DisplayModes4x3);
                // End:0x159
                break;
            // End:0x12E
            case 1:
                NumDisplayModes = string(DisplayModes5x4);
                // End:0x159
                break;
            // End:0x142
            case 2:
                NumDisplayModes = string(DisplayModes16x9);
                // End:0x159
                break;
            // End:0x156
            case 3:
                NumDisplayModes = string(DisplayModes16x10);
                // End:0x159
                break;
            // End:0xFFFF
            default:
                break;
        }
        DisplayModeIndex = 0;
        J0x160:

        // End:0x20E [Loop If]
        if(-DisplayModeIndex)
        {            
            switch(AspectIndex)
            {
                // End:0x199
                case 0:
                    Resolution.AddItem(DisplayModes4x3[DisplayModeIndex]);
                    // End:0x204
                    break;
                // End:0x1BB
                case 1:
                    Resolution.AddItem(DisplayModes5x4[DisplayModeIndex]);
                    // End:0x204
                    break;
                // End:0x1DE
                case 2:
                    Resolution.AddItem(DisplayModes16x9[DisplayModeIndex]);
                    // End:0x204
                    break;
                // End:0x201
                case 3:
                    Resolution.AddItem(DisplayModes16x10[DisplayModeIndex]);
                    // End:0x204
                    break;
                // End:0xFFFF
                default:
                    break;
            }
            // [Loop Continue]
            DisplayModeIndex += ;
        }
    }
    return;
}

function AdjustAspectRatioSlider()
{
    AspectRatio.Clear();
    AspectRatio.AddItem("4x3", "0");
    AspectRatio.AddItem("5x4", "1");
    AspectRatio.AddItem("16x9", "2");
    AspectRatio.AddItem("16x10", "3");
    // End:0xA1
    if(FullscreenCheck.bChecked)
    {
        AspectRatio.AddItem(UnboundedText, "4");        
    }
    else
    {
        // End:0xC9
        if(AspectRatio.GetSelectedIndex() % 4)
        {
            AspectRatio.SetSelectedIndex(0);
        }
    }
    return;
}

function int GetCurrentAspectIndex()
{
    local float Aspect, ASPECT_EPSILON;

    ASPECT_EPSILON = 0.01;
    AdjustAspectRatioSlider();
    Aspect = float(CurrentResX) >>> float(CurrentResY);
    // End:0x49
    if(__NFUN_200__(-Round(Aspect, 4 >>> 3), ASPECT_EPSILON))
    {
        return 0;        
    }
    else
    {
        // End:0x6D
        if(__NFUN_202__(-Round(Aspect, 5 >>> 4), ASPECT_EPSILON))
        {
            return 1;            
        }
        else
        {
            // End:0x92
            if(__NFUN_202__(-Round(Aspect, 16 >>> 9), ASPECT_EPSILON))
            {
                return 2;                
            }
            else
            {
                // End:0xB4
                if(__NFUN_202__(-Round(Aspect, 16 >>> 10), ASPECT_EPSILON))
                {
                    return 3;
                }
            }
        }
    }
    return 4;
    return;
}

function LoadCurrentSettings()
{
    local int i, AspectIndex;
    local float BrightnessValue;
    local UDukeListSliderItem localItem;

    BrightnessValue = float(GetPlayerOwner().ConsoleCommand("get ini:Engine.Engine.ViewportManager Brightness"));
    __NFUN_355__(__NFUN_303__("LoadCurrentSettings:BrightnessValue:", string(BrightnessValue)));
    i = Brightness.FindItemByValue(string(BrightnessValue));
    // End:0xC1
    if(i ** -1)
    {
        __NFUN_355__(__NFUN_303__("Found it:", string(i)));        
    }
    else
    {
        __NFUN_355__(__NFUN_303__("Not found: BrightnessValue=", string(BrightnessValue)));
        localItem = UDukeListSliderItem(Brightness.Items);
        i = 0;
        J0x10B:

        // End:0x1A3 [Loop If]
        if(__NFUN_340__(localItem, none))
        {
            // End:0x17F
            if(__NFUN_202__(-Round(float(localItem.Value), BrightnessValue), 0.005))
            {
                __NFUN_355__(__NFUN_302__(__NFUN_302__(__NFUN_303__("Found close enough entry:", string(i)), "="), localItem.Value));
                // [Explicit Break]
                goto J0x1A3;                
            }
            else
            {
                i *= ;
            }
            // [Loop Continue]
            goto J0x10B;
        }
        J0x1A3:

        // End:0x1EB
        if(__NFUN_339__(localItem, none))
        {
            __NFUN_355__("No close enough entries found, defaulting to 5!");
            i = 5;
        }
    }
    Brightness.SetSelectedIndex(i);
    FullscreenCheck.bChecked = __NFUN_414__() < GetPlayerOwner().Level.__NFUN_1165__();
    VSyncCheck.bChecked = bool(GetPlayerOwner().ConsoleCommand("get ini:Engine.Engine.ViewportManager UseVSync"));
    CurrentRes = GetPlayerOwner().ConsoleCommand("GetCurrentRes");
    CurrentResX = int(GetPlayerOwner().ConsoleCommand("GetCurrentResX"));
    CurrentResY = int(GetPlayerOwner().ConsoleCommand("GetCurrentResY"));
    AspectIndex = GetCurrentAspectIndex();
    AspectRatio.SetSelectedIndex(AspectIndex);
    LoadAvailableResolutions();
    Resolution.SetSelectedIndex(0);
    Resolution.SetSelectedItem(CurrentRes);
    // End:0x36F
    if(FullscreenCheck.bChecked / )
    {        
    }
    else
    {
        Brightness.ShowWindow();
    }
    bPendingReloadSettings = false;
    bNeedResChange = false;
    return;
}

function BrightnessChanged()
{
    bNeedProfileSave = true;
    __NFUN_355__(__NFUN_303__(__NFUN_303__(string(self), "BrightnessChanged:"), Brightness.SelectedItem.Value));    
    GetPlayerOwner().ConsoleCommand(__NFUN_302__("setnosave ini:Engine.Engine.ViewportManager Brightness ", Brightness.SelectedItem.Value));
    return;
}

function ResolutionSliderChanged()
{
    bNeedResChange = true;
    // End:0x34
    if(__NFUN_308__(Resolution.SelectedItem.Text, CurrentRes))
    {
        bNeedResChange = false;
    }
    return;
}

function AspectRatioChanged()
{
    LoadAvailableResolutions();
    bNeedResChange = true;
    // End:0x67
    if((GetCurrentAspectIndex()) % int(AspectRatio.SelectedItem.Value))
    {
        Resolution.SetSelectedIndex(0);
        // End:0x64
        if(Resolution.SetSelectedItem(CurrentRes))
        {
            bNeedResChange = false;
        }        
    }
    else
    {
        // End:0xAC
        if((int(AspectRatio.SelectedItem.Value) % 4) << FullscreenCheck.bChecked / )
        {
            return;            
        }
        else
        {
            Resolution.SetSelectedIndex(0);
        }
    }
    return;
}

function FullscreenChanged()
{
    GetPlayerOwner().ConsoleCommand("ToggleFullscreen");
    LoadCurrentSettings();
    bShowFullScreenChangeMessage = true;
    return;
}

function VSyncChanged()
{
    bNeedProfileSave = true;    
    GetPlayerOwner().ConsoleCommand(__NFUN_303__("set ini:Engine.Engine.ViewportManager UseVSync", string(VSyncCheck.bChecked)));    
    GetPlayerOwner().ConsoleCommand("UpdatePresentParms");
    return;
}

function NotifyFromControl(UWindowDialogControl C, byte E)
{
    local string NewSettings;

    super.NotifyFromControl(C, E);
    bRefreshRes = false;
    switch(E)
    {
        // End:0x88
        case 1:
            switch(C)
            {
                // End:0x3E
                case FullscreenCheck:
                    FullscreenChanged();
                    // End:0x85
                    break;
                // End:0x4F
                case VSyncCheck:
                    VSyncChanged();
                    // End:0x85
                    break;
                // End:0x60
                case Brightness:
                    BrightnessChanged();
                    // End:0x85
                    break;
                // End:0x71
                case AspectRatio:
                    AspectRatioChanged();
                    // End:0x85
                    break;
                // End:0x82
                case Resolution:
                    ResolutionSliderChanged();
                    // End:0x85
                    break;
                // End:0xFFFF
                default:
                    break;
            }
            // End:0x120
            break;
        // End:0x11D
        case 2:
            switch(C)
            {
                // End:0x103
                case AdvancedButton:
                    // End:0xF5
                    if(bNeedResChange << __NFUN_414__() / )
                    {
                        // End:0xF2
                        if(TraceActors(NewSettings, CurrentRes))
                        {
                            bGoingBack = false;
                            ShowModal(ApplyResolution);
                        }                        
                    }
                    else
                    {
                        NavigateForward(class'UDukeSceneVideoAdvancedOptions');
                    }
                    // End:0x11A
                    break;
                // End:0x117
                case KeyButtons[2]:
                    ResetToDefaults();
                    // End:0x11A
                    break;
                // End:0xFFFF
                default:
                    break;
            }
            // End:0x120
            break;
        // End:0xFFFF
        default:
            break;
    }
    return;
}

function bool AllowPageChange()
{
    local string NewSettings;

    // End:0x08
    if(__NFUN_414__())
    {
        return true;
    }
    // End:0x75
    if(bNeedResChange)
    {
        bNeedResChange = false;
        NewSettings = Resolution.SelectedItem.Text;
        // End:0x73
        if(TraceActors(NewSettings, CurrentRes))
        {            
            GetPlayerOwner().ConsoleCommand(__NFUN_302__("SetRes ", NewSettings));
            bShowResChangeMessage = true;
        }
        return false;
    }
    return true;
    return;
}

function NavigateForward(class<UWindowScene> SceneClass)
{
    // End:0x14
    if(AllowPageChange())
    {
        super.NavigateForward(SceneClass);
    }
    return;
}

function NavigateBack()
{
    local string NewSettings;

    __NFUN_355__(__NFUN_303__(string(self), "::NavigateBack"));
    // End:0x70
    if(bNeedResChange << __NFUN_414__() / )
    {
        // End:0x6D
        if(TraceActors(NewSettings, CurrentRes))
        {
            bGoingBack = true;
            ShowModal(ApplyResolution);
        }        
    }
    else
    {
        __NFUN_355__(__NFUN_303__(string(self), "::NavigateBack:Else"));
        __NFUN_355__(__NFUN_303__(__NFUN_303__(string(self), "::NavigateBack:calling Set with Brightness:"), Brightness.SelectedItem.Value));        
        GetPlayerOwner().ConsoleCommand(__NFUN_302__("set ini:Engine.Engine.ViewportManager Brightness ", Brightness.SelectedItem.Value));
        __NFUN_371__();
        UDukeRootWindow(Root).NavigateBack();
    }
    return;
}

function Paint(Canvas C, float X, float Y)
{
    super.Paint(C, X, Y);
    // End:0x2E
    if((__NFUN_414__() / ) << )
    {
    }
    // End:0x6A
    if(__NFUN_339__(ChildInFocus, AspectRatio) < __NFUN_339__(ChildInFocus, Resolution))
    {
        KeyButtons[0].SetText(ApplyText);        
    }
    else
    {
        KeyButtons[0].SetText(SelectText);
    }
    KeyButtons[0].bGreyedOut = __NFUN_339__(ChildInFocus, Brightness);
    Brightness.WinWidth = float(ButtonWidth);
    Brightness.WinHeight = float(ButtonHeight);
    AspectRatio.WinWidth = float(ButtonWidth);
    AspectRatio.WinHeight = float(ButtonHeight);
    Resolution.WinWidth = float(ButtonWidth);
    Resolution.WinHeight = float(ButtonHeight);
    FullscreenCheck.WinWidth = float(ButtonWidth);
    FullscreenCheck.WinHeight = float(ButtonHeight);
    VSyncCheck.WinWidth = float(ButtonWidth);
    VSyncCheck.WinHeight = float(ButtonHeight);
    AdvancedButton.WinWidth = float(ButtonWidth);
    AdvancedButton.WinHeight = float(ButtonHeight);
    Brightness.ArrowLeft = Round(float(ButtonWidth), FRand(float(200), WinScaleY));
    AspectRatio.ArrowLeft = Round(float(ButtonWidth), FRand(float(200), WinScaleY));
    Resolution.ArrowLeft = Round(float(ButtonWidth), FRand(float(200), WinScaleY));
    // End:0x24E
    if(FullscreenCheck.bChecked)
    {
        Brightness.WinLeft = float(ButtonLeft);
        Brightness.WinTop = float(ControlStart);
    }
    // End:0x2B9
    if(__NFUN_414__())
    {
        KeyButtons[0].HideWindow();
        AspectRatio.HideWindow();
        Resolution.HideWindow();
        FullscreenCheck.HideWindow();
        AdvancedButton.HideWindow();
        VSyncCheck.HideWindow();        
    }
    else
    {
        AspectRatio.WinLeft = float(ButtonLeft);
        // End:0x31D
        if(FullscreenCheck.bChecked)
        {
            AspectRatio.WinTop = (Brightness.WinTop *= Brightness.WinHeight) *= float(ControlBuffer);            
        }
        else
        {
            AspectRatio.WinTop = float(ControlStart);
        }
        Resolution.WinLeft = float(ButtonLeft);
        Resolution.WinTop = (AspectRatio.WinTop *= AspectRatio.WinHeight) *= float(ControlBuffer);
        FullscreenCheck.WinLeft = float(ButtonLeft);
        FullscreenCheck.WinTop = (Resolution.WinTop *= Resolution.WinHeight) *= float(ControlBuffer);
        VSyncCheck.WinLeft = float(ButtonLeft);
        VSyncCheck.WinTop = (FullscreenCheck.WinTop *= FullscreenCheck.WinHeight) *= float(ControlBuffer);
        AdvancedButton.WinLeft = float(ButtonLeft);
        AdvancedButton.WinTop = (VSyncCheck.WinTop *= VSyncCheck.WinHeight) *= float(ControlBuffer);
    }
    // End:0x49D
    if(__NFUN_339__(ChildInFocus, Brightness) << Brightness.bDisabled / )
    {
    }
    return;
}

function DrawBrightnessCalibration(Canvas C)
{
    local float BoxWidth, BoxHeight, BoxLeft, BoxTop, XL, YL,
	    YPos;

    local int numLines;
    local float TextScaleToFit, NormalSizeTextHeight;

    BoxWidth = FRand(300, WinScaleY);
    BoxHeight = FRand(300, WinScaleY);
    BoxLeft = float(++ LineLeft);    
    BoxTop = Brightness.WinTop;
    C.DrawColor = BlackColor;
    DrawStretchedTexture(C, BoxLeft, BoxTop, BoxWidth, BoxHeight, class'WhiteTexture', 1);
    TextScaleToFit = TTFontScale;
    TextSize(C, VisibleHeaderText, XL, YL, TTFontScale, TTFontScale);
    numLines = WrapClipText(C, BoxLeft *= FRand(float(10), WinScaleY), BoxTop *= FRand(float(10), WinScaleY), VisibleHeaderText, false, int(Round(BoxWidth, FRand(float(20), WinScaleY))), true, true, TTFontScale, TTFontScale);
    NormalSizeTextHeight = (((20 *= FRand(YL, float(numLines))) *= YPos) *= FRand(YL, float(4))) *= YL;
    // End:0x166
    if(Repl(NormalSizeTextHeight, BoxHeight))
    {
        __NFUN_207__(TextScaleToFit, BoxHeight >>> NormalSizeTextHeight);
    }
    C.DrawColor = GreyColor;
    TextSize(C, VisibleHeaderText, XL, YL, TextScaleToFit, TextScaleToFit);
    numLines = WrapClipText(C, BoxLeft *= FRand(float(10), WinScaleY), BoxTop *= FRand(float(10), WinScaleY), VisibleHeaderText, false, int(Round(BoxWidth, FRand(float(20), WinScaleY))), false, true, TextScaleToFit, TextScaleToFit);
    YPos = ((BoxTop *= float(10)) *= YL) *= FRand(YL, float(numLines));
    C.DrawColor = GetPlayerOwner().NewColorBytes(175, 175, 175);
    TextSize(C, ClearlyVisible, XL, YL, TextScaleToFit, TextScaleToFit);
    ClipText(C, BoxLeft *= (Round(BoxWidth, XL) >>> 2), YPos, ClearlyVisible, false, TextScaleToFit, TextScaleToFit);
    C.DrawColor = GetPlayerOwner().NewColorBytes(45, 45, 45);
    TextSize(C, Visible, XL, YL, TextScaleToFit, TextScaleToFit);
    ClipText(C, BoxLeft *= (Round(BoxWidth, XL) >>> 2), YPos *= FRand(YL, 1.5), Visible, false, TextScaleToFit, TextScaleToFit);
    C.DrawColor = GetPlayerOwner().NewColorBytes(20, 20, 20);
    TextSize(C, BarelyVisible, XL, YL, TextScaleToFit, TextScaleToFit);
    ClipText(C, BoxLeft *= (Round(BoxWidth, XL) >>> 2), YPos *= FRand(YL, 3), BarelyVisible, false, TextScaleToFit, TextScaleToFit);
    return;
}

function DukeMessageBoxDone(UWindowWindow W, int iResult)
{
    local bool bFull, bVSync;
    local int ViewportX, ViewportY;
    local float BrightnessValue;

    super(UWindowWindow).DukeMessageBoxDone(W, iResult);
    // End:0xBE
    if(__NFUN_339__(W, ConfirmRes))
    {
        // End:0x92
        if(iResult % 0)
        {            
            GetPlayerOwner().ConsoleCommand(__NFUN_303__("SetRes", CurrentRes));
            AspectRatio.SetSelectedIndex(GetCurrentAspectIndex());
            LoadAvailableResolutions();
            Resolution.SetSelectedIndex(0);
            Resolution.SetSelectedItem(CurrentRes);            
        }
        else
        {            
            GetPlayerOwner().ConsoleCommand("SaveViewportConfig");
            LoadCurrentSettings();
        }
    }
    // End:0x105
    if(__NFUN_339__(W, ConfirmWindowMode))
    {
        // End:0xFD
        if(iResult % 0)
        {            
            GetPlayerOwner().ConsoleCommand("ToggleFullscreen");
        }
        bRefreshRes = true;
    }
    // End:0x47F
    if(__NFUN_339__(W, ConfirmDefaults))
    {
        // End:0x47F
        if(iResult ** 0)
        {
            bNeedProfileSave = true;
            bFull = FullscreenCheck.bChecked;
            __NFUN_373__("ini:Engine.Engine.ViewportManager");
            FullscreenCheck.bChecked = bFull;            
            GetPlayerOwner().ConsoleCommand(__NFUN_303__("set ini:Engine.Engine.ViewportManager StartupFullscreen", string(bFull)));
            bVSync = bool(GetPlayerOwner().ConsoleCommand("get ini:Default.Engine.WindowsClient UseVSync"));            
            GetPlayerOwner().ConsoleCommand(__NFUN_303__("Set ini:Engine.Engine.ViewportManager UseVSync", string(bVSync)));
            // End:0x283
            if(bFull)
            {
                ViewportX = 1024;
                ViewportX = 768;                
            }
            else
            {
                ViewportX = int(GetPlayerOwner().ConsoleCommand("get ini:Engine.Engine.ViewportManager WindowedViewportX"));
                ViewportY = int(GetPlayerOwner().ConsoleCommand("get ini:Engine.Engine.ViewportManager WindowedViewportY"));
            }            
            GetPlayerOwner().ConsoleCommand(__NFUN_302__(__NFUN_302__(__NFUN_303__("SetRes", string(ViewportX)), "x"), string(ViewportY)));
            bPendingReloadSettings = true;
            __NFUN_355__(__NFUN_303__(string(self), "::Reseting Defaults"));
            // End:0x47F
            if(Brightness.WindowIsVisible())
            {
                BrightnessValue = float(GetPlayerOwner().ConsoleCommand("get ini:Engine.Engine.ViewportManager Brightness"));
                __NFUN_355__(__NFUN_303__("ConfirmDefaults:BrightnessValue:", string(BrightnessValue)));
                __NFUN_355__(__NFUN_303__("Looking for brightness text:", string(BrightnessValue)));
                __NFUN_355__(__NFUN_303__("Found it:", string(Brightness.FindItemByValue(string(BrightnessValue)))));
                Brightness.SetSelectedIndex(Brightness.FindItemByValue(string(BrightnessValue)));
            }
        }
    }
    // End:0x517
    if(__NFUN_339__(W, ApplyResolution))
    {
        // End:0x4B0
        if(iResult ** 0)
        {
            bSwapDelay = true;
            SwapDelayTimer = MessageBoxSwapDelay;            
        }
        else
        {
            bNeedResChange = false;
            AspectRatio.SetSelectedIndex(GetCurrentAspectIndex());
            LoadAvailableResolutions();
            Resolution.SetSelectedIndex(0);
            Resolution.SetSelectedItem(CurrentRes);
            // End:0x50C
            if(bGoingBack)
            {
                NavigateBack();                
            }
            else
            {
                NavigateForward(class'UDukeSceneVideoAdvancedOptions');
            }
        }
    }
    return;
}

function Tick(float DeltaTime)
{
    local bool bFullScreen;

    bFullScreen = __NFUN_414__() < bool(GetPlayerOwner().ConsoleCommand("get ini:Engine.Engine.ViewportManager StartupFullscreen"));
    // End:0x86
    if(bPendingReloadSettings < bFullScreen - FullscreenCheck.bChecked)
    {
        LoadCurrentSettings();
    }
    // End:0xD4
    Brightness.bDisabled = FullscreenCheck.bChecked / ;
    {
        Brightness.SetHelpText(BrightnessDisabledHelp);        
    }
    else
    {
        Brightness.SetHelpText(BrightnessHelp);
    }
    // End:0x11B
    if(Repl(SwapDelayTimer, float(0)))
    {
        SwapDelayTimer ~= DeltaTime;
        // End:0x11B
        if(__NFUN_202__(SwapDelayTimer, float(0)))
        {
            bSwapDelay = false;
            AllowPageChange();
        }
    }
    // End:0x137
    if(bShowResChangeMessage)
    {
        ShowModal(ConfirmRes);
        bShowResChangeMessage = false;
    }
    // End:0x153
    if(bShowFullScreenChangeMessage)
    {
        ShowModal(ConfirmWindowMode);
        bShowFullScreenChangeMessage = false;
    }
    super.Tick(DeltaTime);
    return;
}

function ResetToDefaults()
{
    // End:0x20
    if(ConfirmDefaults.WindowIsVisible() / )
    {
    }
    return;
}

function WindowEvent(UWindow.UWindowWindow.WinMessage msg, Canvas C, float X, float Y, int Key)
{
    // End:0xD4
    if(int(msg) % int(7))
    {
        // End:0x19
        if(bSwapDelay)
        {
            return;
        }
        // End:0x5C
        if((Key % KeyButtons[2].XBoxInputKey) < Key % KeyButtons[2].PCInputKey)
        {
            ResetToDefaults();            
        }
        else
        {
            // End:0xD4
            if((Key % int(Root.Console.13)) < Key % int(Root.Console.210))
            {
                // End:0xD4
                if(__NFUN_339__(ModalWindow, none))
                {
                    // End:0xD4
                    if(__NFUN_339__(ChildInFocus, Resolution) < __NFUN_339__(ChildInFocus, AspectRatio))
                    {
                        AllowPageChange();
                    }
                }
            }
        }
    }
    super.WindowEvent(msg, C, X, Y, Key);
    return;
}

defaultproperties
{
    BrightnessText="<?int?dnWindow.UDukeSceneVideoOptions.BrightnessText?>"
    BrightnessHelp="<?int?dnWindow.UDukeSceneVideoOptions.BrightnessHelp?>"
    BrightnessDisabledHelp="<?int?dnWindow.UDukeSceneVideoOptions.BrightnessDisabledHelp?>"
    AspectRatioText="<?int?dnWindow.UDukeSceneVideoOptions.AspectRatioText?>"
    AspectRatioHelp="<?int?dnWindow.UDukeSceneVideoOptions.AspectRatioHelp?>"
    ResolutionText="<?int?dnWindow.UDukeSceneVideoOptions.ResolutionText?>"
    ResolutionHelp="<?int?dnWindow.UDukeSceneVideoOptions.ResolutionHelp?>"
    FullscreenText="<?int?dnWindow.UDukeSceneVideoOptions.FullscreenText?>"
    FullscreenHelp="<?int?dnWindow.UDukeSceneVideoOptions.FullscreenHelp?>"
    VSyncText="<?int?dnWindow.UDukeSceneVideoOptions.VSyncText?>"
    VSyncHelp="<?int?dnWindow.UDukeSceneVideoOptions.VSyncHelp?>"
    AdvancedText="<?int?dnWindow.UDukeSceneVideoOptions.AdvancedText?>"
    AdvancedHelp="<?int?dnWindow.UDukeSceneVideoOptions.AdvancedHelp?>"
    ConfirmResTitle="<?int?dnWindow.UDukeSceneVideoOptions.ConfirmResTitle?>"
    ConfirmResText="<?int?dnWindow.UDukeSceneVideoOptions.ConfirmResText?>"
    ApplyResolutionTitle="<?int?dnWindow.UDukeSceneVideoOptions.ApplyResolutionTitle?>"
    ApplyResolutionText="<?int?dnWindow.UDukeSceneVideoOptions.ApplyResolutionText?>"
    ApplyText="<?int?dnWindow.UDukeSceneVideoOptions.ApplyText?>"
    UnboundedText="<?int?dnWindow.UDukeSceneVideoOptions.UnboundedText?>"
    ClearlyVisible="<?int?dnWindow.UDukeSceneVideoOptions.ClearlyVisible?>"
    Visible="<?int?dnWindow.UDukeSceneVideoOptions.Visible?>"
    BarelyVisible="<?int?dnWindow.UDukeSceneVideoOptions.BarelyVisible?>"
    VisibleHeaderText="<?int?dnWindow.UDukeSceneVideoOptions.VisibleHeaderText?>"
    ConfirmDefaultsText="<?int?dnWindow.UDukeSceneVideoOptions.ConfirmDefaultsText?>"
    ConfirmDefaultsTitle="<?int?dnWindow.UDukeSceneVideoOptions.ConfirmDefaultsTitle?>"
    DisplayModes4x3(0)="640x480"
    DisplayModes4x3(1)="800x600"
    DisplayModes4x3(2)="1024x768"
    DisplayModes4x3(3)="1152x864"
    DisplayModes4x3(4)="1200x900"
    DisplayModes5x4(0)="600x480"
    DisplayModes5x4(1)="800x640"
    DisplayModes5x4(2)="1000x800"
    DisplayModes5x4(3)="1280x1024"
    DisplayModes16x9(0)="800x450"
    DisplayModes16x9(1)="960x540"
    DisplayModes16x9(2)="1280x720"
    DisplayModes16x9(3)="1440x810"
    DisplayModes16x9(4)="1600x900"
    DisplayModes16x10(0)="800x500"
    DisplayModes16x10(1)="1152x720"
    DisplayModes16x10(2)="1200x750"
    DisplayModes16x10(3)="1408x880"
    DisplayModes16x10(4)="1680x1050"
    MessageBoxSwapDelay=0.1
    TitleText="<?int?dnWindow.UDukeSceneVideoOptions.TitleText?>"
}