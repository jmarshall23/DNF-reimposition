/*******************************************************************************
 * Industrial_Generic_RoadBarricade_Gibs generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Industrial_Generic_RoadBarricade_Gibs extends dnDecoration_Gibs
	collapsecategories;

defaultproperties
{
	Gibs(0)=(RenderObject='sm_class_decorations.Barricade.Barricade_Gib1',bForcedOnly=false)
	Gibs(1)=(RenderObject='sm_class_decorations.Barricade.Barricade_Gib2',bForcedOnly=false)
	Gibs(2)=(RenderObject='sm_class_decorations.Barricade.Barricade_Gib3',bForcedOnly=false)
	Gibs(3)=(RenderObject='sm_class_decorations.Barricade.Barricade_Gib4',bForcedOnly=false)
	bPermanent=true
	DynamicInteractionClassification=1
	PhysicsMaterial='dnMaterial.dnPhysicsMaterial_Wood_Solid'
	PhysicsMassType=1
	PhysicsEntityGroup=RoadBarricadeGibs
	Physics=18
	bBlockPlayers=true
	Mass=20
}