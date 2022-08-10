struct AINode
{
	var() name Ident;
	var private Engine.BaseAI.EAINodeStatus Status;
	var private bool ReportedInvalid;
	var() Engine.BaseAI.EAICondition SucCond;
	var() name SucFunc;
	var() Engine.BaseAI.EAICondition FailCond;
	var() name FailFunc;
	var() Engine.BaseAI.EAIOp Op;
	var private int OpRef;
	var() array<AITransition> SharedTransitions;
	var array<int> StateTable;
	var private int CurStateIndex;
};