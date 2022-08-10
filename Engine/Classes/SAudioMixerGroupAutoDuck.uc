struct SAudioMixerGroupAutoDuck
{
	var() noexport name Name "Group name to auto duck.";
	var() noexport float DuckVolume "Volume to duck to.";
	var() noexport float DuckTime "Time it takes to duck.";
	var() noexport float UnDuckTime "Time it takes to unduck.  If <= 0.0, will use DuckTime";
};