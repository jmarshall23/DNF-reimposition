/*******************************************************************************
 * UWindowListBox generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UWindowListBox extends UWindowListControl;

var float ItemHeight;
var float ItemPadding;
var UWindowVScrollbar VertSB;
var UWindowListBoxItem SelectedItem;
var bool bCanDrag;
var bool bCanDragExternal;
var string DefaultHelpText;
var bool bDragging;
var float DragY;
var UWindowListBox DoubleClickList;
var bool bClickOnSelect;

function Created()
{
	super.Created();
	VertSB = UWindowVScrollbar(CreateWindow(class'UWindowVScrollbar', __NFUN_199__(WinWidth, float(18)), 0, 18, WinHeight));
	VertSB.bInBevel = true;
	return;
}

function BeforePaint(Canvas C, float MouseX, float MouseY)
{
	local UWindowListBoxItem OverItem;
	local string NewHelpText;

	VertSB.SetRange(0, float(Items.CountShown()), float(int(__NFUN_196__(WinHeight, __NFUN_198__(ItemHeight, ItemPadding)))));
	NewHelpText = DefaultHelpText;
	// End:0xA6
	if(__NFUN_340__(SelectedItem, none))
	{
		OverItem = GetItemAt(MouseX, MouseY);
		// End:0xA6
		if(__NFUN_148__(__NFUN_339__(OverItem, SelectedItem), __NFUN_309__(OverItem.HelpText, "")))
		{
			NewHelpText = OverItem.HelpText;
		}
	}
	// End:0xC9
	if(__NFUN_309__(NewHelpText, HelpText))
	{
		HelpText = NewHelpText;
		Notify(13);
	}
	return;
}

function SetHelpText(string t)
{
	super(UWindowDialogControl).SetHelpText(t);
	DefaultHelpText = t;
	return;
}

function Sort()
{
	Items.Sort();
	return;
}

function Paint(Canvas C, float MouseX, float MouseY)
{
	local float Y;
	local UWindowList CurItem;
	local int i;

	CurItem = Items.Next;
	i = 0;
	J0x1C:

	// End:0x76 [Loop If]
	if(__NFUN_148__(__NFUN_340__(CurItem, none), __NFUN_200__(float(i), VertSB.pos)))
	{
		// End:0x5E
		if(CurItem.ShowThisItem())
		{
			__NFUN_184__(i);
		}
		CurItem = CurItem.Next;
		// [Loop Continue]
		goto J0x1C;
	}
	Y = 0;
	J0x81:

	// End:0x10B [Loop If]
	if(__NFUN_148__(__NFUN_200__(Y, WinHeight), __NFUN_340__(CurItem, none)))
	{
		// End:0xF3
		if(CurItem.ShowThisItem())
		{
			DrawItem(C, CurItem, 0, Y, __NFUN_199__(WinWidth, float(12)), ItemHeight);
			Y = __NFUN_198__(__NFUN_198__(Y, ItemHeight), ItemPadding);
		}
		CurItem = CurItem.Next;
		// [Loop Continue]
		goto J0x81;
	}
	return;
}

function Resized()
{
	super(UWindowWindow).Resized();
	VertSB.WinLeft = __NFUN_199__(WinWidth, float(18));
	VertSB.WinTop = 0;
	VertSB.SetSize(18, WinHeight);
	return;
}

function UWindowListBoxItem GetItemAt(float MouseX, float MouseY)
{
	local float Y;
	local UWindowList CurItem;
	local int i;

	// End:0x1F
	if(__NFUN_150__(__NFUN_200__(MouseX, float(0)), __NFUN_201__(MouseX, WinWidth)))
	{
		return none;
	}
	CurItem = Items.Next;
	i = 0;
	J0x3B:

	// End:0x95 [Loop If]
	if(__NFUN_148__(__NFUN_340__(CurItem, none), __NFUN_200__(float(i), VertSB.pos)))
	{
		// End:0x7D
		if(CurItem.ShowThisItem())
		{
			__NFUN_184__(i);
		}
		CurItem = CurItem.Next;
		// [Loop Continue]
		goto J0x3B;
	}
	Y = 0;
	J0xA0:

	// End:0x133 [Loop If]
	if(__NFUN_148__(__NFUN_200__(Y, WinHeight), __NFUN_340__(CurItem, none)))
	{
		// End:0x11B
		if(CurItem.ShowThisItem())
		{
			// End:0x102
			if(__NFUN_148__(__NFUN_203__(MouseY, Y), __NFUN_202__(MouseY, __NFUN_198__(Y, ItemHeight))))
			{
				return UWindowListBoxItem(CurItem);
			}
			Y = __NFUN_198__(Y, __NFUN_198__(ItemHeight, ItemPadding));
		}
		CurItem = CurItem.Next;
		// [Loop Continue]
		goto J0xA0;
	}
	return none;
	return;
}

function MakeSelectedVisible()
{
	local UWindowList CurItem;
	local int i;

	VertSB.SetRange(0, float(Items.CountShown()), float(int(__NFUN_196__(WinHeight, __NFUN_198__(ItemHeight, ItemPadding)))));
	// End:0x49
	if(__NFUN_339__(SelectedItem, none))
	{
		return;
	}
	i = 0;
	CurItem = Items.Next;
	J0x65:

	// End:0xB6 [Loop If]
	if(__NFUN_340__(CurItem, none))
	{
		// End:0x84
		if(__NFUN_339__(CurItem, SelectedItem))
		{
			// [Explicit Break]
			goto J0xB6;
		}
		// End:0x9E
		if(CurItem.ShowThisItem())
		{
			__NFUN_184__(i);
		}
		CurItem = CurItem.Next;
		// [Loop Continue]
		goto J0x65;
	}
	J0xB6:

	VertSB.Show(float(i));
	return;
}

function SetSelectedItem(UWindowListBoxItem NewSelected)
{
	// End:0x76
	if(__NFUN_148__(__NFUN_340__(NewSelected, none), __NFUN_340__(SelectedItem, NewSelected)))
	{
		// End:0x3C
		if(__NFUN_340__(SelectedItem, none))
		{
			SelectedItem.bSelected = false;
		}
		SelectedItem = NewSelected;
		// End:0x65
		if(__NFUN_340__(SelectedItem, none))
		{
			SelectedItem.bSelected = true;
		}
		// End:0x76
		if(bClickOnSelect)
		{
			Notify(2);
		}
	}
	return;
}

function SetSelected(float X, float Y)
{
	local UWindowListBoxItem NewSelected;

	NewSelected = GetItemAt(X, Y);
	SetSelectedItem(NewSelected);
	return;
}

function LMouseDown(float X, float Y)
{
	super(UWindowWindow).LMouseDown(X, Y);
	SetSelected(X, Y);
	// End:0x57
	if(__NFUN_150__(bCanDrag, bCanDragExternal))
	{
		bDragging = true;
		Root.CaptureMouse();
		DragY = Y;
	}
	return;
}

function DoubleClick(float X, float Y)
{
	super(UWindowWindow).DoubleClick(X, Y);
	// End:0x36
	if(__NFUN_339__(GetItemAt(X, Y), SelectedItem))
	{
		DoubleClickItem(SelectedItem);
	}
	return;
}

function ReceiveDoubleClickItem(UWindowListBox l, UWindowListBoxItem i)
{
	i.Remove();
	Items.AppendItem(i);
	SetSelectedItem(i);
	l.SelectedItem = none;
	l.Notify(1);
	Notify(1);
	return;
}

function DoubleClickItem(UWindowListBoxItem i)
{
	// End:0x30
	if(__NFUN_148__(__NFUN_340__(DoubleClickList, none), __NFUN_340__(i, none)))
	{
		DoubleClickList.ReceiveDoubleClickItem(self, i);
	}
	return;
}

function MouseMove(float X, float Y)
{
	local UWindowListBoxItem OverItem;

	super(UWindowDialogControl).MouseMove(X, Y);
	// End:0x101
	if(__NFUN_148__(bDragging, bMouseDown))
	{
		OverItem = GetItemAt(X, Y);
		// End:0xD4
		if(__NFUN_148__(__NFUN_148__(__NFUN_148__(bCanDrag, __NFUN_340__(OverItem, SelectedItem)), __NFUN_340__(OverItem, none)), __NFUN_340__(SelectedItem, none)))
		{
			SelectedItem.Remove();
			// End:0xA8
			if(__NFUN_200__(Y, DragY))
			{
				OverItem.InsertItemBefore(SelectedItem);				
			}
			else
			{
				OverItem.InsertItemAfter(SelectedItem, true);
			}
			Notify(1);
			DragY = Y;			
		}
		else
		{
			// End:0xFE
			if(__NFUN_148__(bCanDragExternal, __NFUN_340__(CheckExternalDrag(X, Y), none)))
			{
				bDragging = false;
			}
		}		
	}
	else
	{
		bDragging = false;
	}
	return;
}

function bool ExternalDragOver(UWindowDialogControl ExternalControl, float X, float Y)
{
	local UWindowListBox B;
	local UWindowListBoxItem OverItem;

	B = UWindowListBox(ExternalControl);
	// End:0x143
	if(__NFUN_148__(__NFUN_340__(B, none), __NFUN_340__(B.SelectedItem, none)))
	{
		OverItem = GetItemAt(X, Y);
		B.SelectedItem.Remove();
		// End:0x92
		if(__NFUN_340__(OverItem, none))
		{
			OverItem.InsertItemBefore(B.SelectedItem);			
		}
		else
		{
			Items.AppendItem(B.SelectedItem);
		}
		SetSelectedItem(B.SelectedItem);
		B.SelectedItem = none;
		B.Notify(1);
		Notify(1);
		// End:0x141
		if(__NFUN_150__(bCanDrag, bCanDragExternal))
		{
			Root.CancelCapture();
			bDragging = true;
			bMouseDown = true;
			Root.CaptureMouse(self);
			DragY = Y;
		}
		return true;
	}
	return false;
	return;
}

defaultproperties
{
	ItemHeight=10
	bClickOnSelect=true
}