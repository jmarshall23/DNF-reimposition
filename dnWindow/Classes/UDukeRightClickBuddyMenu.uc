/*******************************************************************************
 * UDukeRightClickBuddyMenu generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeRightClickBuddyMenu extends UWindowRightClickMenu;

var UWindowPulldownMenuItem Delete;
var localized string DeleteName;
var UWindowPulldownMenuItem DeleteAll;
var localized string DeleteAllName;
var UDukeServerFilterCW ServerFilter;
var UDukeBuddyListBox BuddyListBox;
var UDukeBuddyList List;

function Created()
{
	super.Created();
	Delete = AddMenuItem(DeleteName, none);
	DeleteAll = AddMenuItem(DeleteAllName, none);
	return;
}

function DeleteAllBuddies()
{
	// End:0x1C
	if(__NFUN_340__(ServerFilter, none))
	{
		ServerFilter.DeleteAllBuddies();
	}
	// End:0x38
	if(__NFUN_340__(BuddyListBox, none))
	{
		BuddyListBox.DeleteSelection();
	}
	return;
}

function DeleteBuddy()
{
	// End:0x5B
	if(__NFUN_340__(List, none))
	{
		List.Remove();
		List = none;
		// End:0x3F
		if(__NFUN_340__(ServerFilter, none))
		{
			ServerFilter.DeletedBuddy();
		}
		// End:0x5B
		if(__NFUN_340__(BuddyListBox, none))
		{
			BuddyListBox.DeleteSelection();
		}
	}
	return;
}

function ExecuteItem(UWindowPulldownMenuItem i)
{
	switch(i)
	{
		// End:0x19
		case Delete:
			DeleteBuddy();
			// End:0x2D
			break;
		// End:0x2A
		case DeleteAll:
			DeleteAllBuddies();
			// End:0x2D
			break;
		// End:0xFFFF
		default:
			break;
	}
	super(UWindowPulldownMenu).ExecuteItem(i);
	return;
}

function ShowWindow()
{
	Delete.bDisabled = __NFUN_339__(List, none);
	DeleteAll.bDisabled = false;
	super(UWindowPulldownMenu).ShowWindow();
	Delete.SetCaption(DeleteName);
	return;
}

defaultproperties
{
	DeleteName="<?int?dnWindow.UDukeRightClickBuddyMenu.DeleteName?>"
	DeleteAllName="<?int?dnWindow.UDukeRightClickBuddyMenu.DeleteAllName?>"
}