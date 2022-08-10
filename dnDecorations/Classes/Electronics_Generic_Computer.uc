/*******************************************************************************
 * Electronics_Generic_Computer generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Electronics_Generic_Computer extends Electronics_Generic
	abstract
	collapsecategories;

var() noexport name SystemName "Make this the same on all components for this computer. The CPU *does* support multiple monitors, mice, etc.";

function SystemPowerOn()
{
	DecoActivity(0, 'SystemPowerOn');
	return;
}

function SystemPowerOff()
{
	DecoActivity(0, 'SystemPowerOff');
	return;
}

defaultproperties
{
	bSurviveDeath=true
	FlickerLight=(FlickerLightActor=none,FlickerLightExActor=none,bUseFlickerLight=false,bUseFlickerLightEx=false,bInitialEffect=true,bInitialEffectOnly=false,FlickerLightMounting=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0),MountOriginVariance=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0)
	SpawnOnDestroyedSimple=/* Array type was not detected. */
}