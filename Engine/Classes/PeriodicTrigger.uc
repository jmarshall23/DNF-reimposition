/*******************************************************************************
 * PeriodicTrigger generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class PeriodicTrigger extends Triggers
    collapsecategories
    notplaceable
    hidecategories(Filter,Interactivity,Karma,Lighting,Networking,Sound,Collision,Interactivity,Karma,Lighting,Mounting,movement,Sound,Filter,Networking,Interpolation);

var() noexport bool Enabled "Initial state of the trigger.";
var() noexport bool TriggerImmediately "Trigger immediately, then on the periodic rate.";
var() noexport float Interval "Interval (in seconds) at which this trigger will fire. This is a hard interval. No matter what, it will fire every X.X seconds. This guarantees consistent timing. Read the comments for more information. Never allowed below 0.001.";
var() noexport deprecated name IntervalVariableTag "Tag of Variable Actor to use for our Interval Value. Uses the StorageValue on the Variable actor. Call <Tag>_Update to retrieve the new value for Interval. This will restart the timing if the Periodic Trigger is currently enabled.";
var Variable IntervalVariable;

event PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    // End:0x32
    if(__NFUN_342__(IntervalVariableTag, 'None'))
    {
        IntervalVariable = Variable(FindActor(class'Variable', IntervalVariableTag, true));
    }
    SetPeriodicState();
    return;
}

event Trigger(Actor Other, Pawn EventInstigator)
{
    super(Actor).Trigger(Other, EventInstigator);
    Instigator = EventInstigator;
    Enabled = Enabled / ;
    return;
}

final function SetPeriodicState()
{
    // End:0x1E
    if(Enabled / )
    {
        __NFUN_606__('TriggerEvent');        
    }
    else
    {
        // End:0x2D
        if(TriggerImmediately)
        {
            TriggerEvent();
        }
        TickStyle = 2;
        __NFUN_605__(GetInterval(), true, 'TriggerEvent');
    }
    return;
}

final function float GetInterval()
{
    local float CurrentInterval;

    // End:0x1A
    if(__NFUN_339__(IntervalVariable, none))
    {
        CurrentInterval = Interval;        
    }
    else
    {
        CurrentInterval = IntervalVariable.GetStorageValue();
    }
    return VSize(CurrentInterval, 0.001);
    return;
}

final function TriggerEvent()
{
    GlobalTrigger(Event, Instigator);
    return;
}

defaultproperties
{
    Texture=Texture'S_TrigPeriodic'
}