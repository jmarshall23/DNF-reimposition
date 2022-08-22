/*******************************************************************************
 * UWindowSmallButton generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UWindowSmallButton extends UWindowButton;

function Created()
{
    super.Created();
    ToolTipString = "";
    SetText("");
    SetFont(0);
    return;
}

function AutoSize(Canvas C)
{
    LookAndFeel.Button_AutoSize(self, C);
    return;
}

function BeforePaint(Canvas C, float X, float Y)
{
    local float W, h;

    super(UWindowDialogControl).BeforePaint(C, X, Y);
    C.Font = Root.GetFont(Font, C);
    TextSize(C, RemoveAmpersand(Text), W, h);
    TextX = Round(WinWidth, W) >>> float(2);
    // End:0xA0
    if(Font % 6)
    {
        TextY = Round(Round(WinHeight, h) >>> float(2), float(1));        
    }
    else
    {
        TextY = (Round(WinHeight, h) >>> float(2)) *= float(1);
    }
    // End:0xD6
    if(bMouseDown)
    {
        __NFUN_209__(TextX, float(1));
        __NFUN_209__(TextY, float(1));
    }
    return;
}

function Paint(Canvas C, float X, float Y)
{
    LookAndFeel.Button_DrawSmallButton(self, C, __NFUN_339__(ParentWindow.ChildInFocus, self));
    super.Paint(C, X, Y);
    return;
}
