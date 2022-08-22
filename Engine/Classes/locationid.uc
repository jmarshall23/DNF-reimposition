/*******************************************************************************
 * locationid generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class locationid extends Keypoint
    native
    collapsecategories
    notplaceable;

var() localized string LocationName;
var() float Radius;
var locationid NextLocation;

simulated event PostBeginPlay()
{
    local locationid l;

    super(Actor).PostBeginPlay();
    // End:0x39
    if(__NFUN_339__(Region.Zone.locationid, none))
    {
        Region.Zone.locationid = self;
        return;
    }
    l = Region.Zone.locationid;
    J0x53:

    // End:0xA0 [Loop If]
    if(__NFUN_340__(l, none))
    {
        // End:0x88
        if(__NFUN_339__(l.NextLocation, none))
        {
            l.NextLocation = self;
            return;
        }
        l = l.NextLocation;
        // [Loop Continue]
        goto J0x53;
    }
    return;
}
