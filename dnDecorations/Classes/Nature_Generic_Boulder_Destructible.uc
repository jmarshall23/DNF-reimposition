/*******************************************************************************
 * Nature_Generic_Boulder_Destructible generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Nature_Generic_Boulder_Destructible extends Nature_Generic_Boulder
	collapsecategories;

var SoftParticleSystem Dust;

function PostVerifySelf()
{
	super(dnDecoration).PostVerifySelf();
	Dust = SoftParticleSystem(FindMountedActor('Dust'));
	// End:0x3B
	if(__NFUN_340__(Dust, none))
	{
		Dust.__NFUN_1063__();
		UpdateDust();
	}
	return;
}

event Tick(float DeltaTime)
{
	super(Actor).Tick(DeltaTime);
	// End:0x1D
	if(__NFUN_340__(Dust, none))
	{
		UpdateDust();
	}
	return;
}

simulated function UpdateDust()
{
	local float Alpha;

	Alpha = __NFUN_196__(__NFUN_251__(Velocity), 1500);
	// End:0x38
	if(__NFUN_200__(Alpha, 0.1))
	{
		Dust.Enabled = false;		
	}
	else
	{
		Dust.Enabled = true;
	}
	Dust.AlphaStart = __NFUN_196__(__NFUN_251__(Velocity), 1500);
	Dust.AlphaMid = __NFUN_196__(__NFUN_251__(Velocity), 1500);
	return;
}

defaultproperties
{
	StartupActivities=/* Array type was not detected. */
	ObjectProperty=Z
}