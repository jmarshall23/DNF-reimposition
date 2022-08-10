struct SRappel
{
	var() name StartAnimName;
	var() name IdleAnimName;
	var() name EndAnimName;
	var() name BoneName;
	var() float GravityScale;
	var bool bOverrideAttachToInfo;
	var Actor AttachToActor;
	var name AttachToBone;
	var class<BeamSystem> BeamSystemClass;
	var BeamSystem MyBeamSystem;
	var int Mode;
};