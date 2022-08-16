class IcePlayer extends DukePlayer;

// Remove the 3 weapon limit.
var Weapon InvWeapons[10];
var int CurrentWeaponId;

simulated event HandlePickup(Inventory Inv, Pickup PickupRef, float Count)
{
	Log("Picking up");
	Log(Inv);
}

function IceSwitchToWeapon(Weapon NewWeapon)
{
	super.ChangeToWeapon(NewWeapon);
}

function string ConsoleCommand(string Command, optional bool bAllowExecFuncs, optional bool bExecsOnly)
{
	if(Command == "Weapon1")
	{
		if(InvWeapons[1] == none)
		{
			Log("You don't have this weapon!");
			return "";
		}

		IceSwitchToWeapon(InvWeapons[1]);
		return "";
	}
	if(Command == "Weapon2")
	{
		if(InvWeapons[2] == none)
		{
			Log("You don't have this weapon!");
			return "";
		}

		IceSwitchToWeapon(InvWeapons[2]);
		return "";
	}
	if(Command == "Weapon3")
	{
		if(InvWeapons[3] == none)
		{
			Log("You don't have this weapon!");
			return "";
		}

		IceSwitchToWeapon(InvWeapons[3]);
		return "";
	}
	if(Command == "Weapon4")
	{
		if(InvWeapons[4] == none)
		{
			Log("You don't have this weapon!");
			return "";
		}

		IceSwitchToWeapon(InvWeapons[4]);
		return "";
	}
	if(Command == "Weapon5")
	{
		if(InvWeapons[5] == none)
		{
			Log("You don't have this weapon!");
			return "";
		}
		IceSwitchToWeapon(InvWeapons[5]);
		return "";
	}
	if(Command == "Weapon6")
	{
		if(InvWeapons[6] == none)
		{
			Log("You don't have this weapon!");
			return "";
		}
		IceSwitchToWeapon(InvWeapons[6]);
		return "";
	}
	if(Command == "Weapon7")
	{
		if(InvWeapons[7] == none)
		{
			Log("You don't have this weapon!");
			return "";
		}
		IceSwitchToWeapon(InvWeapons[7]);
		return "";
	}
	if(Command == "Weapon8")
	{
		if(InvWeapons[8] == none)
		{
			Log("You don't have this weapon!");
			return "";
		}
		IceSwitchToWeapon(InvWeapons[8]);
		return "";
	}
	if(Command == "Weapon9")
	{
		if(InvWeapons[9] == none)
		{
			Log("You don't have this weapon!");
			return "";
		}
		IceSwitchToWeapon(InvWeapons[9]);
		return "";
	}
	if(Command == "Weapon0")
	{
		if(InvWeapons[0] == none)
		{
			Log("You don't have this weapon!");
			return "";
		}
		IceSwitchToWeapon(InvWeapons[0]);
		return "";
	}
	return super.ConsoleCommand(Command, bAllowExecFuncs, bExecsOnly);
}

simulated function ChangeToWeapon(Weapon NewWeapon)
{
	if(ATLaser(NewWeapon) != none || ATCaptainLaser(NewWeapon) != none)
	{
		if(InvWeapons[1] == none)
		{
			InvWeapons[1] = NewWeapon;			
		}
	}

	if(Pistol(NewWeapon) != none)
	{
		if(InvWeapons[2] == none)
		{
			InvWeapons[2] = NewWeapon;			
		}
	}

	if(Shotgun(NewWeapon) != none)
	{
		if(InvWeapons[3] == none)
		{
			InvWeapons[3] = NewWeapon;
		}
	}

	if(Machinegun(NewWeapon) != none)
	{
		if(InvWeapons[4] == none)
		{
			InvWeapons[4] = NewWeapon;
		}
	}

	if(RPG(NewWeapon) != none)
	{
		if(InvWeapons[5] == none)
		{
			InvWeapons[5] = NewWeapon;
		}
	}

	if(PipeBomb(NewWeapon) != none)
	{
		if(InvWeapons[6] == none)
		{
			InvWeapons[6] = NewWeapon;
		}
	}

	if(ShrinkRay(NewWeapon) != none)
	{
		if(InvWeapons[7] == none)
		{
			InvWeapons[7] = NewWeapon;
		}
	}

	if(Devastator(NewWeapon) != none)
	{
		if(InvWeapons[8] == none)
		{
			InvWeapons[8] = NewWeapon;
		}
	}

	if(WallBomb(NewWeapon) != none)
	{
		if(InvWeapons[9] == none)
		{
			InvWeapons[9] = NewWeapon;
		}
	}

	if(FreezeRay(NewWeapon) != none)
	{
		if(InvWeapons[0] == none)
		{
			InvWeapons[0] = NewWeapon;
		}
	}

	IceSwitchToWeapon(NewWeapon);
}

function bool InfiniteAmmoCrateUsed()
{
	local int i;

	for(i = 0; i < 10; i++)
	{
		if(InvWeapons[i] != none)
		{
			GiveFullAmmo(InvWeapons[i]);
		}
	}
}

function NotifyAfterLevelChange()
{
	InventoryActivate(InvWeapons[1]);
}



exec function SelectNextWeapon()
{
	
}

exec function SwapWeaponsUp()
{

}

exec function SelectPrevWeapon()
{

}

exec function UsePrimaryWeapon1()
{

}

exec function UsePrimaryWeapon2()
{

}

exec function UsePrimaryWeapon3()
{

}


exec function UsePrimaryWeapon4()
{

}


exec function SelectWeapon1()
{
	return;
}

exec function SelectWeapon2()
{

	return;
}

exec function SelectWeapon3()
{	
	return;
}

exec function SelectWeapon4()
{

}

exec function InventoryActivate(optional ActivatableInventory ForceSelectItem)
{
	if(ForceSelectItem == none)
		return;

	super.InventoryActivate(ForceSelectItem);
}


event DestroyInventory()
{
	local int i;

	Log("!!DESTROYING INVENTORY!!");

	super.DestroyInventory();
/*
	for(i = 0; i < 10; i++)
	{
		InvWeapons[i] = none;
	}
*/
}
// Three weapon limit end.

simulated event PostBeginPlay()
{
	super.PostBeginPlay();	
}

simulated function bool IsDead()
{
	if(ego <= 0)
	{
		// Death_LoadOrRestart();
		return true;
	}

	return false;
}

simulated function int GetWeaponPriority(Weapon Weap)
{
	return 1;
}

defaultproperties
{
	SprintTotalTime=100000
	HealthCap=100;
	EgoCap=100;
	Ego=100;
}