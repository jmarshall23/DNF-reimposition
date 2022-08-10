/*******************************************************************************
 * UDukeSceneHelpOptions generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeSceneHelpOptions extends UWindowScene;

var UDukeMenuButton ControlsButton;
var localized string ControlsText;
var localized string ControlsHelp;
var UDukeMenuButton VideoButton;
var localized string VideoText;
var localized string VideoHelp;
var UDukeMenuButton AudioButton;
var localized string AudioText;
var localized string AudioHelp;
var UDukeMenuButton GameplayButton;
var localized string GameplayText;
var localized string GameplayHelp;

function Created()
{
	super.Created();
	ControlsButton = UDukeMenuButton(CreateWindow(class'UDukeMenuButton'));
	ControlsButton.SetText(ControlsText);
	ControlsButton.SetHelpText(ControlsHelp);
	VideoButton = UDukeMenuButton(CreateWindow(class'UDukeMenuButton'));
	VideoButton.SetText(VideoText);
	VideoButton.SetHelpText(VideoHelp);
	AudioButton = UDukeMenuButton(CreateWindow(class'UDukeMenuButton'));
	AudioButton.SetText(AudioText);
	AudioButton.SetHelpText(AudioHelp);
	GameplayButton = UDukeMenuButton(CreateWindow(class'UDukeMenuButton'));
	GameplayButton.SetText(GameplayText);
	GameplayButton.SetHelpText(GameplayHelp);
	GameplayButton.NavUp = VideoButton;
	ControlsButton.NavUp = GameplayButton;
	AudioButton.NavUp = ControlsButton;
	VideoButton.NavUp = AudioButton;
	GameplayButton.NavDown = ControlsButton;
	ControlsButton.NavDown = AudioButton;
	AudioButton.NavDown = VideoButton;
	VideoButton.NavDown = GameplayButton;
	ControlsButton.Register(self);
	VideoButton.Register(self);
	AudioButton.Register(self);
	GameplayButton.Register(self);
	FirstControlToFocus = GameplayButton;
	return;
}

function Paint(Canvas C, float X, float Y)
{
	super.Paint(C, X, Y);
	ControlsButton.WinWidth = float(ButtonWidth);
	ControlsButton.WinHeight = float(ButtonHeight);
	VideoButton.WinWidth = float(ButtonWidth);
	VideoButton.WinHeight = float(ButtonHeight);
	AudioButton.WinWidth = float(ButtonWidth);
	AudioButton.WinHeight = float(ButtonHeight);
	GameplayButton.WinWidth = float(ButtonWidth);
	GameplayButton.WinHeight = float(ButtonHeight);
	// End:0x16E
	if(__NFUN_148__(__NFUN_148__(__NFUN_148__(__NFUN_340__(UDukeRootWindow(Root), none), __NFUN_340__(UDukeRootWindow(Root).AgentOnline, none)), __NFUN_145__(UDukeRootWindow(Root).AgentOnline.IsInMainMenu())), GetPlayerOwner().IsMP()))
	{
		GameplayButton.HideWindow();
		ControlsButton.WinLeft = float(ButtonLeft);
		ControlsButton.WinTop = float(ControlStart);		
	}
	else
	{
		GameplayButton.WinLeft = float(ButtonLeft);
		GameplayButton.WinTop = float(ControlStart);
		ControlsButton.WinLeft = float(ButtonLeft);
		ControlsButton.WinTop = __NFUN_198__(__NFUN_198__(GameplayButton.WinTop, GameplayButton.WinHeight), float(ControlBuffer));
	}
	AudioButton.WinLeft = float(ButtonLeft);
	AudioButton.WinTop = __NFUN_198__(__NFUN_198__(ControlsButton.WinTop, ControlsButton.WinHeight), float(ControlBuffer));
	VideoButton.WinLeft = float(ButtonLeft);
	VideoButton.WinTop = __NFUN_198__(__NFUN_198__(AudioButton.WinTop, AudioButton.WinHeight), float(ControlBuffer));
	return;
}

function NotifyFromControl(UWindowDialogControl C, byte E)
{
	local UWindowWindow Win;

	super.NotifyFromControl(C, E);
	// End:0xA6
	if(__NFUN_173__(int(E), 2))
	{
		// End:0x4F
		if(__NFUN_339__(C, ControlsButton))
		{
			// End:0x41
			if(__NFUN_414__())
			{
				NavigateForward(class'UDukeSceneControllerSetup');				
			}
			else
			{
				NavigateForward(class'UDukeSceneControlsOptions');
			}			
		}
		else
		{
			// End:0x6D
			if(__NFUN_339__(C, VideoButton))
			{
				NavigateForward(class'UDukeSceneVideoOptions');				
			}
			else
			{
				// End:0x8B
				if(__NFUN_339__(C, AudioButton))
				{
					NavigateForward(class'UDukeSceneAudioOptions');					
				}
				else
				{
					// End:0xA6
					if(__NFUN_339__(C, GameplayButton))
					{
						NavigateForward(class'UDukeSceneGameSettings');
					}
				}
			}
		}
	}
	return;
}

function NavigateBack()
{
	super.NavigateBack();
	return;
}

defaultproperties
{
	ControlsText="<?int?dnWindow.UDukeSceneHelpOptions.ControlsText?>"
	ControlsHelp="<?int?dnWindow.UDukeSceneHelpOptions.ControlsHelp?>"
	VideoText="<?int?dnWindow.UDukeSceneHelpOptions.VideoText?>"
	VideoHelp="<?int?dnWindow.UDukeSceneHelpOptions.VideoHelp?>"
	AudioText="<?int?dnWindow.UDukeSceneHelpOptions.AudioText?>"
	AudioHelp="<?int?dnWindow.UDukeSceneHelpOptions.AudioHelp?>"
	GameplayText="<?int?dnWindow.UDukeSceneHelpOptions.GameplayText?>"
	GameplayHelp="<?int?dnWindow.UDukeSceneHelpOptions.GameplayHelp?>"
	TitleText="<?int?dnWindow.UDukeSceneHelpOptions.TitleText?>"
}