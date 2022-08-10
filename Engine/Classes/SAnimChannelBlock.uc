struct SAnimChannelBlock
{
	var() name ChannelBlockName;
	var() array<SAnimChannelLink> ChannelSubChannels;
	var() int ChannelLastUsedChannel;
	var() int ChannelLastPrimaryAnimIndex;
	var() AnimationControllerEx ChannelLastPrimaryControllerLink;
	var() float ChannelMasterAlpha;
	var float DefaultChannelMasterAlpha;
};