// IceMainMenu.uc
//

class IceMainMenu extends UDukeSceneMainMenuPAX;

var UDukeMenuButton SinglePlayerButton;
var UDukeMenuButton OptionsButton;
var UDukeMenuButton ExitButton;

// var IceSceneHelpOptions videoOptions; // Don't use this or remove it! This helps the unreal compiler find this class!

function Created()
{
	super(UWindowScene).Created();
	SinglePlayerButton = UDukeMenuButton(CreateWindow(class'UDukeMenuButton',,,,, self));
	SinglePlayerButton.SetText("Singleplayer(IceMod)");
	SinglePlayerButton.SetHelpText("Singleplayer(IceMod)");
	SinglePlayerButton.Register(self);

	OptionsButton = UDukeMenuButton(CreateWindow(class'UDukeMenuButton',,,,, self));
	OptionsButton.SetText("Options");
	OptionsButton.SetHelpText("Options");
	OptionsButton.Register(self);

	ExitButton = UDukeMenuButton(CreateWindow(class'UDukeMenuButton',,,,, self));
	ExitButton.SetText("Exit");
	ExitButton.SetHelpText("Exit");
	ExitButton.Register(self);

	FirstControlToFocus = SinglePlayerButton;
}

function Paint(Canvas C, float X, float Y)
{
	SinglePlayerButton.Alpha = FadeAlpha;
	SinglePlayerButton.WinWidth = float(ButtonWidth);
	SinglePlayerButton.WinHeight = float(ButtonHeight);
	SinglePlayerButton.WinLeft = float(ButtonLeft);
	SinglePlayerButton.WinTop = float(ControlStart);

	OptionsButton.Alpha = FadeAlpha;
	OptionsButton.WinWidth = float(ButtonWidth);
	OptionsButton.WinHeight = float(ButtonHeight);
	OptionsButton.WinLeft = float(ButtonLeft);
	OptionsButton.WinTop = SinglePlayerButton.WinTop + SinglePlayerButton.WinHeight;

	ExitButton.Alpha = FadeAlpha;
	ExitButton.WinWidth = float(ButtonWidth);
	ExitButton.WinHeight = float(ButtonHeight);
	ExitButton.WinLeft = float(ButtonLeft);
	ExitButton.WinTop = OptionsButton.WinTop + OptionsButton.WinHeight;
	super(UWindowScene).Paint(C, X, Y);
}

function NotifyFromControl(UWindowDialogControl C, byte E)
{
	if(C == SinglePlayerButton && E == 2)
	{				
		GetPlayerOwner().ClientTravel("map05_night?NewGame?Game=dnModIce.IceGame", TRAVEL_Relative, false);
	}

	if(C == ExitButton && E == 2)
	{
		GetPlayerOwner().ConsoleCommand("quit");
	}

	if(C == OptionsButton && E == 2)
	{
		NavigateForward(class'IceSceneHelpOptions');	
	}
}

function bool PropagateKey(UWindowWindow.WinMessage msg, Canvas C, float X, float Y, int Key)
{
	if(msg == WM_KeyDown && key == 192)
	{
		Root.Console.ShowConsole();
		return true;
	}
	return super.PropagateKey(msg, C, X, Y, Key);
}

function Tick(float Delta)
{
	super(UWindowWindow).Tick(Delta);
}

defaultproperties
{
	bMenuMusic=false
}