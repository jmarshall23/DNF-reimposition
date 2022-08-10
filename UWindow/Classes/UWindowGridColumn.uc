/*******************************************************************************
 * UWindowGridColumn generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UWindowGridColumn extends UWindowWindow;

var UWindowGridColumn NextColumn;
var UWindowGridColumn PrevColumn;
var bool bSizing;
var string ColumnHeading;
var int ColumnNum;
var bool bAllowDoubleClick;
var bool bLargeGrid;
var float ColumnHeadingHeight;

function Created()
{
	super.Created();
	return;
}

function BeforePaint(Canvas C, float X, float Y)
{
	super.BeforePaint(C, X, Y);
	// End:0x2C
	if(__NFUN_200__(WinWidth, float(1)))
	{
		WinWidth = 1;
	}
	LookAndFeel.Grid_SetGridColumnSize(self);
	return;
}

function LMouseDown(float X, float Y)
{
	super.LMouseDown(X, Y);
	// End:0x1B
	if(bLargeGrid)
	{
		return;
	}
	// End:0x99
	if(__NFUN_148__(__NFUN_201__(X, float(__NFUN_188__(int(__NFUN_199__(WinWidth, float(5))), int(__NFUN_199__(__NFUN_199__(ParentWindow.WinWidth, WinLeft), float(5)))))), __NFUN_200__(Y, ColumnHeadingHeight)))
	{
		bSizing = true;
		UWindowGrid(ParentWindow.ParentWindow).bSizingColumn = true;
		Root.CaptureMouse();
	}
	return;
}

function LMouseUp(float X, float Y)
{
	super.LMouseUp(X, Y);
	UWindowGrid(ParentWindow.ParentWindow).bSizingColumn = false;
	return;
}

function MouseMove(float X, float Y)
{
	// End:0x0B
	if(bLargeGrid)
	{
		return;
	}
	// End:0x68
	if(__NFUN_148__(__NFUN_201__(X, float(__NFUN_188__(int(__NFUN_199__(WinWidth, float(5))), int(__NFUN_199__(__NFUN_199__(ParentWindow.WinWidth, WinLeft), float(5)))))), __NFUN_200__(Y, ColumnHeadingHeight)))
	{
		cursor = Root.HSplitCursor;		
	}
	else
	{
		cursor = Root.NormalCursor;
	}
	// End:0xFA
	if(__NFUN_148__(bSizing, bMouseDown))
	{
		WinWidth = X;
		// End:0xB3
		if(__NFUN_200__(WinWidth, float(1)))
		{
			WinWidth = 1;
		}
		// End:0xF7
		if(__NFUN_201__(WinWidth, __NFUN_199__(__NFUN_199__(ParentWindow.WinWidth, WinLeft), float(1))))
		{
			WinWidth = __NFUN_199__(__NFUN_199__(ParentWindow.WinWidth, WinLeft), float(1));
		}		
	}
	else
	{
		bSizing = false;
		UWindowGrid(ParentWindow.ParentWindow).bSizingColumn = false;
	}
	return;
}

function Paint(Canvas C, float X, float Y)
{
	local Region R;
	local Texture t;
	local Color FC;
	local float XL, YL;

	UWindowGrid(ParentWindow.ParentWindow).PaintColumn(C, self, X, Y);
	// End:0xD6
	if(UWindowGrid(ParentWindow.ParentWindow).bBrowserGrid)
	{
		C.DrawColor = LookAndFeel.GetTextColor(self);
		C.Font = C.BlockFont;
		TextSize(C, ColumnHeading, XL, YL);
		ClipText(C, __NFUN_196__(__NFUN_199__(WinWidth, XL), 2), 4, ColumnHeading);		
	}
	else
	{
		t = LookAndFeel.Active;
		FC = LookAndFeel.HeadingActiveTitleColor;
		DrawUpBevel(C, 0, 0, WinWidth, ColumnHeadingHeight, t);
		C.DrawColor = LookAndFeel.GetTextColor(self);
		C.Font = C.BlockFontSmall;
		ClipText(C, 6, 2, ColumnHeading);
		C.DrawColor.R = 255;
		C.DrawColor.G = 255;
		C.DrawColor.B = 255;
	}
	return;
}

function Click(float X, float Y)
{
	local int Row;

	// End:0x66
	if(__NFUN_200__(Y, ColumnHeadingHeight))
	{
		// End:0x63
		if(__NFUN_202__(X, float(__NFUN_188__(int(__NFUN_199__(WinWidth, float(5))), int(__NFUN_199__(__NFUN_199__(ParentWindow.WinWidth, WinLeft), float(5)))))))
		{
			UWindowGrid(ParentWindow.ParentWindow).SortColumn(self);
		}		
	}
	else
	{
		Row = __NFUN_165__(int(__NFUN_196__(float(int(__NFUN_199__(Y, ColumnHeadingHeight))), UWindowGrid(ParentWindow.ParentWindow).RowHeight)), UWindowGrid(ParentWindow.ParentWindow).TopRow);
		UWindowGrid(ParentWindow.ParentWindow).SelectRow(Row);
		UWindowGrid(ParentWindow.ParentWindow).SelectColumn(self);
	}
	return;
}

function RMouseDown(float X, float Y)
{
	local int Row;

	super.RMouseDown(X, Y);
	// End:0xD4
	if(__NFUN_201__(Y, ColumnHeadingHeight))
	{
		Row = __NFUN_165__(int(__NFUN_196__(float(int(__NFUN_199__(Y, ColumnHeadingHeight))), UWindowGrid(ParentWindow.ParentWindow).RowHeight)), UWindowGrid(ParentWindow.ParentWindow).TopRow);
		UWindowGrid(ParentWindow.ParentWindow).SelectRow(Row);
		UWindowGrid(ParentWindow.ParentWindow).RightClickRowDown(Row, __NFUN_198__(X, WinLeft), __NFUN_198__(Y, WinTop));
	}
	return;
}

function RMouseUp(float X, float Y)
{
	local int Row;

	super.RMouseUp(X, Y);
	// End:0xD4
	if(__NFUN_201__(Y, ColumnHeadingHeight))
	{
		Row = __NFUN_165__(int(__NFUN_196__(float(int(__NFUN_199__(Y, ColumnHeadingHeight))), UWindowGrid(ParentWindow.ParentWindow).RowHeight)), UWindowGrid(ParentWindow.ParentWindow).TopRow);
		UWindowGrid(ParentWindow.ParentWindow).SelectRow(Row);
		UWindowGrid(ParentWindow.ParentWindow).RightClickRow(Row, __NFUN_198__(X, WinLeft), __NFUN_198__(Y, WinTop));
	}
	return;
}

function DoubleClick(float X, float Y)
{
	local int Row;

	// End:0x22
	if(__NFUN_200__(Y, ColumnHeadingHeight))
	{
		Click(X, Y);		
	}
	else
	{
		// End:0xA7
		if(bAllowDoubleClick)
		{
			Row = __NFUN_165__(int(__NFUN_196__(float(int(__NFUN_199__(Y, ColumnHeadingHeight))), UWindowGrid(ParentWindow.ParentWindow).RowHeight)), UWindowGrid(ParentWindow.ParentWindow).TopRow);
			UWindowGrid(ParentWindow.ParentWindow).DoubleClickRow(Row);			
		}
		else
		{
			Row = __NFUN_165__(int(__NFUN_196__(float(int(__NFUN_199__(Y, ColumnHeadingHeight))), UWindowGrid(ParentWindow.ParentWindow).RowHeight)), UWindowGrid(ParentWindow.ParentWindow).TopRow);
			UWindowGrid(ParentWindow.ParentWindow).SelectRow(Row);
			UWindowGrid(ParentWindow.ParentWindow).SelectColumn(self);
		}
	}
	return;
}

function MouseLeave()
{
	super.MouseLeave();
	UWindowGrid(ParentWindow.ParentWindow).MouseLeaveColumn(self);
	return;
}

defaultproperties
{
	bAllowDoubleClick=true
}