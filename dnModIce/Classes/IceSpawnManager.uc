class IceSpawnManager extends Actor;

event Spawned()
{
	Log("Ice Spawn Manager Created Successfully");
	super.Spawned();
}

function PreGameInitHook(Object obj)
{
	if(Actor(obj) != none)
	{
		// Actor(obj).bUseShadowTag = false;
		Actor(obj).bCastStencilShadows = true;
		// Actor(obj).bForceDirectionalShadows = true;
		return;
	}
}

function PostEntitySpawn(Object obj)
{
	local int i;	

	if(Weapon(obj) != none)
	{
		Log("!!Changing weapons!!!");
		//Weapon(obj).WeaponConfig.default.ReloadCount = Weapon(obj).WeaponConfig.default.ReloadCount * 2;
		return;
	}
}
