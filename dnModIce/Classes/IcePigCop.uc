class IcePigCop extends PigCop_Shotgun;

// Set PicCop to look more like Duke3D and disabled stupid bezerker mechanic.
// Also increased health. 

event PostBeginPlay()
{
	super(AIActor).PostBeginPlay();
}

event Tick(float Secs)
{	
	super(Actor).Tick(Secs);
}

function TookDamage(Pawn Instigator, float Damage, Object.EPawnBodyPart Part, Vector DamageOrigin, Vector DamageDirection, class<DamageType> DamageType, optional name HitBoneName, optional Vector DamageStart)
{
	Damage = Damage * 0.5;

	if(!IsDead())
	{
		SetHealth(Health - Damage);
		PlayPainSound(DamageType);
	}

	if(IsDead())
	{
		Died(Instigator, int(Damage), DamageOrigin, DamageDirection, DamageType, HitBoneName);
	}
}

defaultproperties
{
	Mesh=Mesh'c_characters.PigCopB'
}