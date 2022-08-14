/*******************************************************************************
 * Settings_Bathroom_WindowCleanerBottle generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Settings_Bathroom_WindowCleanerBottle extends Settings_Bathroom
	collapsecategories;

defaultproperties
{
	bSurviveDeath=true
	DestroyedActivities(0)=none
	DestroyedActivities(1)='dnGame.DecoActivityDeclarations.DA_Sound_Destroyed_Generic'
	begin object name=DA_Display_Settings_Bthrm_WindowClnrBottle_Brkn class=DecoActivities_Display
		RenderObject='sm_class_decorations.Bottles.GlassCleanerBrkn_cd'
	object end
	// Reference: DecoActivities_Display'Settings_Bathroom_WindowCleanerBottle.DA_Display_Settings_Bthrm_WindowClnrBottle_Brkn'
	DestroyedActivities(2)=DA_Display_Settings_Bthrm_WindowClnrBottle_Brkn
	begin object name=DA_Physics_Settings_Bthrm_WindowClnrBottle_Brkn class=DecoActivities_Physics
		Mass=10
	object end
	// Reference: DecoActivities_Physics'Settings_Bathroom_WindowCleanerBottle.DA_Physics_Settings_Bthrm_WindowClnrBottle_Brkn'
	DestroyedActivities(3)=DA_Physics_Settings_Bthrm_WindowClnrBottle_Brkn
	SpawnOnDestroyedSimple(0)='dnParticles.dnDebris_Smoke'
	SpawnOnDestroyedSimple(1)='dnParticles.dnDebris_WaterSplash'
	SpawnOnDestroyed(0)=(SpawnClass='Settings_Bathroom_WindowCleanerBottle_Gibs',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0)
	bTickOnlyWhenPhysicsAwake=true
	PhysicsMaterial='dnMaterial.dnPhysicsMaterial_Plastic'
	Physics=18
	CollisionRadius=3.5
	CollisionHeight=8
	Mass=15
	StaticMesh='sm_class_decorations.Bottles.GlassCleaner_cd'
}