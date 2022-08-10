/*******************************************************************************
 * TriggerDelay generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class TriggerDelay extends Triggers
	collapsecategories
	notplaceable
	hidecategories(Filter,Interactivity,Karma,Lighting,Networking,Sound);

var() noexport float Delay "How long to delay the triggering for.";
var() noexport float DelayVariance "+/- half this value (and anywhere in between) is applied to the Delay.";

event Trigger(Actor Other, Pawn EventInstigator)
{
	super(Actor).Trigger(Other, EventInstigator);
	TickStyle = 3;
	__NFUN_605__(__NFUN_225__(0, __NFUN_226__(Delay, DelayVariance)), false, 'TriggerEvent');
	return;
}

final function TriggerEvent()
{
	TickStyle = 0;
	GlobalTrigger(Event);
	return;
}

defaultproperties
{
	Texture=Texture'S_TrigDelay'
}