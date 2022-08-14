/*******************************************************************************
 * Biology_Generic_AnusDoor_CollisionSheet generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Biology_Generic_AnusDoor_CollisionSheet extends Biology_Generic;

var Biology_Generic_AnusDoor ParentAnus;

function PostVerifySelf()
{
	super(dnDecoration).PostVerifySelf();
	ParentAnus = Biology_Generic_AnusDoor(Owner);
	return;
}

defaultproperties
{
	DecoActivities_Default(0)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(UnBlockAnus),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Collision'Biology_Generic_AnusDoor_CollisionSheet.DA_Collision_AnusDoor_UnBlock'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
	DecoActivities_Default(1)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(BlockAnus),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Collision'Biology_Generic_AnusDoor_CollisionSheet.DA_Collision_AnusDoor_Block'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
	bTraceUsable=false
	bTraceShootable=false
	bAITransparent=true
	bBlockParticles=false
	bHidden=true
	StaticMesh='sm_geo_doors.AnusDoor.AnusDoorCollision_Box'
}