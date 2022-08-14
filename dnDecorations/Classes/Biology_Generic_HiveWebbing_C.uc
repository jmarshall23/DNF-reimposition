/*******************************************************************************
 * Biology_Generic_HiveWebbing_C generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Biology_Generic_HiveWebbing_C extends Biology_Generic_HiveWebbing
	collapsecategories;

defaultproperties
{
	DestroyedActivities(0)=none
	DestroyedActivities(1)=DecoActivities_Sound'Biology_Generic_HiveWebbing.DA_Sound_HiveWebbing_Destroyed'
	begin object name=DA_Display_HiveWebC_Destroyed class=DecoActivities_Display
		RenderObject='sm_geo_decorations.alien.HiveB_webbing_Ends'
	object end
	// Reference: DecoActivities_Display'Biology_Generic_HiveWebbing_C.DA_Display_HiveWebC_Destroyed'
	DestroyedActivities(2)=DA_Display_HiveWebC_Destroyed
	SpawnOnDestroyed(0)=(SpawnClass='Biology_Generic_HiveWebbing_Gib_J',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0)
	SpawnOnDestroyed(1)=(SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=0.0002061278,Y=2.80251E-17,Z=-50.189),Z=7.643)
	SpawnOnDestroyed(2)=(OffsetVariance=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0)
	SpawnOnDestroyed(3)=(Rotation=(Pitch=8709,Yaw=571080704,Roll=0),Roll=0)
	SpawnOnDestroyed(4)=(RotationVariance=(Pitch=8709,Yaw=571080704,Roll=0),Roll=0)
	DestroyedParticleFriendEffects(0)=(bAbsoluteLocation=false,bAbsoluteRotation=false,Scale=0,BoneName=None,Location=(X=1.291717E-41,Y=2.797242E-17,Z=-45),Z=3)
	DestroyedParticleFriendEffects(1)=(Rotation=(Pitch=8709,Yaw=571080704,Roll=0),Roll=0)
	StaticMesh='sm_geo_decorations.alien.HiveB_webbing_Breakable'
}