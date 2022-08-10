/*******************************************************************************
 * GameModule generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class GameModule extends Info
	abstract
	native
	notplaceable
	hidecategories(movement,Collision,Lighting,LightColor);

enum EDirectionalPadDir
{
	DIR_Up,
	DIR_Down,
	DIR_Left,
	DIR_Right
};

enum EButtonPad
{
	BUT_A,
	BUT_B,
	BUT_X,
	BUT_Y
};

enum EPadState
{
	DIRPAD_Pressed,
	DIRPAD_Released
};

var GameModule.EPadState DirectionalPadStates[4];
var GameModule.EPadState ButtonPadStates[4];
var() class<GameModulePersistantData> PersistantDataClass;
var GameModulePersistantData PersistantData;
var() name ButtonAMnemonic;
var() name ButtonBMnemonic;
var() name ButtonXMnemonic;
var() name ButtonYMnemonic;

function UpdateOutput(TextureCanvas OutputCanvas)
{
	return;
}

event NotifyDirectionalPadChange(GameModule.EDirectionalPadDir Dir, GameModule.EPadState NewState)
{
	local int iDir;

	iDir = int(Dir);
	// End:0x25
	if(__NFUN_173__(int(DirectionalPadStates[iDir]), int(NewState)))
	{
		return;
	}
	DirectionalPadStates[iDir] = NewState;
	__NFUN_613__(__NFUN_344__(GetFunctionNameForPadState(NewState), GetShortNameForPadDir(Dir)));
	return;
}

event NotifyButtonPadChange(GameModule.EButtonPad Button, GameModule.EPadState NewState)
{
	local int iButton;

	iButton = int(Button);
	// End:0x25
	if(__NFUN_173__(int(ButtonPadStates[iButton]), int(NewState)))
	{
		return;
	}
	ButtonPadStates[iButton] = NewState;
	__NFUN_613__(__NFUN_344__(GetFunctionNameForPadState(NewState), GetShortNameForButtonPad(Button)));
	return;
}

function name GetShortNameForPadDir(GameModule.EDirectionalPadDir Dir)
{
	switch(Dir)
	{
		// End:0x13
		case 0:
			return 'Up';
		// End:0x1E
		case 1:
			return 'Down';
		// End:0x29
		case 2:
			return 'Left';
		// End:0x34
		case 3:
			return 'Right';
		// End:0xFFFF
		default:
			return;
			break;
	}
}

function name GetShortNameForButtonPad(GameModule.EButtonPad Button)
{
	switch(Button)
	{
		// End:0x13
		case 0:
			return ButtonAMnemonic;
		// End:0x1E
		case 1:
			return ButtonBMnemonic;
		// End:0x29
		case 2:
			return ButtonXMnemonic;
		// End:0x34
		case 3:
			return ButtonYMnemonic;
		// End:0xFFFF
		default:
			return;
			break;
	}
}

function name GetFunctionNameForPadState(GameModule.EPadState NewState)
{
	// End:0x14
	if(__NFUN_173__(int(NewState), int(0)))
	{
		return 'PadPressed_';
	}
	return 'PadReleased_';
	return;
}

event PadPressed_Up()
{
	return;
}

event PadPressed_Down()
{
	return;
}

event PadPressed_Left()
{
	return;
}

event PadPressed_Right()
{
	return;
}

event PadReleased_Up()
{
	return;
}

event PadReleased_Down()
{
	return;
}

event PadReleased_Left()
{
	return;
}

event PadReleased_Right()
{
	return;
}

event PadPressed_A()
{
	return;
}

event PadPressed_B()
{
	return;
}

event PadPressed_X()
{
	return;
}

event PadPressed_Y()
{
	return;
}

event PadReleased_A()
{
	return;
}

event PadReleased_B()
{
	return;
}

event PadReleased_X()
{
	return;
}

event PadReleased_Y()
{
	return;
}

defaultproperties
{
	ButtonAMnemonic=A
	ButtonBMnemonic=B
	ButtonXMnemonic=X
	ButtonYMnemonic=Y
}