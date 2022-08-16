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
		Weapon(obj).WeaponConfig.default.ReloadCount = Weapon(obj).WeaponConfig.default.ReloadCount * 2;
		return;
	}	
}