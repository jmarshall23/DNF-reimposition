struct SActorColor
{
	var() noexport Color ActorColor "Use this color by default for any ActorColor materials rendered on this actor matching this index.";
	var() noexport deprecated LightEx ActorColor_LightEx "If set, overrides ActorColor with the LightEx's current color.";
	var() noexport Vector ActorColor_LightExScale "R=X G=Y B=Z - Scales the resulting color from the ActorColor_lightEx by this amount (clamped from 0-255)";
	var() name id;
};