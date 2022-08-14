/*******************************************************************************
 * dnBonePartMapper_Enforcer_LeftLeg generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnBonePartMapper_Enforcer_LeftLeg extends BonePartMapper
	exportstructs;

defaultproperties
{
	PartMapping(0)=(BoneName=LeftUpLeg,Part=12,BoneNameForDestroy=None)
	PartMapping(1)=(BoneName=LeftLeg,Part=14,BoneNameForDestroy=LeftLeg)
	PartMapping(2)=(BoneName=leftfoot,Part=16,BoneNameForDestroy=LeftLeg)
	PartMapping(3)=(BoneName=LeftToeBase,Part=16,BoneNameForDestroy=LeftLeg)
	PartMapping(4)=(BoneName=LeftToeIndex1,Part=16,BoneNameForDestroy=LeftLeg)
	PartMapping(5)=(BoneName=LeftToeMiddle1,Part=16,BoneNameForDestroy=LeftLeg)
	PartMapping(6)=(BoneName=LeftToePinky1,Part=16,BoneNameForDestroy=LeftLeg)
	DestroyableBones(0)=(BoneName=LeftLeg,bAddToLimbCount=true,LimbCapClass='dnCorpse_LimbCap_Enforcer_LegLeft_Lower',LimbCapMountInfo=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=-1249.126,Y=2.965251E-17,Z=1.291),Z=22.726),MountOriginVariance=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
	Gibs(0)=(BoneName=LeftLeg,ReqBones=none,RenderObject='sm_class_effects.Enforcer_Gibs.Enforcer_FootL_Gib',DrawScale=0,DrawScaleVariance=0,LocOffset=(X=-3.36833E-11,Y=2.954432E-17,Z=3.86),Z=13.96)
	FullyGibbedSoundName=Corpse_LimbExplode
	FullyGibbedFrozenSoundName=IcePart_Shatter_Small
	NumLimbsUntilDestructible=1
}