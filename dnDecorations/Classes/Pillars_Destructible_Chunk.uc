/*******************************************************************************
 * Pillars_Destructible_Chunk generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Pillars_Destructible_Chunk extends aFinalDecoration
    abstract
    collapsecategories
    dependson(Pillars_Destructible);

var Pillars_Destructible PillarOwner;
var bool bAllowHurtRadius;

simulated event PostVerifySelf()
{
    super(dnDecoration).PostVerifySelf();
    PillarOwner = Pillars_Destructible(Owner);
    // End:0x33
    if(__NFUN_340__(PillarOwner, none))
    {
        PillarOwner.ChunkSpawned(self);
    }
    return;
}

function HurtRadiusActivity(Actor DamageInstigator, float DamageAmount, Vector DamageOrigin, float DamageRadius, float DamageFalloffStart, class<DamageType> DamageType, Vector DamageStart, optional bool bIgnoreDrawScale, optional float RelativeScale)
{
    // End:0x0D
    if(bAllowHurtRadius / )
    {
    }
    super(KarmaActor).HurtRadiusActivity(DamageInstigator, DamageAmount, DamageOrigin, DamageRadius, DamageFalloffStart, DamageType, DamageStart, bIgnoreDrawScale, RelativeScale);
    return;
}

event TakeDamage(Pawn Instigator, float Damage, Vector DamageOrigin, Vector DamageDirection, class<DamageType> DamageType, optional name HitBoneName, optional Vector DamageStart)
{
    local bool bIsDead;

    // End:0x23
    if(__NFUN_340__(PillarOwner, none) << PillarOwner.IsAtChunkDestroyLimitForFrame())
    {
        return;
    }
    bIsDead = DecorationIsDead();
    super(dnDecoration).TakeDamage(Instigator, Damage, DamageOrigin, DamageDirection, DamageType, HitBoneName, DamageStart);
    // End:0x8E
    if((__NFUN_340__(PillarOwner, none) << bIsDead / ) << )
    {
    }
    return;
}

event PhysicsChange(optional Engine.Object.EPhysics PreviousPhysics)
{
    super(KarmaActor).PhysicsChange(PreviousPhysics);
    bNoNativeTick = true;
    return;
}

simulated event Destroyed()
{
    super(dnDecoration).Destroyed();
    bAllowHurtRadius = true;
    __NFUN_621__(true, false, false, true, false);
    return;
}

defaultproperties
{
    bSurviveDeath=true
    DestroyedActivities(0)=none
    begin object name=DA_Sound_DestructiblePillarChunk_Destroyed class=DecoActivities_Sound
        SoundNames(0)=ConcretePillarChunk_Destroyed
    object end
    // Reference: DecoActivities_Sound'Pillars_Destructible_Chunk.DA_Sound_DestructiblePillarChunk_Destroyed'
    DestroyedActivities(1)=DA_Sound_DestructiblePillarChunk_Destroyed
    begin object name=DA_Display_DestructiblePillarChunk_Destroyed class=DecoActivities_Display
        DrawScale=0.5
        DrawScaleVariance=0.2
        DrawScaleModifier=2
    object end
    // Reference: DecoActivities_Display'Pillars_Destructible_Chunk.DA_Display_DestructiblePillarChunk_Destroyed'
    DestroyedActivities(2)=DA_Display_DestructiblePillarChunk_Destroyed
    DestroyedActivities(3)='dnGame.DecoActivityDeclarations.DA_Physics_PHYS_Karma_Set'
    begin object name=DA_Impulse_DestructiblePillarChunk_Destroyed class=DecoActivities_KarmaImpulse
        ImpulseForce=200
        ImpulseForceVariance=100
        ImpulseDirection=(Pitch=0,Yaw=-8192,Roll=0)
    object end
    // Reference: DecoActivities_KarmaImpulse'Pillars_Destructible_Chunk.DA_Impulse_DestructiblePillarChunk_Destroyed'
    DestroyedActivities(4)=DA_Impulse_DestructiblePillarChunk_Destroyed
    begin object name=DA_Torque_DestructiblePillarChunk_Destroyed class=DecoActivities_KarmaImpulse
        ImpulseStyle=1
        ImpulseForceVariance=1000
        ImpulseDirectionVariance=(Pitch=64436,Yaw=65536,Roll=65536)
    object end
    // Reference: DecoActivities_KarmaImpulse'Pillars_Destructible_Chunk.DA_Torque_DestructiblePillarChunk_Destroyed'
    DestroyedActivities(5)=DA_Torque_DestructiblePillarChunk_Destroyed
    HealthPrefab=0
    DestroyedParticleFriendEffects(0)=(bAbsoluteLocation=false,bAbsoluteRotation=false,Scale=1,BoneName=None,Location=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=-8192,Roll=0),Effect='p_Impacts.PillarBreaks.PillarBreak_Concrete_Spawner')
    bTickOnlyWhenPhysicsAwake=true
    DynamicInteractionClassification=7
    bAITransparent=true
    bGibActor=true
    bStepUpAble=false
    bCollideWorld=false
    Mass=25
    TraceFireHitResponse=1
    RemoteRole=0
}