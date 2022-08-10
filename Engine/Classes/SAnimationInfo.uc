struct SAnimationInfo
{
	var() name AnimationName;
	var() SAnimChannelLink AnimationChannel;
	var() name AnimSequence;
	var() float AnimStartingFrame;
	var() float AnimRate;
	var() float AnimRateVariance;
	var() float AnimTween;
	var() float AnimDefaultBlendAlpha;
	var() float AnimEarlyEndTime;
	var() bool bLoopAnim;
	var() bool bInterrupt;
	var() bool bNoRemoveAnim;
	var() bool bBatchAnim;
	var() bool bAdjustStart;
	var() SAnimationFadeBlend AnimBlendInInfo;
	var() SAnimationFadeBlend AnimBlendOutInfo;
	var() name AnimStart_FunctionCallName;
	var() name AnimEnd_NextAnimStateName;
	var() name AnimEnd_FunctionCallName;
	var() name AnimEnd_Event;
	var() float GroupCrossfadeOverride;
	var() bool bForceCrossfade;
	var() bool bIs3DGrid;
	var() int AnimGridLink;
};