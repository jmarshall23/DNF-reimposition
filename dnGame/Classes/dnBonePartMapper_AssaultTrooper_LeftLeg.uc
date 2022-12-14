/*******************************************************************************
 * dnBonePartMapper_AssaultTrooper_LeftLeg generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnBonePartMapper_AssaultTrooper_LeftLeg extends BonePartMapper
    exportstructs;

defaultproperties
{
    PartMapping(0)=(BoneName=LeftUpLeg,Part=12,BoneNameForDestroy=None)
    PartMapping(1)=(BoneName=LeftLeg,Part=14,BoneNameForDestroy=LeftLeg)
    PartMapping(2)=(BoneName=leftfoot,Part=16,BoneNameForDestroy=LeftLeg)
    PartMapping(3)=(BoneName=LeftToeBase,Part=16,BoneNameForDestroy=LeftLeg)
    DestroyableBones(0)=(BoneName=LeftLeg,bAddToLimbCount=true,LimbCapClass='dnCorpse_LimbCap_Male_LegLeft_Lower',LimbCapMountInfo=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=0,Y=0,Z=12),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=32768),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),DestroyedEffect=none,FrozenDestroyedEffect='p_Weapons.FreezeRay_Projectile.FreezeRay_Projectile_Small_Spawner',ExplodeSound=Corpse_LimbExplode,FrozenExplodeSound=IcePart_Shatter_Small)
    Gibs(0)=(BoneName=LeftLeg,ReqBones=none,RenderObject='sm_class_effects.Assault_Trooper_Gibs.Assault_Trooper_FootL_Gib',DrawScale=0,DrawScaleVariance=0,LocOffset=(X=-5.459709,Y=-3.403139,Z=14.90217),RotOffset=(Pitch=-1720,Yaw=-29790,Roll=32265),Mass=15,GibChance=1,bKDNoPawnInteractions=false,bExplodeOut=false,bNoBloodyMess=false,bIgnorePawnAirCushion=false,bStaticGib=false,GibBloodyMess=none)
    FullyGibbedSoundName=Corpse_LimbExplode
    FullyGibbedFrozenSoundName=IcePart_Shatter_Small
    NumLimbsUntilDestructible=1
}