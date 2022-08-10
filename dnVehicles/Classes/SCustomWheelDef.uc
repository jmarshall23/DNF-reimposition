struct SCustomWheelDef
{
	var() bool bFlipWheel;
	var() Vector LocationOffset;
	var() Rotator RotationOffset;
	var() noexport float DrawScaleOverride "Set to something non-zero to override the default scale of the wheel class specified by WheelProps.";
};