class IceMiniBattleLord extends BattleLord_Boss;

event PostBeginPlay()
{
	super.PostBeginPlay();
	FinishMeControlType = none;
}

event Tick(float DeltaSeconds)
{
	local Vector alignment;

	super(Actor).Tick(DeltaSeconds);

	if(PrimaryTarget != none)
	{
		alignment.x = 1.0;
		alignment.y = 0.0;
		alignment.z = 0.0;

		MeshInstance.AimBoneAtPoint('mount_hand_r', alignment, PrimaryTarget.GetEyePos(),,0.5);
	}
}

simulated event float GetBaseDamage(Actor Victim, optional Pawn Instigator, optional class<DamageType> DamageType, optional Vector HitDirection, optional Vector HitLocation, optional name BoneName, optional Vector SourceTraceOrigin)
{
	return 10;
}

defaultproperties
{
	Health_Stage1=600
	Health_Stage2=150
	Health_Stage3=80
	Health_RecoveryHealth=0
	Health=300
	HealthCap=600
	bIsBoss=false
	bShrinkable=true
	bFreezable=true
	FinishMeControlType=none
}
