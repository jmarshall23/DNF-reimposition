/*******************************************************************************
 * ParticleEffector generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ParticleEffector extends InfoActor
	native
	collapsecategories
	notplaceable;

cpptext
{
// Stripped
}

enum EEffectorType
{
	EFT_Accel,
	EFT_Sphere,
	EFT_Plane
};

var() noexport ParticleEffector.EEffectorType m_eEffectorType "Type of effector to use.";
var() noexport float m_fRadius "Particles within this radius can be affected.";
var() noexport float m_fAge "How 'old' the effector is when it spawns.  Affects LifeSpan.";
var(EffectorAccel) noexport float m_fAccelSpeed "Speed to apply to pushed particles.";
var(EffectorAccel) noexport Vector m_vAccelDir "Direction in which to accelerate particles.";
var(EffectorAccel) noexport bool m_bAccelOutwards "Accelerate along the direction from the effector's center to the particle.";
var(EffectorPlane) noexport Vector m_vPlaneDir "Direction of the plane normal.";
var(EffectorPlane) noexport bool m_bTwoSided "If true, plane will stop partcles impacting it's back side.";
var(EffectorMisc) noexport float m_fElasticity "Elasticity to use for particle impacts (EFT_Sphere, EFT_Plane).";
var float m_fLifeTime;
var transient int m_pEffector;

// Export UParticleEffector::execEffectorAttach(FFrame&, void* const)
native(1176) final function EffectorAttach(Actor pActor)
{
	//native.pActor;	
}

// Export UParticleEffector::execEffectorDetach(FFrame&, void* const)
native(1177) final function EffectorDetach(Actor pActor)
{
	//native.pActor;	
}

// Export UParticleEffector::execUpdate(FFrame&, void* const)
native(1178) final function Update(float fDeltaTime)
{
	//native.fDeltaTime;	
}

// Export UParticleEffector::execCreateEffector(FFrame&, void* const)
native(1179) final function CreateEffector();

simulated function Tick(float fDeltaTime)
{
	__NFUN_1178__(fDeltaTime);
	return;
}

event PostBeginPlay()
{
	m_fLifeTime = LifeSpan;
	__NFUN_1179__();
	__NFUN_590__(true);
	return;
}

event Touch(Actor Other)
{
	// End:0x1B
	if(__NFUN_341__(Event, 'None'))
	{
		__NFUN_1176__(Other);		
	}
	else
	{
		// End:0x3D
		if(__NFUN_341__(Event, Other.Tag))
		{
			__NFUN_1176__(Other);
		}
	}
	return;
}

event UnTouch(Actor Other)
{
	Detach(Other);
	return;
}

defaultproperties
{
	m_fRadius=128
	m_fAccelSpeed=300
	m_vPlaneDir=(X=1.293258E-41,Y=3.084513E-17,Z=0)
	m_bTwoSided=true
	m_fElasticity=1
	bCollideActors=true
	CollisionRadius=32
	CollisionHeight=32
}