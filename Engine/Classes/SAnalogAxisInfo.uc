struct SAnalogAxisInfo
{
	var() const noexport float Speed "Base turn speed for axis.";
	var() const noexport float AccelSpeed "Accelerated turn speed for axis.";
	var() const noexport float AccelThreshold "Minimum required stick input for acceleration.";
	var() const noexport float AccelTime "Time it takes to accelerate toward AccelSpeed after AccelWarmup";
	var() const noexport float AccelWarmup "Time after exceeding AccelThreshold before acceleration begins.";
};