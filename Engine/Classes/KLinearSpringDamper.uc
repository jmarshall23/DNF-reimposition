/*******************************************************************************
 * KLinearSpringDamper generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KLinearSpringDamper extends KSpringDamper
    native
    collapsecategories
    notplaceable
    hidecategories(Collision,HeatVision,Interactivity,Karma,KarmaCollision);

cpptext
{
// Stripped
}

var(KAffector) const noexport float Length "The resting length of this spring.";
var(KAffector) const noexport float BreakLength "The spring will automatically break if it is forced to extend past this distance.";
var(KAffector) const noexport bool KConstraintActor1UseConstraintPoint "If set, the point the spring is attached to on KConstraintActor1 will be the location of this constraint relative to that actor. If false, the actor's origin will be used.";
var(KAffector) const noexport bool KConstraintActor2UseConstraintPoint "See [KConstraintActor1UseConstraintPoint].";

// Export UKLinearSpringDamper::execSetRestLength(FFrame&, void* const)
native(1102) final function SetRestLength(float NewRestLength);

// Export UKLinearSpringDamper::execSetBreakLength(FFrame&, void* const)
native(1103) final function SetBreakLength(float NewBreakLength);

// Export UKLinearSpringDamper::execSetConstraintActor1UseConstraintPoint(FFrame&, void* const)
native(1104) final function SetConstraintActor1UseConstraintPoint(bool bNewKConstraintActor1UseConstraintPoint);

// Export UKLinearSpringDamper::execSetConstraintActor2UseConstraintPoint(FFrame&, void* const)
native(1105) final function SetConstraintActor2UseConstraintPoint(bool bNewKConstraintActor2UseConstraintPoint);

defaultproperties
{
    KConstraintActor1UseConstraintPoint=true
    KConstraintActor2UseConstraintPoint=true
}