struct SAudioMixerGroup
{
	var() name Name;
	var() float Volume;
	var() array<int> ActiveSamples;
	var() array<int> ActiveStreams;
	var() array<SAudioMixerOverride> Overrides;
};