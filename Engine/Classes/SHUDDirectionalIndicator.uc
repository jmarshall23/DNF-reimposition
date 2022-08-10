struct SHUDDirectionalIndicator
{
	var() noexport bool bNoAutoRotate "Set to true if you don't want to rotate.";
	var() noexport float TotalLifetime "Amount of time left for this damage indicator to be displayed.";
	var() noexport float XScale "Scale to use for X.";
	var() noexport float YScale "Scale to use for Y.";
	var() noexport float CircleRadius "Distance from center of screen where this indicator will be drawn.";
	var() noexport float BaseRot "Base rotation (radians).";
	var() noexport Vector WorldPos "Worldspace location where the damage originated.";
	var() noexport MaterialEx Texture "Material to use for this indicator.";
	var() noexport Color Color "Color to use for colorization of this indicator.";
	var float RemainingLife;
};