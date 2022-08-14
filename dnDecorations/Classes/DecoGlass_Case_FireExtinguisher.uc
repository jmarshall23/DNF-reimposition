/*******************************************************************************
 * DecoGlass_Case_FireExtinguisher generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class DecoGlass_Case_FireExtinguisher extends dnBreakableGlass_DecoGlass
	collapsecategories;

var Actor TreasureBehind;

event TakeDamage(Pawn Instigator, float Damage, Vector DamageOrigin, Vector DamageDirection, class<DamageType> DamageType, optional name HitBoneName, optional Vector DamageStart)
{
	// End:0x43
	if(__NFUN_357__(DamageType, class'ExplosionDamage'))
	{
		TreasureBehind.TakeDamage(Instigator, Damage, DamageOrigin, DamageDirection, DamageType, HitBoneName, DamageStart);
	}
	super(InteractiveActor).TakeDamage(Instigator, Damage, DamageOrigin, DamageDirection, DamageType, HitBoneName, DamageStart);
	return;
}

event Used(Actor Other, Pawn EventInstigator)
{
	super(dnBreakableGlass).Used(Other, EventInstigator);
	__NFUN_1080__(Location);
	__NFUN_1086__();
	return;
}

defaultproperties
{
	ParticleSize=3
	bRandomTextureRotation=false
	bAlignTextureOnBreak=false
	bStaticEdgePieces=false
	bForceUsePhrase=true
	bMimicOwner=false
	bPassUseToOwner=false
	DrawScale3D=(X=1.291717E-41,Y=2.802768E-17,Z=28)
	Skins(0)='smt_skins3.FireExtinguisher_Box.FireGlass_FinalBlend'
	Skins(1)='smt_skins3.FireExtinguisher_Box.FireGlass_FinalBlend'
	Skins(2)='smt_skins3.FireExtinguisher_Box.FireGlass_FinalBlend'
	Skins(3)='smt_skins3.FireExtinguisher_Box.FireGlass_FinalBlend'
}