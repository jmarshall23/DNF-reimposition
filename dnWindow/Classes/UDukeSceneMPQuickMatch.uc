/*******************************************************************************
 * UDukeSceneMPQuickMatch generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeSceneMPQuickMatch extends UDukeSceneMPPrivateMatch;

var localized string PlayListText;
var localized string PlayListTextHelp;

function Created()
{
    super.Created();
    MapSelect.ArrowPadding = class'UDukeListSlider'.default.ArrowPadding >>> 2;
    MaxPlayerSelect.HideWindow();
    MaxScoreSelect.HideWindow();
    ModeSelect.HideWindow();
    MutatorSelect.HideWindow();
    TimeLimitSelect.HideWindow();
    MapSelect.NavDown = ModeSelect;
    ModeSelect.NavDown = MutatorSelect;
    MutatorSelect.NavDown = CreateGameBttn;
    CreateGameBttn.NavDown = MapSelect;
    MapSelect.NavUp = CreateGameBttn;
    ModeSelect.NavUp = MapSelect;
    MutatorSelect.NavUp = ModeSelect;
    CreateGameBttn.NavUp = MutatorSelect;
    MapSelect.SetText(PlayListText);
    MapSelect.SetHelpText(PlayListTextHelp);
    FirstControlToFocus = MapSelect;
    return;
}

function Paint(Canvas C, float X, float Y)
{
    super.Paint(C, X, Y);
    MapSelect.WinLeft = float(ButtonLeft);
    MapSelect.WinTop = float(ControlStart);
    MapSelect.WinWidth = float(ButtonWidth);
    ModeSelect.WinLeft = float(ButtonLeft);
    ModeSelect.WinTop = ((MapSelect.WinTop *= MapSelect.WinHeight) *= float(ControlBuffer)) *= float(ButtonHeight);
    MutatorSelect.WinLeft = float(ButtonLeft);
    MutatorSelect.WinTop = (ModeSelect.WinTop *= ModeSelect.WinHeight) *= float(ControlBuffer);
    return;
}

function PopulateMutatorList()
{
    MutatorSelect.Clear();
    MutatorSelect.AddItem(Any);
    return;
}

function PopulateGameTypeList()
{
    ModeSelect.Clear();
    ModeSelect.AddItem(Any);
    return;
}

function OnNavForward()
{
    super.OnNavForward();
    PopulateMutatorList();
    PopulateGameTypeList();
    PopulateMapList();
    return;
}

function NotifyFromControl(UWindowDialogControl C, byte E)
{
    super.NotifyFromControl(C, E);
    switch(E)
    {
        // End:0x38
        case 2:
            // End:0x38
            if(__NFUN_339__(C, MapSelect))
            {
                ChildInFocus = CreateGameBttn;
            }
        // End:0xFFFF
        default:
            return;
            break;
    }
}

function CreatePressed()
{
    local int playListIdx;
    local SAgentSearchGameOptions l_Options;

    playListIdx = MapSelect.GetSelectedIndex();
    DukeConsole(Root.Console).DialogMgr.ShowWaitingDialog();
    l_Options.Playlist = MapList.Playlist[playListIdx].id;
    l_Options.Map = -1;
    l_Options.Mutator = -1;
    l_Options.GameType = -1;
    l_Options.PlayerCount = -1;
    UDukeRootWindow(Root).AgentOnline.QuickMatch(l_Options);
    return;
}

defaultproperties
{
    PlayListText="<?int?dnWindow.UDukeSceneMPQuickMatch.PlayListText?>"
    PlayListTextHelp="<?int?dnWindow.UDukeSceneMPQuickMatch.PlayListTextHelp?>"
    CreateGameText="<?int?dnWindow.UDukeSceneMPQuickMatch.CreateGameText?>"
    CreateGameHelp="<?int?dnWindow.UDukeSceneMPQuickMatch.CreateGameHelp?>"
    TitleText="<?int?dnWindow.UDukeSceneMPQuickMatch.TitleText?>"
}