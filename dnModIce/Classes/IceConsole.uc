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

// ZOMBIE BEGIN
exec function God()
{
    Root.GetPlayerOwner().God();
}

exec function AllAmmo()
{
    DukePlayer(Root.GetPlayerOwner()).AllAmmo("");
}

exec function Ghost()
{
    Root.GetPlayerOwner().Ghost();
}

exec function Fly()
{
    Root.GetPlayerOwner().Fly();
}

exec function Walk()
{
    Root.GetPlayerOwner().Walk();
}

exec function Invisible()
{
    Root.GetPlayerOwner().Invisible();
}

exec function dnIronLung()
{
    Root.GetPlayerOwner().dnIronLung();
}
// ZOMBIE END 

defaultproperties
{
	bLocked=false
}