/*******************************************************************************
 * UDukeControllerBinderControl generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeControllerBinderControl extends UDukeKeyBinderBaseControl
	dependson(UDukeSceneControllerKeySetup);

var Texture XboxButtonTex[16];
var int BoundKeys[150];

function DrawKey(Canvas C, float X, float Y, int i)
{
	C.DrawColor = class'UWindowScene'.default.WhiteColor;
	DrawStretchedTexture(C, X, Y, KeyHeight, KeyHeight, XboxButtonTex[__NFUN_166__(BoundKeys[i], int(Root.Console.200))], 1);
	return;
}

function LoadExistingKeys()
{
	local int i, j;
	local string KeyName, Alias;

	i = 0;
	J0x07:

	// End:0x40 [Loop If]
	if(__NFUN_169__(i, 150))
	{
		BoundKeys[i] = int(Root.Console.200);
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x07;
	}
	i = int(Root.Console.200);
	J0x5D:

	// End:0x148 [Loop If]
	if(__NFUN_171__(i, int(Root.Console.215)))
	{
		KeyName = GetPlayerOwner().ConsoleCommand(__NFUN_302__("KEYNAME ", string(i)));
		// End:0x13E
		if(__NFUN_309__(KeyName, ""))
		{
			Alias = GetPlayerOwner().ConsoleCommand(__NFUN_302__("KEYBINDING ", KeyName));
			j = 0;
			J0xE8:

			// End:0x13E [Loop If]
			if(__NFUN_169__(j, 150))
			{
				// End:0x10A
				if(__NFUN_308__(AliasNames[j], ""))
				{
					// [Explicit Break]
					goto J0x13E;
				}
				// End:0x134
				if(__NFUN_310__(Alias, AliasNames[j]))
				{
					BoundKeys[j] = i;
					// [Explicit Break]
					goto J0x13E;
				}
				__NFUN_184__(j);
				// [Loop Continue]
				goto J0xE8;
			}
		}
		J0x13E:

		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x5D;
	}
	return;
}

function ProcessMenuKey(int KeyNo)
{
	// End:0x40
	if(IsXboxButton(KeyNo))
	{
		// End:0x40
		if(__NFUN_174__(KeyNo, int(Root.Console.204)))
		{
			StopPolling();
			SetKey(KeyNo);
		}
	}
	return;
}

function SetKey(int KeyNo)
{
	local string KeyName, Alias, OldKeyName;

	// End:0x175
	if(__NFUN_174__(KeyNo, BoundKeys[SelectedIndex]))
	{
		OldKeyName = GetPlayerOwner().ConsoleCommand(__NFUN_303__("KEYNAME", string(BoundKeys[SelectedIndex])));
		KeyName = GetPlayerOwner().ConsoleCommand(__NFUN_302__("KEYNAME ", string(KeyNo)));
		// End:0x118
		if(__NFUN_309__(OldKeyName, ""))
		{			
			GetPlayerOwner().ConsoleCommand(__NFUN_303__(__NFUN_303__("set input", OldKeyName), ""));
			// End:0x118
			if(__NFUN_309__(KeyName, ""))
			{
				Alias = GetPlayerOwner().ConsoleCommand(__NFUN_302__("KEYBINDING ", KeyName));
				// End:0x118
				if(__NFUN_309__(Alias, ""))
				{					
					GetPlayerOwner().ConsoleCommand(__NFUN_303__(__NFUN_303__("set input", OldKeyName), Alias));
				}
			}
		}
		// End:0x158
		if(__NFUN_309__(KeyName, ""))
		{			
			GetPlayerOwner().ConsoleCommand(__NFUN_303__(__NFUN_303__("set input", KeyName), AliasNames[SelectedIndex]));
		}
		LoadExistingKeys();
		UDukeSceneControllerKeySetup(OwnerWindow).bNeedProfileSave = true;
	}
	return;
}

defaultproperties
{
	XboxButtonTex[0]='dt_hud.ingame_hud.xbox_dpad_up'
	XboxButtonTex[1]='dt_hud.ingame_hud.xbox_dpad_down'
	XboxButtonTex[2]='dt_hud.ingame_hud.xbox_dpad_left'
	XboxButtonTex[3]='dt_hud.ingame_hud.xbox_dpad_right'
	XboxButtonTex[4]='dt_hud.ingame_hud.xbox_button_start'
	XboxButtonTex[5]='dt_hud.ingame_hud.xbox_button_back'
	XboxButtonTex[6]='dt_hud.ingame_hud.xbox_stick_left'
	XboxButtonTex[7]='dt_hud.ingame_hud.xbox_stick_right'
	XboxButtonTex[8]='dt_hud.ingame_hud.xbox_bumper_left'
	XboxButtonTex[9]='dt_hud.ingame_hud.xbox_bumper_right'
	XboxButtonTex[10]='dt_hud.ingame_hud.xbox_button_a'
	XboxButtonTex[11]='dt_hud.ingame_hud.xbox_button_b'
	XboxButtonTex[12]='dt_hud.ingame_hud.xbox_button_x'
	XboxButtonTex[13]='dt_hud.ingame_hud.xbox_button_y'
	XboxButtonTex[14]='dt_hud.ingame_hud.xbox_trigger_left'
	XboxButtonTex[15]='dt_hud.ingame_hud.xbox_trigger_right'
	LastKeyBind=14
	HelpText="<?int?dnWindow.UDukeControllerBinderControl.HelpText?>"
	PollingHelpText="<?int?dnWindow.UDukeControllerBinderControl.PollingHelpText?>"
	Commands[0]="<?int?dnWindow.UDukeControllerBinderControl.Commands?>"
	Commands[1]="<?int?dnWindow.UDukeControllerBinderControl.Commands?>"
	Commands[2]="<?int?dnWindow.UDukeControllerBinderControl.Commands?>"
	Commands[3]="<?int?dnWindow.UDukeControllerBinderControl.Commands?>"
	Commands[4]="<?int?dnWindow.UDukeControllerBinderControl.Commands?>"
	Commands[5]="<?int?dnWindow.UDukeControllerBinderControl.Commands?>"
	Commands[6]="<?int?dnWindow.UDukeControllerBinderControl.Commands?>"
	Commands[7]="<?int?dnWindow.UDukeControllerBinderControl.Commands?>"
	Commands[8]="<?int?dnWindow.UDukeControllerBinderControl.Commands?>"
	Commands[9]="<?int?dnWindow.UDukeControllerBinderControl.Commands?>"
	Commands[10]="<?int?dnWindow.UDukeControllerBinderControl.Commands?>"
	Commands[11]="<?int?dnWindow.UDukeControllerBinderControl.Commands?>"
	Commands[12]="<?int?dnWindow.UDukeControllerBinderControl.Commands?>"
	Commands[13]="<?int?dnWindow.UDukeControllerBinderControl.Commands?>"
	Commands[14]="<?int?dnWindow.UDukeControllerBinderControl.Commands?>"
	Commands[15]="<?int?dnWindow.UDukeControllerBinderControl.Commands?>"
	AliasNames[0]="Fire | DnControlFireAction"
	AliasNames[1]="Melee | VehicleHandBrake | VehicleDownAction"
	AliasNames[2]="Zoom | DnControlMeleeAction"
	AliasNames[3]="Use | VehicleFire"
	AliasNames[4]="Jump | VehicleBoost | VehicleUpAction | DnControlJumpAction"
	AliasNames[5]="Duck | VehicleViewChange | DnControlDuckAction"
	AliasNames[6]="Sprint"
	AliasNames[7]="UsePipeBomb"
	AliasNames[8]="UseTripMine"
	AliasNames[9]="SwapWeapons"
	AliasNames[10]="DoHeatVision"
	AliasNames[11]="DoHoloDuke"
	AliasNames[12]="UseSteroids"
	AliasNames[13]="UseBeer"
	AliasNames[14]="ShowControls"
	AliasNames[15]="DoTaunt"
}