struct SAnimationBlockBlend
{
	var() int ChannelBlockIndex;
	var() float StartAlpha;
	var() float EndAlpha;
	var() float CurrentBlendTime;
	var() float TotalBlendTime;
	var() name BlendEndCallback;
	var() bool bClearAnimsOnBlendFinish;
	var() Object.EAnimationControllerBlockBlend BlendType;
};