/*******************************************************************************
 * UDukeBuddyList generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeBuddyList extends UWindowListBoxItem;

var string PlayerName;

function int Compare(UWindowList t, UWindowList B)
{

    /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
        
    */
    /*@Error*/;
}

function UDukeBuddyList FindName(string FindPlayerName)
{
    local UDukeBuddyList i;

    i = UDukeBuddyList(Next);
    J0x10:

    // End:0x59 [Loop If]
    if(__NFUN_340__(i, none))
    {
        // End:0x3C
        if(__NFUN_310__(i.PlayerName, FindPlayerName))
        {
            return i;
        }
        i = UDukeBuddyList(i.Next);
        // [Loop Continue]
        goto J0x10;
    }
    return none;
    return;
}

function DeleteName(UDukeBuddyList l)
{
    l.Remove();
    return;
}
