class AssaultTrooper_New_Captian extends AssaultTrooper_Captain
	config
	placeable;

event FireWeapon()
{
	if(FireProjectile('None', ProjectileClass, CalcLeadTime(ProjectileClass.default.MaxSpeed), false) != none)
	{
		StartWeaponFX();
		NotifyFired();
		FindSoundAndSpeak(FiringSound);

		ReloadCountDown++;
		FireCount++;
	}
}

defaultproperties
{
	
}