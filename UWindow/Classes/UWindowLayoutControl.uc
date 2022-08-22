/*******************************************************************************
 * UWindowLayoutControl generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UWindowLayoutControl extends UWindowLayoutBase;

var UWindowDialogClientWindow OwnerWindow;
var float WinTop;
var float WinLeft;
var float WinWidth;
var float WinHeight;
var float MinimumWidth;
var float MinimumHeight;
var UWindowLayoutRow RowList;

static function UWindowLayoutControl Create()
{
    local UWindowLayoutControl C;

    C = new class'UWindowLayoutControl';
    C.RowList = new class'UWindowLayoutRow';
    C.RowList.SetupSentinel();
    return C;
    return;
}

function PerformLayout()
{
    local UWindowLayoutRow R;
    local float TotalWidth, TotalHeight;

    R = UWindowLayoutRow(RowList.Next);
    J0x1A:

    // End:0x5A [Loop If]
    if(__NFUN_340__(R, none))
    {
        __NFUN_209__(TotalHeight, R.CalcMinHeight());
        R = UWindowLayoutRow(R.Next);
        // [Loop Continue]
        goto J0x1A;
    }
    __NFUN_209__(TotalWidth, R.CalcMinHeight());
    return;
}

function UWindowLayoutRow AddRow()
{
    return UWindowLayoutRow(RowList.Append(class'UWindowLayoutRow'));
    return;
}

function UWindowLayoutCell AddCell(optional int ColSpan, optional int RowSpan)
{
    return RowList.AddCell(ColSpan, RowSpan);
    return;
}
