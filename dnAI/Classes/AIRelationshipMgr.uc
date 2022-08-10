/*******************************************************************************
 * AIRelationshipMgr generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AIRelationshipMgr extends Object
	native;

cpptext
{
// Stripped
}

// Export UAIRelationshipMgr::execWeightForAttitude(FFrame&, void* const)
native final function float WeightForAttitude(int Att)
{
	//native.Att;	
}

// Export UAIRelationshipMgr::execAttitudeForWeight(FFrame&, void* const)
native final function int AttitudeForWeight(float Weight)
{
	//native.Weight;	
}

// Export UAIRelationshipMgr::execAddClassRelation(FFrame&, void* const)
native final function bool AddClassRelation(AIActor MyOwner, class<Actor> NewClass, Engine.Actor.EAIAttitude NewAttitude, float NewDamageThreshold)
{
	//native.MyOwner;
	//native.NewClass;
	//native.NewAttitude;
	//native.NewDamageThreshold;	
}

// Export UAIRelationshipMgr::execGetAttitudeTowards(FFrame&, void* const)
native final function float GetAttitudeTowards(AIActor MyOwner, Pawn Subject, string Caller)
{
	//native.MyOwner;
	//native.Subject;
	//native.Caller;	
}
