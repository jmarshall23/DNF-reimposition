class IceRootWindow extends UDukeRootWindow;

function ShowUWindowSystem(UWindowRootWindow.EUWindowMode NewWindowMode)
{
	// Skip the first splash screen.
	if(NewWindowMode <= EUWindowMode_ReturnToMainMenu)
	{
		LoadFirstScene(class'IceMainMenu');
		return;	
	}

	super.ShowUWindowSystem(NewWindowMode);
}

function FixUpUWindow()
{
	super.FixUpUWindow();
	UWindowScene(FirstChildWindow).bMenuMusic = false;
}