struct SAISquadChannel
{
	var() noexport name ChannelName "Name of channel we are communicating on";
	var() noexport float MaxDistance "Max distance between AI for squad communication to work. 0 = no max distance";
};