/*******************************************************************************
 * dnControlHelper_Pinball_Light generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnControlHelper_Pinball_Light extends dnControlHelper_Pinball
	collapsecategories;

var() Color ActivatedColor;

simulated function Activate()
{
	bActivated = true;
	ActorColorList[0].ActorColor.R = ActivatedColor.R;
	ActorColorList[0].ActorColor.G = ActivatedColor.G;
	ActorColorList[0].ActorColor.B = ActivatedColor.B;
	ActorColorList[0].ActorColor.A = 255;
	return;
}

simulated function Deactivate()
{
	bActivated = false;
	ActorColorList[0].ActorColor.R = 0;
	ActorColorList[0].ActorColor.G = 0;
	ActorColorList[0].ActorColor.B = 0;
	ActorColorList[0].ActorColor.A = 255;
	return;
}

defaultproperties
{
	PhysicsEntityGroup=PinballTable
	DrawType=8
	StaticMesh='sm_class_decorations.Arcades.Pinball_Light_Circle'
	ActorColorList(0)=(ActorColor=(B=76,G=3,R=1,A=0),G=0,B=0,A=0)
}