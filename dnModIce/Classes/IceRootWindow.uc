class IceRootWindow extends UDukeRootWindow;

function MoveMouse(float X, float Y)
{
	if(DukeConsole(Console).bShowConsole)
		return;

	super.MoveMouse(X, Y);
}

function ShowUWindowSystem(UWindowRootWindow.EUWindowMode NewWindowMode)
{
	// Skip the first splash screen.
	if(NewWindowMode <= EUWindowMode_ReturnToMainMenu)
	{
		LoadFirstScene(class'IceMainMenu');
		return;	
	}
	else
	{
		LoadFirstScene(class'IcePauseMenu');
		BackgroundMovieMaterial=none;
		return;	
	}

	if(DukeConsole(Console).bShowConsole)
	{
		NavigateBack();
		return;
	}

	super.ShowUWindowSystem(NewWindowMode);
}

function FixUpUWindow()
{
	super.FixUpUWindow();
	UWindowScene(FirstChildWindow).bMenuMusic = false;
}