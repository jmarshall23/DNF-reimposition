/*******************************************************************************
 * Details_Generic_ClothingHanger generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Details_Generic_ClothingHanger extends Details_Clothes
	collapsecategories;

function KarmaSetConstraintProperties(KConstraint ConstraintActor)
{
	local KHinge Hinge;

	super(KarmaActor).KarmaSetConstraintProperties(ConstraintActor);
	ConstraintActor.KConstraintActor2 = KarmaActor(Owner);
	Hinge = KHinge(ConstraintActor);
	// End:0x191
	if(__NFUN_340__(Hinge, none))
	{
		Hinge.CreakSoundInfo.bAllowRepeats = true;
		Hinge.CreakSoundInfo.Sounds[0] = class'HangerRattle_01';
		Hinge.CreakSoundInfo.Sounds[1] = class'HangerRattle_02';
		Hinge.CreakSoundInfo.Volume = 1;
		Hinge.CreakSoundInfo.VolumeVariance = 0.1;
		Hinge.CreakSoundInfo.InnerRadius = 96;
		Hinge.CreakSoundInfo.Radius = 600;
		Hinge.CreakSoundInfo.Pitch = 1;
		Hinge.CreakSoundInfo.PitchVariance = 0.25;
		Hinge.CreakInfo.bEnableCreakSounds = true;
		Hinge.CreakInfo.SwingMinimumVolumeVelocity = 1;
		Hinge.CreakInfo.SwingMinimumVolume = 0.25;
		Hinge.CreakInfo.SwingMaximumVolume = 1;
	}
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super(dnDecoration).RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1274__(class'HangerRattle_01');
	PrecacheIndex.__NFUN_1274__(class'HangerRattle_02');
	return;
}

defaultproperties
{
	DecoActivities_Default=/* Array type was not detected. */
	X=/* Unknown default property type! */
	
/* Exception thrown while deserializing Engine
System.ArgumentOutOfRangeException: Length cannot be less than zero.
Parameter name: length
   at System.String.Substring(Int32 startIndex, Int32 length)
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 578 */
}