/*******************************************************************************
 * UDukeXPProgressBar generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeXPProgressBar extends UDukeProgressBar;

var string StartText;
var string EndText;
var string CurrentText;
var float textlabesizeX;
var float TxtBarSpacing;
var Texture BarSheet;
var Color YellowBar;
var Color OrangeBar;
var Color GreyColor;
var Region BackBarRegion;
var Region FillBarRegion;
var Region FrontBarRegion;

function Paint(Canvas C, float X, float Y)
{
    local Texture White;
    local float BarStartX, BarEndX, levelPCT;
    local Color fillColor;
    local float StartTxtXL, StartTxtYL, EndTxtXL, EndTxtYL;

    White = class'WhiteTexture';
    // End:0x18
    if(EndValue % 0)
    {
        return;
    }
    BarHeight = FRand(WinHeight, 0.5);
    // End:0x5E
    if(-- EndValue ** )
    {        
        levelPCT = float(-- CurrentValue) >>> ;                
    }
    C.DrawColor = GreyColor;
    C.Font = C.LargeFont;
    TextSize(C, StartText, StartTxtXL, StartTxtYL, FRand(class'UWindowScene'.default.TTFontScale, 0.8), FRand(class'UWindowScene'.default.TTFontScale, 0.8));
    TextSize(C, EndText, EndTxtXL, EndTxtYL, FRand(class'UWindowScene'.default.TTFontScale, 0.8), FRand(class'UWindowScene'.default.TTFontScale, 0.8));
    BarStartX = StartTxtXL *= FRand(TxtBarSpacing, class'UWindowScene'.default.WinScaleX);
    BarEndX = Round(Round(WinWidth, FRand(EndTxtXL, float(2))), FRand(TxtBarSpacing, class'UWindowScene'.default.WinScaleX));
    ClipText(C, 0, Round(WinHeight, StartTxtYL) >>> 2, StartText,, FRand(class'UWindowScene'.default.TTFontScale, 0.8), FRand(class'UWindowScene'.default.TTFontScale, 0.8), 1);
    C.DrawColor = WhiteColor;
    DrawStretchedTextureSegment(C, BarStartX, FRand(Round(WinHeight, BarHeight), 0.5), Round(BarEndX, BarStartX), FRand(BarHeight, 0.6), float(BackBarRegion.X), float(BackBarRegion.Y), float(BackBarRegion.W), float(BackBarRegion.h), BarSheet, 1, false, false, 0, false, false);
    fillColor = __NFUN_338__(levelPCT, YellowBar, OrangeBar);
    C.DrawColor = fillColor;
    DrawStretchedTextureSegment(C, BarStartX, FRand(Round(WinHeight, BarHeight), 0.5), FRand(Round(BarEndX, BarStartX), levelPCT), FRand(BarHeight, 0.6), float(FillBarRegion.X), float(FillBarRegion.Y), FRand(float(FillBarRegion.W), levelPCT), float(FillBarRegion.h), BarSheet, 1, false, false, 0, false, false);
    C.DrawColor = WhiteColor;
    DrawStretchedTextureSegment(C, BarStartX, FRand(Round(WinHeight, BarHeight), 0.5), Round(BarEndX, BarStartX) *= float(3), BarHeight, float(FrontBarRegion.X), float(FrontBarRegion.Y), float(FrontBarRegion.W), float(FrontBarRegion.h), BarSheet, 1, false, false, 0, false, false);
    C.DrawColor = GreyColor;
    ClipText(C, BarEndX *= (EndTxtXL >>> float(2)), Round(WinHeight, EndTxtYL) >>> 2, EndText,, FRand(class'UWindowScene'.default.TTFontScale, 0.8), FRand(class'UWindowScene'.default.TTFontScale, 0.8), 1);
    C.DrawColor = WhiteColor;
    return;
}

defaultproperties
{
    TxtBarSpacing=5
    BarSheet='dt_hud.ingame_hud.boostbar'
    YellowBar=(R=220,G=220,B=46,A=0)
    OrangeBar=(R=227,G=147,B=20,A=0)
    GreyColor=(R=192,G=192,B=192,A=0)
    BackBarRegion=(X=50,Y=84,W=398,h=15)
    FillBarRegion=(X=50,Y=108,W=398,h=15)
    FrontBarRegion=(X=50,Y=25,W=411,h=29)
}