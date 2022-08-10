/*******************************************************************************
 * MP_dnRocket_Devastator generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MP_dnRocket_Devastator extends dnRocket_Devastator
	collapsecategories;

var array<SMountedActorPrefab> MP_MountOnSpawn;

simulated event PostNetInitial()
{
	local int i;

	MountOnSpawn = MP_MountOnSpawn;
	// End:0x16
	if(bIgnoreSpawn)
	{
		return;
	}
	super(RenderActor).PostNetInitial();
	SetHiddenProjectileActor();
	return;
}

simulated event PostVerifySelf()
{
	return;
}

simulated function ExecutePostVerifySelf()
{
	PostVerifySelf();
	return;
}

simulated function Explode(Vector HitLocation, optional Vector HitNormal, optional Actor HitActor)
{
	DoDamage(HitLocation, HitActor);
	__NFUN_652__(Rotator(HitNormal));
	SetHiddenProjectileActor();
	PostExplode();
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	MountOnSpawn = MP_MountOnSpawn;
	super(dnRocket).RegisterPrecacheComponents(PrecacheIndex);
	return;
}
