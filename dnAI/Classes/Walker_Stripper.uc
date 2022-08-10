/*******************************************************************************
 * Walker_Stripper generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Walker_Stripper extends stripper
	config
	collapsecategories;

var bool bPaused;

function PostVerifySelf()
{
	super(AIActor).PostVerifySelf();
	__NFUN_718__('Pause', 'Pause');
	return;
}

final function TriggerFunc_Pause()
{
	bPaused = __NFUN_145__(bPaused);
	return;
}

event Trigger(Actor Other, Pawn EventInstigator)
{
	super(AIActor).Trigger(Other, EventInstigator);
	bPaused = __NFUN_145__(bPaused);
	BroadcastLog(__NFUN_302__("DCR bPaused=", string(bPaused)));
	return;
}

event Engine.BaseAI.EAICode COND_ShouldIdle()
{
	// End:0x0C
	if(bPaused)
	{
		return 0;
	}
	return 1;
	return;
}

event Engine.BaseAI.EAICode COND_ShouldChase()
{
	// End:0x0E
	if(__NFUN_145__(bPaused))
	{
		return 0;
	}
	return 1;
	return;
}

defaultproperties
{
	Nodes(0)=(ChannelLink=22,Root=8.117489E+11)
	Nodes(1)=(SucCond=1,SucFunc=None,FailCond=1,FailFunc=None,Op=0,OpRef=0,SharedTransitions=(none,(StateTable=/* Array type was not detected. */),(CurStateIndex=0),(Ident=GotoGuardPos,Status=0,ReportedInvalid=false,SucCond=79,SucFunc=None,FailCond=1,FailFunc=None,Op=0,OpRef=0,SharedTransitions=/* Array type was not detected. */),(StateTable=/* Array type was not detected. */),(CurStateIndex=0),(Ident=AvoidDanger,Status=0,ReportedInvalid=false,SucCond=1,SucFunc=None,FailCond=1,FailFunc=None,Op=0,OpRef=0,SharedTransitions=/* Array type was not detected. */),(StateTable=/* Array type was not detected. */),(CurStateIndex=0),(Ident=Wait,Status=0,ReportedInvalid=false,SucCond=1,SucFunc=None,FailCond=1,FailFunc=None,Op=0,OpRef=0,SharedTransitions=/* Array type was not detected. */),(StateTable=/* Array type was not detected. */)),CurStateIndex=0)
	Nodes(2)=(Ident=Default,Status=0,ReportedInvalid=false,SucCond=0,SucFunc=None,FailCond=0,FailFunc=None,Op=85,OpRef=0,SharedTransitions=(none,(StateTable=/* Array type was not detected. */),(CurStateIndex=0),(Ident=idle,Status=0,ReportedInvalid=false,SucCond=0,SucFunc=None,FailCond=0,FailFunc=None,Op=85,OpRef=0,SharedTransitions=/* Array type was not detected. */),(StateTable=/* Array type was not detected. */),(CurStateIndex=0),(Ident=Pain,Status=0,ReportedInvalid=false,SucCond=0,SucFunc=None,FailCond=0,FailFunc=None,Op=96,OpRef=0,SharedTransitions=/* Array type was not detected. */),(StateTable=/* Array type was not detected. */),(CurStateIndex=0),(Ident=FaceTarget,Status=0,ReportedInvalid=false,SucCond=0,SucFunc=None,FailCond=0,FailFunc=None,Op=145,OpRef=0,SharedTransitions=/* Array type was not detected. */),(StateTable=/* Array type was not detected. */)),CurStateIndex=0)
}