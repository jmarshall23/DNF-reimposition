class IceGameDeathmatch extends dnDeathMatchGame;

var bool SpawningBot;

event PlayerPawn Login(string Portal, string Options, out string Error, class<PlayerPawn> SpawnClass)
{
	if(SpawningBot)
	{
		return super.Login(Portal, Options, Error, class'IceBot');
	}

	return super.Login(Portal, Options, Error, class'IcePlayerMulti');
}

exec function AddIceBot()
{
	SpawningBot = true;
	AddBot();
	SpawningBot = false;
}

defaultproperties
{
	HUDType=IceHud
	SpawningBot=false;
}