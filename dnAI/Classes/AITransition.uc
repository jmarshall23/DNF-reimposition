struct AITransition
{
	var() name Ident;
	var() Engine.BaseAI.EAICondition Cond;
	var() name Func;
	var() Engine.BaseAI.EAIWindow Win;
	var() Engine.BaseAI.EAICode Code;
	var private int StateTableIndex;
};