struct SGunshipEventInfo
{
	var() noexport name EventTag "Trigger this to execute this.";
	var() noexport array<dnGunship_Base.EGunship_GunPosition> GunPositions "Which guns are we affecting? Use EGUNSHIP_ALL to set target for all.";
	var() noexport bool bChangeTarget "Must set to TRUE to change target.";
	var() noexport name NewTargetTag "Tag of the new target. Setting to None will clear target and hold fire.";
	var() noexport bool bChangeGunType "If TRUE we will change the gun type on the affected turrets.";
	var() noexport dnGunship_Base.EGunshipGun_GunType NewGunType "New guntype. Only used if bChangeGunType is true";
};