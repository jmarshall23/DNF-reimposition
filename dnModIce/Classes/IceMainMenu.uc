// IceMainMenu.uc
//

class IceMainMenu extends UDukeSceneMainMenuPAX;

var UDukeMenuButton SinglePlayerButton;
var UDukeMenuButton SinglePlayerOriginalGameButton;
var UDukeMenuButton LocalMultiplayerGameButton;
var UDukeMenuButton OptionsButton;
var UDukeMenuButton ExitButton;

// var IceSceneHelpOptions videoOptions; // Don't use this or remove it! This helps the unreal compiler find this class!

function Created()
{
	super(UWindowScene).Created();
	SinglePlayerButton = UDukeMenuButton(CreateWindow(class'UDukeMenuButton',,,,, self));
	SinglePlayerButton.SetText("Play Ice Campaign");
	SinglePlayerButton.SetHelpText("Play Ice Campaign");
	SinglePlayerButton.Register(self);

	SinglePlayerOriginalGameButton = UDukeMenuButton(CreateWindow(class'UDukeMenuButton',,,,, self));
	SinglePlayerOriginalGameButton.SetText("Play Retail Campaign");
	SinglePlayerOriginalGameButton.SetHelpText("Play Retail Campaign");
	SinglePlayerOriginalGameButton.Register(self);

	LocalMultiplayerGameButton = UDukeMenuButton(CreateWindow(class'UDukeMenuButton',,,,, self));
	LocalMultiplayerGameButton.SetText("Local Multiplayer");
	LocalMultiplayerGameButton.SetHelpText("Local Multiplayer");
	LocalMultiplayerGameButton.Register(self);

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

	SinglePlayerOriginalGameButton.Alpha = FadeAlpha;
	SinglePlayerOriginalGameButton.WinWidth = float(ButtonWidth);
	SinglePlayerOriginalGameButton.WinHeight = float(ButtonHeight);
	SinglePlayerOriginalGameButton.WinLeft = float(ButtonLeft);
	SinglePlayerOriginalGameButton.WinTop = SinglePlayerButton.WinTop + SinglePlayerButton.WinHeight;

	LocalMultiplayerGameButton.Alpha = FadeAlpha;
	LocalMultiplayerGameButton.WinWidth = float(ButtonWidth);
	LocalMultiplayerGameButton.WinHeight = float(ButtonHeight);
	LocalMultiplayerGameButton.WinLeft = float(ButtonLeft);
	LocalMultiplayerGameButton.WinTop = SinglePlayerOriginalGameButton.WinTop + SinglePlayerOriginalGameButton.WinHeight;

	OptionsButton.Alpha = FadeAlpha;
	OptionsButton.WinWidth = float(ButtonWidth);
	OptionsButton.WinHeight = float(ButtonHeight);
	OptionsButton.WinLeft = float(ButtonLeft);
	OptionsButton.WinTop = LocalMultiplayerGameButton.WinTop + LocalMultiplayerGameButton.WinHeight;

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
		GetPlayerOwner().ClientTravel("ice_map00?Game=dnModIce.IceGame", TRAVEL_Relative, false);
	}

	if(c == SinglePlayerOriginalGameButton && E == 2)
	{
		GetPlayerOwner().ClientTravel("map00_ice?Game=dnModIce.IceGame", TRAVEL_Relative, false);	
	}

	if(c == LocalMultiplayerGameButton && E == 2)
	{
		GetPlayerOwner().ClientTravel("DM-Casino?Listen?Game=dnModIce.IceGameDeathmatch", TRAVEL_Relative, false);	
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