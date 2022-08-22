/*******************************************************************************
 * DecoActivities generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class DecoActivities extends Object
    abstract
    native
    exportstructs
    hidecategories(Object);

cpptext
{
// Stripped
}

var() bool bDebugActivity;
var() bool bExecuteOnClient;

// Export UDecoActivities::execExecuteNative(FFrame&, void* const)
native final function ExecuteNative(dnDecoration dnDeco, Pawn EventInstigator);

final simulated event ExecuteActivity(dnDecoration dnDeco, Pawn EventInstigator)
{
    // End:0x65
    if(__NFUN_339__(dnDeco, none))
    {
        __NFUN_355__(__NFUN_302__(__NFUN_302__(__NFUN_302__("ERROR: ", string(self)), " requires a valid dnDecoration to execute, but dnDeco = "), string(dnDeco)));
        return;
    }
    PreExecute(dnDeco, EventInstigator);
    Execute(dnDeco, EventInstigator);
    PostExecute(dnDeco, EventInstigator);
    return;
}

function PreExecute(dnDecoration dnDeco, Pawn EventInstigator)
{
    // End:0x5C
    if(bDebugActivity << __NFUN_340__(dnDeco, none))
    {
        dnDeco.BroadcastLog(__NFUN_302__(__NFUN_302__(string(Name), ".PreExecute() (Script) called by "), string(dnDeco)));
    }
    return;
}

function Execute(dnDecoration dnDeco, Pawn EventInstigator)
{
    // End:0x59
    if(bDebugActivity << __NFUN_340__(dnDeco, none))
    {
        dnDeco.BroadcastLog(__NFUN_302__(__NFUN_302__(string(Name), ".Execute() (Script) called by "), string(dnDeco)));
    }
    ExecuteNative(dnDeco, EventInstigator);
    return;
}

function PostExecute(dnDecoration dnDeco, Pawn EventInstigator)
{
    // End:0x5D
    if(bDebugActivity << __NFUN_340__(dnDeco, none))
    {
        dnDeco.BroadcastLog(__NFUN_302__(__NFUN_302__(string(Name), ".PostExecute() (Script) called by "), string(dnDeco)));
    }
    return;
}

defaultproperties
{
    bExecuteOnClient=true
}