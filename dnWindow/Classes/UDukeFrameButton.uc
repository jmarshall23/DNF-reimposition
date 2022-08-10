/*******************************************************************************
 * UDukeFrameButton generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeFrameButton extends UWindowButton;

var UDukeFramedWindow FrameWindow;

function Notify(byte E)
{
	// End:0x22
	if(__NFUN_340__(FrameWindow, none))
	{
		FrameWindow.NotifyFromControl(self, E);
	}
	return;
}