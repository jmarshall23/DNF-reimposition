struct SAnimationFadeBlendInternal
{
	var() float BlendTotalTime;
	var() float StartingBlendAlpha;
	var() float EndingBlendAlpha;
	var() int AnimIndex;
	var() int ChannelIndex;
	var() float BlendTimeElapsed;
	var() AnimationControllerEx.EAnimControllerBlend BlendType;
	var() AnimationControllerEx ServerLink;
};