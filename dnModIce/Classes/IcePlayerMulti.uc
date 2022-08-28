class IcePlayerMulti extends DukeMultiPlayer;

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
	local int loadedAmmo;
	local int totalAmmo;

	if(Command == "CurrentWeapon")
	{
		if(Weapon == none)
		{
			return "";
		}
		if(Weapon == InvWeapons[0])
		{
			return "0";
		}
		else if(Weapon == InvWeapons[1])
		{
			return "1";
		}
		else if(Weapon == InvWeapons[2])
		{
			return "2";
		}
		else if(Weapon == InvWeapons[3])
		{
			return "3";
		}
		else if(Weapon == InvWeapons[4])
		{
			return "4";
		}
		else if(Weapon == InvWeapons[5])
		{
			return "5";
		}
		else if(Weapon == InvWeapons[6])
		{
			return "6";
		}
		else if(Weapon == InvWeapons[7])
		{
			return "7";
		}
		else if(Weapon == InvWeapons[8])
		{
			return "8";
		}
		else if(Weapon == InvWeapons[9])
		{
			return "9";
		}
	}
	if(Command == "GetWeapon1Ammo")
	{
		if(InvWeapons[1] != none)
		{
			loadedAmmo = InvWeapons[1].GetLoadedAmmo();
			totalAmmo  = InvWeapons[1].GetTotalAmmo();

			return "1) " $ loadedAmmo $ "/" $ totalAmmo;
		}
		else
		{
			return "1) N/A";
		}
	}
	if(Command == "GetWeapon2Ammo")
	{
		if(InvWeapons[2] != none)
		{
			loadedAmmo = InvWeapons[2].GetLoadedAmmo();
			totalAmmo  = InvWeapons[2].GetTotalAmmo();

			return "2) " $ loadedAmmo $ "/" $ totalAmmo;
		}
		else
		{
			return "2) N/A";
		}
	}
	if(Command == "GetWeapon3Ammo")
	{
		if(InvWeapons[3] != none)
		{
			loadedAmmo = InvWeapons[3].GetLoadedAmmo();
			totalAmmo  = InvWeapons[3].GetTotalAmmo();

			return "3) " $ loadedAmmo $ "/" $ totalAmmo;
		}
		else
		{
			return "3) N/A";
		}
	}
	if(Command == "GetWeapon4Ammo")
	{
		if(InvWeapons[4] != none)
		{
			loadedAmmo = InvWeapons[4].GetLoadedAmmo();
			totalAmmo  = InvWeapons[4].GetTotalAmmo();

			return "4) " $ loadedAmmo $ "/" $ totalAmmo;
		}
		else
		{
			return "4) N/A";
		}
	}
	if(Command == "GetWeapon5Ammo")
	{
		if(InvWeapons[5] != none)
		{
			loadedAmmo = InvWeapons[5].GetLoadedAmmo();
			totalAmmo  = InvWeapons[5].GetTotalAmmo();

			return "5) " $ loadedAmmo $ "/" $ totalAmmo;
		}
		else
		{
			return "5) N/A";
		}
	}
	if(Command == "GetWeapon6Ammo")
	{
		if(InvWeapons[6] != none)
		{
			loadedAmmo = InvWeapons[6].GetLoadedAmmo();
			totalAmmo  = InvWeapons[6].GetTotalAmmo();

			return "6) " $ loadedAmmo $ "/" $ totalAmmo;
		}
		else
		{
			return "6) N/A";
		}
	}
	if(Command == "GetWeapon7Ammo")
	{
		if(InvWeapons[7] != none)
		{
			loadedAmmo = InvWeapons[7].GetLoadedAmmo();
			totalAmmo  = InvWeapons[7].GetTotalAmmo();

			return "7) " $ loadedAmmo $ "/" $ totalAmmo;
		}
		else
		{
			return "7) N/A";
		}
	}
	if(Command == "GetWeapon8Ammo")
	{
		if(InvWeapons[8] != none)
		{
			loadedAmmo = InvWeapons[8].GetLoadedAmmo();
			totalAmmo  = InvWeapons[8].GetTotalAmmo();

			return "8) " $ loadedAmmo $ "/" $ totalAmmo;
		}
		else
		{
			return "8) N/A";
		}
	}
	if(Command == "GetWeapon9Ammo")
	{
		if(InvWeapons[9] != none)
		{
			loadedAmmo = InvWeapons[9].GetLoadedAmmo();
			totalAmmo  = InvWeapons[9].GetTotalAmmo();

			return "9) " $ loadedAmmo $ "/" $ totalAmmo;
		}
		else
		{
			return "9) N/A";
		}
	}
	if(Command == "GetWeapon0Ammo")
	{
		if(InvWeapons[0] != none)
		{
			loadedAmmo = InvWeapons[0].GetLoadedAmmo();
			totalAmmo  = InvWeapons[0].GetTotalAmmo();

			return "0) " $ loadedAmmo $ "/" $ totalAmmo;
		}
		else
		{
			return "0) N/A";
		}
	}

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

	super.DestroyInventory();

	for(i = 0; i < 10; i++)
	{
		InvWeapons[i] = none;
	}
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

event Tick(float DeltaTime)
{
	super.Tick(DeltaTime);
	if(TouchingWeaponPickup != none)
	{		
		Pickup(TouchingWeaponPickup).DoPickup(Self);

		// Log("TOUCHING THE FUCKING GUN!!");
	}
}

defaultproperties
{
	SprintTotalTime=100000
	HealthCap=100;
	EgoCap=100;
	Ego=100;
}