struct SDistanceFog
{
	var() noexport Color Color "Color to use for distance fog.";
	var() noexport float Start "How far into the screen (in world units) the fog begins";
	var() noexport float End "How far into the screen (in world units) where the fog will be fully opaque";
	var() noexport float Opacity "Fog thickness when objects are at or near Fog End. 0 - 1.";
};