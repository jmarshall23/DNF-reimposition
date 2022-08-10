/*******************************************************************************
 * TriggerMultisampler generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class TriggerMultisampler extends Triggers
	collapsecategories
	hidecategories(Filter,Interactivity,Karma,Lighting,Networking,Sound);

var() noexport float RampTime "Time taken to fade to desired values.";
var() noexport float ScaleDampening "Percent value of starting values." "" "(1 = normal, 0 = disabled)";
var() noexport float NewHeightOffset "Set height offset to this amount above the surface.";
var float fStartHeightOffset;
var float fStartPitchDamp;
var float fStartRollDamp;
var float fEndPitchDamp;
var float fEndRollDamp;
var float fRunningTime;
var bool bEnabled;
var() bool bAffectViewDamping;
var() bool bAffectHeightOffset;
var GeoWaterMultisampler Multisampler;

simulated function PostBeginPlay()
{
	local GeoWaterMultisampler m;

	super(Actor).PostBeginPlay();
	Multisampler = GeoWaterMultisampler(FindActor(class'GeoWaterMultisampler', Event));
	TickStyle = 0;
	return;
}

simulated function Trigger(Actor Other, Pawn EventInstigator)
{
	local TriggerMultisampler t;

	// End:0x0E
	if(__NFUN_339__(Multisampler, none))
	{
		return;
	}
	// End:0x6E
	foreach __NFUN_747__(class'TriggerMultisampler', t)
	{
		// End:0x6D
		if(__NFUN_148__(__NFUN_148__(t.bEnabled, __NFUN_339__(t.Multisampler, Multisampler)), __NFUN_340__(t, self)))
		{
			t.bEnabled = false;
		}		
	}	
	bEnabled = true;
	fRunningTime = 0;
	fStartPitchDamp = Multisampler.DampenPitch;
	fEndPitchDamp = __NFUN_195__(Multisampler.DampenPitchOrig, ScaleDampening);
	fStartRollDamp = Multisampler.DampenRoll;
	fEndRollDamp = __NFUN_195__(Multisampler.DampenRollOrig, ScaleDampening);
	fStartHeightOffset = Multisampler.HeightOffset;
	TickStyle = 3;
	return;
}

simulated function Tick(float fDeltaTime)
{
	local float fAlpha;

	// End:0x21
	if(__NFUN_150__(__NFUN_339__(Multisampler, none), __NFUN_145__(bEnabled)))
	{
		TickStyle = 0;
	}
	__NFUN_209__(fRunningTime, fDeltaTime);
	// End:0x4F
	if(__NFUN_201__(fRunningTime, RampTime))
	{
		fRunningTime = RampTime;
		bEnabled = false;
	}
	fAlpha = __NFUN_196__(fRunningTime, RampTime);
	// End:0xAC
	if(bAffectViewDamping)
	{
		Multisampler.DampenPitch = __NFUN_228__(fAlpha, fStartPitchDamp, fEndPitchDamp);
		Multisampler.DampenRoll = __NFUN_228__(fAlpha, fStartRollDamp, fEndRollDamp);
	}
	// End:0xD6
	if(bAffectHeightOffset)
	{
		Multisampler.HeightOffset = __NFUN_228__(fAlpha, fStartHeightOffset, NewHeightOffset);
	}
	return;
}

defaultproperties
{
	ScaleDampening=1
	bAffectViewDamping=true
	bNoNativeTick=false
}