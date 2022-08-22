/*******************************************************************************
 * TriggerScriptMethod generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class TriggerScriptMethod extends Triggers
    collapsecategories
    hidecategories(Filter,Interactivity,Karma,Lighting,Networking,Sound);

var() noexport ScriptMethod Method "A script method to trigger.  NOTE: you should only use transient script methods with this trigger.";
var() noexport bool PrintDebug "Print out some debug info when the method executes.";

event Trigger(Actor Other, Pawn EventInstigator)
{
    local AIActor MyActor;

    // End:0xE8
    if(PrintDebug)
    {
        BroadcastLog(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__("(", string(Name)), ", "), string(Level.GameTimeSeconds)), ") -- Trigger () -- "));
        BroadcastLog(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__("(", string(Name)), ", "), string(Level.GameTimeSeconds)), ")   -- Method: "), Method.GetMethodString()));
        BroadcastLog(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__("(", string(Name)), ", "), string(Level.GameTimeSeconds)), ")   -- Event: "), string(Event)));
    }
    // End:0x18B
    if(__NFUN_342__(Event, 'None'))
    {
        // End:0x187
        foreach __NFUN_747__(class'AIActor', MyActor, Event)
        {
            // End:0x16B
            if(PrintDebug)
            {
                BroadcastLog(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__("(", string(Name)), ", "), string(Level.GameTimeSeconds)), ")   -- Executing on Actor: "), string(MyActor)));
            }
            Method.Execute(MyActor, PrintDebug);            
        }                
    }
    else
    {
        MyActor = AIActor(EventInstigator);
        // End:0x22A
        if(__NFUN_340__(MyActor, none))
        {
            // End:0x20F
            if(PrintDebug)
            {
                BroadcastLog(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__("(", string(Name)), ", "), string(Level.GameTimeSeconds)), ")   -- Executing on EventInstigator: "), string(MyActor)));
            }
            Method.Execute(MyActor, PrintDebug);
        }
    }
    return;
}

event EnumerateRawAnimationSequences(out array<SAnimationEnumeration> References)
{
    local AIActor AI;

    super(Actor).EnumerateRawAnimationSequences(References);
    // End:0x6A
    if(__NFUN_340__(Method, none))
    {
        // End:0x69
        foreach __NFUN_747__(class'AIActor', AI)
        {
            // End:0x68
            if(__NFUN_341__(AI.Tag, Event))
            {
                Method.EnumerateRawAnimationSequences(References, AI.Mesh);
                // End:0x69
                break;
            }            
        }        
    }
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    local bool bFound;
    local AIActor AI;

    // End:0x5A
    if(__NFUN_340__(Method, none))
    {
        // End:0x59
        foreach __NFUN_747__(class'AIActor', AI)
        {
            // End:0x58
            if(__NFUN_341__(AI.Tag, Event))
            {
                bFound = true;
                Method.super(ScriptMethod).RegisterPrecacheComponents(PrecacheIndex, AI);
            }            
        }        
    }
    return;
}
