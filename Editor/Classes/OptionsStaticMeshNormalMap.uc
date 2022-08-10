/*******************************************************************************
 * OptionsStaticMeshNormalMap generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class OptionsStaticMeshNormalMap extends OptionsProxy
	native;

enum ESampleMode
{
	SAMPLE_CLOSEST,
	SAMPLE_FARTHEST,
	SAMPLE_FIRST_HIT,
	SAMPLE_BEST_NORMAL
};

enum ESuperSample
{
	SS_None,
	SS_2X,
	SS_4X,
	SS_8X
};

var() bool bOverrideSize;
var() int OverrideWidth;
var() int OverrideHeight;
var() int NumSmooths;
var() int NumExpands;
var() bool bOverridePackage;
var() string TexturePkg;
var() string TextureGroup;
var() bool bAutoNumberNames;
var() bool bAllowDistortion;
var() bool bDebug;
var() bool bDrawEdges;
var() int NumSamples;
var() float SampleScale;
var() float SampleDist;
var() OptionsStaticMeshNormalMap.ESampleMode SampleMode;
var() OptionsStaticMeshNormalMap.ESuperSample SuperSample;
var() float BumpScale;

defaultproperties
{
	OverrideWidth=256
	OverrideHeight=256
	NumExpands=2
	bOverridePackage=true
	TexturePkg="NormalMaps"
	TextureGroup="Default"
	bAllowDistortion=true
	NumSamples=1
	SampleScale=1
	SampleDist=64
	SampleMode=2
	SuperSample=2
	BumpScale=1
	DlgCaption="Create NormalMap"
}