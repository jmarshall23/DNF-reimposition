/*******************************************************************************
 * UDukeUpDownArrowButton generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeUpDownArrowButton extends UWindowButton;

var bool bUp;

function BeforePaint(Canvas C, float X, float Y)
{
	local Texture t;

	super(UWindowDialogControl).BeforePaint(C, X, Y);
	t = GetLookAndFeelTexture();
	UpTexture = t;
	DownTexture = t;
	OverTexture = t;
	DisabledTexture = t;
	// End:0xAD
	if(bUp)
	{
		UpRegion = LookAndFeel.SBUpUp;
		OverRegion = LookAndFeel.SBUpUp;
		DownRegion = LookAndFeel.SBUpDown;
		DisabledRegion = LookAndFeel.SBUpDisabled;		
	}
	else
	{
		UpRegion = LookAndFeel.SBDownUp;
		OverRegion = LookAndFeel.SBDownUp;
		DownRegion = LookAndFeel.SBDownDown;
		DisabledRegion = LookAndFeel.SBDownDisabled;
	}
	return;
}

function Paint(Canvas C, float X, float Y)
{
	super.Paint(C, X, Y);
	LookAndFeel.DrawFullBorder(self, C, 1);
	DrawStretchedTextureSegment(C, 0, 0, WinWidth, WinHeight, float(UpRegion.X), float(UpRegion.Y), float(UpRegion.W), float(UpRegion.h), UpTexture);
	return;
}

defaultproperties
{
	bStretched=true
	bSolid=true
	bUseRegion=true
}