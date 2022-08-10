/*******************************************************************************
 * dnControlHelper_CircularGymVent generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnControlHelper_CircularGymVent extends dnDecoration;

k2call simulated function GoPhysics(optional EventInfo AnimEventInfo)
{
	UnMimicOwner();
	__NFUN_631__();
	__NFUN_709__();
	bMimicOwner = false;
	bUsable = false;
	bStartEnabled = true;
	bDumbMesh = true;
	__NFUN_642__(18);
	return;
}

defaultproperties
{
	HealthPrefab=0
	bUseDecoAnim=false
	bMimicOwner=true
	bPassUseToOwner=true
	StartAnimSequence=a_circularvent_cover_map02_circlevent_01
	StartAnimFrame=1
	AnimationControllerClass='acCircularGymVent'
	DynamicInteractionClassification=1
	PhysicsMaterial='dnMaterial.dnPhysicsMaterial_Metal_Hollow'
	PhysicsMassType=1
	bTraceUsable=false
	bBlockActors=false
	bBlockPlayers=false
	bBlockKarma=true
	bHidden=true
	bDumbMesh=false
	bCollideWorld=false
	CollisionRadius=0
	CollisionHeight=0
	Mass=50
	Mesh='c_hands.CircularVent_Cover'
}