/*******************************************************************************
 * Details_Generic_MouseTrap_A generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Details_Generic_MouseTrap_A extends Details_Generic
    collapsecategories;

var() noexport float TrapDamage "Amount of damage to issue to any Pawn coming into contact with the trap.";
var() noexport float TrapTimer "How long it takes for the trap to spring.";
var Pawn TrapSpringer;
var bool bTrapSprung;
var Details_Generic_MouseTrap_HingeBar_A HingeBar;
var Details_Generic_MouseTrap_Cheese Cheese;

function PostVerifySelf()
{
    super(dnDecoration).PostVerifySelf();
    HingeBar = Details_Generic_MouseTrap_HingeBar_A(FindMountedActor('HingeBar'));
    Cheese = Details_Generic_MouseTrap_Cheese(FindMountedActor('Cheese'));
    return;
}

event TakeDamage(Pawn Instigator, float Damage, Vector DamageOrigin, Vector DamageDirection, class<DamageType> DamageType, optional name HitBoneName, optional Vector DamageStart)
{
    super(dnDecoration).TakeDamage(Instigator, Damage, DamageOrigin, DamageDirection, DamageType, HitBoneName, DamageStart);
    SpringTrap();
    return;
}

event Bump(Actor Other)
{
    super(dnDecoration).Bump(Other);
    SpringTrap(Pawn(Other));
    return;
}

event KImpact(name SelfBoneName, KarmaActor Other, name OtherBoneName, Vector Position, Vector ImpactVelocity, Vector ImpactNormal)
{
    super(dnDecoration).KImpact(SelfBoneName, Other, OtherBoneName, Position, ImpactVelocity, ImpactNormal);
    SpringTrap(Pawn(Other));
    return;
}

event Used(Actor Other, Pawn EventInstigator)
{
    super(dnDecoration).Used(Other, EventInstigator);
    SpringTrap(EventInstigator);
    return;
}

final function SpringTrap(optional Pawn NewTrapSpringer)
{
    // End:0x0B
    if(bTrapSprung)
    {
        return;
    }
    bTrapSprung = true;
    TrapSpringer = NewTrapSpringer;
    DecoActivity(0, 'SpringTrap');
    // End:0x4C
    if(__NFUN_340__(HingeBar, none))
    {
        HingeBar.Snap(TrapTimer);
    }
    __NFUN_605__(TrapTimer, false, 'Snapped');
    Cheese.__NFUN_631__();
    return;
}

final function Snapped()
{
    local Pawn HitPawn;

    DecoActivity(0, 'Snapped');
    TrapHitPawn(TrapSpringer);
    // End:0x5F
    foreach __NFUN_751__(class'Pawn', HitPawn, FRand(VSize(CollisionRadius, CollisionHeight), 2), Location)
    {
        // End:0x5B
        if(__NFUN_340__(HitPawn, TrapSpringer))
        {
            TrapHitPawn(HitPawn);
        }
        // End:0x5F
        break;        
    }    
    return;
}

final function TrapHitPawn(Pawn TrapSpringer)
{
    // End:0x0E
    if(__NFUN_339__(TrapSpringer, none))
    {
        return;
    }
    TrapSpringer.TakeDamage(none, TrapDamage, Location, __NFUN_239__(TrapSpringer.Location, Location), class'MeleeDamage',, Location);
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super(dnDecoration).RegisterPrecacheComponents(PrecacheIndex);
    PrecacheIndex.__NFUN_1279__(class'MeleeDamage');
    return;
}

defaultproperties
{
    TrapDamage=20
    TrapTimer=0.15
    DecoActivities_Default(0)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(SpringTrap),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Sound'Details_Generic_MouseTrap_A.DA_Sound_Details_Generic_MouseTrap_A_SpringTrap','dnGame.DecoActivityDeclarations.DA_Ticking_TICK_NoRules'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    DecoActivities_Default(1)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(Snapped),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Sound'Details_Generic_MouseTrap_A.DA_Sound_Details_Generic_MouseTrap_A_Snapped',DecoActivities_KarmaImpulse'Details_Generic_MouseTrap_A.DA_KImpulse_Details_Generic_MouseTrap_A_Snapped','dnGame.DecoActivityDeclarations.DA_Interact_bUsable_Disable','dnGame.DecoActivityDeclarations.DA_Ticking_TICK_Normal'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    HealthPrefab=0
    bForceUsePhrase=true
    bUsable=true
    MountOnSpawn(0)=(bSkipVerifySelf=false,SpawnClass='Details_Generic_MouseTrap_HingeBar_A',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=HingeBar,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=0,Y=0,Z=-0.5),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),RenderObject=none,DrawScale=0)
    MountOnSpawn(1)=(bSkipVerifySelf=false,SpawnClass='Details_Generic_MouseTrap_Cheese',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=true,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=Cheese,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=-3,Y=0,Z=0.5),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),RenderObject=none,DrawScale=0)
    bIgnorePawnAirCushion=true
    bTickOnlyWhenPhysicsAwake=true
    PhysicsMaterial='dnMaterial.dnPhysicsMaterial_Wood_Solid'
    KImpactThreshold=25
    Physics=18
    CollisionRadius=8
    CollisionHeight=1.3
    Mass=10
    StaticMesh='sm_class_decorations.RatTrap.RatTrap_cd'
}