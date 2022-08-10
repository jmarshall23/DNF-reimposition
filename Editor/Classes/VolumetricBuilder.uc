/*******************************************************************************
 * VolumetricBuilder generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class VolumetricBuilder extends BrushBuilder;

var() float Height;
var() float Radius;
var() int NumSheets;
var() name GroupName;

function BuildVolumetric(int Direction, int NumSheets, float Height, float Radius)
{
	local int n, X, Y;
	local Rotator RotStep;
	local Vector vtx, NewVtx;

	n = GetVertexCount();
	RotStep.Yaw = __NFUN_163__(65536, __NFUN_162__(NumSheets, 2));
	vtx.X = Radius;
	vtx.Z = __NFUN_196__(Height, float(2));
	X = 0;
	J0x53:

	// End:0xDA [Loop If]
	if(__NFUN_169__(X, __NFUN_162__(NumSheets, 2)))
	{
		NewVtx = __NFUN_241__(vtx, __NFUN_266__(RotStep, float(X)));
		Vertex3f(NewVtx.X, NewVtx.Y, NewVtx.Z);
		Vertex3f(NewVtx.X, NewVtx.Y, __NFUN_199__(NewVtx.Z, Height));
		__NFUN_184__(X);
		// [Loop Continue]
		goto J0x53;
	}
	X = 0;
	J0xE1:

	// End:0x190 [Loop If]
	if(__NFUN_169__(X, NumSheets))
	{
		Y = __NFUN_165__(__NFUN_162__(X, 2), 1);
		// End:0x125
		if(__NFUN_172__(Y, __NFUN_162__(NumSheets, 2)))
		{
			__NFUN_181__(Y, __NFUN_162__(NumSheets, 2));
		}
		Poly4i(Direction, __NFUN_165__(n, __NFUN_162__(X, 2)), __NFUN_165__(n, Y), __NFUN_165__(__NFUN_165__(n, Y), __NFUN_162__(NumSheets, 2)), __NFUN_165__(__NFUN_165__(n, __NFUN_162__(X, 2)), __NFUN_162__(NumSheets, 2)), 'Sheets', 264);
		__NFUN_184__(X);
		// [Loop Continue]
		goto J0xE1;
	}
	return;
}

function bool Build()
{
	// End:0x13
	if(__NFUN_169__(NumSheets, 2))
	{
		return BadParameters();
	}
	// End:0x34
	if(__NFUN_150__(__NFUN_202__(Height, float(0)), __NFUN_202__(Radius, float(0))))
	{
		return BadParameters();
	}
	BeginBrush(true, GroupName);
	BuildVolumetric(1, NumSheets, Height, Radius);
	return EndBrush();
	return;
}

defaultproperties
{
	Height=128
	Radius=64
	NumSheets=2
	GroupName=Volumetric
	BitmapFilename="BBVolumetric"
	ToolTip="Volumetric (Torches, Chains, etc)"
}