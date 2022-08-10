struct SGibProperties
{
	var() noexport Object RenderObject "Objects to select from for our display property. (StaticMesh, Mesh, Texture)";
	var() noexport bool bForcedOnly "Means this gib isn't available for random selection. Can only show up with ForcedIndex";
};