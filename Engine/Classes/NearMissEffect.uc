/*******************************************************************************
 * NearMissEffect generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class NearMissEffect extends Object
	abstract
	native;

var() SSoundInfo NearMissSoundInfo;

static function PlayNearMissEffectSound(Pawn P, Vector ClosestPoint)
{
	local SSoundInfo LocalSoundInfo;

	LocalSoundInfo = default.NearMissSoundInfo;
	LocalSoundInfo.SoundLocationOverride.OverrideType = 2;
	LocalSoundInfo.SoundLocationOverride.Location3D = ClosestPoint;
	P.PlaySoundInfo(0, LocalSoundInfo);
	return;
}

defaultproperties
{
	NearMissSoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=2,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=1.293258E-41,Y=3.079134E-17,Z=0),Z=0),Velocity3D=(X=1.293258E-41,Y=3.079134E-17,Z=0),Z=0)
}