/*******************************************************************************
 * DecoActivities_Events generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class DecoActivities_Events extends DecoActivities
	native
	exportstructs
	hidecategories(Object);

cpptext
{
// Stripped
}

enum ESafeCallbacks
{
	SCALLBACK_None,
	SCALLBACK_Trigger,
	SCALLBACK_UnTrigger,
	SCALLBACK_Use,
	SCALLBACK_UnUse,
	SCALLBACK_Touch,
	SCALLBACK_UnTouch,
	SCALLBACK_Bump,
	SCALLBACK_EMP,
	SCALLBACK_TakeDamage,
	SCALLBACK_Destroy
};

struct SSafeCallbacks
{
	var() noexport float Delay "Amount of time that should pass before the Callback event will go off.";
	var() noexport float DelayVariance "Amount of time to vary the delay by when we set one.";
	var() noexport bool bLoop "Whether the event should loop when called.";
	var() noexport bool bEnforceLoop "Whether to make the callback happen multiple times in a single frame if the frame took longer than the delay period.";
	var() noexport bool bDontOverwrite "Whether the event should overwrite another callback of the same type when it gets created.";
	var() noexport bool bIndependent "Whether this callback is independent or not. If it isn't independent and one is already going, it will be ignored.";
	var() noexport DecoActivities_Events.ESafeCallbacks Callback "Action to make happen on this actor once this activity is complete.";
	var name CallbackScript;
};

struct SEndCallbacks
{
	var() noexport DecoActivities_Events.ESafeCallbacks Callback "The callback that you want to force to end.";
	var name CallbackScript;
};

var() noexport deprecated name Event "Event to trigger when this activity occurs.";
var() noexport bool EventPrependTag "If this is true, then take the tag of the current actor, and prepend it to the value in Event.";
var() noexport array<SSafeCallbacks> Callbacks "List of events that can get called on the actor once this activity is complete.";
var() noexport array<SSafeCallbacks> Callbacks_Always "List of events that can get called on the actor once this activity is complete. These are independent of the actor's ticking state.";
var() noexport array<SEndCallbacks> CallbacksEnd "List of Callbacks that you want to force to end if it is currently waiting to occur.";
var() noexport array<SEndCallbacks> CallbacksEnd_Always "List of Callback_Always that you want to force to end if it is currently waiting to occur.";
