/*******************************************************************************
 * Weapon_LightEx generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Weapon_LightEx extends LightEx
	collapsecategories
	notplaceable
	hidecategories(Collision,Filter,HeatVision,Interactivity,Karma,KarmaObject,KarmaOverride,Networking,SpawnOnDestroyed);

var() noexport float FlashTime "How long should this light flash after a weapon is fired?";

function PostBeginPlay()
{
	super(RenderActor).PostBeginPlay();
	// End:0x3F
	if(__NFUN_340__(Owner, none))
	{
		LightRadius = __NFUN_195__(default.LightRadius, __NFUN_196__(Owner.DrawScale, Owner.default.DrawScale));
	}
	FlashOver();
	return;
}

function Flash()
{
	LightStyle = default.LightStyle;
	LightStringStartTime = Level.GameTimeSeconds;
	__NFUN_607__(FlashTime, false, 'FlashOver');
	bAlwaysVisible = bSkipVisibilityUpdate;
	return;
}

function FlashOver()
{
	LightStyle = 0;
	MarkDirty();
	bAlwaysVisible = false;
	return;
}

defaultproperties
{
	FlashTime=0.05
	bCastStencilShadows=false
	bSkipVisibilityUpdate=true
	RemoteRole=0
}