/*******************************************************************************
 * BumpCubeEnvMap generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class BumpCubeEnvMap extends RenderedMaterial
	native
	hidecategories(Object);

cpptext
{
// Stripped
}

var() MaterialEx NormalMap;
var() Texture HeightMap;
var() float BumpScale;
var() int NumSmoothPasses;
var() bool bInvertBumps;
var() MaterialEx BumpTarget;
var() bool bHighResNormalMap;

defaultproperties
{
	BumpScale=1
	bBumpCubeEnvMap=true
}