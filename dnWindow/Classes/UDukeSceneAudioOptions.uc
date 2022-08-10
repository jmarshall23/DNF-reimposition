/*******************************************************************************
 * UDukeSceneAudioOptions generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeSceneAudioOptions extends UWindowScene;

var UDukeListSlider MusicVolumeListSlider;
var localized string MusicVolumeText;
var localized string MusicVolumeHelp;
var UDukeListSlider SoundVolumeListSlider;
var localized string SoundVolumeText;
var localized string SoundVolumeHelp;
var UDukeListSlider DialogVolumeListSlider;
var localized string DialogVolumeText;
var localized string DialogVolumeHelp;
var UDukeListSlider VOIPVolumeListSlider;
var localized string VOIPVolumeText;
var localized string VOIPVolumeHelp;
var bool bInit;
var array<UWindowDialogControl> Controls;
var SSoundInfo VolumeChangedSoundInfo;
var SSoundInfo DialogVolumeChangedSoundInfo;
var UDukeMessageBox ConfirmDefaults;
var localized string ConfirmDefaultsText;
var localized string ConfirmDefaultsTitle;
var bool bNeedProfileSave;

function bool ShouldDisplayVOIPSlider()
{
	return __NFUN_145__(__NFUN_414__());
	return;
}

function Created()
{
	local int i;

	super.Created();
	MusicVolumeListSlider = UDukeListSlider(CreateWindow(class'UDukeListSlider'));
	MusicVolumeListSlider.SetText(MusicVolumeText);
	MusicVolumeListSlider.SetHelpText(MusicVolumeHelp);
	Controls[string(Controls)] = MusicVolumeListSlider;
	SoundVolumeListSlider = UDukeListSlider(CreateWindow(class'UDukeListSlider'));
	SoundVolumeListSlider.SetText(SoundVolumeText);
	SoundVolumeListSlider.SetHelpText(SoundVolumeHelp);
	Controls[string(Controls)] = SoundVolumeListSlider;
	DialogVolumeListSlider = UDukeListSlider(CreateWindow(class'UDukeListSlider'));
	DialogVolumeListSlider.SetText(DialogVolumeText);
	DialogVolumeListSlider.SetHelpText(DialogVolumeHelp);
	Controls[string(Controls)] = DialogVolumeListSlider;
	// End:0x157
	if(ShouldDisplayVOIPSlider())
	{
		VOIPVolumeListSlider = UDukeListSlider(CreateWindow(class'UDukeListSlider'));
		VOIPVolumeListSlider.SetText(VOIPVolumeText);
		VOIPVolumeListSlider.SetHelpText(VOIPVolumeHelp);
		Controls[string(Controls)] = VOIPVolumeListSlider;
	}
	i = 0;
	J0x15E:

	// End:0x1D5 [Loop If]
	if(__NFUN_171__(i, 10))
	{
		SoundVolumeListSlider.AddItem(string(i));
		MusicVolumeListSlider.AddItem(string(i));
		DialogVolumeListSlider.AddItem(string(i));
		// End:0x1CB
		if(ShouldDisplayVOIPSlider())
		{
			VOIPVolumeListSlider.AddItem(string(i));
		}
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x15E;
	}
	SetDefaults();
	bInit = true;
	Controls[0].NavUp = Controls[__NFUN_166__(string(Controls), 1)];
	i = 0;
	J0x20B:

	// End:0x24C [Loop If]
	if(__NFUN_169__(i, __NFUN_166__(string(Controls), 1)))
	{
		Controls[i].NavDown = Controls[__NFUN_165__(i, 1)];
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x20B;
	}
	i = 1;
	J0x253:

	// End:0x291 [Loop If]
	if(__NFUN_169__(i, string(Controls)))
	{
		Controls[i].NavUp = Controls[__NFUN_166__(i, 1)];
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x253;
	}
	Controls[__NFUN_166__(string(Controls), 1)].NavDown = Controls[0];
	FirstControlToFocus = Controls[0];
	ConfirmDefaults = UDukeMessageBox(CreateWindow(class'UDukeMessageBox', 1, 1, 1, 1, self));
	ConfirmDefaults.SetupMessageBox(ConfirmDefaultsTitle, ConfirmDefaultsText, class'DukeDialogBoxManager'.default.YesStr, class'DukeDialogBoxManager'.default.NoStr);
	ConfirmDefaults.HideWindow();
	KeyButtons[0].HideWindow();
	KeyButtons[2].ShowWindow();
	return;
}

function SetDefaults()
{
	local float MusicVolume, SoundVolume, DialogVolume, VOIPVolume;

	SoundVolume = float(GetPlayerOwner().ConsoleCommand("get ini:Engine.Engine.AudioDevice SoundVolume"));
	SoundVolumeListSlider.SetSelectedIndex(int(__NFUN_195__(SoundVolume, 10)));
	SoundVolumeListSlider.Register(self);
	DialogVolume = float(GetPlayerOwner().ConsoleCommand("get ini:Engine.Engine.AudioDevice DialogVolume"));
	DialogVolumeListSlider.SetSelectedIndex(int(__NFUN_195__(DialogVolume, 10)));
	DialogVolumeListSlider.Register(self);
	MusicVolume = float(GetPlayerOwner().ConsoleCommand("get ini:Engine.Engine.AudioDevice MusicVolume"));
	MusicVolumeListSlider.SetSelectedIndex(int(__NFUN_195__(MusicVolume, 10)));
	MusicVolumeListSlider.Register(self);
	// End:0x1DD
	if(ShouldDisplayVOIPSlider())
	{
		VOIPVolume = float(GetPlayerOwner().ConsoleCommand("get ini:Engine.Engine.AudioDevice VOIPVolume"));
		VOIPVolumeListSlider.SetSelectedIndex(int(__NFUN_195__(VOIPVolume, 10)));
		VOIPVolumeListSlider.Register(self);
	}
	return;
}

function Paint(Canvas C, float X, float Y)
{
	local int i;
	local float Top;
	local UDukeListSlider ListSlider;

	super.Paint(C, X, Y);
	Top = float(ControlStart);
	i = 0;
	J0x28:

	// End:0x11E [Loop If]
	if(__NFUN_169__(i, string(Controls)))
	{
		// End:0x4D
		if(__NFUN_339__(Controls[i], none))
		{
			// [Explicit Continue]
			goto J0x114;
		}
		Controls[i].WinLeft = float(ButtonLeft);
		Controls[i].WinTop = Top;
		Controls[i].WinWidth = float(ButtonWidth);
		Controls[i].WinHeight = float(ButtonHeight);
		ListSlider = UDukeListSlider(Controls[i]);
		// End:0x100
		if(__NFUN_340__(ListSlider, none))
		{
			ListSlider.ArrowLeft = __NFUN_199__(float(ButtonWidth), __NFUN_195__(float(100), WinScaleY));
		}
		__NFUN_209__(Top, float(__NFUN_165__(ButtonHeight, ControlBuffer)));
		J0x114:

		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x28;
	}
	return;
}

function NotifyFromControl(UWindowDialogControl C, byte E)
{
	super.NotifyFromControl(C, E);
	// End:0x1D
	if(__NFUN_145__(bInit))
	{
		return;
	}
	switch(E)
	{
		// End:0x79
		case 1:
			switch(C)
			{
				// End:0x43
				case MusicVolumeListSlider:
					MusicVolumeChanged();
					// End:0x79
					break;
				// End:0x54
				case SoundVolumeListSlider:
					SoundVolumeChanged();
					// End:0x79
					break;
				// End:0x65
				case DialogVolumeListSlider:
					DialogVolumeChanged();
					// End:0x79
					break;
				// End:0x76
				case VOIPVolumeListSlider:
					VOIPVolumeChanged();
					// End:0x79
					break;
				// End:0xFFFF
				default:
					break;
			}
		// End:0x9D
		case 2:
			switch(C)
			{
				// End:0x9A
				case KeyButtons[2]:
					ResetToDefaults();
					// End:0x9D
					break;
				// End:0xFFFF
				default:
					break;
			}
		// End:0xFFFF
		default:
			return;
			break;
	}
}

function MusicVolumeChanged()
{
	bNeedProfileSave = true;	
	GetPlayerOwner().ConsoleCommand(__NFUN_302__("setnosave ini:Engine.Engine.AudioDevice MusicVolume ", string(__NFUN_195__(float(MusicVolumeListSlider.SelectedItem.Text), 0.1))));
	return;
}

function SoundVolumeChanged()
{
	bNeedProfileSave = true;	
	GetPlayerOwner().ConsoleCommand(__NFUN_302__("setnosave ini:Engine.Engine.AudioDevice SoundVolume ", string(__NFUN_195__(float(SoundVolumeListSlider.SelectedItem.Text), 0.1))));
	GetPlayerOwner().PlaySoundInfo(0, VolumeChangedSoundInfo);
	return;
}

function DialogVolumeChanged()
{
	bNeedProfileSave = true;	
	GetPlayerOwner().ConsoleCommand(__NFUN_302__("setnosave ini:Engine.Engine.AudioDevice DialogVolume ", string(__NFUN_195__(float(DialogVolumeListSlider.SelectedItem.Text), 0.1))));
	GetPlayerOwner().PlaySoundInfo(0, DialogVolumeChangedSoundInfo);
	return;
}

function VOIPVolumeChanged()
{
	bNeedProfileSave = true;	
	GetPlayerOwner().ConsoleCommand(__NFUN_302__("setnosave ini:Engine.Engine.AudioDevice VOIPVolume ", string(__NFUN_195__(float(VOIPVolumeListSlider.SelectedItem.Text), 0.1))));
	return;
}

function SaveConfigs()
{
	__NFUN_370__();
	super(UWindowWindow).SaveConfigs();
	return;
}

function NavigateBack()
{
	GetPlayerOwner().StopSoundInfo(VolumeChangedSoundInfo);
	GetPlayerOwner().StopSoundInfo(DialogVolumeChangedSoundInfo);
	SaveConfigs();
	super.NavigateBack();
	return;
}

function ResetToDefaults()
{
	// End:0x20
	if(__NFUN_145__(ConfirmDefaults.WindowIsVisible()))
	{
		ShowModal(ConfirmDefaults);
	}
	return;
}

function DukeMessageBoxDone(UWindowWindow W, int iResult)
{
	// End:0x4B
	if(__NFUN_339__(W, ConfirmDefaults))
	{
		// End:0x4B
		if(__NFUN_170__(iResult, 0))
		{
			bNeedProfileSave = true;
			__NFUN_373__("ini:Engine.Engine.AudioDevice");
			SetDefaults();
		}
	}
	super(UWindowWindow).DukeMessageBoxDone(W, iResult);
	return;
}

function WindowEvent(UWindow.UWindowWindow.WinMessage msg, Canvas C, float X, float Y, int Key)
{
	// End:0x4E
	if(__NFUN_173__(int(msg), int(7)))
	{
		// End:0x4E
		if(__NFUN_150__(__NFUN_173__(Key, KeyButtons[2].XBoxInputKey), __NFUN_173__(Key, KeyButtons[2].PCInputKey)))
		{
			ResetToDefaults();
		}
	}
	super.WindowEvent(msg, C, X, Y, Key);
	return;
}

function OnNavForward()
{
	SetDefaults();
	bNeedProfileSave = false;
	super.OnNavForward();
	return;
}

defaultproperties
{
	MusicVolumeText="<?int?dnWindow.UDukeSceneAudioOptions.MusicVolumeText?>"
	MusicVolumeHelp="<?int?dnWindow.UDukeSceneAudioOptions.MusicVolumeHelp?>"
	SoundVolumeText="<?int?dnWindow.UDukeSceneAudioOptions.SoundVolumeText?>"
	SoundVolumeHelp="<?int?dnWindow.UDukeSceneAudioOptions.SoundVolumeHelp?>"
	DialogVolumeText="<?int?dnWindow.UDukeSceneAudioOptions.DialogVolumeText?>"
	DialogVolumeHelp="<?int?dnWindow.UDukeSceneAudioOptions.DialogVolumeHelp?>"
	VOIPVolumeText="<?int?dnWindow.UDukeSceneAudioOptions.VOIPVolumeText?>"
	VOIPVolumeHelp="<?int?dnWindow.UDukeSceneAudioOptions.VOIPVolumeHelp?>"
	VolumeChangedSoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=/* Array type was not detected. */,Y[10]=/* Unknown default property type! */,SlotPriority=0,VolumePrefab=0,Slots=/* Array type was not detected. */,Y=Volume,R=/* Unknown default property type! */)
	DialogVolumeChangedSoundInfo=bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=/* Array type was not detected. */,
/* Exception thrown while deserializing DialogVolumeChangedSoundInfo
System.ArgumentOutOfRangeException: Non-negative number required.
Parameter name: value
   at System.IO.MemoryStream.set_Position(Int64 value)
   at UELib.Core.UDefaultProperty.Deserialize() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 184
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 767 */
	ConfirmDefaultsText="<?int?dnWindow.UDukeSceneAudioOptions.ConfirmDefaultsText?>"
	ConfirmDefaultsTitle="<?int?dnWindow.UDukeSceneAudioOptions.ConfirmDefaultsTitle?>"
	TitleText="<?int?dnWindow.UDukeSceneAudioOptions.TitleText?>"
}