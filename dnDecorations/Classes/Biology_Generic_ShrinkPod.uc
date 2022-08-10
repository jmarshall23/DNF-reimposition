/*******************************************************************************
 * Biology_Generic_ShrinkPod generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Biology_Generic_ShrinkPod extends Biology_Generic
	collapsecategories;

var() noexport float ShrinkTime "Time to shrink player. If less than 0, then shrink forever";
var() noexport float ParticleTimer "How often to emit particle effect";
var() noexport float ParticleCoolDown "Cooldown in seconds before reimmitting particles";
var bool CoolingDown;
var SoftParticleSystem ParticleSystem;
var SoftParticleSystem ParticleBurstSystem;
var() class<SoftParticleSystem> ParticleSystemClass;
var() class<SoftParticleSystem> ParticleBurstSystemClass;

replication
{
	// Pos:0x000
	reliable if(__NFUN_173__(int(Role), int(ROLE_Authority)))
		CoolingDown;
}

simulated function NU_CoolingDown(bool in_CoolingDown)
{
	// End:0x12
	if(in_CoolingDown)
	{
		TurnParticlesOff();		
	}
	else
	{
		TurnParticlesOn();
	}
	return;
}

simulated event PostVerifySelf()
{
	SpawnMountedParticleSystems();
	super(dnDecoration).PostVerifySelf();
	return;
}

simulated event PostBeginPlay()
{
	super(dnDecoration).PostBeginPlay();
	ParticleBurstSystem = SoftParticleSystem(FindMountedActor('BurstPodFX'));
	ParticleSystem = SoftParticleSystem(FindMountedActor('MainPodFX'));
	return;
}

simulated function SpawnMountedParticleSystems()
{
	local int Index, i;

	// End:0xCB
	if(__NFUN_340__(ParticleSystemClass, none))
	{
		Index = MountOnSpawn.Add(1);
		MountOnSpawn[Index].SpawnClass = ParticleSystemClass;
		MountOnSpawn[Index].MountPrefab.bSurviveDismount = true;
		MountOnSpawn[Index].MountPrefab.MountOrigin.X = 1;
		MountOnSpawn[Index].MountPrefab.MountOrigin.Y = 0;
		MountOnSpawn[Index].MountPrefab.MountOrigin.Z = 7;
		MountOnSpawn[Index].MountPrefab.ForceTag = __NFUN_343__("MainPodFX");
	}
	// End:0x197
	if(__NFUN_340__(ParticleBurstSystemClass, none))
	{
		Index = MountOnSpawn.Add(1);
		MountOnSpawn[Index].SpawnClass = ParticleBurstSystemClass;
		MountOnSpawn[Index].MountPrefab.bSurviveDismount = true;
		MountOnSpawn[Index].MountPrefab.MountOrigin.X = 1;
		MountOnSpawn[Index].MountPrefab.MountOrigin.Y = 0;
		MountOnSpawn[Index].MountPrefab.MountOrigin.Z = 7;
		MountOnSpawn[Index].MountPrefab.ForceTag = __NFUN_343__("BurstPodFX");
	}
	// End:0x1E1
	if(__NFUN_173__(int(Level.NetMode), int(NM_Client)))
	{
		i = __NFUN_166__(string(MountOnSpawn), 1);
		J0x1BE:

		// End:0x1E1 [Loop If]
		if(__NFUN_172__(i, 0))
		{
			__NFUN_837__(MountOnSpawn[i]);
			__NFUN_185__(i);
			// [Loop Continue]
			goto J0x1BE;
		}
	}
	return;
}

event Touch(Actor Other)
{
	super(dnDecoration).Touch(Other);
	PodAction(Other);
	return;
}

event Bump(Actor Other)
{
	super(dnDecoration).Bump(Other);
	PodAction(Other);
	return;
}

function PodAction(Actor Other)
{
	local Pawn P;

	// End:0xF4
	if(__NFUN_148__(Other.bIsPawn, __NFUN_145__(CoolingDown)))
	{
		P = Pawn(Other);
		// End:0xF4
		if(__NFUN_150__(__NFUN_145__(IsMP()), __NFUN_148__(P.CanShrink(class'ShrinkerDamage'), __NFUN_173__(int(P.Role), int(ROLE_Authority)))))
		{
			// End:0xF4
			if(__NFUN_145__(P.__NFUN_921__()))
			{
				P.ShrinkPawn(ShrinkTime,,, true);
				ParticleBurstSystem.Trigger(none, none);
				CoolingDown = true;
				ParticleSystem.Enabled = false;
				// End:0xD9
				if(IsMP())
				{
					ParticleCoolDown = 0;
				}
				__NFUN_607__(ParticleCoolDown, false, 'TurnParticlesOn');
				DecoActivity(0, 'Play_Idle_Active');
			}
		}
	}
	return;
}

simulated function TurnParticlesOn()
{
	local int i;

	ParticleSystem.Enabled = true;
	CoolingDown = false;
	DecoActivity(0, 'Play_Idle');
	// End:0x74
	if(IsMP())
	{
		J0x30:

		// End:0x74 [Loop If]
		if(__NFUN_169__(i, string(Touching)))
		{
			// End:0x6A
			if(Touching[i].bIsPlayerPawn)
			{
				PodAction(Touching[i]);
			}
			__NFUN_184__(i);
			// [Loop Continue]
			goto J0x30;
		}
	}
	return;
}

simulated function TurnParticlesOff()
{
	ParticleBurstSystem.Trigger(none, none);
	ParticleSystem.Enabled = false;
	CoolingDown = true;
	DecoActivity(0, 'Play_Idle_Active');
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super(dnDecoration).RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1266__(ParticleSystemClass);
	PrecacheIndex.__NFUN_1266__(ParticleBurstSystemClass);
	PrecacheIndex.__NFUN_1269__(class'Pawn'.default.ShrinkingMaterial);
	PrecacheIndex.__NFUN_1276__(class'Pawn'.default.ShrinkSound);
	PrecacheIndex.__NFUN_1276__(class'Pawn'.default.ExpandSound);
	PrecacheIndex.__NFUN_1266__(class'dnScreenSplatter_Blood');
	PrecacheIndex.__NFUN_1279__(class'ShrunkSmashDamage');
	PrecacheIndex.__NFUN_1277__(class'DukePlayer'.default.VoicePack, 'Stomp_Squish');
	PrecacheIndex.__NFUN_1277__(class'DukePlayer'.default.VoicePack, 'StompLines');
	return;
}

defaultproperties
{
	ShrinkTime=-1
	ParticleTimer=0.25
	ParticleCoolDown=1
	ParticleSystemClass='p_Decorations.ShrinkPod.ShrinkPod_Main'
	ParticleBurstSystemClass='p_Decorations.podfx.ShrinkPodBurstFX'
	DecoActivities_Default=/* Array type was not detected. */
}