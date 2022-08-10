struct SUpdateMaterialEx
{
	var() noexport int Index "The Index of the section to update.";
	var() noexport MaterialEx NewMaterialEx "Material to update in skin slot = Index.";
};