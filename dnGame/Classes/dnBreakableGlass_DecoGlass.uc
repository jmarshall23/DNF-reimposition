/*******************************************************************************
 * dnBreakableGlass_DecoGlass generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnBreakableGlass_DecoGlass extends dnBreakableGlass
    collapsecategories;

event PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x24
    if(__NFUN_340__(KarmaActor(Owner), none))
    {
        __NFUN_822__(KarmaActor(Owner));
    }
    return;
}

defaultproperties
{
    GlassShatterSoundName=Glass_Shatter_Small
    BulgeOnBreakAmount=0
    bMimicOwner=true
    bPassUseToOwner=true
    Physics=9
    bOccludeSounds=false
}