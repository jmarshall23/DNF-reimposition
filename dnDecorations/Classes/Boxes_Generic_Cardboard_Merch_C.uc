/*******************************************************************************
 * Boxes_Generic_Cardboard_Merch_C generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Boxes_Generic_Cardboard_Merch_C extends Boxes_Generic_Cardboard_Merch_A
	collapsecategories;

defaultproperties
{
	DestroyedActivities(0)=none
	DestroyedActivities(1)=DecoActivities_Sound'Boxes_Generic_Cardboard_Merch_A.DA_Sound_Boxes_Cardboard_Brkn'
	begin object name=DA_Display_Boxes_Cardboard_Merch_C_Brkn class=DecoActivities_Display
		RenderObject='sm_FBstadium.Locker_Room.Merch_Box_C_GIB'
	object end
	// Reference: DecoActivities_Display'Boxes_Generic_Cardboard_Merch_C.DA_Display_Boxes_Cardboard_Merch_C_Brkn'
	DestroyedActivities(2)=DA_Display_Boxes_Cardboard_Merch_C_Brkn
	DestroyedActivities(3)='dnGame.DecoActivityDeclarations.DA_Interact_bGrabbable_Disable'
	StaticMesh='sm_FBstadium.Locker_Room.Merch_Box_C'
}