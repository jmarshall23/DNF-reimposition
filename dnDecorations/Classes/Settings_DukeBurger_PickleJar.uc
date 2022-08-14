/*******************************************************************************
 * Settings_DukeBurger_PickleJar generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Settings_DukeBurger_PickleJar extends Settings_DukeBurger
	collapsecategories;

simulated event Destroyed()
{
	local dnScreenSplatter_PickleJuice ScreenSplatter;

	ScreenSplatter = dnScreenSplatter_PickleJuice(FindStaticActor(class'dnScreenSplatter_PickleJuice'));
	// End:0x44
	if(__NFUN_340__(ScreenSplatter, none))
	{
		ScreenSplatter.__NFUN_645__(Location);
		ScreenSplatter.ExecuteEffect();
	}
	super(dnDecoration).Destroyed();
	return;
}

simulated function SpawnOnDestroyedActivity()
{
	super(RenderActor).SpawnOnDestroyedActivity();
	class'DecalBomb'.static.StaticDeploy(class'PickleJuice_SplatterBomb', Location, Rotation, self, self);
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super(dnDecoration).RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1266__(class'dnScreenSplatter_PickleJuice');
	PrecacheIndex.__NFUN_1266__(class'PickleJuice_SplatterBomb');
	return;
}

defaultproperties
{
	DestroyedActivities(0)=none
	begin object name=DA_Sound_PickleJar_Destroyed class=DecoActivities_Sound
		SoundNames(0)=DukeSauceJar_Break
	object end
	// Reference: DecoActivities_Sound'Settings_DukeBurger_PickleJar.DA_Sound_PickleJar_Destroyed'
	DestroyedActivities(1)=DA_Sound_PickleJar_Destroyed
	HealthPrefab=5
	DamageThreshold=1
	Health=1
	SpawnOnDestroyedSimple(0)='p_Impacts.dukesauce.Splatter_Pickles'
	SpawnOnDestroyed(0)=(SpawnClass='Settings_DukeBurger_PickleJar_Gib_B',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0)
	SpawnOnDestroyed(1)=(SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=0.9888307,Y=2.813475E-17,Z=3.962),Z=8.803)
	SpawnOnDestroyed(2)=(OffsetVariance=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0)
	SpawnOnDestroyed(3)=(Rotation=(Pitch=8709,Yaw=571080704,Roll=0),Roll=0)
	SpawnOnDestroyed(4)=(RotationVariance=(Pitch=8709,Yaw=571080704,Roll=0),Roll=0)
	SpawnOnDestroyed(5)=(BoneName=None,MotionInfo=none)
	bTickOnlyWhenPhysicsAwake=true
	DynamicInteractionClassification=7
	PhysicsMaterial='dnMaterial.dnPhysicsMaterial_Glass'
	PhysicsMassType=1
	MinDamageVelocity=80
	MaxImpactDamage=10
	FixedPhysicsDamageToNotPlayer=1
	bAITransparent=true
	CollisionRadius=10
	CollisionHeight=15
	Mass=10
	PrePivot=(X=1.291717E-41,Y=2.797242E-17,Z=0)
	StaticMesh='sm_class_decorations.Kitchen.jar_pickle'
}