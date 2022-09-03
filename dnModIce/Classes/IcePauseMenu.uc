class IcePauseMenu extends UDukeSceneSinglePlayerPauseMenu;

function NotifyFromControl(UWindowDialogControl C, byte E)
{
	if(C == HelpOptionsButton && E == 2)
	{
		NavigateForward(class'IceSceneHelpOptions');
		return;
	}
	
	super.NotifyFromControl(C, E);
}