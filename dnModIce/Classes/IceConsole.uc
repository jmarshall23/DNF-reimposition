class IceConsole extends DukeConsole
	transient
	config;

event bool KeyEvent(EInputKey Key, EInputAction Action, float Delta)
{
	if(Action == 1 && Key == 192)
	{
		TypedStr="";
		bLocked=false;	
		super.LaunchUWindow();
		super.ShowConsole();

		return true;
	}

	return super.KeyEvent(Key, Action, Delta);
}

defaultproperties
{
	bLocked=false
}