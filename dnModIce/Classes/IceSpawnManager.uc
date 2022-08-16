class IceSpawnManager extends Actor;

event Spawned()
{
	Log("Ice Spawn Manager Created Successfully");
	super.Spawned();
}

function PostEntitySpawn(Object obj)
{
	if(Weapon(obj) != none)
	{
		Log("!!Changing weapons!!!");
		Weapon(obj).WeaponConfig.default.ReloadCount = Weapon(obj).WeaponConfig.default.ReloadCount * 2;
		return;
	}
	//Vinícius Devastator ammo change
	if(DevastatorAmmo(obj) != none)
	{
		DevastatorAmmo(obj).Charge = 99;
		DevastatorAmmo(obj).MaxCharge = 99;
	}
	//Vinícius Devastator ammo change
}
