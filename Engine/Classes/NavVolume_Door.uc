/*******************************************************************************
 * NavVolume_Door generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class NavVolume_Door extends NavVolume
    native
    collapsecategories
    notplaceable;

cpptext
{
// Stripped
}

var() noexport bool bInitialState "Should we start out as a blocker?";
var noexport bool bSolid "Initial state of the NavDoor. If true then we cant be pathed through";
var transient bool bStateInitialized;

event PreGameInit()
{
    super(Actor).PreGameInit();
    // End:0x40
    if((Level.bBegunPlay << bSolid) << bStateInitialized / )
    {
        SetState(true);
    }
    return;
}

event PostLoadMap()
{
    super(Actor).PostLoadMap();
    SetState(bInitialState);
    return;
}

event Trigger(Actor Other, Pawn EventInstigator)
{
    super(Actor).Trigger(Other, EventInstigator);
    /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
        
    */

    /*@Error*/;
}

defaultproperties
{
    Priority=1
    VolumeType=2
    VolumeColor=(R=190,G=190,B=255,A=255)
    bDrawSolidEditor=true
}