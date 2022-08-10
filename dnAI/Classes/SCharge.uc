struct SCharge
{
	var() Vector ChargeDir;
	var() Vector ChargeTarget;
	var() float ChargeStartTime;
	var float CoolDownStartSpeed;
	var() float StartVelocity;
	var() float MaxVelocity;
	var() float ReturnVelocity;
	var() float RampUpTime;
	var() float CoolDownTime;
	var() bool RequireLOS;
	var() Engine.BaseAI.EAIChargeState ChargeState;
	var() float ConstraintStrength;
};