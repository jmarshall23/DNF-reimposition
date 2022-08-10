/*******************************************************************************
 * Biology_Generic_GrowPod generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Biology_Generic_GrowPod extends Biology_Generic_ShrinkPod
	collapsecategories;

function PodAction(Actor Other)
{
	local Pawn P;
	local Vector LinVel;

	// End:0x102
	if(__NFUN_150__(__NFUN_145__(IsMP()), __NFUN_145__(DukeMultiPlayer(Other).IsDrivingVehicle())))
	{
		// End:0x102
		if(__NFUN_148__(Other.bIsPawn, __NFUN_145__(CoolingDown)))
		{
			P = Pawn(Other);
			// End:0x102
			if(P.bFullyShrunk)
			{
				P.__NFUN_794__(LinVel);
				LinVel.Z = 0;
				P.__NFUN_790__(LinVel);
				P.__NFUN_966__();
				P.ExpandPawn();
				ParticleBurstSystem.Trigger(none, none);
				CoolingDown = true;
				ParticleSystem.Enabled = false;
				__NFUN_605__(ParticleCoolDown, false, 'TurnParticlesOn');
				DecoActivity(0, 'Play_Deactivate');
			}
		}
	}
	return;
}

simulated function TurnParticlesOn()
{
	ParticleSystem.Enabled = true;
	CoolingDown = false;
	DecoActivity(0, 'Play_Activate');
	return;
}

simulated function TurnParticlesOff()
{
	ParticleBurstSystem.Trigger(none, none);
	CoolingDown = true;
	ParticleSystem.Enabled = false;
	DecoActivity(0, 'Play_Deactivate');
	return;
}

simulated event AnimEndEx(SAnimEndInfo AnimEndInfo)
{
	super(dnDecoration).AnimEndEx(AnimEndInfo);
	// End:0x30
	if(__NFUN_341__(AnimEndInfo.AnimName, 'Activate'))
	{
		DecoActivity(0, 'Play_Idle_Open');		
	}
	else
	{
		// End:0x52
		if(__NFUN_341__(AnimEndInfo.AnimName, 'Deactivate'))
		{
			DecoActivity(0, 'Play_Idle_Closed');
		}
	}
	return;
}

defaultproperties
{
	ParticleSystemClass='p_Decorations.GrowPod.GrowPod_Main'
	ParticleBurstSystemClass='p_Decorations.podfx.GrowPodBurstFX'
}