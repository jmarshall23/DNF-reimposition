/*******************************************************************************
 * Biology_Generic_InfestationFence generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Biology_Generic_InfestationFence extends Biology_Generic
	collapsecategories;

function Destroyed()
{
	FadeOverlayEffect(0.2, 2);
	__NFUN_621__(false, false, false, false, false);
	super(dnDecoration).Destroyed();
	return;
}

defaultproperties
{
	begin object name=DA_Anim_Fence_Idle class=DecoActivities_Animation
		AnimActivities(0)=(Flags=(bLoop=true,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=idle,Channel=0,Rate=0,TweenTime=0)
	object end
	// Reference: DecoActivities_Animation'Biology_Generic_InfestationFence.DA_Anim_Fence_Idle'
	StartupActivities(0)=DA_Anim_Fence_Idle
	begin object name=DA_Sound_InfestationFence_Amb class=DecoActivities_Sound
		SoundNames(0)=InfestFence_Amb
	object end
	// Reference: DecoActivities_Sound'Biology_Generic_InfestationFence.DA_Sound_InfestationFence_Amb'
	StartupActivities(1)=DA_Sound_InfestationFence_Amb
	bSurviveDeath=true
	DestroyedActivities(0)=none
	begin object name=DA_Sound_InfestationFence_Deflate class=DecoActivities_Sound
		SoundNames(0)=InfestFence_Deflate
		bClearAmbientSound=true
	object end
	// Reference: DecoActivities_Sound'Biology_Generic_InfestationFence.DA_Sound_InfestationFence_Deflate'
	DestroyedActivities(1)=DA_Sound_InfestationFence_Deflate
	begin object name=DA_Anim_Fence_Deflate class=DecoActivities_Animation
		AnimActivities(0)=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=dissolve,Channel=0,Rate=0,TweenTime=0)
	object end
	// Reference: DecoActivities_Animation'Biology_Generic_InfestationFence.DA_Anim_Fence_Deflate'
	DestroyedActivities(2)=DA_Anim_Fence_Deflate
	HealthPrefab=5
	DamageTypesAcceptedOnly(0)='Engine.SteamDamage'
	Health=1
	bAcceptMeshAccurateMoveActorTrace=true
	bAcceptMinesInMultiplayer=false
	bAcceptMines=false
	DrawType=2
	Mesh='c_characters.infestation_fence'
}