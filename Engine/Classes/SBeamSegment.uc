struct SBeamSegment
{
	var() noexport float Lifetime "Used to determine how long the segment will be active. 0 == use DefaultLifetime.";
	var() noexport deprecated Actor Actor1 "Actor used to represent this segments start location. None will use BeamSystem when bNonActor1 == false.";
	var() noexport deprecated Actor Actor2 "Actor used to represent this segments end location. None will use BeamSystem when bNonActor2 == false. NOT used for BST_Spline mode.";
	var() noexport Vector Location1 "Used as the first endpoint when bNonActor1 == true";
	var() noexport Vector Location2 "Used as the second endpoint when bNonActor2 == true";
	var() noexport bool bNonActor1 "When true, Actor1 is ignored.";
	var() noexport bool bNonActor2 "When true, Actor2 is ignored.";
	var() noexport name Actor1Bone "When Actor1 is not None and is using a Mesh, this is the name of the bone to use for this segments start location.";
	var() noexport name Actor2Bone "When Actor2 is not None and is using a Mesh, this is the name of the bone to use for this segments end location.";
};