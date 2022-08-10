/*******************************************************************************
 * GeoWaterOscillator generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class GeoWaterOscillator extends InfoActor
	native
	collapsecategories
	notplaceable
	hidecategories(Collision,Filter,Interactivity,Karma,Lighting,Networking,Sound);

cpptext
{
// Stripped
}

var() float Frequency;
var() byte Phase;
var() float Strength;
var() float RandomStrength;
var() float Radius;
var() bool bEnabled;
var() bool bPulseOnTrigger;
var() noexport bool bForceHeight "Set oscillation height as an absolute instead of a modify?";
var() noexport bool bStationary "Make the oscillator appear stationary";
var transient GeoWater Water;
var const transient float OscTime;
var int SineSide;
var float StrengthToUse;

simulated event PostBeginPlay()
{
	Water = GeoWater(FindActor(class'GeoWater', Event));
	// End:0x35
	if(__NFUN_340__(Water, none))
	{
		Water.__NFUN_1118__(self);
	}
	super(Actor).PostBeginPlay();
	StrengthToUse = Strength;
	return;
}

function Destroyed()
{
	// End:0x1A
	if(__NFUN_340__(Water, none))
	{
		Water.__NFUN_1119__(self);
	}
	return;
}

function Trigger(Actor Other, Pawn EventInstigator)
{
	// End:0x14
	if(bPulseOnTrigger)
	{
		bEnabled = true;		
	}
	else
	{
		// End:0x28
		if(bEnabled)
		{
			bEnabled = false;			
		}
		else
		{
			bEnabled = true;
		}
	}
	return;
}

defaultproperties
{
	Frequency=1
	Strength=10
	bEnabled=true
	bHidden=true
	Texture=Texture'S_GeoWaterOscillate'
}