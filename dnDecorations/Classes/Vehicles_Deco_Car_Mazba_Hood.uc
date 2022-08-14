/*******************************************************************************
 * Vehicles_Deco_Car_Mazba_Hood generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Vehicles_Deco_Car_Mazba_Hood extends Vehicles_Deco_Parts_Karma
	collapsecategories;

function KarmaSetConstraintProperties(KConstraint ConstraintActor)
{
	local KAngularJointLimit AngularLimit;

	super.KarmaSetConstraintProperties(ConstraintActor);
	AngularLimit = KAngularJointLimit(ConstraintActor);
	// End:0x5F
	if(__NFUN_340__(AngularLimit, none))
	{
		AngularLimit.__NFUN_1106__(4608);
		AngularLimit.__NFUN_1107__(true, __NFUN_269__(__NFUN_265__(5024, 0, 0), Vehicle.Rotation));
	}
	return;
}

defaultproperties
{
	BurntMesh='sm_class_vehicles.Mazba_A.MazbaA_Brnt_Hood'
	AutoConstraints(0)=(bConstraintDisabledOnDeath=false,bConstraintOnDeath=true,BoneName=None,ConstraintMounting=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=1.291717E-41,Y=2.813642E-17,Z=0),Z=0),MountOriginVariance=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0)
	AutoConstraints(1)=(MountAngles=(Pitch=8709,Yaw=571080704,Roll=-16384),Roll=0)
	Mass=60
	StaticMesh='sm_class_vehicles.Mazba_A.MazbaA_hood'
}