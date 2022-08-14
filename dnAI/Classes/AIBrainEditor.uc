/*******************************************************************************
 * AIBrainEditor generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AIBrainEditor extends AIHUD
	native
	collapsecategories
	hidecategories(Actor,Advanced,Collision,HUDHint,None,Display,DukeHUD,Editor,Filter,HeatVision,HUD,Interpolation,Lighting,Material,Mounting,movement,Network,Networking,Object,Sound,Tick,TickRules);

cpptext
{
// Stripped
}

const FSM_EDIT_USER_VAR = 1;
const FSM_TEST_USER_VAR = 2;
const OP_USER_VAR = 3;
const BROWSE_USER_VAR = 4;
const TRANS_REMOVE_USER_VAR = 5;
const TRANS_REPLACE_USER_VAR = 6;
const TRANS_REPLACEALL_USER_VAR = 7;
const STATE_EDIT_USER = 8;

var(Spawn) AIActorFactory Factory;
var(Spawn) Vector PositionOffset;
var(FSM_Edit) class<AIActor> ClassToEdit;
var(FSM_Edit) name FSMToEdit;
var(FSM_Edit) AINode FSMNode;
var(FSM_Edit) array<AIState> FSMStates;
var(FSM_Edit) name StateToEdit;
var(FSM_Edit) AITransition NewTransition;
var(Transitions) array<name> WatchList_Ident;
var(Transitions) array<name> WatchList_Func;
var(Transitions) array<Engine.BaseAI.EAICondition> WatchList_Cond;
var(Transitions) int MaxHistory;
var(Transitions) bool ShowPass;
var(Transitions) bool ShowFail;
var(AIOPNodes) array<AINode> OPNodes;
var BGInfo TransitionHistoryBG;
var BGInfo StateHistoryBG;
var Engine.BaseAI.EAIOp SelectedOP;
var int TransitionHistMax;

// Export UAIBrainEditor::execNative_BeginFSMTest(FFrame&, void* const)
native function Native_BeginFSMTest();

// Export UAIBrainEditor::execExportFSMToText(FFrame&, void* const)
native function ExportFSMToText();

// Export UAIBrainEditor::execExecuteOp(FFrame&, void* const)
native function ExecuteOp();

event PostBeginPlay()
{
	super(DukeHUD).PostBeginPlay();
	ClassToEdit = class'AssaultTrooper_Captain';
	Factory = __NFUN_615__(class'AIActorFactory', self);
	Factory.m_Class = ClassToEdit;
	Factory.m_bOneSpawnPerFrame = false;
	PopulateDebugTree();
	return;
}

simulated function DrawAIHUD(Canvas C)
{
	local AIActor AI;
	local string str;
	local int i;
	local name LastGroup;
	local float sx, sy, xw, yh, StartY, StartX,
		lengthX, lengthXb;

	// End:0x0E
	if(__NFUN_339__(C, none))
	{
		return;
	}
	DrawMessageArea(C);
	// End:0x2B
	if(__NFUN_339__(m_aTarget, none))
	{
		FindTestSubject();
	}
	sx = 0;
	sy = 0;
	C.DrawColor = WhiteColor;
	C.__NFUN_1231__("Brain HUD", xw, yh);
	StartColumn(int(sx), int(__NFUN_199__(sy, yh)), int(yh));
	C.__NFUN_1250__(0, 0);
	// End:0x162
	if(__NFUN_148__(__NFUN_340__(m_aTarget, none), __NFUN_174__(int(m_aTarget.GetExecutive()), int(1))))
	{
		DrawString(C, __NFUN_302__("Test Subject: ", string(m_aTarget)));
		DrawString(C, string(__NFUN_365__(class'EAIOp', int(m_aTarget.GetCurrentOp()))));
		DrawString(C, string(m_aTarget.GetCurrentOpRef()));
		DrawString(C, m_aTarget.TreeDescentLog);
		DrawString(C, " ");
	}
	sx = C.CurX;
	sy = C.CurY;
	// End:0x19A
	if(__NFUN_171__(string(DebugTreeItems), 0))
	{
		return;
	}
	// End:0x244
	if(__NFUN_148__(__NFUN_206__(DebugTreeBGSizeX, float(0)), __NFUN_206__(DebugTreeBGSizeY, float(0))))
	{
		C.Style = 5;
		C.DrawColor.R = 0;
		C.DrawColor.G = 0;
		C.DrawColor.B = 0;
		C.__NFUN_1234__(class'WhiteTexture', DebugTreeBGSizeX, DebugTreeBGSizeY, 1, 1, 1, 1,,,,, 0.5);
	}
	m_aTarget.DebugOpChanges = true;
	C.__NFUN_1250__(sx, sy);
	DrawDebugTree(C, DebugTreeItems, C.CurX, C.CurY);
	// End:0x339
	if(__NFUN_170__(TransitionHistMax, 0))
	{
		C.__NFUN_1250__(sx, __NFUN_198__(sy, DebugTreeBGSizeY));
		StartColumn(int(sx), int(__NFUN_198__(sy, DebugTreeBGSizeY)), int(yh));
		StartBG(C, TransitionHistoryBG);
		DrawTransitionHistory(C);
		EndBG(C, TransitionHistoryBG);
		StartBG(C, StateHistoryBG);
		DrawStateTransitionHistory(C);
		EndBG(C, StateHistoryBG);
	}
	return;
}

exec function SpawnDude()
{
	local Vector SpawnPosition;

	SpawnPosition = __NFUN_238__(PlayerOwner.Location, __NFUN_241__(PositionOffset, PlayerOwner.Rotation));
	Factory.__NFUN_645__(SpawnPosition);
	Factory.Trigger(none, none);
	m_aTarget = Factory.LastSpawnedActor;
	return;
}

exec function SpawnDude2()
{
	local Vector SpawnPosition, Delta;
	local int i;

	i = 0;
	J0x07:

	// End:0x9F [Loop If]
	if(__NFUN_169__(i, 2))
	{
		SpawnPosition = __NFUN_238__(__NFUN_238__(PlayerOwner.Location, __NFUN_241__(PositionOffset, PlayerOwner.Rotation)), __NFUN_234__(__NFUN_236__(__NFUN_255__(), __NFUN_232__(1, 1, 0)), float(100)));
		Factory.__NFUN_645__(SpawnPosition);
		Factory.Trigger(none, none);
		m_aTarget = Factory.LastSpawnedActor;
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x07;
	}
	return;
}

exec function FindTestSubject()
{
	local AIActor bodge;

	// End:0x54
	foreach __NFUN_747__(class'AIActor', bodge)
	{
		// End:0x53
		if(__NFUN_357__(bodge.Class, ClassToEdit))
		{
			BroadcastLog(__NFUN_302__("m_aTarget=", string(m_aTarget)));
			m_aTarget = bodge;			
			return;
		}		
	}	
	// End:0xC3
	foreach __NFUN_747__(class'AIActor', bodge)
	{
		m_aTarget = bodge;
		ClassToEdit = m_aTarget.Class;
		BroadcastLog(__NFUN_302__(__NFUN_303__(__NFUN_302__("Now editing class ", string(ClassToEdit)), "New Target: "), string(m_aTarget)));		
	}	
	return;
}

exec function SpawnDudeAtLoc()
{
	Factory.__NFUN_645__(__NFUN_232__(-450.4189, -1633.957, -148.0427));
	Factory.__NFUN_652__(__NFUN_265__(0, 10275, 0));
	Factory.Trigger(none, none);
	m_aTarget = Factory.LastSpawnedActor;
	return;
}

exec function Kill()
{
	return;
}

exec function PopulateDebugTree()
{
	local int i, j, K;
	local string str;

	string(DebugTreeItems) = string(default.DebugTreeItems);
	DebugTreeStartGroup("Edit_FSM", true);
	i = 0;
	J0x25:

	// End:0x93 [Loop If]
	if(__NFUN_169__(i, string(ClassToEdit.default.Nodes)))
	{
		// End:0x65
		if(__NFUN_174__(int(ClassToEdit.default.Nodes[i].Op), int(0)))
		{
			// [Explicit Continue]
			goto J0x89;
		}
		DebugTreeAddItem(,, ClassToEdit.default.Nodes[i].Ident,, 1);
		J0x89:

		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x25;
	}
	DebugTreeEndGroup();
	DebugTreeStartGroup("Test_FSM", true);
	i = 0;
	J0xB1:

	// End:0x120 [Loop If]
	if(__NFUN_169__(i, string(ClassToEdit.default.Nodes)))
	{
		// End:0xF1
		if(__NFUN_174__(int(ClassToEdit.default.Nodes[i].Op), int(0)))
		{
			// [Explicit Continue]
			goto J0x116;
		}
		DebugTreeAddItem(,, ClassToEdit.default.Nodes[i].Ident,, 2);
		J0x116:

		__NFUN_184__(i);
		// [Loop Continue]
		goto J0xB1;
	}
	DebugTreeEndGroup();
	DebugTreeStartGroup("AIOP_Nodes", true);
	string(OPNodes) = 0;
	i = 0;
	J0x148:

	// End:0x1F6 [Loop If]
	if(__NFUN_169__(i, string(ClassToEdit.default.Nodes)))
	{
		// End:0x188
		if(__NFUN_173__(int(ClassToEdit.default.Nodes[i].Op), int(0)))
		{
			// [Explicit Continue]
			goto J0x1EC;
		}
		OPNodes[OPNodes.Add(1)] = ClassToEdit.default.Nodes[i];
		DebugTreeAddItem(,, ClassToEdit.default.Nodes[i].Ident,, 3, float(int(ClassToEdit.default.Nodes[i].Op)));
		J0x1EC:

		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x148;
	}
	DebugTreeEndGroup();
	DebugTreeStartGroup("Root", true);
	PopulateBrowseTree('Root', 50);
	DebugTreeEndGroup();
	// End:0x28B
	if(__NFUN_342__(FSMToEdit, 'None'))
	{
		DebugTreeStartGroup(__NFUN_302__("Edit_State ", string(FSMToEdit)), true);
		i = 0;
		J0x250:

		// End:0x285 [Loop If]
		if(__NFUN_169__(i, string(FSMStates)))
		{
			DebugTreeAddItem(,, FSMStates[i].Ident,, 8);
			__NFUN_184__(i);
			// [Loop Continue]
			goto J0x250;
		}
		DebugTreeEndGroup();
	}
	// End:0x44C
	if(__NFUN_342__(StateToEdit, 'None'))
	{
		DebugTreeStartGroup(__NFUN_302__("Transitions to ", string(StateToEdit)), true);
		DebugTreeAddItem(, "Replace All",,, 7);
		j = 0;
		J0x2DB:

		// End:0x446 [Loop If]
		if(__NFUN_169__(j, string(FSMStates)))
		{
			K = 0;
			J0x2F2:

			// End:0x43C [Loop If]
			if(__NFUN_169__(K, string(FSMStates[j].Transitions)))
			{
				// End:0x432
				if(__NFUN_341__(FSMStates[j].Transitions[K].Ident, StateToEdit))
				{
					str = __NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(string(FSMStates[j].Ident), ": ["), string(FSMStates[j].Transitions[K].Func)), ","), string(__NFUN_365__(class'EAICondition', int(FSMStates[j].Transitions[K].Cond)))), "]  "), string(__NFUN_365__(class'EAIWindow', int(FSMStates[j].Transitions[K].Win))));
					DebugTreeStartGroup(str, true);
					DebugTreeAddItem(, "Remove", FSMStates[j].Ident,, 5, float(K));
					DebugTreeAddItem(, "Replace", FSMStates[j].Ident,, 6, float(K));
					DebugTreeEndGroup();
				}
				__NFUN_184__(K);
				// [Loop Continue]
				goto J0x2F2;
			}
			__NFUN_184__(j);
			// [Loop Continue]
			goto J0x2DB;
		}
		DebugTreeEndGroup();
	}
	return;
}

function PopulateBrowseTree(name ThisNodeName, int Depth)
{
	local AIState ThisState;
	local int i, j;
	local bool Op;

	// End:0x0D
	if(__NFUN_169__(Depth, 0))
	{
		return;
	}
	i = 0;
	J0x14:

	// End:0x179 [Loop If]
	if(__NFUN_169__(i, string(ClassToEdit.default.FSMStates)))
	{
		// End:0x16F
		if(__NFUN_341__(ThisNodeName, ClassToEdit.default.FSMStates[i].FSM))
		{
			Op = false;
			j = 0;
			J0x62:

			// End:0xEE [Loop If]
			if(__NFUN_169__(j, string(ClassToEdit.default.Nodes)))
			{
				// End:0xE4
				if(__NFUN_341__(ClassToEdit.default.Nodes[j].Ident, ClassToEdit.default.FSMStates[i].Ident))
				{
					// End:0xE1
					if(__NFUN_174__(int(ClassToEdit.default.Nodes[j].Op), int(0)))
					{
						Op = true;
					}
					// [Explicit Break]
					goto J0xEE;
				}
				__NFUN_184__(j);
				// [Loop Continue]
				goto J0x62;
			}
			J0xEE:

			// End:0x11F
			if(Op)
			{
				DebugTreeAddItem(,, ClassToEdit.default.FSMStates[i].Ident,, 4);
				// [Explicit Continue]
				goto J0x16F;
			}
			DebugTreeStartGroup(string(ClassToEdit.default.FSMStates[i].Ident), true);
			PopulateBrowseTree(ClassToEdit.default.FSMStates[i].Ident, __NFUN_166__(Depth, 1));
			DebugTreeEndGroup();
		}
		J0x16F:

		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x14;
	}
	return;
}

function bool DebugTreeOnEnter(optional bool Found)
{
	local int i;
	local SHUDDebugTreeItem Item;

	Item = DebugTreeItems[DebugTreeUseIndex];
	Found = true;
	switch(Item.var1)
	{
		// End:0x49
		case 1:
			FSMToEdit = Item.TriggerEvent;
			PopulateEditState();
			PopulateDebugTree();
			// End:0x1CB
			break;
		// End:0x73
		case 2:
			FSMToEdit = Item.TriggerEvent;
			BeginFSMTest();
			PopulateEditState();
			PopulateDebugTree();
			// End:0x1CB
			break;
		// End:0x14B
		case 3:
			i = 0;
			J0x7F:

			// End:0xED [Loop If]
			if(__NFUN_169__(i, string(ClassToEdit.default.Nodes)))
			{
				// End:0xE3
				if(__NFUN_341__(ClassToEdit.default.Nodes[i].Ident, Item.TriggerEvent))
				{
					SelectedOP = ClassToEdit.default.Nodes[i].Op;
				}
				__NFUN_184__(i);
				// [Loop Continue]
				goto J0x7F;
			}
			// End:0x142
			if(__NFUN_173__(int(SelectedOP), int(0)))
			{
				BroadcastLog(__NFUN_303__(__NFUN_302__("AIEdit Warning Couldn't find op ", string(Item.TriggerEvent)), "in Nodes."));
				// [Explicit Continue]
				goto J0x1CB;
			}
			ExecuteOp();
			// End:0x1CB
			break;
		// End:0x16E
		case 5:
			RemoveTransition(Item.TriggerEvent, int(Item.var2));
			// End:0x1CB
			break;
		// End:0x191
		case 6:
			ReplaceTransition(Item.TriggerEvent, int(Item.var2));
			// End:0x1CB
			break;
		// End:0x19F
		case 7:
			ReplaceAllTransitions();
			// End:0x1CB
			break;
		// End:0x1BD
		case 8:
			StateToEdit = Item.TriggerEvent;
			PopulateDebugTree();
			// End:0x1CB
			break;
		// End:0xFFFF
		default:
			Found = false;
			// End:0x1CB
			break;
			break;
	}
	J0x1CB:

	// End:0x1D6
	if(Found)
	{
		return true;
	}
	return super(HUD).DebugTreeOnEnter(Found);
	return;
}

exec function BeginFSMTest()
{
	local AIActor bodge;

	// End:0x3C
	foreach __NFUN_747__(class'AIActor', bodge)
	{
		// End:0x3B
		if(__NFUN_357__(bodge.Class, ClassToEdit))
		{
			m_aTarget = bodge;
			Native_BeginFSMTest();
		}		
	}	
	return;
}

exec function PopulateEditState()
{
	local int i;

	string(FSMStates) = 0;
	i = 0;
	J0x0F:

	// End:0x7B [Loop If]
	if(__NFUN_169__(i, string(ClassToEdit.default.FSMStates)))
	{
		// End:0x71
		if(__NFUN_341__(ClassToEdit.default.FSMStates[i].FSM, FSMToEdit))
		{
			FSMStates[FSMStates.Add(1)] = ClassToEdit.default.FSMStates[i];
		}
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x0F;
	}
	i = 0;
	J0x82:

	// End:0xE6 [Loop If]
	if(__NFUN_169__(i, string(ClassToEdit.default.Nodes)))
	{
		// End:0xDC
		if(__NFUN_341__(ClassToEdit.default.Nodes[i].Ident, FSMToEdit))
		{
			FSMNode = ClassToEdit.default.Nodes[i];
		}
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x82;
	}
	return;
}

exec function Export_FSM()
{
	local int i;
	local bool Found;
	local AINode NewNode;

	// End:0x0E
	if(__NFUN_173__(string(FSMStates), 0))
	{
		return;
	}
	CleanseFSM();
	i = string(ClassToEdit.default.FSMStates);
	J0x2A:

	// End:0x7A [Loop If]
	if(__NFUN_172__(i, 0))
	{
		// End:0x70
		if(__NFUN_341__(ClassToEdit.default.FSMStates[i].FSM, FSMToEdit))
		{
			ClassToEdit.default.FSMStates.Remove(i, 1);
		}
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0x2A;
	}
	i = 0;
	J0x81:

	// End:0xC8 [Loop If]
	if(__NFUN_169__(i, string(FSMStates)))
	{
		ClassToEdit.default.FSMStates[ClassToEdit.default.FSMStates.Add(1)] = FSMStates[i];
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x81;
	}
	i = 0;
	J0xCF:

	// End:0x13E [Loop If]
	if(__NFUN_169__(i, string(ClassToEdit.default.Nodes)))
	{
		// End:0x134
		if(__NFUN_341__(ClassToEdit.default.Nodes[i].Ident, FSMToEdit))
		{
			ClassToEdit.default.Nodes[i] = FSMNode;
			Found = true;
			// [Explicit Break]
			goto J0x13E;
		}
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0xCF;
	}
	J0x13E:

	// End:0x1A6
	if(__NFUN_145__(Found))
	{
		BroadcastLog(__NFUN_302__("AIEdit: Creating new Node: ", string(FSMToEdit)));
		NewNode = FSMNode;
		ClassToEdit.default.Nodes[string(ClassToEdit.default.Nodes)] = NewNode;
	}
	PopulateDebugTree();
	PopulateEditState();
	return;
}

exec function Export_OPNodes()
{
	local int i;

	// End:0x0E
	if(__NFUN_173__(string(OPNodes), 0))
	{
		return;
	}
	i = __NFUN_166__(string(ClassToEdit.default.Nodes), 1);
	J0x27:

	// End:0x75 [Loop If]
	if(__NFUN_172__(i, 0))
	{
		// End:0x6B
		if(__NFUN_174__(int(ClassToEdit.default.Nodes[i].Op), int(0)))
		{
			ClassToEdit.default.Nodes.Remove(i, 1);
		}
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0x27;
	}
	i = 0;
	J0x7C:

	// End:0xC3 [Loop If]
	if(__NFUN_169__(i, string(OPNodes)))
	{
		ClassToEdit.default.Nodes[ClassToEdit.default.Nodes.Add(1)] = OPNodes[i];
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x7C;
	}
	PopulateDebugTree();
	PopulateEditState();
	return;
}

exec function SaveTXT_FSM()
{
	ExportFSMToText();
	return;
}

exec function Create_FSM()
{
	local int i;

	SaveTXT_FSM();
	i = 0;
	J0x0D:

	// End:0x3D [Loop If]
	if(__NFUN_169__(i, string(FSMStates)))
	{
		FSMStates[i].FSM = FSMToEdit;
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x0D;
	}
	return;
}

exec function CleanseFSM()
{
	local int i, j;
	local AITransition Tranny;

	i = 0;
	J0x07:

	// End:0xE7 [Loop If]
	if(__NFUN_169__(i, string(FSMStates)))
	{
		j = __NFUN_166__(string(FSMStates[i].Transitions), 1);
		J0x31:

		// End:0xDD [Loop If]
		if(__NFUN_172__(j, 0))
		{
			Tranny = FSMStates[i].Transitions[j];
			// End:0xD3
			if(__NFUN_145__(VerifyTransition(Tranny)))
			{
				BroadcastLog(__NFUN_302__(__NFUN_302__(__NFUN_302__("AIEdit: Invalid Transition \"", string(Tranny.Ident)), "\" in FSM "), string(FSMStates[i].Ident)));
				FSMStates[i].Transitions.Remove(j, 1);
			}
			__NFUN_185__(j);
			// [Loop Continue]
			goto J0x31;
		}
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x07;
	}
	i = __NFUN_166__(string(FSMNode.SharedTransitions), 1);
	J0xFB:

	// End:0x19D [Loop If]
	if(__NFUN_172__(i, 0))
	{
		Tranny = FSMNode.SharedTransitions[i];
		// End:0x193
		if(__NFUN_145__(VerifyTransition(Tranny)))
		{
			BroadcastLog(__NFUN_302__(__NFUN_302__(__NFUN_302__("AIEdit: Invalid Shared Transition \"", string(Tranny.Ident)), "\" in Node "), string(FSMNode.Ident)));
			FSMNode.SharedTransitions.Remove(i, 1);
		}
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0xFB;
	}
	return;
}

function bool VerifyTransition(AITransition Transition)
{
	local int i;
	local bool Valid;

	i = 0;
	J0x07:

	// End:0x49 [Loop If]
	if(__NFUN_169__(i, string(FSMStates)))
	{
		// End:0x3F
		if(__NFUN_341__(FSMStates[i].Ident, Transition.Ident))
		{
			Valid = true;
		}
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x07;
	}
	return Valid;
	return;
}

function RemoveTransition(name StateName, int RemoveIndex)
{
	local int i;

	// End:0x2A
	if(GetStateIndex(StateName, i))
	{
		FSMStates[i].Transitions.Remove(RemoveIndex, 1);
	}
	PopulateDebugTree();
	return;
}

function ReplaceTransition(name StateName, int RemoveIndex)
{
	local int i;

	// End:0x2F
	if(GetStateIndex(StateName, i))
	{
		FSMStates[i].Transitions[RemoveIndex] = NewTransition;
	}
	PopulateDebugTree();
	return;
}

function ReplaceAllTransitions()
{
	local int i, K;

	i = 0;
	J0x07:

	// End:0x8F [Loop If]
	if(__NFUN_169__(i, string(FSMStates)))
	{
		K = 0;
		J0x1E:

		// End:0x85 [Loop If]
		if(__NFUN_169__(K, string(FSMStates[i].Transitions)))
		{
			// End:0x7B
			if(__NFUN_341__(StateToEdit, FSMStates[i].Transitions[K].Ident))
			{
				FSMStates[i].Transitions[K] = NewTransition;
			}
			__NFUN_184__(K);
			// [Loop Continue]
			goto J0x1E;
		}
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x07;
	}
	PopulateDebugTree();
	return;
}

function GenLinearTrans()
{
	local int i, j;
	local AITransition Trans;

	// End:0x12
	if(__NFUN_341__(FSMToEdit, 'None'))
	{
		return;
	}
	i = __NFUN_166__(string(FSMStates), 2);
	J0x22:

	// End:0xE0 [Loop If]
	if(__NFUN_172__(i, 0))
	{
		string(FSMStates[i].Transitions) = 0;
		j = __NFUN_165__(i, 1);
		J0x4E:

		// End:0xD6 [Loop If]
		if(__NFUN_169__(j, string(FSMStates)))
		{
			Trans.Ident = FSMStates[j].Ident;
			Trans.Win = 1;
			Trans.Cond = 0;
			Trans.Func = 'None';
			FSMStates[i].Transitions[FSMStates[i].Transitions.Add(1)] = Trans;
			__NFUN_184__(j);
			// [Loop Continue]
			goto J0x4E;
		}
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0x22;
	}
	return;
}

function DrawTrans()
{
	__NFUN_180__(TransitionHistMax, 10);
	// End:0x1C
	if(__NFUN_172__(TransitionHistMax, 20))
	{
		TransitionHistMax = 0;
	}
	return;
}

function bool GetStateIndex(name StateName, out int i)
{
	i = 0;
	J0x07:

	// End:0x3E [Loop If]
	if(__NFUN_169__(i, string(FSMStates)))
	{
		// End:0x34
		if(__NFUN_341__(StateName, FSMStates[i].Ident))
		{
			return true;
		}
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x07;
	}
	return false;
	return;
}

function DrawStateTransitionHistory(Canvas C)
{
	local int i, j, cnt;

	C.DrawColor = LightBlueColor;
	DrawString(C, __NFUN_302__("State Transitions: ", string(string(m_aTarget.StateEndMessages))));
	DrawString(C, __NFUN_302__("m_aTarget.DebugOpChanges: ", string(m_aTarget.DebugOpChanges)));
	C.DrawColor = WhiteColor;
	DrawString(C, "----------------------");
	i = __NFUN_166__(string(m_aTarget.StateEndMessages), 1);
	J0xD5:

	// End:0x130 [Loop If]
	if(__NFUN_172__(i, 0))
	{
		DrawString(C, m_aTarget.StateEndMessages[i]);
		__NFUN_184__(cnt);
		// End:0x126
		if(__NFUN_148__(__NFUN_170__(cnt, MaxHistory), __NFUN_170__(MaxHistory, 0)))
		{
			// [Explicit Break]
			goto J0x130;
		}
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0xD5;
	}
	J0x130:

	return;
}

function DrawTransitionHistory(Canvas C)
{
	local int i, j, cnt, WatchMax;
	local bool pass;
	local string str;

	C.DrawColor = LightBlueColor;
	DrawString(C, __NFUN_302__("Recent Transitions: ", string(string(m_aTarget.TransitionHistory))));
	C.DrawColor = WhiteColor;
	DrawString(C, "----------------------");
	WatchMax = __NFUN_189__(string(WatchList_Ident), string(WatchList_Func));
	WatchMax = __NFUN_189__(WatchMax, string(WatchList_Cond));
	i = __NFUN_166__(string(m_aTarget.TransitionHistory), 1);
	J0xC2:

	// End:0x40A [Loop If]
	if(__NFUN_172__(i, 0))
	{
		j = 0;
		J0xD4:

		// End:0x1BD [Loop If]
		if(__NFUN_169__(j, WatchMax))
		{
			// End:0x128
			if(__NFUN_148__(__NFUN_169__(j, string(WatchList_Ident)), __NFUN_341__(WatchList_Ident[j], m_aTarget.TransitionHistory[i].Transition.Ident)))
			{
				// [Explicit Break]
				goto J0x1BD;
			}
			// End:0x16E
			if(__NFUN_148__(__NFUN_169__(j, string(WatchList_Cond)), __NFUN_173__(int(WatchList_Cond[j]), int(m_aTarget.TransitionHistory[i].Transition.Cond))))
			{
				// [Explicit Break]
				goto J0x1BD;
			}
			// End:0x1B3
			if(__NFUN_148__(__NFUN_169__(j, string(WatchList_Func)), __NFUN_341__(WatchList_Func[j], m_aTarget.TransitionHistory[i].Transition.Func)))
			{
				// [Explicit Break]
				goto J0x1BD;
			}
			__NFUN_184__(j);
			// [Loop Continue]
			goto J0xD4;
		}
		J0x1BD:

		// End:0x1DC
		if(__NFUN_148__(__NFUN_173__(j, WatchMax), __NFUN_174__(j, 0)))
		{
			// [Explicit Continue]
			goto J0x400;
		}
		// End:0x20F
		if(__NFUN_148__(__NFUN_145__(ShowPass), __NFUN_173__(int(m_aTarget.TransitionHistory[i].Code), int(0))))
		{
			// [Explicit Continue]
			goto J0x400;
		}
		// End:0x242
		if(__NFUN_148__(__NFUN_145__(ShowFail), __NFUN_174__(int(m_aTarget.TransitionHistory[i].Code), int(0))))
		{
			// [Explicit Continue]
			goto J0x400;
		}
		// End:0x268
		if(__NFUN_173__(int(m_aTarget.TransitionHistory[i].Code), int(2)))
		{
			// [Explicit Continue]
			goto J0x400;
		}
		// End:0x2BF
		if(__NFUN_174__(int(m_aTarget.TransitionHistory[i].Transition.Cond), int(0)))
		{
			str = string(__NFUN_365__(class'EAICondition', int(m_aTarget.TransitionHistory[i].Transition.Cond)));
		}
		// End:0x312
		if(__NFUN_342__(m_aTarget.TransitionHistory[i].Transition.Func, 'None'))
		{
			str = string(m_aTarget.TransitionHistory[i].Transition.Func);			
		}
		else
		{
			str = "->";
		}
		DrawString(C, __NFUN_303__(__NFUN_303__(__NFUN_303__(__NFUN_303__(SpaceoutString(string(m_aTarget.TransitionHistory[i].Node), 15), SpaceoutString(string(m_aTarget.TransitionHistory[i].State), 20)), SpaceoutString(string(m_aTarget.TransitionHistory[i].Transition.Ident), 25)), SpaceoutString(str, 25)), SpaceoutString(string(__NFUN_365__(class'EAICode', int(m_aTarget.TransitionHistory[i].Code))), 25)));
		__NFUN_184__(cnt);
		// End:0x400
		if(__NFUN_148__(__NFUN_170__(cnt, MaxHistory), __NFUN_170__(MaxHistory, 0)))
		{
			// [Explicit Break]
			goto J0x40A;
		}
		J0x400:

		__NFUN_185__(i);
		// [Loop Continue]
		goto J0xC2;
	}
	J0x40A:

	// End:0x42E
	if(__NFUN_174__(i, 0))
	{
		m_aTarget.TransitionHistory.Remove(0, __NFUN_165__(i, 1));
	}
	return;
}

simulated function OnNewTarget(AIActor OldTarget)
{
	super.OnNewTarget(OldTarget);
	// End:0x29
	if(__NFUN_340__(OldTarget, none))
	{
		OldTarget.DebugOpChanges = false;
	}
	// End:0x62
	if(__NFUN_340__(none, m_aTarget))
	{
		ClassToEdit = m_aTarget.Class;
		PopulateDebugTree();
		m_aTarget.DebugOpChanges = true;
	}
	return;
}

defaultproperties
{
	PositionOffset=(X=1.298303E-41,Y=3.778781E-17,Z=0)
	ClassToEdit='AssaultTrooper_Captain'
	MaxHistory=20
	ShowPass=true
	ShowFail=true
	DebugTreeItems(0)=(Text="",ConsoleCommand="",TriggerEvent=None,Func=SpawnDude,Pop=false,Push=false,bHideChildren=false,var1=0,var2=0,MaxVisibleChildren=0,ChildrenOffset=0)
	DebugTreeItems(1)=(Text="",ConsoleCommand="",TriggerEvent=None,Func=SpawnDude2,Pop=false,Push=false,bHideChildren=false,var1=0,var2=0,MaxVisibleChildren=0,ChildrenOffset=0)
	DebugTreeItems(2)=(Text="",ConsoleCommand="",TriggerEvent=None,Func=SpawnDudeAtLoc,Pop=false,Push=false,bHideChildren=false,var1=0,var2=0,MaxVisibleChildren=0,ChildrenOffset=0)
	DebugTreeItems(3)=(Text="",ConsoleCommand="",TriggerEvent=None,Func=Export_FSM,Pop=false,Push=false,bHideChildren=false,var1=0,var2=0,MaxVisibleChildren=0,ChildrenOffset=0)
	DebugTreeItems(4)=(Text="",ConsoleCommand="",TriggerEvent=None,Func=SaveTXT_FSM,Pop=false,Push=false,bHideChildren=false,var1=0,var2=0,MaxVisibleChildren=0,ChildrenOffset=0)
	DebugTreeItems(5)=(Text="",ConsoleCommand="",TriggerEvent=None,Func=Create_FSM,Pop=false,Push=false,bHideChildren=false,var1=0,var2=0,MaxVisibleChildren=0,ChildrenOffset=0)
	DebugTreeItems(6)=(Text="",ConsoleCommand="",TriggerEvent=None,Func=PopulateDebugTree,Pop=false,Push=false,bHideChildren=false,var1=0,var2=0,MaxVisibleChildren=0,ChildrenOffset=0)
	DebugTreeItems(7)=(Text="",ConsoleCommand="",TriggerEvent=None,Func=Export_OPNodes,Pop=false,Push=false,bHideChildren=false,var1=0,var2=0,MaxVisibleChildren=0,ChildrenOffset=0)
	DebugTreeItems(8)=(Text="",ConsoleCommand="",TriggerEvent=None,Func=GenLinearTrans,Pop=false,Push=false,bHideChildren=false,var1=0,var2=0,MaxVisibleChildren=0,ChildrenOffset=0)
	DebugTreeItems(9)=(Text="",ConsoleCommand="",TriggerEvent=None,Func=DrawTrans,Pop=false,Push=false,bHideChildren=false,var1=0,var2=0,MaxVisibleChildren=0,ChildrenOffset=0)
	Tag=AIBrainHUD
}