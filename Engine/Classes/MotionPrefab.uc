/*******************************************************************************
 * MotionPrefab generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MotionPrefab extends Object
	native;

enum EVelocityRelativeType
{
	VRT_World,
	VRT_Self,
	VRT_Parent,
	VRT_AwayFromParent
};

var() noexport bool bNoMotion "When TRUE, the object does not become physics.";
var() noexport bool bUseDamageInfo "When TRUE, the damage recieved by the spawning actor will be taken into account in our velocity calculations.";
var() noexport bool bUseParentVelocity "When TRUE, the LinearVelocity of the spawning actor will be added to our initial LinearVelocity.";
var() noexport bool bUseParentRotationRate "When TRUE, the AngularVelocity of the spawning actor will be added to our initial AngularVelocity.";
var() noexport MotionPrefab.EVelocityRelativeType VelocityRelativeType "VRT_World means Velocity will be relative to the world." "VRT_Self means relative to this actors rotation." "VRT_Parent means relative to the actor spawning us." "VRT_AwayFromParent means relative to the rotation defined by the vector from my parent to me.";
var() noexport Vector Velocity "Initial LinearVelocity of the actor.";
var() noexport Vector VelocityVariance "Amount to vary the initial LinearVelocity.";
var() noexport Rotator RotationRate "Initial AngularVelocity to apply to this actor.";
var() noexport Rotator RotationRateVariance "Amount of initial AngularVelocity variance.";

defaultproperties
{
	bUseDamageInfo=true
	bUseParentVelocity=true
	bUseParentRotationRate=true
}