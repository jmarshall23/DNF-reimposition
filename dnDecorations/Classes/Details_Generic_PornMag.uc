/*******************************************************************************
 * Details_Generic_PornMag generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Details_Generic_PornMag extends Details_Generic;

defaultproperties
{
	HealthPrefab=0
	bGrabbable=true
	UsePhrase="<?int?dnDecorations.Details_Generic_PornMag.UsePhrase?>"
	GrabInfo=(bCanDuckWhileHeld=true,MountItemOverride=mount_handright,MountOrigin=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0)
	SpawnOnDestroyedSimple(0)='dnParticles.dnDebris_Paper1'
	bIgnorePawnAirCushion=true
	bIgnorePawnDownwardForce=true
	bCanCrushOthers=false
	bIgnoresPhysicsDamage=true
	bTickOnlyWhenPhysicsAwake=true
	PhysicsMaterial='dnMaterial.dnPhysicsMaterial_Paper'
	GravityScale=0.75
	PhysicsSoundOverrides(0)=(SoundType=0,OtherMaterialTypes=none,OtherMassTypes=none,Sounds=('a_impact.SpecialCase.Magazine_Impact_01','a_impact.SpecialCase.Magazine_Impact_02','a_impact.SpecialCase.Magazine_Impact_03','a_impact.SpecialCase.Magazine_Impact_04'),SoundInfo=(InputRange=(Min=64,Max=1280),OutputPitchRange=(Min=1,Max=1),OutputVolumeRange=(Min=0.4,Max=0.8)),bDisableSoundInWater=true)
	Physics=18
	CollisionRadius=12
	CollisionHeight=0.1
	DrawType=2
	Mesh='c_generic.PornMag'
}