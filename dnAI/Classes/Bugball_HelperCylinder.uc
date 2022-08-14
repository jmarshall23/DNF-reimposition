/*******************************************************************************
 * Bugball_HelperCylinder generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Bugball_HelperCylinder extends dnDecoration;

var Bugball_sphere MySphere;
var KFixedOrientation FixedOrientation;
var KBSJoint BSJoint;

function PostVerifySelf()
{
	super.PostVerifySelf();
	MySphere = Bugball_sphere(Owner);
	return;
}

function CopyOwnerProperties()
{
	return;
}

function Activate()
{
	__NFUN_621__(,,, true);
	__NFUN_642__(18);
	BSJoint.__NFUN_642__(18);
	FixedOrientation.__NFUN_642__(18);
	return;
}

function Deactivate()
{
	FixedOrientation.__NFUN_642__(0);
	BSJoint.__NFUN_642__(0);
	__NFUN_621__(,,, false);
	return;
}

function KarmaSetConstraintProperties(KConstraint ConstraintActor)
{
	ConstraintActor.KConstraintActor1 = self;
	// End:0x4F
	if(__NFUN_340__(KBSJoint(ConstraintActor), none))
	{
		BSJoint = KBSJoint(ConstraintActor);
		ConstraintActor.KConstraintActor2 = Bugball_sphere(Owner);		
	}
	else
	{
		FixedOrientation = KFixedOrientation(ConstraintActor);
	}
	return;
}

defaultproperties
{
	AutoConstraints(0)=(bConstraintDisabledOnDeath=false,bConstraintOnDeath=false,BoneName=None,ConstraintMounting=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=1.298303E-41,Y=3.773024E-17,Z=0),Z=0),MountOriginVariance=(X=1.298303E-41,Y=3.773024E-17,Z=0),Z=0)
	AutoConstraints(1)=(MountAngles=(Pitch=8754,Yaw=574554112,Roll=0),Roll=0)
	HealthPrefab=0
	DynamicInteractionClassification=9
	PhysicsEntityGroup=CorpsePhysicsEntityGroup
	Physics=18
	bTraceShootable=false
	bBlockKarma=true
	bAcceptsProjectors=false
	bAcceptsDecalProjectors=false
	bCollideWorld=false
	CollisionRadius=100
	CollisionHeight=60
	DrawType=8
	PrePivot=(X=1.298303E-41,Y=3.773024E-17,Z=0)
	DrawScale3D=(X=1.298303E-41,Y=3.778402E-17,Z=1)
	StaticMesh='sm_class_decorations.Default.Cylinder'
	Skins(0)='dt_editor.Surface.Climbable_Masking'
	EffectsMaterial='dnMaterial.Flesh_Alien'
}