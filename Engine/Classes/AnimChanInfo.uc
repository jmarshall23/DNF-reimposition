struct AnimChanInfo
{
	var() bool bValid;
	var() bool bLoop;
	var() bool bTween;
	var() bool bIsGroup;
	var() bool bEventEnabled;
	var() int id;
	var() int RefId;
	var() name Sequence;
	var() name NodeName;
	var() float Rate;
	var() int BlendOp;
	var() float Blend;
	var() float FrameScale;
};