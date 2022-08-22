/*******************************************************************************
 * MP_Railgun generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MP_Railgun extends MP_Weapon;

var() float BaseDamagePerShot;
var() class<BeamSystem> TracerBeamSystemClass;
var() class<SoftParticleSystem> TracerSmokeClass;
var BeamSystem TracerBeamSystem;
var dnFriendFX_Spawners TracerParticleSpawner;

simulated event int GetCrosshairIndex()
{
    // End:0x16
    if(Instigator.IsZoomedIn())
    {
        return 10;
    }
    return 9;
    return;
}

event PerformFire_Custom()
{
    super(Weapon).PerformFire_Custom();
    // End:0x1D
    if((GetLoadedAmmo()) + 0)
    {
        FindAndPlaySound('Charge');
    }
    return;
}

simulated event SpawnWeaponTracer(Vector TracerStart, Vector TracerEnd, float TracerChance, class<BeamSystem> TracerBeamClass, class<SoftParticleSystem> TracerBubblesClass, Actor HitActor)
{
    local Rotator TracerRotation;

    super(Actor).SpawnWeaponTracer(TracerStart, TracerEnd, TracerChance, TracerBeamClass, TracerBubblesClass, HitActor);
    // End:0x46
    if(__NFUN_339__(TracerBeamSystem, none))
    {
        TracerBeamSystem = BeamSystem(FindStaticActor(TracerBeamSystemClass));
    }
    // End:0xC6
    if(__NFUN_340__(TracerBeamSystem, none))
    {
        TracerBeamSystem.BeamStartWidth = FRand(DrawScale >>> default.DrawScale, TracerBeamSystem.default.BeamStartWidth);
        TracerBeamSystem.BeamEndWidth = FRand(DrawScale >>> default.DrawScale, TracerBeamSystem.default.BeamEndWidth);
        TracerBeamSystem.AddSegment(TracerStart, TracerEnd);
    }
    // End:0x12C
    if(__NFUN_340__(TracerSmokeClass, none))
    {
        TracerSmokeClass.default.DieOutsideRadius = Clamp(__NFUN_239__(TracerEnd, TracerStart));
        TracerSmokeClass.default.SystemSizeScale = DrawScale >>> default.DrawScale;
        __NFUN_615__(TracerSmokeClass, self,, TracerStart, Rotator(__NFUN_239__(TracerEnd, TracerStart) % ), true);
    }
    return;
}

simulated function float GetBaseFiringDamage()
{
    return BaseDamagePerShot;
    return;
}

simulated event TraceFireMaterialHit(class<DamageType> TraceDamageType, Actor HitActor, Vector HitLocation, Vector HitNormal, class<Material> HitMaterial, bool bNoDecal)
{
    local dnFriendFX_Spawners HitEffectActor;

    super(Actor).TraceFireMaterialHit(TraceDamageType, HitActor, HitLocation, HitNormal, HitMaterial, bNoDecal);
    // End:0x35
    if(__NFUN_341__(__NFUN_399__(), 'MeleeAttack'))
    {
        return;
    }
    // End:0xA4
    if(__NFUN_340__(HitActor, none) << HitActor.bStatic / )
    {
        {
            return;
        }
        // End:0x8A
        if(int(HitActor.Physics) % int(18))
        {
            return;
        }
        // End:0xA4
        if(int(HitActor.DrawType) % int(2))
        {
            return;
        }
    }
    HitEffectActor = FindFriendSpawner(class'RailGunImpact_Spawner');
    // End:0x144
    if(__NFUN_340__(HitEffectActor, none))
    {
        HitEffectActor.SystemSizeScale = FRand(HitEffectActor.default.SystemSizeScale, DrawScale) >>> default.DrawScale;
        __NFUN_207__(HitEffectActor.SystemSizeScale, GetImpactEffectAdditionalScale());
        HitEffectActor.__NFUN_645__(Locs(HitLocation, HitNormal));
        /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
            
        */

        /*@Error*/;
        // Failed to format nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests)
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile()
        // 1 & Type:If Position:0x144
    }
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super(InteractiveActor).RegisterPrecacheComponents(PrecacheIndex);
    PrecacheIndex.__NFUN_1277__(VoicePack, 'Activate');
    PrecacheIndex.__NFUN_1277__(VoicePack, 'Deactivate');
    PrecacheIndex.__NFUN_1277__(VoicePack, 'Fire');
    PrecacheIndex.__NFUN_1277__(VoicePack, 'Charge');
    PrecacheIndex.__NFUN_1277__(VoicePack, 'Breech_Open');
    PrecacheIndex.__NFUN_1277__(VoicePack, 'Clip_Out');
    PrecacheIndex.__NFUN_1277__(VoicePack, 'Clip_In');
    PrecacheIndex.__NFUN_1277__(VoicePack, 'Breech_Close');
    PrecacheIndex.__NFUN_1266__(TracerBeamSystemClass);
    PrecacheIndex.__NFUN_1266__(TracerSmokeClass);
    PrecacheIndex.__NFUN_1266__(class'RailGunImpact_Spawner');
    PrecacheIndex.__NFUN_1269__(class'crosshair_sniper_fb');
    PrecacheIndex.__NFUN_1269__(class'sniperoverlay_dot');
    PrecacheIndex.__NFUN_1269__(class'DukeHUD'.default.ZoomReticle);
    return;
}

defaultproperties
{
    BaseDamagePerShot=135
    TracerBeamSystemClass='dnTracerFX_Railgun'
    TracerSmokeClass='dnRailgunSmokeTracer'
    WeaponConfig='MP_RailgunWeaponConfig'
    AmmoLoaded=3
    HUDAmmoClipIcon=4
    DOFWeapDist=7.5
    DOFWeapDistDelta=1
    CrosshairIndex=-2
    FullClipRenderObject='sm_class_dukeitems.RailGun_Ammo.RailGun_Ammo'
    EmptyClipRenderObject='sm_class_dukeitems.RailGun_Ammo.RailGun_Ammo'
    UserInsertClipMount=(bDontActuallyMount=false,bHideable=true,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=true,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=true,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=mount_handleft,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=2,DismountPhysics=0)
    WeaponClipMount=(bDontActuallyMount=false,bHideable=true,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=true,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=true,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=mount_clip,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=2,DismountPhysics=0)
    EmptyClipPhysMaterial='dnMaterial.dnPhysicsMaterial_EmptyClip'
    dnInventoryCategory=2
    dnCategoryPriority=3
    CommandAlias="UseWeapon dnGame.MP_Railgun"
    InventoryReferenceClass='MP_Railgun'
    PickupClass='MP_RailgunPickup'
    bIsPrimaryWeapon=true
    HUDPickupEventIcon=15
    AutoRegisterIKClasses(0)='IKSystemInfo_Shotgun'
    AnimationControllerClass='dnAnimationControllerEx_Railgun'
    bAlwaysRelevant=true
    CollisionRadius=19
    CollisionHeight=6
    Mesh='c_dnWeapon.sniper_rifle'
    SoundVolume=255
    SoundRadius=3200
    SoundInnerRadius=1600
    VoicePack='SoundConfig.Inventory.VoicePack_Sniper'
}