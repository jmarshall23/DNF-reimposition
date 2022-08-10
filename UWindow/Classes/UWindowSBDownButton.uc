/*******************************************************************************
 * UWindowSBDownButton generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UWindowSBDownButton extends UWindowButton;

var float NextClickTime;

function Created()
{
	bNoKeyboard = true;
	super.Created();
	return;
}

function LMouseDown(float X, float Y)
{
	super(UWindowWindow).LMouseDown(X, Y);
	// End:0x1B
	if(bDisabled)
	{
		return;
	}
	UWindowVScrollbar(ParentWindow).Scroll(UWindowVScrollbar(ParentWindow).ScrollAmount);
	NextClickTime = __NFUN_198__(Root.GetPlayerOwner().Level.TimeSeconds, 0.5);
	return;
}

function Tick(float Delta)
{
	// End:0xA1
	if(__NFUN_148__(__NFUN_148__(bMouseDown, __NFUN_201__(NextClickTime, float(0))), __NFUN_200__(NextClickTime, Root.GetPlayerOwner().Level.TimeSeconds)))
	{
		UWindowVScrollbar(ParentWindow).Scroll(UWindowVScrollbar(ParentWindow).ScrollAmount);
		NextClickTime = __NFUN_198__(Root.GetPlayerOwner().Level.TimeSeconds, 0.1);
	}
	// End:0xB7
	if(__NFUN_145__(bMouseDown))
	{
		NextClickTime = 0;
	}
	return;
}

defaultproperties
{
	bStretched=true
	bSolid=true
	UpTexture='Menu.Menu.Backdrop'
	DownTexture='Menu.Menu.Backdrop'
	DisabledTexture='Menu.Menu.Backdrop'
	OverTexture='Menu.Menu.Backdrop'
	UpRegion=(X=417,Y=136,W=11,h=19)
	DownRegion=(X=417,Y=136,W=11,h=19)
	DisabledRegion=(X=417,Y=136,W=11,h=19)
	OverRegion=(X=417,Y=136,W=11,h=19)
	bUseRegion=true
}