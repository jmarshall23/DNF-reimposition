class IceConsole extends DukeConsole
	transient
	config;

event bool KeyEvent(EInputKey Key, EInputAction Action, float Delta)
{
	if(Action == 1 && Key == 192)
	{
		Log("!!Showing console!!");
		TypedStr="";
		bLocked=false;	
		super.LaunchUWindow();
		super.ShowConsole();

		return true;
	}

	if(!bShowConsole)
	{
		if(Action == 1 && Key == IK_1)
		{
			IcePlayer(Root.GetPlayerOwner()).ConsoleCommand("Weapon1");
			return true;
		}

		if(Action == 1 && Key == IK_2)
		{
			IcePlayer(Root.GetPlayerOwner()).ConsoleCommand("Weapon2");
			return true;
		}

		if(Action == 1 && Key == IK_3)
		{
			IcePlayer(Root.GetPlayerOwner()).ConsoleCommand("Weapon3");
			return true;
		}

		if(Action == 1 && Key == IK_4)
		{
			IcePlayer(Root.GetPlayerOwner()).ConsoleCommand("Weapon4");
			return true;
		}

		if(Action == 1 && Key == IK_5)
		{
			IcePlayer(Root.GetPlayerOwner()).ConsoleCommand("Weapon5");
			return true;
		}

		if(Action == 1 && Key == IK_6)
		{
			IcePlayer(Root.GetPlayerOwner()).ConsoleCommand("Weapon6");
			return true;
		}

		if(Action == 1 && Key == IK_7)
		{
			IcePlayer(Root.GetPlayerOwner()).ConsoleCommand("Weapon7");
			return true;
		}

		if(Action == 1 && Key == IK_8)
		{
			IcePlayer(Root.GetPlayerOwner()).ConsoleCommand("Weapon8");
			return true;
		}

		if(Action == 1 && Key == IK_9)
		{
			IcePlayer(Root.GetPlayerOwner()).ConsoleCommand("Weapon9");
			return true;
		}

		if(Action == 1 && Key == IK_0)
		{
			IcePlayer(Root.GetPlayerOwner()).ConsoleCommand("Weapon0");
			return true;
		}
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

exec function DebugHUD()
{
    DukeHUD(DukePlayer(Root.GetPlayerOwner()).MyHUD).DebugHUD();
}
// ZOMBIE END 

defaultproperties
{
	bLocked=false
	RootWindow="dnModIce.IceRootWindow"
}