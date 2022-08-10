struct SWebbedBone
{
	var() noexport name BoneName "This is the name of the bone that you want to attach webbing to.";
	var() noexport deprecated Actor WorldAttachPoint "Point this to an Actor placed in the world as an attach point for the webbing.";
	var KBSJoint WorldBSJoint;
	var KarmaActor HelperNode1;
	var KLinear LinearJoint;
	var KLinearSpringDamper SpringDamper;
	var KarmaActor HelperNode2;
	var KBSJoint BoneBSJoint;
	var Details_Generic_CorpseWebbing_Pinata Webbing;
};