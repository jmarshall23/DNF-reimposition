/*******************************************************************************
 * UWindowHotkeyWindowList generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UWindowHotkeyWindowList extends UWindowList;

var UWindowWindow Window;

function UWindowHotkeyWindowList FindWindow(UWindowWindow W)
{
    local UWindowHotkeyWindowList l;

    l = UWindowHotkeyWindowList(Next);
    J0x10:

    // End:0x59 [Loop If]
    if(__NFUN_340__(l, none))
    {
        // End:0x3C
        if(__NFUN_339__(l.Window, W))
        {
            return l;
        }
        l = UWindowHotkeyWindowList(l.Next);
        // [Loop Continue]
        goto J0x10;
    }
    return none;
    return;
}
