/*******************************************************************************
 * MeshInstance generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MeshInstance extends Primitive
	transient
	native
	noexport;

var const int UnrealMesh;
var const int Actor;
var const int FrameCount;
var const int SkinMeshInstance;
var array<AnimChanInfo> AnimInfoArray;
var private const int InstanceData;
var array<int> ProjectorList;
var private float TimeWitholding;

// Export UMeshInstance::execGetBoneCount(FFrame&, void* const)
native(523) final function int GetBoneCount();

// Export UMeshInstance::execGetBoneName(FFrame&, void* const)
native(524) final function name GetBoneName(int BoneIndex)
{
	//native.BoneIndex;	
}

// Export UMeshInstance::execBoneExists(FFrame&, void* const)
native(525) final function bool BoneExists(name BoneName)
{
	//native.BoneName;	
}

// Export UMeshInstance::execBoneGetParentName(FFrame&, void* const)
native(526) final function name BoneGetParentName(name BoneName)
{
	//native.BoneName;	
}

// Export UMeshInstance::execBoneGetChildCount(FFrame&, void* const)
native(527) final function int BoneGetChildCount(name BoneName)
{
	//native.BoneName;	
}

// Export UMeshInstance::execBoneGetChildName(FFrame&, void* const)
native(528) final function name BoneGetChildName(name BoneName, int ChildIndex)
{
	//native.BoneName;
	//native.ChildIndex;	
}

// Export UMeshInstance::execBoneSupportsPhysics(FFrame&, void* const)
native(529) final function bool BoneSupportsPhysics(name BoneName)
{
	//native.BoneName;	
}

// Export UMeshInstance::execRotateBoneAroundAxis(FFrame&, void* const)
native(530) final function RotateBoneAroundAxis(name BoneName, Vector Axis, int Angle)
{
	//native.BoneName;
	//native.Axis;
	//native.Angle;	
}

// Export UMeshInstance::execAimBoneAtPoint(FFrame&, void* const)
native(531) final function AimBoneAtPoint(name BoneName, Vector Alignment, Vector Point, optional float AimThreshold, optional float MaxAngleOffset)
{
	//native.BoneName;
	//native.Alignment;
	//native.Point;
	//native.AimThreshold;
	//native.MaxAngleOffset;	
}

// Export UMeshInstance::execMakeReferencePose(FFrame&, void* const)
native(532) final function MakeReferencePose();

// Export UMeshInstance::execBoneGetTranslate(FFrame&, void* const)
native(533) final function Vector BoneGetTranslate(name BoneName, optional bool bAbsolute, optional bool bDefault, optional float Scale)
{
	//native.BoneName;
	//native.bAbsolute;
	//native.bDefault;
	//native.Scale;	
}

// Export UMeshInstance::execBoneGetRotate(FFrame&, void* const)
native(534) final function Rotator BoneGetRotate(name BoneName, optional bool bAbsolute, optional bool bDefault)
{
	//native.BoneName;
	//native.bAbsolute;
	//native.bDefault;	
}

// Export UMeshInstance::execBoneGetScale(FFrame&, void* const)
native(535) final function Vector BoneGetScale(name BoneName, optional bool bAbsolute, optional bool bDefault)
{
	//native.BoneName;
	//native.bAbsolute;
	//native.bDefault;	
}

// Export UMeshInstance::execBoneGetLastFrameTranslate(FFrame&, void* const)
native(536) final function Vector BoneGetLastFrameTranslate(name BoneName)
{
	//native.BoneName;	
}

// Export UMeshInstance::execBoneSetTranslate(FFrame&, void* const)
native(537) final function bool BoneSetTranslate(name BoneName, Vector t, optional bool bAbsolute)
{
	//native.BoneName;
	//native.t;
	//native.bAbsolute;	
}

// Export UMeshInstance::execBoneSetRotate(FFrame&, void* const)
native(538) final function bool BoneSetRotate(name BoneName, Rotator R, optional bool bAbsolute, optional bool bRelCurrent)
{
	//native.BoneName;
	//native.R;
	//native.bAbsolute;
	//native.bRelCurrent;	
}

// Export UMeshInstance::execBoneSetScale(FFrame&, void* const)
native(539) final function bool BoneSetScale(name BoneName, Vector S, optional bool bAbsolute)
{
	//native.BoneName;
	//native.S;
	//native.bAbsolute;	
}

// Export UMeshInstance::execBoneGetNearest(FFrame&, void* const)
native(540) final function name BoneGetNearest(Vector TestLocation, optional bool bSkipMounts)
{
	//native.TestLocation;
	//native.bSkipMounts;	
}

// Export UMeshInstance::execCopyBoneInfo(FFrame&, void* const)
native(541) final function bool CopyBoneInfo(MeshInstance SourceInstance, optional name BaseBoneName)
{
	//native.SourceInstance;
	//native.BaseBoneName;	
}

// Export UMeshInstance::execCreateAnimGroup(FFrame&, void* const)
native(542) final function bool CreateAnimGroup(name GroupName, int Channel, optional name ParentGroupName)
{
	//native.GroupName;
	//native.Channel;
	//native.ParentGroupName;	
}

// Export UMeshInstance::execSwapChannel(FFrame&, void* const)
native(543) final function bool SwapChannel(int Channel_1, int Channel_2, optional name GroupName)
{
	//native.Channel_1;
	//native.Channel_2;
	//native.GroupName;	
}

// Export UMeshInstance::execIsAnimating(FFrame&, void* const)
native(544) final function bool IsAnimating(int Channel, optional name GroupName)
{
	//native.Channel;
	//native.GroupName;	
}

// Export UMeshInstance::execIsAnyAnimating(FFrame&, void* const)
native(545) final function bool IsAnyAnimating();

// Export UMeshInstance::execFreezeAnimations(FFrame&, void* const)
native(546) final function FreezeAnimations();

// Export UMeshInstance::execAnimUpdateRate(FFrame&, void* const)
native(547) final function bool AnimUpdateRate(int Channel, float Rate, optional name GroupName)
{
	//native.Channel;
	//native.Rate;
	//native.GroupName;	
}

// Export UMeshInstance::execAnimUpdateGrid(FFrame&, void* const)
native(548) final function bool AnimUpdateGrid(int Channel, Vector2D GridPoint, optional name GroupName)
{
	//native.Channel;
	//native.GridPoint;
	//native.GroupName;	
}

// Export UMeshInstance::execAnimUpdateBlend(FFrame&, void* const)
native(549) final function bool AnimUpdateBlend(int Channel, Object.EAnimationBlendMode BlendOp, float Blend, optional name GroupName)
{
	//native.Channel;
	//native.BlendOp;
	//native.Blend;
	//native.GroupName;	
}

// Export UMeshInstance::execAnimUpdateTime(FFrame&, void* const)
native(550) final function bool AnimUpdateTime(int Channel, float Time, optional name GroupName)
{
	//native.Channel;
	//native.Time;
	//native.GroupName;	
}

// Export UMeshInstance::execAnimEventEnable(FFrame&, void* const)
native(551) final function AnimEventEnable(int Channel, bool bEnable, optional name GroupName)
{
	//native.Channel;
	//native.bEnable;
	//native.GroupName;	
}

// Export UMeshInstance::execGetAnimChanInfo(FFrame&, void* const)
native(552) final function AnimChanInfo GetAnimChanInfo(int Channel, optional name GroupName)
{
	//native.Channel;
	//native.GroupName;	
}

// Export UMeshInstance::execGetAnimTime(FFrame&, void* const)
native(553) final function float GetAnimTime(name AnimName)
{
	//native.AnimName;	
}

// Export UMeshInstance::execGetSequence(FFrame&, void* const)
native(554) final function name GetSequence(int Channel, optional name GroupName)
{
	//native.Channel;
	//native.GroupName;	
}

// Export UMeshInstance::execClearAnimEnds(FFrame&, void* const)
native(555) final function bool ClearAnimEnds(int Channel, optional name GroupName)
{
	//native.Channel;
	//native.GroupName;	
}

// Export UMeshInstance::execClearAnimEarlyEnds(FFrame&, void* const)
native(556) final function bool ClearAnimEarlyEnds(int Channel, optional name GroupName)
{
	//native.Channel;
	//native.GroupName;	
}

// Export UMeshInstance::execSetChannelEndFlags(FFrame&, void* const)
native(557) final function SetChannelEndFlags(int Channel, bool bAnimEnd, bool bAnimEarlyEnd, optional name GroupName)
{
	//native.Channel;
	//native.bAnimEnd;
	//native.bAnimEarlyEnd;
	//native.GroupName;	
}

// Export UMeshInstance::execGetBounds(FFrame&, void* const)
native(558) final function GetBounds(out Vector Min, out Vector Max)
{
	//native.Min;
	//native.Max;	
}

// Export UMeshInstance::execResetTimeWitholding(FFrame&, void* const)
native(559) final function ResetTimeWitholding();