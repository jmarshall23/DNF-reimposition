struct SAnimControllerChannel
{
	var() name ChannelName;
	var() name ChannelGroupName;
	var() Object.EAnimationBlendMode ChannelBlendOp;
	var() float LastBlendAlpha;
	var() int LastAnimLink;
	var() AnimationControllerEx LastAnimControllerLink;
	var() int ParentBlockChannelLink;
	var() bool bActAsGroup;
	var() float GroupCrossfadeTime;
	var() int PrimaryChannelIndex;
	var() float FadeRates[24];
	var() int NumFadingOut;
	var() float LastCrossfadeRate;
	var() bool bMovementActive;
};