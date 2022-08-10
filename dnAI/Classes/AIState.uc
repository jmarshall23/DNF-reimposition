struct AIState
{
	var() name FSM;
	var() name Ident;
	var() bool FSMSucc;
	var() bool FSMFail;
	var() array<AITransition> Transitions;
	var private int NodeIndex;
};