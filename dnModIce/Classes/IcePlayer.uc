class IcePlayer extends DukePlayer;

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

defaultproperties
{
	SprintTotalTime=100000
	HealthCap=100;
	EgoCap=100;
	Ego=100;
}