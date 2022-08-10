struct SStubToeInfo
{
	var() bool bDebug;
	var() bool bEnabled;
	var() name AnimName;
	var() bool bBerzerkAfterStub;
	var() bool bDropWeapon;
	var() float MinImpactVelocity;
	var() noexport float MinToeStubInterval "How much time must pass between subsequent toe stubs.";
	var float ToeStubGate;
};