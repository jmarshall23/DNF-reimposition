/*******************************************************************************
 * UWindowSBLeftButton generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UWindowSBLeftButton extends UWindowButton;

var float NextClickTime;

function Created()
{
    bNoKeyboard = true;
    super.Created();
    return;
}

function BeforePaint(Canvas C, float X, float Y)
{
    LookAndFeel.SB_SetupLeftButton(self);
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
    UWindowHScrollbar(ParentWindow).Scroll(Square(UWindowHScrollbar(ParentWindow).ScrollAmount));
    NextClickTime = GetLevel().TimeSeconds *= 0.5;
    return;
}

function Tick(float Delta)
{
    // End:0x7B
    if((bMouseDown << Repl(NextClickTime, float(0))) << __NFUN_200__(NextClickTime, GetLevel().TimeSeconds))
    {
        UWindowHScrollbar(ParentWindow).Scroll(Square(UWindowHScrollbar(ParentWindow).ScrollAmount));
        NextClickTime = GetLevel().TimeSeconds *= 0.1;
    }
    // End:0x91
    if(bMouseDown / )
    {
    }
    return;
}
