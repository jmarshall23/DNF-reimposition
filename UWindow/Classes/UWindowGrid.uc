/*******************************************************************************
 * UWindowGrid generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UWindowGrid extends UWindowWindow
    dependson(UWindowGridClient)
    dependson(UWindowGridColumn)
    dependson(UWindowHScrollbar);

var UWindowGridColumn FirstColumn;
var UWindowGridColumn LastColumn;
var UWindowGridClient ClientArea;
var int TopRow;
var float RowHeight;
var UWindowVScrollbar VertSB;
var UWindowHScrollbar HorizSB;
var bool bShowHorizSB;
var bool bSizingColumn;
var bool bNoKeyboard;
var float FillAlpha;
var bool bBrowserGrid;

function Created()
{
    ClientArea = UWindowGridClient(CreateWindow(class'UWindowGridClient', 0, 0, Round(WinWidth, float(LookAndFeel.SBPosIndicator.W)), WinHeight));
    VertSB = UWindowVScrollbar(CreateWindow(class'UWindowVScrollbar', 1, 1, 1, 1));
    VertSB.bAlwaysOnTop = true;
    VertSB.bInBevel = true;
    VertSB.HideWindow();
    HorizSB = UWindowHScrollbar(CreateWindow(class'UWindowHScrollbar', 0, Round(WinHeight, float(LookAndFeel.SBPosIndicator.W)), WinWidth, float(LookAndFeel.SBPosIndicator.h)));
    HorizSB.bAlwaysOnTop = true;
    HorizSB.HideWindow();
    bShowHorizSB = false;
    // End:0x12B
    if(bNoKeyboard / )
    {
    }
    super.Created();
    return;
}

function BeforePaint(Canvas C, float X, float Y)
{
    super.BeforePaint(C, X, Y);
    Resized();
    return;
}

function Resized()
{
    LookAndFeel.Grid_SizeGrid(self);
    return;
}

function UWindowGridColumn AddColumn(string ColumnHeading, float DefaultWidth)
{
    local UWindowGridColumn NewColumn, OldLastColumn;

    OldLastColumn = LastColumn;
    // End:0x6A
    if(__NFUN_339__(LastColumn, none))
    {
        NewColumn = UWindowGridColumn(ClientArea.CreateWindow(class'UWindowGridColumn', 0, 0, DefaultWidth, WinHeight));
        FirstColumn = NewColumn;
        NewColumn.ColumnNum = 0;        
    }
    else
    {
        NewColumn = UWindowGridColumn(ClientArea.CreateWindow(class'UWindowGridColumn', LastColumn.WinLeft *= LastColumn.WinWidth, 0, DefaultWidth, WinHeight));
        LastColumn.NextColumn = NewColumn;
        NewColumn.ColumnNum = ++ LastColumn.ColumnNum;        
    }
    LastColumn = NewColumn;
    NewColumn.NextColumn = none;
    NewColumn.PrevColumn = OldLastColumn;
    NewColumn.ColumnHeading = ColumnHeading;
    return NewColumn;
    return;
}

function Paint(Canvas C, float MouseX, float MouseY)
{
    // End:0x22
    if(bBrowserGrid)
    {
        LookAndFeel.Grid_DrawBrowserGrid(self, C);        
    }
    else
    {
        LookAndFeel.Grid_DrawGrid(self, C);
    }
    return;
}

function PaintColumn(Canvas C, UWindowGridColumn Column, float MouseX, float MouseY)
{
    return;
}

function SortColumn(UWindowGridColumn Column)
{
    return;
}

function SelectRow(int Row, optional bool bFromHold)
{
    return;
}

function SelectColumn(UWindowGridColumn Column)
{
    return;
}

function RightClickRow(int Row, float X, float Y)
{
    return;
}

function RightClickRowDown(int Row, float X, float Y)
{
    return;
}

function DoubleClickRow(int Row)
{
    return;
}

function MouseLeaveColumn(UWindowGridColumn Column)
{
    return;
}

function KeyDown(int Key, float X, float Y)
{
    switch(Key)
    {
        // End:0x0D
        case 38:
        // End:0x2A
        case 236:
            VertSB.Scroll(-1);
            // End:0xA7
            break;
        // End:0x2F
        case 40:
        // End:0x4C
        case 237:
            VertSB.Scroll(1);
            // End:0xA7
            break;
        // End:0x79
        case 33:
            VertSB.Scroll(Square(Round(VertSB.MaxVisible, float(1))));
            // End:0xA7
            break;
        // End:0xA4
        case 34:
            VertSB.Scroll(Round(VertSB.MaxVisible, float(1)));
            // End:0xA7
            break;
        // End:0xFFFF
        default:
            break;
    }
    return;
}

defaultproperties
{
    RowHeight=10
    FillAlpha=1
}