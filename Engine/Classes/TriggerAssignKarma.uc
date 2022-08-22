/*******************************************************************************
 * TriggerAssignKarma generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class TriggerAssignKarma extends TriggerAssign
    collapsecategories
    notplaceable
    hidecategories(Filter,Interactivity,Karma,Lighting,Networking,Sound,Collision,Interpolation,movement);

var(AssignKarma) name VelocityAccelerationModifierBone;
var(AssignKarma) Object.EVectModifier LinearVelocityModifier;
var(AssignKarma) Vector LinearVelocityValue;
var(AssignKarma) Object.EVectModifier AngularVelocityModifier;
var(AssignKarma) Vector AngularVelocityValue;
var(AssignKarma) Object.EVectModifier LinearAccelerationModifier;
var(AssignKarma) Vector LinearAccelerationValue;
var(AssignKarma) Object.EVectModifier AngularAccelerationModifier;
var(AssignKarma) Vector AngularAccelerationValue;
var(AssignKarma) Object.EBitModifier bTakeDamageMomentumModifier;
var(AssignKarma) Object.EBitModifier bTakeExplosionDamageMomentumModifier;
var(AssignKarmaDamage) Object.EBitModifier bIgnoresPhysicsDamageModifier;
var(AssignKarma) Object.EFloatModifier KFrictionModifier;
var(AssignKarma) float KFrictionValue;
var(AssignKarma) Object.EFloatModifier KRestitutionModifier;
var(AssignKarma) float KRestitutionValue;
var(AssignKarma) Object.EFloatModifier KLinearDampingModifier;
var(AssignKarma) float KLinearDampingValue;
var(AssignKarma) Object.EFloatModifier KAngularDampingModifier;
var(AssignKarma) float KAngularDampingValue;
var(AssignKarma) noexport class<PhysicsMaterial> NewPhysicsMaterial "If non-None, this will replace the existing PhysicsMaterial value on affected actors.";
var(AssignKarma) bool bAssignPhysicsMassType;
var(AssignKarma) Object.EPhysicsMassType NewPhysicsMassType;
var(AssignKarma) Object.EFloatModifier MagneticChargeModifier;
var(AssignKarma) float MagneticChargeValue;
var(AssignKarma) Object.EFloatModifier MagneticRangeModifier;
var(AssignKarma) float MagneticRangeValue;
var(AssignKarma) Object.EFloatModifier GravityScaleModifier;
var(AssignKarma) float GravityScaleValue;
var(AssignKarma) Object.EFloatModifier DensityModifier;
var(AssignKarma) float DensityValue;
var(AssignKarma) Object.EFloatModifier EnableDisableThresholdModifier;
var(AssignKarma) float EnableDisableThresholdValue;
var(AssignKarma) Object.EFloatModifier PhysicsTimeScaleModifier;
var(AssignKarma) float PhysicsTimeScaleValue;
var(AssignKarma) Object.ENameModifier PhysicsEntityGroupModifier;
var(AssignKarma) name PhysicsEntityGroupValue;
var(AssignKarma) Object.EFloatModifier ThrowForceScaleModifier;
var(AssignKarma) float ThrowForceScale;
var(AssignKarma) Object.EFloatModifier ThrowForceScaleAIModifier;
var(AssignKarma) float ThrowForceScaleAI;
var(AssignKarmaDamage) Object.EFloatModifier MinImpactTimeModifier;
var(AssignKarmaDamage) float MinImpactTime;
var(AssignKarmaDamage) Object.EFloatModifier MinDamageVelocityModifier;
var(AssignKarmaDamage) float MinDamageVelocity;
var(AssignKarmaDamage) Object.EFloatModifier MinDamageVelocityThrownModifier;
var(AssignKarmaDamage) float MinDamageVelocityThrown;
var(AssignKarmaDamage) Object.EFloatModifier MinDamageVelocityDroppedModifier;
var(AssignKarmaDamage) float MinDamageVelocityDropped;
var(AssignKarmaDamage) Object.EFloatModifier FixedPhysicsDamageToNotPlayerModifier;
var(AssignKarmaDamage) float FixedPhysicsDamageToNotPlayer;
var(AssignKarmaDamage) Object.EFloatModifier FixedPhysicsDamageToPlayerModifier;
var(AssignKarmaDamage) float FixedPhysicsDamageToPlayer;
var(AssignKarmaDamage) bool bModifyOverridePhysicsImpactDamageType;
var(AssignKarmaDamage) class<DamageType> OverridePhysicsImpactDamageType;
var(AssignKarma) bool bAssignStaticInteractionClassification;
var(AssignKarma) bool bAssignDynamicInteractionClassification;
var(AssignKarma) KarmaActor.EStaticInteractionClassification NewStaticInteractionClassification;
var(AssignKarma) KarmaActor.EDynamicInteractionClassification NewDynamicInteractionClassification;
var(AssignKarmaLaunch) noexport bool bLaunchTowardsTarget "If true, Actor will be launched at a specific target in the world.";
var(AssignKarmaLaunch) noexport bool bLaunchLeadTarget "If true, launch velocity will be modified to go toward the target's destination (based on current velocity) instead of where the target is at the moment of activation.";
var(AssignKarmaLaunch) noexport bool bLaunchDisablePlayerAirControl "If true and launching a player, air control will be disabled for the duration of the launch.";
var(AssignKarmaLaunch) noexport deprecated Actor LaunchTarget "Actor to use for our launch target.";
var(AssignKarmaLaunch) noexport deprecated name LaunchTargetTag "Tag of the object to use as the launch target.";
var(AssignKarmaLaunch) noexport float LaunchMaxHeight "If the target is above the starting position, this is the max height above the target you want to go in the arc of motion." "If the target is below, this should have no effect.";
var(AssignCrushing) Object.EBitModifier bCanCrushOthersModifier;

function DoAssign(Actor A)
{
    local KarmaActor K;
    local InteractiveActor IA;

    super.DoAssign(A);
    K = KarmaActor(A);
    // End:0x61C
    if(__NFUN_340__(K, none))
    {
        // End:0x51
        if(int(LinearVelocityModifier) + int(0))
        {
            K.__NFUN_790__(LinearVelocityValue, LinearVelocityModifier, VelocityAccelerationModifierBone);
        }
        // End:0x7B
        if(int(AngularVelocityModifier) + int(0))
        {
            K.__NFUN_791__(AngularVelocityValue, AngularVelocityModifier, VelocityAccelerationModifierBone);
        }
        // End:0xA5
        if(int(LinearAccelerationModifier) + int(0))
        {
            K.__NFUN_791__(LinearAccelerationValue, LinearAccelerationModifier, VelocityAccelerationModifierBone);
        }
        // End:0xCF
        if(int(AngularAccelerationModifier) + int(0))
        {
            K.__NFUN_791__(AngularAccelerationValue, AngularAccelerationModifier, VelocityAccelerationModifierBone);
        }
        K.bTakeDamageMomentum = __NFUN_346__(bTakeDamageMomentumModifier, K.bTakeDamageMomentum);
        K.bTakeExplosionDamageMomentum = __NFUN_346__(bTakeExplosionDamageMomentumModifier, K.bTakeExplosionDamageMomentum);
        K.bIgnoresPhysicsDamage = __NFUN_346__(bIgnoresPhysicsDamageModifier, K.bIgnoresPhysicsDamage);
        K.KLinearDamping = __NFUN_348__(KLinearDampingModifier, K.KLinearDamping, KLinearDampingValue);
        K.KAngularDamping = __NFUN_348__(KAngularDampingModifier, K.KAngularDamping, KAngularDampingValue);
        // End:0x1C3
        if(__NFUN_340__(NewPhysicsMaterial, none))
        {
            K.PhysicsMaterial = NewPhysicsMaterial;
        }
        // End:0x1E1
        if(bAssignPhysicsMassType)
        {
            K.PhysicsMassType = NewPhysicsMassType;
        }
        K.__NFUN_810__(__NFUN_348__(KFrictionModifier, K.KFriction, KFrictionValue), __NFUN_348__(KRestitutionModifier, K.KRestitution, KRestitutionValue));
        K.__NFUN_813__(__NFUN_348__(MagneticChargeModifier, K.MagneticCharge, MagneticChargeValue), __NFUN_348__(MagneticRangeModifier, K.MagneticRange, MagneticRangeValue));
        K.GravityScale = __NFUN_348__(GravityScaleModifier, K.GravityScale, GravityScaleValue);
        K.Density = __NFUN_348__(DensityModifier, K.Density, DensityValue);
        K.__NFUN_814__(__NFUN_348__(EnableDisableThresholdModifier, K.EnableDisableThreshold, EnableDisableThresholdValue));
        K.__NFUN_815__(__NFUN_348__(PhysicsTimeScaleModifier, K.PhysicsTimeScale, PhysicsTimeScaleValue));
        K.MinImpactTime = __NFUN_348__(MinImpactTimeModifier, K.MinImpactTime, MinImpactTime);
        K.MinDamageVelocity = __NFUN_348__(MinDamageVelocityModifier, K.MinDamageVelocity, MinDamageVelocity);
        K.MinDamageVelocityThrown = __NFUN_348__(MinDamageVelocityThrownModifier, K.MinDamageVelocityThrown, MinDamageVelocityThrown);
        K.MinDamageVelocityDropped = __NFUN_348__(MinDamageVelocityDroppedModifier, K.MinDamageVelocityDropped, MinDamageVelocityDropped);
        K.FixedPhysicsDamageToNotPlayer = __NFUN_348__(FixedPhysicsDamageToNotPlayerModifier, K.FixedPhysicsDamageToNotPlayer, FixedPhysicsDamageToNotPlayer);
        K.FixedPhysicsDamageToPlayer = __NFUN_348__(FixedPhysicsDamageToPlayerModifier, K.FixedPhysicsDamageToPlayer, FixedPhysicsDamageToPlayer);
        // End:0x43B
        if(bModifyOverridePhysicsImpactDamageType)
        {
            K.OverridePhysicsImpactDamageType = OverridePhysicsImpactDamageType;
        }
        // End:0x472
        if(int(PhysicsEntityGroupModifier) + int(0))
        {
            K.__NFUN_816__(__NFUN_351__(PhysicsEntityGroupModifier, K.PhysicsEntityGroup, PhysicsEntityGroupValue));
        }
        IA = InteractiveActor(K);
        // End:0x4E6
        if(__NFUN_340__(IA, none))
        {
            IA.ThrowForceScale = __NFUN_348__(ThrowForceScaleModifier, IA.ThrowForceScale, ThrowForceScale);
            IA.ThrowForceScaleAI = __NFUN_348__(ThrowForceScaleAIModifier, IA.ThrowForceScaleAI, ThrowForceScaleAI);
        }
        // End:0x501
        if(bAssignStaticInteractionClassification)
        {
            K.__NFUN_811__(NewStaticInteractionClassification);
        }
        // End:0x51C
        if(bAssignDynamicInteractionClassification)
        {
            K.__NFUN_812__(NewDynamicInteractionClassification);
        }
        // End:0x5F3
        if(bLaunchTowardsTarget)
        {
            // End:0x559
            if(__NFUN_339__(LaunchTarget, none) << __NFUN_342__(LaunchTargetTag, 'None'))
            {
                LaunchTarget = FindActor(class'Actor', LaunchTargetTag);
            }
            // End:0x5F3
            if(__NFUN_340__(LaunchTarget, none))
            {
                // End:0x5B9
                if(bLaunchLeadTarget)
                {
                    K.JumpPadLaunch(K.Location, LaunchTarget.Location, LaunchMaxHeight, LaunchTarget.Velocity, bLaunchDisablePlayerAirControl);                    
                }
                else
                {
                    K.JumpPadLaunch(K.Location, LaunchTarget.Location, LaunchMaxHeight,, bLaunchDisablePlayerAirControl);
                }
            }
        }
        K.bCanCrushOthers = __NFUN_346__(bCanCrushOthersModifier, K.bCanCrushOthers);
    }
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super.RegisterPrecacheComponents(PrecacheIndex);
    // End:0x26
    if(bModifyOverridePhysicsImpactDamageType)
    {
        PrecacheIndex.__NFUN_1279__(OverridePhysicsImpactDamageType);
    }
    return;
}

defaultproperties
{
    LaunchMaxHeight=50
}