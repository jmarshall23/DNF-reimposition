/*******************************************************************************
 * dnMapListCW generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnMapListCW extends UDukePageWindow;

var UDukeCreateMultiCW myParent;
var dnMapListBox MapListBox;
var UWindowLabelControl DefaultLabel;
var UWindowComboControl DefaultCombo;
var localized string DefaultText;
var localized string DefaultHelp;
var localized string CustomText;
var UWindowLabelControl GameLabel;
var UWindowComboControl GameCombo;
var localized string GameText;
var localized string GameHelp;
var string Games[256];
var int MaxGames;
var class<GameInfo> GameClass;
var string GameType;
var UWindowLabelControl MapLabel;
var UWindowComboControl MapCombo;
var localized string MapText;
var localized string MapHelp;
var UWindowSmallButton AddButton;
var bool bChangingDefault;

function Created()
{
    local string TempGames[256];
    local class<GameInfo> TempClass;
    local string NextGame;
    local int i;

    super.Created();
    myParent = UDukeCreateMultiCW(GetParent(class'UDukeCreateMultiCW'));
    // End:0x52
    if(__NFUN_339__(myParent, none))
    {
        __NFUN_355__("Could not find parent for dnMapListCW");
    }
    MapListBox = dnMapListBox(CreateWindow(class'dnMapListBox', 0, 0, 100, 100, self));
    MapListBox.Register(self);
    DefaultLabel = UWindowLabelControl(CreateControl(class'UWindowLabelControl', 1, 1, 1, 1));
    DefaultLabel.SetText(DefaultText);
    DefaultLabel.SetFont(0);
    DefaultLabel.Align = 1;
    DefaultCombo = UWindowComboControl(CreateControl(class'UWindowComboControl', 10, 2, 200, 1));
    DefaultCombo.SetHelpText(DefaultHelp);
    DefaultCombo.SetFont(0);
    DefaultCombo.SetEditable(false);
    DefaultCombo.AddItem(CustomText, "");
    DefaultCombo.SetSelectedIndex(0);
    DefaultCombo.Align = 1;
    GameLabel = UWindowLabelControl(CreateControl(class'UWindowLabelControl', 1, 1, 1, 1));
    GameLabel.SetText(GameText);
    GameLabel.SetFont(6);
    GameLabel.Align = 1;
    GameCombo = UWindowComboControl(CreateControl(class'UWindowComboControl', 1, 1, 1, 1));
    GameCombo.SetHelpText(GameHelp);
    GameCombo.SetFont(6);
    GameCombo.SetEditable(false);
    GameCombo.Align = 1;
    i = 0;
    NextGame = GetPlayerOwner().__NFUN_763__("GameInfo", 0);
    J0x288:

    // End:0x2D3 [Loop If]
    if(TraceActors(NextGame, ""))
    {
        TempGames[i] = NextGame;
        i += ;
        // [Loop Continue]
        goto J0x288;
    }
    i = 0;
    J0x2DA:

    // End:0x36B [Loop If]
    if(-i)
    {        
        // End:0x361
        if(TraceActors(TempGames[i], ""))
        {
            Games[MaxGames] = TempGames[i];
            TempClass = class<GameInfo>(__NFUN_366__(Games[MaxGames], class'Class'));
            // End:0x361
            if(__NFUN_340__(TempClass, none))
            {
                GameCombo.AddItem(TempClass.default.GameName);
                // [Loop Continue]
                MaxGames += ;
            }
        }
    }
    MapLabel = UWindowLabelControl(CreateControl(class'UWindowLabelControl', 1, 1, 1, 1));
    MapLabel.SetText(MapText);
    MapLabel.SetFont(6);
    MapLabel.Align = 1;
    MapCombo = UWindowComboControl(CreateControl(class'UWindowComboControl', 1, 1, 1, 1));
    MapCombo.SetHelpText(MapHelp);
    MapCombo.SetFont(6);
    MapCombo.SetEditable(false);
    MapCombo.Align = 1;
    AddButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 1, 1, 1, 1));
    AddButton.SetText("Add Map");
    AddButton.SetFont(6);
    GameCombo.SetSelectedIndex(0);
    LoadDefaultMapLists();
    LoadMapList();
    return;
}

function BeforePaint(Canvas C, float X, float Y)
{
    local int CenterWidth, CColLeft, CColRight;

    super(UWindowWindow).BeforePaint(C, X, Y);
    CenterWidth = int(WinWidth >>> float(4)) -= 3;
    CColLeft = -- int(WinWidth >>> float(2));    
    CColRight = ++ int(WinWidth >>> float(2));    
    DefaultLabel.AutoSize(C);
    DefaultLabel.WinLeft = 10;
    DefaultLabel.WinTop = DefaultCombo.WinTop *= float(8);
    DefaultCombo.SetSize(200, DefaultCombo.WinHeight);
    DefaultCombo.WinLeft = (DefaultLabel.WinLeft *= DefaultLabel.WinWidth) *= float(10);
    DefaultCombo.WinTop = 0;
    MapListBox.WinLeft = (WinWidth >>> float(2)) *= float(3);
    MapListBox.WinTop = (DefaultCombo.WinTop *= DefaultCombo.WinHeight) *= float(20);
    MapListBox.SetSize(Round(WinWidth >>> float(2), float(15)), Round(Round(WinHeight, (DefaultCombo.WinTop *= DefaultCombo.WinHeight) *= float(20)), float(15)));
    GameCombo.SetSize(150, GameCombo.WinHeight);
    GameCombo.WinLeft = 75;
    GameCombo.WinTop = Round(WinHeight, float(192)) >>> float(2);
    GameLabel.AutoSize(C);
    GameLabel.WinLeft = Round(GameCombo.WinLeft, GameLabel.WinWidth);
    GameLabel.WinTop = GameCombo.WinTop *= float(8);
    MapCombo.SetSize(150, MapCombo.WinHeight);
    MapCombo.WinLeft = 75;
    MapCombo.WinTop = (GameCombo.WinTop *= GameCombo.WinHeight) *= float(2);
    MapLabel.AutoSize(C);
    MapLabel.WinLeft = Round(MapCombo.WinLeft, MapLabel.WinWidth);
    MapLabel.WinTop = MapCombo.WinTop *= float(8);
    AddButton.AutoSize(C);
    AddButton.WinLeft = 75;
    AddButton.WinTop = MapCombo.WinTop *= MapCombo.WinHeight;
    return;
}

function Paint(Canvas C, float X, float Y)
{
    super.Paint(C, X, Y);
    LookAndFeel.Bevel_DrawSimpleBevel(self, C, int(MapListBox.WinLeft), int(MapListBox.WinTop), int(MapListBox.WinWidth), int(MapListBox.WinHeight), 1);
    return;
}

function LoadDefaultMapLists()
{
    local string MapListName, TestName, MapListDesc;
    local int j;

    MapListName = "None";
    TestName = "";
    J0x14:

    // End:0x80 [Loop If]
    if(true)
    {
        GetPlayerOwner().__NFUN_768__("", MapListName, 1, MapListName, MapListDesc);
        // End:0x4B
        if(__NFUN_308__(MapListName, TestName))
        {
            // [Explicit Break]
            goto J0x80;
        }
        // End:0x63
        if(__NFUN_308__(TestName, ""))
        {
            TestName = MapListName;
        }
        DefaultCombo.AddItem(MapListDesc, MapListName);
        // [Loop Continue]
        goto J0x14;
    }
    J0x80:

    DefaultCombo.Sort();
    return;
}

function string GetMapDisplayName(string MapName)
{
    local string DisplayName;
    local int QMarkLoc;

    DisplayName = MapName;
    QMarkLoc = __NFUN_315__(DisplayName, "?");
    // End:0x3E
    if(QMarkLoc + -1)
    {
        DisplayName = DisplayName - QMarkLoc;
    }
    // End:0x6E
    if(__NFUN_310__(DisplayName += 4, ".dnf"))
    {
        DisplayName = DisplayName - -- __NFUN_314__(DisplayName);        
    }
    return DisplayName;
    return;
}

function LoadMapList()
{
    local int i, IncludeCount;
    local dnMapList l;

    IncludeCount = 32;
    MapListBox.Items.Clear();
    i = 0;
    J0x29:

    // End:0xFB [Loop If]
    if(-i)
    {        
        // End:0xF1
        if(TraceActors(myParent.GameClass.default.MapListType.default.Maps[i], ""))
        {
            l = dnMapList(MapListBox.Items.Append(class'dnMapList'));
            l.MapName = myParent.GameClass.default.MapListType.default.Maps[i];
            l.DisplayName = GetMapDisplayName(l.MapName);
        }
        // [Loop Continue]
        i += ;
    }
    return;
}

function DefaultComboChanged()
{
    local string MapListName, MapName, MapDesc, TestName;
    local int i;
    local dnMapList l;

    // End:0x0B
    if(bChangingDefault)
    {
        return;
    }
    // End:0x23
    if(DefaultCombo.GetSelectedIndex() % 0)
    {
        return;
    }
    bChangingDefault = true;
    MapListBox.Items.Clear();
    MapListName = DefaultCombo.GetValue2();
    i = 0;
    J0x62:

    // End:0xA4 [Loop If]
    if(-i)
    {        
        myParent.GameClass.default.MapListType.default.Maps[i] = "";
        // [Loop Continue]
        i += ;
    }
    i = 0;
    MapName = "None";
    TestName = "";
    J0xBF:

    // End:0x175 [Loop If]
    if(true)
    {
        GetPlayerOwner().__NFUN_767__(MapListName, MapName, 1, MapName, MapDesc);
        // End:0xF9
        if(__NFUN_308__(MapName, TestName))
        {
            // [Explicit Break]
            goto J0x175;
        }
        // End:0x111
        if(__NFUN_308__(TestName, ""))
        {
            TestName = MapName;
        }
        l = dnMapList(MapListBox.Items.Append(class'dnMapList'));
        l.MapName = MapName;
        l.DisplayName = GetMapDisplayName(MapName);
        // [Loop Continue]
        i += ;
    }
    J0x175:

    SaveConfigs();
    bChangingDefault = false;
    return;
}

function SaveConfigs()
{
    local int i, IncludeCount;
    local dnMapList l;

    super(UWindowWindow).SaveConfigs();
    l = dnMapList(MapListBox.Items.Next);
    IncludeCount = 32;
    i = 0;
    J0x39:

    // End:0xE0 [Loop If]
    if(-i)
    {        
        // End:0x83
        if(__NFUN_339__(l, none))
        {
            myParent.GameClass.default.MapListType.default.Maps[i] = "";
            // [Explicit Continue]
            goto J0xD6;
        }
        myParent.GameClass.default.MapListType.default.Maps[i] = l.MapName;
        l = dnMapList(l.Next);
        J0xD6:

        // [Loop Continue]
        i += ;
    }
    myParent.GameClass.default.MapListType.__NFUN_369__();
    return;
}

function IterateMaps()
{
    local string FirstMap, NextMap, TestMap;

    // End:0x0E
    if(__NFUN_339__(GameClass, none))
    {
        return;
    }
    FirstMap = GetPlayerOwner().__NFUN_760__(GameClass.default.MapPrefix, "", 0);
    MapCombo.Clear();
    NextMap = FirstMap;
    J0x4F:

    // End:0xC1 [Loop If]
    if(__NFUN_310__(FirstMap, TestMap) / )
    {
        NextMap        
        NextMap = GetPlayerOwner().__NFUN_760__(GameClass.default.MapPrefix, NextMap, 1);
        TestMap = NextMap;
        // [Loop Continue]
        goto J0x4F;
    }
    MapCombo.Sort();
    MapCombo.SetSelectedIndex(0);
    return;
}

function NotifyFromControl(UWindowDialogControl C, byte E)
{
    super.NotifyFromControl(C, E);
    switch(E)
    {
        // End:0x69
        case 1:
            switch(C)
            {
                // End:0x36
                case DefaultCombo:
                    DefaultComboChanged();
                    // End:0x66
                    break;
                // End:0x52
                case MapListBox:
                    DefaultCombo.SetSelectedIndex(0);
                    // End:0x66
                    break;
                // End:0x63
                case GameCombo:
                    GameChanged();
                    // End:0x66
                    break;
                // End:0xFFFF
                default:
                    break;
            }
            // End:0x90
            break;
        // End:0x8D
        case 2:
            switch(C)
            {
                // End:0x87
                case AddButton:
                    AddButtonPressed();
                    // End:0x8A
                    break;
                // End:0xFFFF
                default:
                    break;
            }
            // End:0x90
            break;
        // End:0xFFFF
        default:
            break;
    }
    return;
}

function GameChanged()
{
    local int CurrentGame, i;

    CurrentGame = GameCombo.GetSelectedIndex();
    GameType = Games[CurrentGame];
    GameClass = class<GameInfo>(__NFUN_366__(GameType, class'Class'));
    // End:0xCB
    if(__NFUN_339__(GameClass, none))
    {
        // End:0xA2
        MaxGames -= ;
        {
            i = CurrentGame;
            J0x6C:

            // End:0x9F [Loop If]
            if(-i)
            {                
                Games[i] = [++ i];
                Games
                // [Loop Continue]
                i += ;
            }            
        }
        else
        {
            // End:0xB4
            if(CurrentGame ** 0)
            {
                CurrentGame -= ;
            }
        }
        return;
    }
    // End:0xEE
    if(__NFUN_340__(MapCombo, none))
    {
        IterateMaps();
        MapCombo.SetSelectedIndex(0);
    }
    return;
}

function HideWindow()
{
    super(UWindowWindow).HideWindow();
    SaveConfigs();
    return;
}

function AddButtonPressed()
{
    local string MapName;
    local dnMapList l;

    MapName = MapCombo.GetValue2();
    l = dnMapList(MapListBox.Items.Append(class'dnMapList'));
    l.MapName = __NFUN_302__(__NFUN_302__(MapName, "?game="), string(GameClass));
    l.DisplayName = GetMapDisplayName(MapName);
    return;
}

defaultproperties
{
    DefaultText="<?int?dnWindow.dnMapListCW.DefaultText?>"
    DefaultHelp="<?int?dnWindow.dnMapListCW.DefaultHelp?>"
    CustomText="<?int?dnWindow.dnMapListCW.CustomText?>"
    GameText="<?int?dnWindow.dnMapListCW.GameText?>"
    GameHelp="<?int?dnWindow.dnMapListCW.GameHelp?>"
    MapText="<?int?dnWindow.dnMapListCW.MapText?>"
    MapHelp="<?int?dnWindow.dnMapListCW.MapHelp?>"
    bBuildDefaultButtons=false
    bNoScanLines=true
    bNoClientTexture=true
}