/*******************************************************************************
 * Veh_MonsterTruck_NativeBase generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Veh_MonsterTruck_NativeBase extends Veh_CarTemplate
	native
	collapsecategories;

cpptext
{
// Stripped
}

struct SWheelEffect
{
	var VWheel Wheel;
	var SoftParticleSystem Effect;
	var SoftParticleSystem WaterEffect;
	var SoftParticleSystem MudEffect;
};

var VehicleSpecialPartBase Suspension;
var class<dnHUDEffects> MudSplatterClass;
var class<dnHUDEffects> WaterSplatterClass;
var bool bHasWheelEffects;
var float WheelEffectOffset;
var SWheelEffect WheelEffects[4];
var SoftParticleSystem Exhaust[2];
var SoftParticleSystem BoostExhaust[2];
var transient bool bInitialized;
var() name WheelWaterSoundName;
var const editconst transient pointer pBone_Front_Main;
var const editconst transient pointer pBone_Front_1;
var const editconst transient pointer pBone_Front_L_1;
var const editconst transient pointer pBone_Front_L_Spring;
var const editconst transient pointer pBone_Front_R_1;
var const editconst transient pointer pBone_Front_R_Spring;
var const editconst transient pointer pBone_Rear_Main;
var const editconst transient pointer pBone_Rear_1;
var const editconst transient pointer pBone_Rear_L_1;
var const editconst transient pointer pBone_Rear_L_Spring;
var const editconst transient pointer pBone_Rear_R_1;
var const editconst transient pointer pBone_Rear_R_Spring;

final simulated event DoSplatter(class<dnHUDEffects> SplatterClass)
{
	local dnHUDEffects ScreenSplatter;

	// End:0x3E
	if(__NFUN_340__(SplatterClass, none))
	{
		ScreenSplatter = dnHUDEffects(FindStaticActor(SplatterClass));
		// End:0x3E
		if(__NFUN_340__(ScreenSplatter, none))
		{
			ScreenSplatter.ExecuteEffect();
		}
	}
	return;
}

simulated event GetGroundMaterialInfo(class<PhysicsMaterial> GroundMaterial, out int bPuddlesMaterial, out int bDirtMaterial)
{
	// End:0x1D
	if(__NFUN_339__(GroundMaterial, none))
	{
		bPuddlesMaterial = 0;
		bDirtMaterial = 0;		
	}
	else
	{
		// End:0x3E
		if(__NFUN_357__(GroundMaterial, class'dnPhysicsMaterial_Puddles'))
		{
			bPuddlesMaterial = 1;
			bDirtMaterial = 0;			
		}
		else
		{
			// End:0x6E
			if(__NFUN_150__(__NFUN_357__(GroundMaterial, class'dnPhysicsMaterial_Dirt'), __NFUN_357__(GroundMaterial, class'dnPhysicsMaterial_Stone')))
			{
				bPuddlesMaterial = 0;
				bDirtMaterial = 1;
			}
		}
	}
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super(VehicleBase).RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1266__(MudSplatterClass);
	PrecacheIndex.__NFUN_1266__(WaterSplatterClass);
	PrecacheIndex.__NFUN_1277__(VoicePack, WheelWaterSoundName);
	return;
}