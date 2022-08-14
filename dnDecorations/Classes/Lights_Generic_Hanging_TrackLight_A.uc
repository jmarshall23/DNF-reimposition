/*******************************************************************************
 * Lights_Generic_Hanging_TrackLight_A generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Lights_Generic_Hanging_TrackLight_A extends Lights_Generic
	abstract
	collapsecategories;

defaultproperties
{
	DestroyedActivities(0)=none
	DestroyedActivities(1)='dnGame.DecoActivityDeclarations.DA_Sound_Destroyed_Glass_Large'
	DestroyedActivities(2)=DecoActivities_Events'Lights_Generic.DA_Events_Lights_Generic_Destroyed'
	begin object name=DA_Display_Lights_Generic_Hanging_TrackLight_A_Brkn class=DecoActivities_Display
		RenderObject='sm_class_lights.TrackLighting.TrackLight_BRKN'
		Skins(0)=(Index=0,NewMaterialEx=none)
	object end
	// Reference: DecoActivities_Display'Lights_Generic_Hanging_TrackLight_A.DA_Display_Lights_Generic_Hanging_TrackLight_A_Brkn'
	DestroyedActivities(3)=DA_Display_Lights_Generic_Hanging_TrackLight_A_Brkn
	CollisionRadius=4
	CollisionHeight=4
	StaticMesh='sm_class_lights.TrackLighting.TrackLight'
}