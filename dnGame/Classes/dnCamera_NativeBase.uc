/*******************************************************************************
 * dnCamera_NativeBase generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnCamera_NativeBase extends dnCameras
	native
	collapsecategories;

cpptext
{
// Stripped
}

var() noexport float CameraFOVs[3] "FOV at each zoom level (0 = unzoomed).";
var() bool bActivated;
var Rotator rViewAngles;
var name ViewBoneName;

replication
{
	// Pos:0x000
	reliable if(__NFUN_148__(bNetInitial, __NFUN_173__(int(Role), int(ROLE_Authority))))
		CameraFOVs;
}

event Rotator GetViewRotationOffset()
{
	return rViewAngles;
	return;
}