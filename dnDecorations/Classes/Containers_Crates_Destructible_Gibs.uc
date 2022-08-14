/*******************************************************************************
 * Containers_Crates_Destructible_Gibs generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Containers_Crates_Destructible_Gibs extends aFinalDecoration_Gibs
	abstract
	collapsecategories;

defaultproperties
{
	Gibs(0)=(RenderObject='sm_class_decorations.Crate.Wooden_CrateA_Gib',bForcedOnly=false)
	Gibs(1)=(RenderObject='sm_class_decorations.Crate.Wooden_CrateB_Gib',bForcedOnly=false)
	Gibs(2)=(RenderObject='sm_class_decorations.Crate.Wooden_CrateC_Gib',bForcedOnly=false)
	Gibs(3)=(RenderObject='sm_class_decorations.Crate.Wooden_CrateD_Gib',bForcedOnly=false)
	Gibs(4)=(RenderObject='sm_class_decorations.Crate.Wooden_CrateE_Gib',bForcedOnly=false)
	HealthPrefab=1
	DynamicInteractionClassification=7
	PhysicsMaterial='dnMaterial.dnPhysicsMaterial_Wood_Solid'
	PhysicsMassType=0
	Density=5
	PhysicsEntityGroup=DestructibleCrate
	Physics=0
	bBlockActors=false
	bStepUpAble=false
	bDontUseMeqonPhysics=true
}