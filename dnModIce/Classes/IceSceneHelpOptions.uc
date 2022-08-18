class IceSceneHelpOptions extends UDukeSceneHelpOptions;

function NotifyFromControl(UWindowDialogControl C, byte E)
{
	if(C == VideoButton)
	{
		NavigateForward(class'IceSceneVideoOptions');
		return;
	}

	super.NotifyFromControl(C, E);
}
