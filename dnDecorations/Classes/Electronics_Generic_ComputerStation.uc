/*******************************************************************************
 * Electronics_Generic_ComputerStation generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Electronics_Generic_ComputerStation extends Electronics_Generic
	collapsecategories;

var int BodyTexIdx;
var array<MaterialEx> BodyTextures;
var array<MaterialEx> DestroyedBodyTextures;
var int PanelTexIdx_Left;
var int PanelTexIdx_Right;
var array<MaterialEx> PanelTextures;
var array<MaterialEx> DestroyedPanelTextures;

function PostVerifySelf()
{
	super(dnDecoration).PostVerifySelf();
	FindTextureIndices();
	return;
}

final function FindTextureIndices()
{
	local int i;

	BodyTexIdx = -1;
	i = __NFUN_166__(string(BodyTextures), 1);
	J0x1A:

	// End:0x52 [Loop If]
	if(__NFUN_172__(i, 0))
	{
		// End:0x48
		if(__NFUN_339__(BodyTextures[i], __NFUN_740__(0)))
		{
			BodyTexIdx = i;
			// [Explicit Break]
			goto J0x52;
		}
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0x1A;
	}
	J0x52:

	PanelTexIdx_Left = -1;
	i = __NFUN_166__(string(PanelTextures), 1);
	J0x6C:

	// End:0xA4 [Loop If]
	if(__NFUN_172__(i, 0))
	{
		// End:0x9A
		if(__NFUN_339__(PanelTextures[i], __NFUN_740__(1)))
		{
			PanelTexIdx_Left = i;
			// [Explicit Break]
			goto J0xA4;
		}
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0x6C;
	}
	J0xA4:

	PanelTexIdx_Right = -1;
	i = __NFUN_166__(string(PanelTextures), 1);
	J0xBE:

	// End:0xF7 [Loop If]
	if(__NFUN_172__(i, 0))
	{
		// End:0xED
		if(__NFUN_339__(PanelTextures[i], __NFUN_740__(2)))
		{
			PanelTexIdx_Right = i;
			// [Explicit Break]
			goto J0xF7;
		}
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0xBE;
	}
	J0xF7:

	return;
}

function Destroyed()
{
	super(dnDecoration).Destroyed();
	// End:0x24
	if(__NFUN_174__(BodyTexIdx, -1))
	{
		__NFUN_741__(0, DestroyedBodyTextures[BodyTexIdx]);
	}
	// End:0x42
	if(__NFUN_174__(PanelTexIdx_Left, -1))
	{
		__NFUN_741__(1, DestroyedPanelTextures[PanelTexIdx_Left]);
	}
	// End:0x61
	if(__NFUN_174__(PanelTexIdx_Right, -1))
	{
		__NFUN_741__(2, DestroyedPanelTextures[PanelTexIdx_Right]);
	}
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super(dnDecoration).RegisterPrecacheComponents(PrecacheIndex);
	FindTextureIndices();
	// End:0x38
	if(__NFUN_174__(BodyTexIdx, -1))
	{
		PrecacheIndex.__NFUN_1269__(DestroyedBodyTextures[BodyTexIdx]);
	}
	// End:0x5F
	if(__NFUN_174__(PanelTexIdx_Left, -1))
	{
		PrecacheIndex.__NFUN_1269__(DestroyedPanelTextures[PanelTexIdx_Left]);
	}
	// End:0x86
	if(__NFUN_174__(PanelTexIdx_Right, -1))
	{
		PrecacheIndex.__NFUN_1269__(DestroyedPanelTextures[PanelTexIdx_Right]);
	}
	return;
}

defaultproperties
{
	begin object name=DA_Sound_ComputerStation_Ambience class=DecoActivities_Sound
		SoundNames(0)=ComputerStation_Ambience
	object end
	// Reference: DecoActivities_Sound'Electronics_Generic_ComputerStation.DA_Sound_ComputerStation_Ambience'
	StartupActivities(0)=DA_Sound_ComputerStation_Ambience
	bSurviveDeath=true
	FlickerLight=(FlickerLightActor=none,FlickerLightExActor=none,bUseFlickerLight=true,bUseFlickerLightEx=true,bInitialEffect=true,bInitialEffectOnly=false,FlickerLightMounting=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0),MountOriginVariance=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0)
	DestroyedActivities(0)=none
	DestroyedActivities(1)=DecoActivities_Sound'Electronics_Generic.DA_Sound_Destroyed_Electronic'
	DestroyedActivities(2)='dnGame.DecoActivityDeclarations.DA_Sound_Ambient_Clear'
	HealthPrefab=4
	SpawnOnDestroyedSimple(0)=none
	SpawnOnDestroyedSimple(1)='dnParticles.dnDebris_Smoke'
	SpawnOnDestroyedSimple(2)='dnParticles.dnDebris_Sparks1'
	PhysicsMaterial='dnMaterial.dnPhysicsMaterial_Metal_Hollow'
	PhysicsMassType=1
	SoundRadius=208
	SoundInnerRadius=104
}