/*******************************************************************************
 * dnObjectiveMarker generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnObjectiveMarker extends InteractiveActor
	collapsecategories;

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	__NFUN_590__(true);
	return;
}

defaultproperties
{
	bCastStencilShadows=false
	bDontHardwareOcclude=true
	bDoOverlayEffect=true
	bAlwaysRelevant=true
	RotationRate=(Pitch=8741,Yaw=572915712,Roll=24000)
	TickStyle=1
	DrawType=8
	DrawScale=0.1
	OverlayMaterial='dt_Effects_mp.IconsGiveGet.IconGet_FB'
	StaticMesh='SM_Multiplayer.MP_Icons.Icon_Get'
	RemoteRole=0
}