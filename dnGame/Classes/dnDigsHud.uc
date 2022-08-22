/*******************************************************************************
 * dnDigsHud generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnDigsHud extends MetagameHUD
    config(User)
    collapsecategories;

var InteractiveActor MyDigsItem;
var localized string MoreInfoButtonStr;
var localized string MyDigsButtonStr;
var bool bDrawDigsHud;
var float SizeX;
var float SizeY;
var SquareRegion ClippingRegion;

simulated event PostPostRender(Canvas C)
{
    super.PostPostRender(C);
    SizeX = float(C.SizeX);
    SizeY = float(C.SizeY);
    ClippingRegion.X = 0;
    ClippingRegion.Y = 0;
    ClippingRegion.W = int(SizeX);
    ClippingRegion.h = int(SizeY);
    DisplayCustomizationButtons(C);
    DisplayMoreInfoButton(C);
    return;
}

function DisplayCustomizationButtons(Canvas Canvas)
{
    // End:0x3B
    if(__NFUN_339__(Level.Game, none) < Level.Game.__NFUN_358__('dnMyDigs') / )
    {
    }
    // End:0x70
    if(DukeMyDigsPlayer(Level.__NFUN_1161__()).IsBusy())
    {
        HUDMessages[8].TargetAlpha = 0;
        return;
    }
    bHideHUD = true;
    GetLookActor();
    HUDMessages[8].Message = MyDigsButtonStr;
    // End:0xB0
    if(bDrawDigsHud)
    {
        HUDMessages[8].TargetAlpha = 1;        
    }
    else
    {
        HUDMessages[8].TargetAlpha = 0;
    }
    return;
}

function DisplayMoreInfoButton(Canvas C)
{
    // End:0x12A
    if(DukeMyDigsPlayer(Level.__NFUN_1161__()).IsLookingAtDigsItem())
    {
        // End:0x5B
        if(__NFUN_339__(Level.Game, none) < Level.Game.__NFUN_358__('dnMyDigs') / )
        {
        }
        // End:0x90
        if(DukeMyDigsPlayer(Level.__NFUN_1161__()).IsBusy())
        {
            HUDMessages[9].TargetAlpha = 0;
            return;
        }
        bHideHUD = true;
        // End:0xE2
        if(DukeMyDigsPlayer(Level.__NFUN_1161__()).Player.Console.bShowDigsMoreInfo)
        {
            HUDMessages[9].TargetAlpha = 0;            
        }
        else
        {
            HUDMessages[9].Message = MoreInfoButtonStr;
            // End:0x114
            if(bDrawDigsHud)
            {
                HUDMessages[9].TargetAlpha = 1;                
            }
            else
            {
                HUDMessages[9].TargetAlpha = 0;
            }
        }        
    }
    else
    {
        HUDMessages[9].TargetAlpha = 0;
    }
    return;
}

function HideDigsHud()
{
    bDrawDigsHud = false;
    return;
}

function ShowDigsHud()
{
    bDrawDigsHud = true;
    return;
}

defaultproperties
{
    MoreInfoButtonStr="<?int?dnGame.dnDigsHud.MoreInfoButtonStr?>"
    MyDigsButtonStr="<?int?dnGame.dnDigsHud.MyDigsButtonStr?>"
}