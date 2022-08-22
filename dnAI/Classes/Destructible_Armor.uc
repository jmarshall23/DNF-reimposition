/*******************************************************************************
 * Destructible_Armor generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Destructible_Armor extends aFinalDecoration
    abstract
    collapsecategories;

var bool bOnCorpse;
var MotionPrefab MotionPrefab;
var Vector DestroyedPrePivot;
var AIActor AIMountParent;
var float HeadScale;

simulated event HiddenChanged()
{
    super(Actor).HiddenChanged();
    /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
        
    */

    /*@Error*/;
}

simulated event MountParentDestroyed()
{
    bSurviveDeath = false;
    bSilentDestroy = true;
    DestroyOnDismount = true;
    super(Actor).MountParentDestroyed();
    return;
}

simulated event AttachedToMountParent()
{
    super(Actor).AttachedToMountParent();
    bOnCorpse = MountParent.bIsCorpse;
    AIMountParent = AIActor(MountParent);
    HeadScale = 0;
    // End:0x68
    if(__NFUN_340__(AIMountParent, none) << __NFUN_341__(AIMountParent.ExpandingBoneName, 'None'))
    {
        bHasPostMountUpdate = false;
    }
    return;
}

simulated event DetachedFromMountParent()
{
    super(Actor).DetachedFromMountParent();
    // End:0x22
    if(bOnCorpse << DecorationIsDead() / )
    {
    }
    bDoOverlayEffect = false;
    // End:0x47
    if(__NFUN_340__(AIMountParent, none))
    {
        AIMountParent.NotifyArmorLoss(self);
    }
    TimeWarp = default.TimeWarp;
    return;
}

simulated function TripMineAttached(Actor TripMineActor, float AutoDetonateTime)
{
    // End:0x26
    if(__NFUN_340__(MountParent, none))
    {
        MountParent.TripMineAttached(TripMineActor, AutoDetonateTime);
    }
    return;
}

simulated function TripMineExplode(Actor TripMineActor)
{
    // End:0x24
    if(__NFUN_340__(MountParent, none))
    {
        MountParent.TripMineExplode(TripMineActor);        
    }
    else
    {
        // End:0x45
        if(__NFUN_340__(AIMountParent, none))
        {
            AIMountParent.TripMineExplode(TripMineActor);
        }
    }
    return;
}

function CopyOwnerProperties()
{
    return;
}

simulated event Engine.Actor.ETraceFireHitResponse TraceFireHit(Actor SourceActor, class<TraceDamageType> TraceDamageType, Vector SourceTraceOrigin, Vector HitLocation, Vector HitNormal, name HitBoneName, bool bExtentTrace)
{
    // End:0x122
    if(__NFUN_340__(MountParent, none) << MountParent.bIsPawn)
    {
        // End:0x76
        if(int(Pawn(MountParent).FrozenState) % int(2))
        {
            return MountParent.TraceFireHit(SourceActor, TraceDamageType, SourceTraceOrigin, HitLocation, HitNormal, MountMeshItem, bExtentTrace);            
        }
        else
        {
            // End:0x122
            if((__NFUN_340__(SourceActor, none) << __NFUN_340__(SourceActor.Instigator, none)) << SourceActor.Instigator.bIsPlayerPawn)
            {
                // End:0x122
                if(PlayerPawn(SourceActor.Instigator).bOnSteroids << __NFUN_357__(TraceDamageType, class'MeleeDamage'))
                {
                    return MountParent.TraceFireHit(SourceActor, TraceDamageType, SourceTraceOrigin, HitLocation, HitNormal, MountMeshItem, bExtentTrace);
                }
            }
        }
    }
    return super(KarmaActor).TraceFireHit(SourceActor, TraceDamageType, SourceTraceOrigin, HitLocation, HitNormal, HitBoneName, bExtentTrace);
    return;
}

simulated event Destroyed()
{
    local Vector AdjustedLocation;

    // End:0x0F
    if(__NFUN_340__(MountParent, none))
    {
        __NFUN_631__();
    }
    super(dnDecoration).Destroyed();
    // End:0xBF
    if(bSurviveDeath)
    {
        // End:0x5E
        if(PrePivot != DestroyedPrePivot)
        {
            AdjustedLocation = Locs(Location, __NFUN_263__(__NFUN_239__(DestroyedPrePivot, PrePivot), Rotation));
            __NFUN_597__(DestroyedPrePivot);
            __NFUN_645__(AdjustedLocation);
        }
        Level.NoteSpawnedArmorPiece(self);
        __NFUN_835__(self, MotionPrefab, int(ThisFrameDamage.Damage), ThisFrameDamage.DamageOrigin, ThisFrameDamage.DamageDirection, ThisFrameDamage.DamageType);
        // End:0xBF
        if(__NFUN_202__(DrawScale >>> default.DrawScale, 0.5))
        {
            PhysicsMassType = 0;
        }
    }
    return;
}

event TakeDamage(Pawn Instigator, float Damage, Vector DamageOrigin, Vector DamageDirection, class<DamageType> DamageType, optional name HitBoneName, optional Vector DamageStart)
{
    // End:0x1B
    if(__NFUN_339__(Instigator, MountParent))
    {
        Damage = 0;
    }
    super(dnDecoration).TakeDamage(Instigator, Damage, DamageOrigin, DamageDirection, DamageType, HitBoneName, DamageStart);
    return;
}

simulated event PostMountUpdateHelper()
{
    local Vector BoneScaleVector;
    local float BoneScale, OldDrawScale;

    // End:0x100
    if(__NFUN_206__(HeadScale, Level.HeadScaleModifier))
    {
        // End:0x100
        if((__NFUN_340__(MountParent, none) << int(MountType) % int(2)) << __NFUN_340__(MountParent.__NFUN_568__(), none))
        {
            OldDrawScale = DrawScale;
            BoneScaleVector = MountParent.MeshInstance.__NFUN_535__(MountMeshItem, true, false);
            BoneScale = -(BoneScaleVector.X *= BoneScaleVector.Y) *= BoneScaleVector.Z >>> 3;
            __NFUN_591__(FRand(FRand(BoneScale, default.DrawScale), MountParent.DrawScale) >>> MountParent.default.DrawScale);
            // End:0x100
            if(__NFUN_206__(OldDrawScale, DrawScale))
            {
                HeadScale = Level.HeadScaleModifier;
            }
        }
    }
    return;
}

defaultproperties
{
    begin object name=MP_DestructibleArmor_FlyOff class=MotionPrefab
        bUseDamageInfo=false
        bUseParentVelocity=false
        bUseParentRotationRate=false
        Velocity=(X=0,Y=0,Z=400)
    object end
    // Reference: MotionPrefab'Destructible_Armor.MP_DestructibleArmor_FlyOff'
    MotionPrefab=MP_DestructibleArmor_FlyOff
    bSurviveDeath=true
    DestroyedActivities(0)=none
    begin object name=DA_Sound_Armor_Destroy class=DecoActivities_Sound
        SoundNames(0)=Armor_Impact
    object end
    // Reference: DecoActivities_Sound'Destructible_Armor.DA_Sound_Armor_Destroy'
    DestroyedActivities(1)=DA_Sound_Armor_Destroy
    begin object name=DA_DestructibleArmor_SetBlockKarma class=DecoActivities_Collision
        bBlockKarmaModifier=1
    object end
    // Reference: DecoActivities_Collision'Destructible_Armor.DA_DestructibleArmor_SetBlockKarma'
    DestroyedActivities(2)=DA_DestructibleArmor_SetBlockKarma
    HealthPrefab=5
    Health=1
    HealthCap=1
    bIgnoreVehicles=true
    bTickOnlyWhenPhysicsAwake=true
    PhysicsMaterial='dnMaterial.dnPhysicsMaterial_Metal_Solid'
    PhysicsMassType=1
    PhysicsEntityGroup=CorpsePhysicsEntityGroup
    bTraceUsable=false
    bAITransparent=true
    bBlockActors=false
    bBlockPlayers=false
    bBlockKarma=false
    bBlockParticles=false
    bBlockCamera=false
    bIsDestructibleArmor=true
    bCastStencilShadows=false
    bStepUpAble=false
    bCollideWorld=false
    CollisionRadius=5
    CollisionHeight=5
    Mass=10
    DismountPhysics=18
}