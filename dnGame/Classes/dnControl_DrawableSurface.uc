/*******************************************************************************
 * dnControl_DrawableSurface generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnControl_DrawableSurface extends dnControl
	abstract
	collapsecategories;

var() float XDrawOffset;
var() float YDrawOffset;
var() float XDrawRatio;
var() float YDrawRatio;
var() name AimGridName;
var() name ReferencePose;
var() name IdleAnimName;
var() name WriteAnimName;
var() TextureCanvas DrawCanvas;
var() noexport array<byte> DrawColors "The colors that the pen can choose from for drawing.";
var int PreviousXDrawPos;
var int PreviousYDrawPos;
var int CurrentColor;
var bool bPenJustTouchedPaper;
var int DrawSurfaceIndex;
var dnControlHelper_DrawingTool DrawingTool;
var float TouchPaperTimer;
var Texture SurfaceTexture;

event PreGameInit()
{
	local bool bInitComplete;

	super(dnDecoration).PreGameInit();
	// End:0x32
	if(__NFUN_148__(__NFUN_172__(DrawSurfaceIndex, 0), __NFUN_339__(SurfaceTexture, none)))
	{
		SurfaceTexture = Texture(__NFUN_740__(DrawSurfaceIndex));
	}
	// End:0x8B
	if(__NFUN_148__(__NFUN_339__(DrawCanvas, none), __NFUN_340__(SurfaceTexture, none)))
	{
		DrawCanvas = class'TextureCanvas'.static.StaticCreateTextureCanvas(SurfaceTexture, Level.XLevel);
		__NFUN_741__(DrawSurfaceIndex, DrawCanvas);
		bInitComplete = true;
	}
	// End:0x10C
	if(__NFUN_340__(DrawCanvas, none))
	{
		// End:0xF0
		if(__NFUN_145__(bInitComplete))
		{
			DrawCanvas.__NFUN_1198__(DrawCanvas.USize, DrawCanvas.VSize);
			// End:0xF0
			if(__NFUN_340__(SurfaceTexture, none))
			{
				DrawCanvas.DrawBitmap(SurfaceTexture, 0, 0);
			}
		}
		DrawCanvas.__NFUN_1209__(false);
		DrawCanvas.__NFUN_1210__(true);
	}
	return;
}

k2call simulated function ColorChange()
{
	local byte PaletteIndex;

	// End:0x1C
	if(__NFUN_173__(string(DrawColors), 0))
	{
		CurrentColor = DrawColors.Add(1);		
	}
	else
	{
		CurrentColor = __NFUN_164__(__NFUN_165__(CurrentColor, 1), string(DrawColors));
	}
	return;
}

simulated function AttachPawnSuccess(Pawn Attachee, optional bool bForced)
{
	local DukePlayer Duke;

	super.AttachPawnSuccess(Attachee, bForced);
	Duke = DukePlayer(User);
	// End:0x3F
	if(__NFUN_340__(Duke, none))
	{
		Duke.bDontAllowToggleZoom = true;
	}
	return;
}

simulated function DetachPawnSuccess(bool bForced)
{
	local DukePlayer Duke;

	Duke = DukePlayer(User);
	// End:0x2E
	if(__NFUN_340__(Duke, none))
	{
		Duke.bDontAllowToggleZoom = false;
	}
	super.DetachPawnSuccess(bForced);
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super.RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1281__(AimGridName);
	PrecacheIndex.__NFUN_1281__(ReferencePose);
	PrecacheIndex.__NFUN_1281__(IdleAnimName);
	PrecacheIndex.__NFUN_1281__(WriteAnimName);
	return;
}

state DrawableSurfaceBaseState
{
	function InputHook_ViewRotationAdjust(out int PitchAdjust, out int YawAdjust, out int RollAdjust, optional float DeltaTime)
	{
		global.InputHook_ViewRotationAdjust(PitchAdjust, YawAdjust, RollAdjust, DeltaTime);
		User.AnimationController.SetAnimGridState(AimGridName, MouseInputX, MouseInputY);
		return;
	}
	stop;
}

state DrawableSurfaceIdle extends DrawableSurfaceBaseState
{
	event BeginState()
	{
		// End:0x2F
		if(__NFUN_342__(ReferencePose, 'None'))
		{
			User.AnimationController.SetAnimState(ReferencePose);
		}
		// End:0x5E
		if(__NFUN_342__(IdleAnimName, 'None'))
		{
			User.AnimationController.SetAnimState(IdleAnimName);
		}
		return;
	}
	stop;
}

state Drawing extends DrawableSurfaceBaseState
{
	event BeginState()
	{
		bPenJustTouchedPaper = true;
		TouchPaperTimer = default.TouchPaperTimer;
		// End:0x42
		if(__NFUN_342__(WriteAnimName, 'None'))
		{
			User.AnimationController.SetAnimState(WriteAnimName);
		}
		return;
	}

	event Tick(float DeltaTime)
	{
		local int XDrawPos, YDrawPos;

		// End:0x37
		if(__NFUN_201__(TouchPaperTimer, 0))
		{
			__NFUN_210__(TouchPaperTimer, DeltaTime);
			// End:0x35
			if(__NFUN_200__(TouchPaperTimer, 0))
			{
				bPenJustTouchedPaper = true;				
			}
			else
			{
				return;
			}
		}
		XDrawPos = int(__NFUN_198__(float(int(__NFUN_195__(XDrawRatio, __NFUN_195__(float(DrawCanvas.USize), __NFUN_199__(1, __NFUN_196__(__NFUN_198__(__NFUN_194__(MouseInputX), 1), 2)))))), XDrawOffset));
		YDrawPos = int(__NFUN_198__(float(int(__NFUN_195__(YDrawRatio, __NFUN_195__(float(DrawCanvas.VSize), __NFUN_199__(1, __NFUN_196__(__NFUN_198__(MouseInputY, 1), 2)))))), YDrawOffset));
		// End:0xFD
		if(bPenJustTouchedPaper)
		{
			bPenJustTouchedPaper = false;
			DrawingTool.DrawOnPoint(DrawCanvas, XDrawPos, YDrawPos, DrawColors[CurrentColor]);			
		}
		else
		{
			// End:0x151
			if(__NFUN_150__(__NFUN_174__(XDrawPos, PreviousXDrawPos), __NFUN_174__(YDrawPos, PreviousYDrawPos)))
			{
				DrawingTool.DrawOnLine(DrawCanvas, XDrawPos, YDrawPos, PreviousXDrawPos, PreviousYDrawPos, DrawColors[CurrentColor]);
			}
		}
		PreviousXDrawPos = XDrawPos;
		PreviousYDrawPos = YDrawPos;
		global.Tick(DeltaTime);
		return;
	}
	stop;
}

defaultproperties
{
	WriteAnimName=BookSigning_PenDown
	CurrentColor=-1
	DrawSurfaceIndex=-1
	TouchPaperTimer=0.125
	bManipulateViewOnAttach=false
	bManipulateViewOnIdle=false
}