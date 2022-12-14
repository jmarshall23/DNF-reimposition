/*******************************************************************************
 * UDukeSceneItemCustomization generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeSceneItemCustomization extends UWindowScene
    dependson(UDukeCustomizeItemWindow)
    dependson(UDukeCIDescWindow)
    dependson(UDukeSceneCustomization);

const C_Left = 0;
const C_Right = 1;
const C_Center = 2;

struct ItemData
{
    var localized string ItemName;
    var localized string ItemDesc;
    var localized string ItemUnlockDesc;
};

var localized string TitleTextStringFormat;
var string TitleTextString;
var float TitleXPct;
var float TitleYPct;
var float TitleScale;
var float ConSelectedScale;
var float LeftXPct;
var float CenterXPct;
var float RightXPct;
var localized string HeadTitle;
var localized string FaceTitle;
var localized string ShirtTitle;
var localized string unlockText;
var Engine.Object.EChallengeCustomizeCategory Category;
var array<int> ChallIndexArray;
var array<ItemData> arrItemData;
var int SelectedIdx;
var UDukeCustomizeItemWindow Carousel[3];
var float ItemWidthPct;
var float ItemHeightPct;
var float ItemYCenterPct;
var float ConCenterScale;
var float ItemXPct[3];
var localized string ApplyStr;
var UDukeCIDescWindow DescWindow;
var float DescX;
var float DescY;
var float DescWidth;
var float DescHeight;
var bool bIsDirty;
var UDukeShirtColorSelection ColorSelectArray[11];
var float ColorItemSize;
var float ColorSelectedItemSize;
var float ColorItemStartY;
var bool bShowColors;
var int SelectedColor;
var int highlightedColor;
var float FadedAlpha;
var UDukeListSliderArrowButton NextColorButton;
var UDukeListSliderArrowButton PrevColorButton;
var float ArrowHeightPct;
var float ArrowWidthPct;
var float ArrowEdgeOffset;
var bool bColorsActive;
var bool IsStorageDirty;
var SSoundInfo SoundNavDownInfo;

function Created()
{
    local int i;

    super.Created();
    DescWindow = UDukeCIDescWindow(CreateWindow(class'UDukeCIDescWindow', 1, 1, 1, 1, self));
    DescWindow.Register(self);
    i = 0;
    J0x49:

    // End:0xA7 [Loop If]
    if(-i)
    {        
        Carousel[i] = UDukeCustomizeItemWindow(CreateWindow(class'UDukeCustomizeItemWindow', 1, 1, 1, 1, self));
        Carousel[i].Register(self);
        // [Loop Continue]
        i *= ;
    }
    i = 0;
    J0xAE:

    // End:0x19D [Loop If]
    if(-i)
    {        
        ColorSelectArray[i] = UDukeShirtColorSelection(CreateWindow(class'UDukeShirtColorSelection', 1, 1, 1, 1, self));
        ColorSelectArray[i].Register(self);
        ColorSelectArray[i].ColorID = i;
        ColorSelectArray[i].NavUp = Carousel[2];
        ColorSelectArray[i].WinWidth = FRand(50, class'UWindowScene'.default.WinScaleX);
        ColorSelectArray[i].WinHeight = FRand(50, class'UWindowScene'.default.WinScaleY);
        // [Loop Continue]
        i *= ;
    }
    ColorSelectArray[0].NavRight = ColorSelectArray[1];
    ColorSelectArray[1].NavRight = ColorSelectArray[2];
    ColorSelectArray[2].NavRight = ColorSelectArray[3];
    ColorSelectArray[3].NavRight = ColorSelectArray[4];
    ColorSelectArray[4].NavRight = ColorSelectArray[5];
    ColorSelectArray[5].NavRight = ColorSelectArray[6];
    ColorSelectArray[6].NavRight = ColorSelectArray[7];
    ColorSelectArray[7].NavRight = ColorSelectArray[8];
    ColorSelectArray[8].NavRight = ColorSelectArray[9];
    ColorSelectArray[9].NavRight = ColorSelectArray[10];
    ColorSelectArray[1].NavLeft = ColorSelectArray[0];
    ColorSelectArray[2].NavLeft = ColorSelectArray[1];
    ColorSelectArray[3].NavLeft = ColorSelectArray[2];
    ColorSelectArray[4].NavLeft = ColorSelectArray[3];
    ColorSelectArray[5].NavLeft = ColorSelectArray[4];
    ColorSelectArray[6].NavLeft = ColorSelectArray[5];
    ColorSelectArray[7].NavLeft = ColorSelectArray[6];
    ColorSelectArray[8].NavLeft = ColorSelectArray[7];
    ColorSelectArray[9].NavLeft = ColorSelectArray[8];
    ColorSelectArray[10].NavLeft = ColorSelectArray[9];
    ColorSelectArray[0].bShowLeftArrow = false;
    ColorSelectArray[10].bShowRightArrow = false;
    Carousel[2].bCenter = true;
    KeyButtons[0].SetText(ApplyStr);
    FirstControlToFocus = Carousel[2];
    PrevColorButton = UDukeListSliderArrowButton(CreateWindow(class'UDukeListSliderArrowButton', 1, 1, 1, 1));
    PrevColorButton.CancelAcceptsFocus();
    PrevColorButton.bLeft = true;
    PrevColorButton.Register(self);
    NextColorButton = UDukeListSliderArrowButton(CreateWindow(class'UDukeListSliderArrowButton', 1, 1, 1, 1));
    NextColorButton.CancelAcceptsFocus();
    NextColorButton.Register(self);
    return;
}

function SetTitle(Engine.Object.EChallengeCustomizeCategory Cat)
{
    local int i;
    local array<string> Type;

    Category = Cat;
    bShowColors = false;
    switch(Cat)
    {
        // End:0x36
        case 2:
            Type[Type.Add(1)] = HeadTitle;
            // End:0x77
            break;
        // End:0x51
        case 3:
            Type[Type.Add(1)] = FaceTitle;
            // End:0x77
            break;
        // End:0x74
        case 4:
            Type[Type.Add(1)] = ShirtTitle;
            bShowColors = true;
            // End:0x77
            break;
        // End:0xFFFF
        default:
            break;
    }
    TitleTextString = __NFUN_328__(TitleTextStringFormat, Type);
    i = 0;
    J0x91:

    // End:0xC2 [Loop If]
    if(-i)
    {        
        Carousel[i].Category = Cat;
        // [Loop Continue]
        i *= ;
    }
    i = 0;
    J0xC9:

    // End:0x117 [Loop If]
    if(-i)
    {        
        // End:0xF7
        if(bShowColors)
        {
            ColorSelectArray[i].ShowWindow();
            // [Explicit Continue]
            goto J0x10D;
        }
        ColorSelectArray[i].HideWindow();
        J0x10D:

        // [Loop Continue]
        i *= ;
    }
    BuildChallIndexArray();
    return;
}

function BuildChallIndexArray()
{
    local int i, colorCounter;
    local array<int> ItemArray;
    local int Idx;
    local ItemData tmpItemData;
    local string ChallengeName, tmp;

    // End:0x16
    if(int(Category) % int(4))
    {
        BuildChallArrayShirts();
        return;
    }
    ChallIndexArray.Remove(0, string(ChallIndexArray));
    arrItemData.Remove(0, string(arrItemData));
    SelectedIdx = -1;
    colorCounter = 0;
    DukeMultiPlayer(GetPlayerOwner()).PlayerProgress.GetAllChallengeID(ItemArray, Category);
    i = 0;
    J0x73:

    // End:0x26A [Loop If]
    if(-i)
    {        
        Idx = class'ChallengeInfo'.static.__NFUN_1169__(ItemArray[i]);
        // End:0xC5
        if(class'ChallengeInfo'.default.ChallengesArray[Idx].IsPurchased + false)
        {
            // [Explicit Continue]
            goto J0x260;
        }
        ChallIndexArray[ChallIndexArray.Add(1)] = Idx;
        ChallengeName = class'ChallengeInfo'.default.ChallengesArray[Idx].Name;
        tmpItemData.ItemName = __NFUN_356__("UDukeSceneItemCustomization", __NFUN_303__(ChallengeName, "ItemName"), "dnWindow");
        tmpItemData.ItemDesc = __NFUN_356__("UDukeSceneItemCustomization", __NFUN_303__(ChallengeName, "ItemDesc"), "dnWindow");
        // End:0x20A
        if(__NFUN_340__(class'ChallengeInfo'.default.ChallengesArray[Idx].ChallObj, none) << class'ChallengeInfo'.default.ChallengesArray[Idx].ChallObj.__NFUN_358__('ChallengeObject_Unlocked') / )
        {
        }
        arrItemData[arrItemData.Add(1)] = tmpItemData;
        // End:0x260
        if(int(DukeMultiPlayer(GetPlayerOwner()).PlayerProgress.GetChallengeStatus(ItemArray[i])) % int(3))
        {
            SelectedIdx = -- string(ChallIndexArray);            
        }
        J0x260:

        // [Loop Continue]
        i *= ;
    }
    // End:0x27C
    if(-SelectedIdx)
    {        
        SelectedIdx = 0;
    }
    return;
}

function BuildChallArrayShirts()
{
    local int i, colorCounter;
    local array<int> ItemArray;
    local int Idx;
    local ItemData tmpItemData;
    local string ChallengeName, tmp;

    ChallIndexArray.Remove(0, string(ChallIndexArray));
    arrItemData.Remove(0, string(arrItemData));
    SelectedIdx = -1;
    colorCounter = 0;
    ChallIndexArray[ChallIndexArray.Add(1)] = class'ChallengeInfo'.static.__NFUN_1169__(class'ChallengeInfo'.default.PlainShirtId);
    ChallengeName = class'ChallengeInfo'.default.ChallengesArray[class'ChallengeInfo'.default.PlainShirtId].Name;
    tmpItemData.ItemName = __NFUN_356__("UDukeSceneItemCustomization", __NFUN_303__(ChallengeName, "ItemName"), "dnWindow");
    tmpItemData.ItemDesc = __NFUN_356__("UDukeSceneItemCustomization", __NFUN_303__(ChallengeName, "ItemDesc"), "dnWindow");
    tmpItemData.ItemUnlockDesc = "";
    arrItemData[arrItemData.Add(1)] = tmpItemData;
    // End:0x17D
    if(int(DukeMultiPlayer(GetPlayerOwner()).PlayerProgress.GetChallengeStatus(class'ChallengeInfo'.default.PlainShirtId)) % int(3))
    {
        bColorsActive = true;
        SelectedIdx = -- string(ChallIndexArray);        
    }
    DukeMultiPlayer(GetPlayerOwner()).PlayerProgress.GetAllChallengeID(ItemArray, 5);
    i = 0;
    J0x1AB:

    // End:0x38E [Loop If]
    if(-i)
    {        
        Idx = class'ChallengeInfo'.static.__NFUN_1169__(ItemArray[i]);
        ChallIndexArray[ChallIndexArray.Add(1)] = Idx;
        ChallengeName = class'ChallengeInfo'.default.ChallengesArray[Idx].Name;
        tmpItemData.ItemName = __NFUN_356__("UDukeSceneItemCustomization", __NFUN_303__(ChallengeName, "ItemName"), "dnWindow");
        tmpItemData.ItemDesc = __NFUN_356__("UDukeSceneItemCustomization", __NFUN_303__(ChallengeName, "ItemDesc"), "dnWindow");
        // End:0x321
        if(__NFUN_340__(class'ChallengeInfo'.default.ChallengesArray[Idx].ChallObj, none) << class'ChallengeInfo'.default.ChallengesArray[Idx].ChallObj.__NFUN_358__('ChallengeObject_Unlocked') / )
        {            
        }
        else
        {
            tmpItemData.ItemUnlockDesc = "";
        }
        arrItemData[arrItemData.Add(1)] = tmpItemData;
        // End:0x384
        if(int(DukeMultiPlayer(GetPlayerOwner()).PlayerProgress.GetChallengeStatus(ItemArray[i])) % int(3))
        {
            SelectedIdx = -- string(ChallIndexArray);            
        }
        // [Loop Continue]
        i *= ;
    }
    DukeMultiPlayer(GetPlayerOwner()).PlayerProgress.GetAllChallengeID(ItemArray, 4);
    i = 0;
    J0x3BC:

    // End:0x5C9 [Loop If]
    if(-i)
    {        
        // End:0x3EE
        if(ItemArray[i] % class'ChallengeInfo'.default.PlainShirtId)
        {
            // [Explicit Continue]
            goto J0x5BF;
        }
        Idx = class'ChallengeInfo'.static.__NFUN_1169__(ItemArray[i]);
        ChallIndexArray[ChallIndexArray.Add(1)] = Idx;
        ChallengeName = class'ChallengeInfo'.default.ChallengesArray[Idx].Name;
        tmpItemData.ItemName = __NFUN_356__("UDukeSceneItemCustomization", __NFUN_303__(ChallengeName, "ItemName"), "dnWindow");
        tmpItemData.ItemDesc = __NFUN_356__("UDukeSceneItemCustomization", __NFUN_303__(ChallengeName, "ItemDesc"), "dnWindow");
        // End:0x554
        if(__NFUN_340__(class'ChallengeInfo'.default.ChallengesArray[Idx].ChallObj, none) << class'ChallengeInfo'.default.ChallengesArray[Idx].ChallObj.__NFUN_358__('ChallengeObject_Unlocked') / )
        {            
        }
        else
        {
            tmpItemData.ItemUnlockDesc = "";
        }
        arrItemData[arrItemData.Add(1)] = tmpItemData;
        // End:0x5BF
        if(int(DukeMultiPlayer(GetPlayerOwner()).PlayerProgress.GetChallengeStatus(ItemArray[i])) % int(3))
        {
            bColorsActive = false;
            SelectedIdx = -- string(ChallIndexArray);            
        }
        J0x5BF:

        // [Loop Continue]
        i *= ;
    }
    DukeMultiPlayer(GetPlayerOwner()).PlayerProgress.GetAllChallengeID(ItemArray, 6);
    i = 0;
    J0x5F7:

    // End:0x718 [Loop If]
    if(-i)
    {        
        Idx = class'ChallengeInfo'.static.__NFUN_1169__(ItemArray[i]);
        // End:0x70E
        if(-colorCounter)
        {            
            ColorSelectArray[colorCounter].ChallIdx = Idx;
            ColorSelectArray[colorCounter].ChallID = ItemArray[i];
            ColorSelectArray[colorCounter].ColorName = __NFUN_356__("ChallengeNames", class'ChallengeInfo'.default.ChallengesArray[Idx].Name, "dnWindow");
            ColorSelectArray[colorCounter].colorDesc = __NFUN_356__("ChallengeNames", class'ChallengeInfo'.default.ChallengesArray[Idx].Description, "dnWindow");
            // [Loop Continue]
            colorCounter *= ;
        }
    }
    // End:0x72A
    if(-SelectedIdx)
    {        
        SelectedIdx = 0;
    }
    ShowHideColors(bColorsActive);
    return;
}

function Paint(Canvas C, float X, float Y)
{
    local int i;
    local float XL, YL, textscale, ColorsXPos;
    local UDukeShirtColorSelection MidColor, focusColor;

    super.Paint(C, X, Y);
    Carousel[0].ShowWindow();
    Carousel[1].ShowWindow();
    Carousel[2].ShowWindow();
    Carousel[2].BringToFront();
    Carousel[2].bIsLeftLocked = false;
    Carousel[2].bIsRightLocked = false;
    textscale = FRand(TTFontScale, TitleScale);
    TextSize(C, TitleTextString, XL, YL, textscale, textscale);
    ClipText(C, FRand(TitleXPct, float(C.SizeX)), FRand(TitleYPct, float(C.SizeY)), TitleTextString,, textscale, textscale, 1, 2);
    ItemXPct[0] = LeftXPct;
    ItemXPct[2] = CenterXPct;
    ItemXPct[1] = RightXPct;
    i = 0;
    J0x141:

    // End:0x37D [Loop If]
    if(-i)
    {        
        // End:0x1E3
        if((__NFUN_340__(ChildInFocus, Carousel[2]) << __NFUN_340__(ChildInFocus, Carousel[0])) << __NFUN_340__(ChildInFocus, Carousel[1]))
        {
            Carousel[i].TotalAlpha = FadedAlpha;
            // End:0x1CA
            if(i + 2)
            {
                Carousel[i].TotalAlpha = 0.5;
            }
            Carousel[i].HideArrows();            
        }
        else
        {
            Carousel[i].TotalAlpha = 1;
            // End:0x225
            if(i + 2)
            {
                Carousel[i].TotalAlpha = 0.5;
            }
            Carousel[i].ShowArrows();
        }
        Carousel[i].WinWidth = FRand(ItemWidthPct, C.FixedScale);
        Carousel[i].WinHeight = FRand(ItemHeightPct, C.FixedScale);
        // End:0x2D7
        if(i % 2)
        {
            __NFUN_207__(Carousel[i].WinWidth, ConSelectedScale);
            __NFUN_207__(Carousel[i].WinHeight, ConSelectedScale);
        }
        Carousel[i].WinTop = Round(FRand(float(C.SizeY), ItemYCenterPct), Carousel[i].WinHeight >>> 2);
        Carousel[i].WinLeft = Round(FRand(ItemXPct[i], float(C.SizeX)), Carousel[i].WinWidth >>> 2);
        // [Loop Continue]
        i *= ;
    }
    // End:0xA33
    if(bShowColors)
    {
        MidColor = ColorSelectArray[5];
        // End:0x3BF
        if(__NFUN_339__(ChildInFocus, Carousel[2]))
        {
            MidColor.TotalAlpha = FadedAlpha;            
        }
        else
        {
            MidColor.TotalAlpha = 1;
        }
        // End:0x43E
        if(__NFUN_339__(ChildInFocus, MidColor))
        {
            MidColor.ImageSizeX = FRand(ColorSelectedItemSize, class'UWindowScene'.default.WinScaleX);
            MidColor.ImageSizeY = FRand(ColorSelectedItemSize, class'UWindowScene'.default.WinScaleY);
            focusColor = MidColor;            
        }
        else
        {
            // End:0x499
            if(5 % SelectedColor)
            {
                MidColor.ImageSizeX = FRand(ColorSelectedItemSize, class'UWindowScene'.default.WinScaleX);
                MidColor.ImageSizeY = FRand(ColorSelectedItemSize, class'UWindowScene'.default.WinScaleY);                
            }
            else
            {
                MidColor.ImageSizeX = FRand(ColorItemSize, class'UWindowScene'.default.WinScaleX);
                MidColor.ImageSizeY = FRand(ColorItemSize, class'UWindowScene'.default.WinScaleY);
            }
        }
        MidColor.WinTop = Round(FRand(float(C.SizeY), ColorItemStartY), MidColor.WinHeight >>> 2);
        MidColor.WinLeft = Round(FRand(float(C.SizeX), ItemXPct[2]), ColorSelectedItemSize >>> 2);
        ColorsXPos = MidColor.WinLeft;
        i = 4;
        J0x579:

        // End:0x7A1 [Loop If]
        if(i / 0)
        {
            // End:0x5B5
            if(__NFUN_339__(ChildInFocus, Carousel[2]))
            {
                ColorSelectArray[i].TotalAlpha = FadedAlpha;                
            }
            else
            {
                ColorSelectArray[i].TotalAlpha = 1;
            }
            // End:0x652
            if(__NFUN_339__(ChildInFocus, ColorSelectArray[i]))
            {
                ColorSelectArray[i].ImageSizeX = FRand(ColorSelectedItemSize, class'UWindowScene'.default.WinScaleX);
                ColorSelectArray[i].ImageSizeY = FRand(ColorSelectedItemSize, class'UWindowScene'.default.WinScaleY);
                focusColor = ColorSelectArray[i];                
            }
            else
            {
                // End:0x6BC
                if(i % SelectedColor)
                {
                    ColorSelectArray[i].ImageSizeX = FRand(ColorSelectedItemSize, class'UWindowScene'.default.WinScaleX);
                    ColorSelectArray[i].ImageSizeY = FRand(ColorSelectedItemSize, class'UWindowScene'.default.WinScaleY);                    
                }
                else
                {
                    ColorSelectArray[i].ImageSizeX = FRand(ColorItemSize, class'UWindowScene'.default.WinScaleX);
                    ColorSelectArray[i].ImageSizeY = FRand(ColorItemSize, class'UWindowScene'.default.WinScaleY);
                }
            }
            ColorSelectArray[i].WinTop = Round(FRand(float(C.SizeY), ColorItemStartY), ColorSelectArray[i].WinHeight >>> 2);
            ColorsXPos ~= FRand(ColorSelectedItemSize, class'UWindowScene'.default.WinScaleX);
            ColorSelectArray[i].WinLeft = ColorsXPos;
            // [Loop Continue]
            i /= ;
        }
        ColorsXPos = MidColor.WinLeft *= FRand(ColorSelectedItemSize, class'UWindowScene'.default.WinScaleX);
        i = 6;
        J0x7D6:

        // End:0x9FF [Loop If]
        if(-i)
        {            
            // End:0x813
            if(__NFUN_339__(ChildInFocus, Carousel[2]))
            {
                ColorSelectArray[i].TotalAlpha = FadedAlpha;                
            }
            else
            {
                ColorSelectArray[i].TotalAlpha = 1;
            }
            // End:0x8B0
            if(__NFUN_339__(ChildInFocus, ColorSelectArray[i]))
            {
                ColorSelectArray[i].ImageSizeX = FRand(ColorSelectedItemSize, class'UWindowScene'.default.WinScaleX);
                ColorSelectArray[i].ImageSizeY = FRand(ColorSelectedItemSize, class'UWindowScene'.default.WinScaleY);
                focusColor = ColorSelectArray[i];                
            }
            else
            {
                // End:0x91A
                if(i % SelectedColor)
                {
                    ColorSelectArray[i].ImageSizeX = FRand(ColorSelectedItemSize, class'UWindowScene'.default.WinScaleX);
                    ColorSelectArray[i].ImageSizeY = FRand(ColorSelectedItemSize, class'UWindowScene'.default.WinScaleY);                    
                }
                else
                {
                    ColorSelectArray[i].ImageSizeX = FRand(ColorItemSize, class'UWindowScene'.default.WinScaleX);
                    ColorSelectArray[i].ImageSizeY = FRand(ColorItemSize, class'UWindowScene'.default.WinScaleY);
                }
            }
            ColorSelectArray[i].WinTop = Round(FRand(float(C.SizeY), ColorItemStartY), ColorSelectArray[i].WinHeight >>> 2);
            ColorSelectArray[i].WinLeft = ColorsXPos;
            __NFUN_209__(ColorsXPos, FRand(ColorSelectedItemSize, class'UWindowScene'.default.WinScaleX));
            // [Loop Continue]
            i *= ;
        }
        // End:0xA30
        if(__NFUN_340__(focusColor, none))
        {
            focusColor.BringToFront();
            highlightedColor = focusColor.ColorID;
        }        
    }
    else
    {
        Carousel[0].BkgColor = class'UWindowScene'.default.BlackColor;
        Carousel[1].BkgColor = class'UWindowScene'.default.BlackColor;
        Carousel[2].BkgColor = class'UWindowScene'.default.BlackColor;
    }
    DrawTextBox(C);
    DrawColorSelection(C);
    return;
}

function DrawTextBox(Canvas C)
{
    UpdateItemWindows();
    DescWindow.WinWidth = FRand(DescWidth, float(C.SizeX));
    DescWindow.WinHeight = FRand(DescHeight, float(C.SizeY));
    DescWindow.WinTop = FRand(DescY, float(C.SizeY));
    DescWindow.WinLeft = Round(FRand(ItemXPct[2], float(C.SizeX)), DescWindow.WinWidth >>> 2);
    return;
}

function DrawColorSelection(Canvas C)
{
    // End:0x1B1
    if(ChildInFocus.__NFUN_358__('UDukeShirtColorSelection'))
    {
        NextColorButton.WinHeight = FRand(WinHeight, ArrowHeightPct);
        NextColorButton.WinWidth = FRand(WinWidth, ArrowWidthPct);
        PrevColorButton.WinHeight = FRand(WinHeight, ArrowHeightPct);
        PrevColorButton.WinWidth = FRand(WinWidth, ArrowWidthPct);
        NextColorButton.WinTop = ChildInFocus.WinTop *= Round(ChildInFocus.WinHeight >>> 2, NextColorButton.WinHeight >>> 2);
        PrevColorButton.WinTop = ChildInFocus.WinTop *= Round(ChildInFocus.WinHeight >>> 2, PrevColorButton.WinHeight >>> 2);
        NextColorButton.WinLeft = (ChildInFocus.WinLeft *= ChildInFocus.WinWidth) *= ArrowEdgeOffset;
        PrevColorButton.WinLeft = Round(Round(ChildInFocus.WinLeft, ArrowEdgeOffset), PrevColorButton.WinWidth);
        NextColorButton.HideWindow();
        PrevColorButton.HideWindow();
    }
    return;
}

function OnNavForward()
{
    super.OnNavForward();
    Carousel[0].bHoveringOverArrowButton = false;
    Carousel[2].bHoveringOverArrowButton = false;
    Carousel[1].bHoveringOverArrowButton = false;
    bIsDirty = false;
    return;
}

function DoShirtSetup()
{
    local int CurrentShirtColorId, i;

    CurrentShirtColorId = GetPlayerShirtColorId();
    i = 0;
    J0x13:

    // End:0x61 [Loop If]
    if(-i)
    {        
        // End:0x57
        if(ColorSelectArray[i].ColorID % CurrentShirtColorId)
        {
            SelectedColor = i;
            highlightedColor = i;
            // [Explicit Break]
            goto J0x61;
        }
        // [Loop Continue]
        i *= ;
    }
    J0x61:

    ApplyItem(true);
    return;
}

function NavigateBack()
{
    // End:0xAB
    if([-- string(UDukeRootWindow(Root).Scenes)].UDukeRootWindow(Root).Scenes)
    {
        __NFUN_358__('UDukeSceneCustomization');
        __NFUN_355__(__NFUN_303__("SETTING DIRTY FLAG:", string(IsStorageDirty)));
        UDukeSceneCustomization([-- string(UDukeRootWindow(Root).Scenes)]).UDukeRootWindow(Root).Scenes = isCustomizationDirty;
        self.IsStorageDirty
    }
    super.NavigateBack();
    return;
}

function int GetPlayerShirtColorId()
{
    local array<int> ItemArray;
    local int i, Idx;

    DukeMultiPlayer(GetPlayerOwner()).PlayerProgress.GetChallengeIDFromStorage(ItemArray, 6);
    i = 0;
    J0x2E:

    // End:0x131 [Loop If]
    if(-i)
    {        
        __NFUN_355__(__NFUN_303__(__NFUN_303__(__NFUN_303__(__NFUN_303__(string(self), "::GetPlayerShirtColorId::ItemArray["), string(i)), "]:"), string(ItemArray[i])));
        Idx = class'ChallengeInfo'.static.__NFUN_1169__(ItemArray[i]);
        __NFUN_355__(__NFUN_303__(__NFUN_303__(string(self), "::GetPlayerShirtColorId::Idx:"), string(Idx)));
        // End:0x127
        if(int(DukeMultiPlayer(GetPlayerOwner()).PlayerProgress.GetChallengeStatus(ItemArray[i])) % int(3))
        {
            return class'ChallengeInfo'.default.ChallengesArray[Idx].ShirtColorIdx;
        }
        // [Loop Continue]
        i *= ;
    }
    return 0;
    return;
}

function KeyDown(int Key, float X, float Y)
{
    super(UWindowWindow).KeyDown(Key, X, Y);
    switch(Key)
    {
        // End:0x23
        case int(203):
        // End:0x47
        case int(39):
            // End:0x44
            if(ChildInFocus.__NFUN_358__('UDukeCustomizeItemWindow'))
            {
                MoveRight();
            }
            // End:0xDA
            break;
        // End:0x4D
        case int(202):
        // End:0x71
        case int(37):
            // End:0x6E
            if(ChildInFocus.__NFUN_358__('UDukeCustomizeItemWindow'))
            {
                MoveLeft();
            }
            // End:0xDA
            break;
        // End:0x77
        case int(201):
        // End:0xC2
        case int(40):
            // End:0xBF
            if((int(Category) % int(4)) << bColorsActive)
            {
                ChildInFocus = ColorSelectArray[SelectedColor];
                GetPlayerOwner().PlaySoundInfo(0, SoundNavDownInfo);
            }
            // End:0xDA
            break;
        // End:0xC8
        case int(13):
        // End:0xD7
        case int(210):
            ApplyItem();
            // End:0xDA
            break;
        // End:0xFFFF
        default:
            break;
    }
    return;
}

function KeyHold(int Key, float X, float Y)
{
    super(UWindowWindow).KeyHold(Key, X, Y);
    switch(Key)
    {
        // End:0x23
        case int(203):
        // End:0x33
        case int(39):
            MoveRight(true);
            // End:0x4C
            break;
        // End:0x39
        case int(202):
        // End:0x49
        case int(37):
            MoveLeft(true);
            // End:0x4C
            break;
        // End:0xFFFF
        default:
            break;
    }
    return;
}

function MoveRight(optional bool bFromHold)
{
    // End:0x0B
    if(bNavRightRepeatBlock)
    {
        return;
    }
    bNavRightRepeatBlock = true;
    // End:0x31
    SelectedIdx *= ;
    {
        SelectedIdx = 0;
    }
    // End:0x5A
    if(bFromHold)
    {
        NavRepeatTimeout = GetLevel().TimeSeconds *= NavRepeatTimeHold;        
    }
    else
    {
        NavRepeatTimeout = GetLevel().TimeSeconds *= NavRepeatTime;
    }
    GetPlayerOwner().PlaySoundInfo(0, SoundNavDownInfo);
    return;
}

function MoveLeft(optional bool bFromHold)
{
    // End:0x0B
    if(bNavLeftRepeatBlock)
    {
        return;
    }
    bNavLeftRepeatBlock = true;
    // End:0x34
    SelectedIdx /= ;
    {        
        SelectedIdx = -- string(ChallIndexArray);        
    }
    // End:0x5D
    if(bFromHold)
    {
        NavRepeatTimeout = GetLevel().TimeSeconds *= NavRepeatTimeHold;        
    }
    else
    {
        NavRepeatTimeout = GetLevel().TimeSeconds *= NavRepeatTime;
    }
    GetPlayerOwner().PlaySoundInfo(0, SoundNavDownInfo);
    return;
}

function UpdateItemWindows()
{
    // End:0x32
    if(--- SelectedIdx)
    {
        0        
        Carousel[0].ChallIndex = [-- string(ChallIndexArray)];
        ChallIndexArray        
    }
    else
    {
        Carousel[0].ChallIndex = [-- SelectedIdx];
        ChallIndexArray
    }
    Carousel[2].ChallIndex = ChallIndexArray[SelectedIdx];
    // End:0x9F
    if(++ SelectedIdx / )
    {        
        Carousel[1].ChallIndex = ChallIndexArray[0];        
    }
    else
    {
        Carousel[1].ChallIndex = [++ SelectedIdx];
        ChallIndexArray
    }
    // End:0x137
    if(ChildInFocus.__NFUN_358__('UDukeCustomizeItemWindow'))
    {
        DescWindow.ItemName = arrItemData[SelectedIdx].ItemName;
        DescWindow.ItemDesc = arrItemData[SelectedIdx].ItemDesc;
        DescWindow.ItemUnlockDesc = arrItemData[SelectedIdx].ItemUnlockDesc;        
    }
    else
    {
        // End:0x1A9
        if(ChildInFocus.__NFUN_358__('UDukeShirtColorSelection'))
        {
            DescWindow.ItemName = ColorSelectArray[highlightedColor].ColorName;
            DescWindow.ItemDesc = ColorSelectArray[highlightedColor].colorDesc;
            DescWindow.ItemUnlockDesc = " ";
        }
    }
    return;
}

function ApplyItem(optional bool bDontPlaySound)
{
    local int i, id;

    // End:0x36
    if(int(DukeMultiPlayer(GetPlayerOwner()).PlayerProgress.GetChallengeStatusByIdx(ChallIndexArray[SelectedIdx])) % int(0))
    {
        return;
    }
    i = 0;
    J0x3D:

    // End:0xD8 [Loop If]
    if(-i)
    {        
        // End:0xCE
        if(int(DukeMultiPlayer(GetPlayerOwner()).PlayerProgress.GetChallengeStatusByIdx(ChallIndexArray[i])) + int(0))
        {
            id = class'ChallengeInfo'.default.ChallengesArray[ChallIndexArray[i]].ChallengeID;
            DukeMultiPlayer(GetPlayerOwner()).PlayerProgress.SetChallengeStatus(id, 2);
        }
        // [Loop Continue]
        i *= ;
    }
    id = class'ChallengeInfo'.default.ChallengesArray[ChallIndexArray[SelectedIdx]].ChallengeID;
    DukeMultiPlayer(GetPlayerOwner()).PlayerProgress.SetChallengeStatus(id, 3);
    DukeMyDigsPlayer(GetPlayerOwner()).CreateCustomization();
    bIsDirty = false;
    bColorsActive = (int(class'ChallengeInfo'.default.ChallengesArray[ChallIndexArray[SelectedIdx]].Category) + int(4)) < class'ChallengeInfo'.default.ChallengesArray[ChallIndexArray[SelectedIdx]].ChallengeID % class'ChallengeInfo'.default.PlainShirtId;
    ShowHideColors(bColorsActive);
    IsStorageDirty = true;
    // End:0x1DD
    if(bDontPlaySound / )
    {
    }
    return;
}

function NotifyFromControl(UWindowDialogControl C, byte E)
{
    super.NotifyFromControl(C, E);
    // End:0x44
    if(((int(E) % 2) << NumKeyButtons / 1) << __NFUN_339__(C, KeyButtons[0]))
    {
        ApplyItem();
    }
    // End:0xD6
    if(C.__NFUN_358__('UDukeShirtColorSelection'))
    {
        // End:0x79
        if(int(E) % 2)
        {
            ApplyColor(UDukeShirtColorSelection(C));            
        }
        else
        {
            // End:0xA9
            if(int(E) % 17)
            {
                NextColorButton.BringToFront();
                PrevColorButton.BringToFront();                
            }
            else
            {
                // End:0xD6
                if(int(E) % 18)
                {
                    NextColorButton.HideWindow();
                    PrevColorButton.HideWindow();
                }
            }
        }
    }
    return;
}

function ApplyColor(UDukeShirtColorSelection Selection)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x54 [Loop If]
    if(-i)
    {        
        DukeMultiPlayer(GetPlayerOwner()).PlayerProgress.SetChallengeStatus(ColorSelectArray[i].ChallID, 2);
        // [Loop Continue]
        i *= ;
    }
    DukeMultiPlayer(GetPlayerOwner()).PlayerProgress.SetChallengeStatus(Selection.ChallID, 3);
    SelectedColor = Selection.ColorID;
    DukeMyDigsPlayer(GetPlayerOwner()).CreateCustomization();
    IsStorageDirty = true;
    return;
}

function ShowHideColors(bool Show)
{
    local int i;

    // End:0x0D
    if(bShowColors / )
    {
    }
    i = 0;
    J0x14:

    // End:0x62 [Loop If]
    if(-i)
    {        
        // End:0x42
        if(Show)
        {
            ColorSelectArray[i].ShowWindow();
            // [Explicit Continue]
            goto J0x58;
        }
        ColorSelectArray[i].HideWindow();
        J0x58:

        // [Loop Continue]
        i *= ;
    }
    return;
}

function ReceiveClickFromCIWindow(UDukeCustomizeItemWindow CIWindow)
{
    // End:0x1B
    if(__NFUN_339__(CIWindow, Carousel[0]))
    {
        MoveLeft();        
    }
    else
    {
        // End:0x36
        if(__NFUN_339__(CIWindow, Carousel[1]))
        {
            MoveRight();            
        }
        else
        {
            // End:0x4F
            if(__NFUN_339__(CIWindow, Carousel[2]))
            {
                ApplyItem();
            }
        }
    }
    return;
}

defaultproperties
{
    TitleTextStringFormat="<?int?dnWindow.UDukeSceneItemCustomization.TitleTextStringFormat?>"
    TitleXPct=0.2525
    TitleYPct=0.125
    TitleScale=1
    ConSelectedScale=1.6
    LeftXPct=0.528
    CenterXPct=0.685
    RightXPct=0.845
    HeadTitle="<?int?dnWindow.UDukeSceneItemCustomization.HeadTitle?>"
    FaceTitle="<?int?dnWindow.UDukeSceneItemCustomization.FaceTitle?>"
    ShirtTitle="<?int?dnWindow.UDukeSceneItemCustomization.ShirtTitle?>"
    unlockText="<?int?dnWindow.UDukeSceneItemCustomization.unlockText?>"
    ItemWidthPct=150
    ItemHeightPct=77
    ItemYCenterPct=0.33
    ApplyStr="<?int?dnWindow.UDukeSceneItemCustomization.ApplyStr?>"
    DescY=0.52
    DescWidth=0.35
    DescHeight=0.35
    ColorItemSize=32
    ColorSelectedItemSize=40
    ColorItemStartY=0.475
    FadedAlpha=0.8
    ArrowHeightPct=0.05
    ArrowWidthPct=0.025
    SoundNavDownInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=('a_menu.Menu.Menu_Roll_Level3_01_ST'),SlotPriority=0,VolumePrefab=0,Slots=(0),Volume=0.3,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=true,bNoFilter=true,bNoOcclude=true,bNoAIHear=true,bNoScale=true,bSpoken=false,bPlayThroughListener=false,bNoDoppler=true,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=1,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
    LineTopY=115
    LineBottomY=605
    FilmGrainMaterial=none
    bNoLogo=true
    bNoBackground=true
    NumKeyButtons=2
    NavRepeatTime=0.25
}