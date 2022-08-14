/*******************************************************************************
 * Destructible_MetalFence_Section generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Destructible_MetalFence_Section extends dnDestructibleBuildingDefinition within dnDestructibleBuilding;

defaultproperties
{
	Parts(0)=(StaticMesh='SM_Lvl_Desert.Destructible.gen_sheetmetal_2',Location=(X=-9.45304E+22,Y=2.954668E-17,Z=1.924591),Z=4.000122)
	Parts(1)=(Rotation=(Pitch=8741,Yaw=572915712,Roll=16372),Roll=0)
	Parts(2)=(Scale=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
	Parts(3)=(SkewPitch=0,SkewYaw=0,SkewRoll=0,RandomSeed=0,OverrideSurvivalChance=0,OverrideCollisionChance=0,OverrideDensity=0,Mass=0,PhysicsMaterial='dnMaterial.dnPhysicsMaterial_Metal_Solid',bDefaultInteractionClass=false)
	Parts(4)=(StaticMesh='SM_Lvl_Desert.Destructible.gen_sheetmetal_3',Location=(X=-7.760502E-26,Y=2.95458E-17,Z=0.925568),Z=-1.999878)
	Parts(5)=(Rotation=(Pitch=8741,Yaw=572915712,Roll=16372),Roll=0)
	Parts(6)=(Scale=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
	Parts(7)=(SkewPitch=0,SkewYaw=0,SkewRoll=0,RandomSeed=0,OverrideSurvivalChance=0,OverrideCollisionChance=0,OverrideDensity=0,Mass=0,PhysicsMaterial='dnMaterial.dnPhysicsMaterial_Metal_Solid',bDefaultInteractionClass=false)
	Parts(8)=(StaticMesh='SM_Lvl_Desert.Destructible.gen_sheetmetal_4',Location=(X=1.193141E-06,Y=2.965472E-17,Z=-0.075409),Z=4.000122)
	Parts(9)=(Rotation=(Pitch=8741,Yaw=572915712,Roll=16372),Roll=0)
	ParticleEffects(0)=(SpawnerClass='p_Decorations.Debris_WoodBuilding.Debris_WoodBuilding_Spawner',LocationOffset=(X=1.292418E-41,Y=2.965526E-17,Z=0),Z=-32)
	ParticleEffects(1)=(RotationOffset=(Pitch=8741,Yaw=572915712,Roll=16384),Roll=0)
	ShellPart=(StaticMesh='SM_Lvl_Desert.Destructible_Shells.MetalFence_Section',Location=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
}