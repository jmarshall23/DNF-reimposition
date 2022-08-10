struct SAIPathInfo
{
	var() bool bNeedsFlying;
	var() bool bPrecomputeAP;
	var() name PathID;
	var() float Radius;
	var() float Height;
	var() class<Actor> SourceClass;
};