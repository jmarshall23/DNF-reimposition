/*******************************************************************************
 * BonePartMapper generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class BonePartMapper extends Object
	native
	exportstructs
	noexport;

var() array<SMeshBoneToPartMapping> PartMapping;
var() array<SCorpseDestroyableBone> DestroyableBones;
var() array<SCorpseGib> Gibs;
var() array<SCorpseGibEffect> GibEffects;
var() array<SCorpseGibEffect> FrozenGibEffects;
var() class<SoftParticleSystem> GibBloodyMess;
var() name CenterOfMassBone;
var() name FullyGibbedSoundName;
var() name FullyGibbedFrozenSoundName;
var int NumLimbsUntilDestructible;

defaultproperties
{
	GibBloodyMess='p_hit_effects.Gibs.GibBlood'
	CenterOfMassBone=Root
}