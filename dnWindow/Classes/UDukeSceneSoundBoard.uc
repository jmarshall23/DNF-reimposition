/*******************************************************************************
 * UDukeSceneSoundBoard generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeSceneSoundBoard extends UDukeSceneTemplate;

var SSoundInfo SoundInfo;

function ButtonClicked(UDukeMenuButton Button, string Command)
{
	SoundInfo.SimpleSingleSound = Sound(__NFUN_366__(Command, class'Sound'));
	// End:0x50
	if(__NFUN_340__(SoundInfo.SimpleSingleSound, none))
	{
		GetPlayerOwner().Level.PlaySoundInfo(0, SoundInfo);
	}
	return;
}

function Tick(float Delta)
{
	super(UWindowScene).Tick(Delta);
	GetPlayerOwner().__NFUN_692__(25, 0);
	return;
}

function OnNavForward()
{
	super(UWindowScene).OnNavForward();
	GetPlayerOwner().FadeSoundInfo(SoundMenuAmbience, 0.5, 0, 1);
	return;
}

function NavigateBack()
{
	super(UWindowScene).NavigateBack();
	GetPlayerOwner().FadeSoundInfo(SoundMenuAmbience, 0.5, 1, 1);
	return;
}

defaultproperties
{
	SoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=/* Array type was not detected. */)
	Entries(0)=BeforePaint=/* Unknown default property type! */,SliderWidth=1936485473,Z=/* Unknown default property type! */,
/* Exception thrown while deserializing Entries
System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at System.Collections.Generic.List`1.get_Item(Int32 index)
   at UELib.UnrealStreamImplementations.ReadNameReference(IUnrealStream stream) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 838
   at UELib.Core.UDefaultProperty.DeserializeTagUE1() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 204
   at UELib.Core.UDefaultProperty.DeserializeNextTag() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 193
   at UELib.Core.UDefaultProperty.Deserialize() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 169
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 767 */
	Entries(1)=
/* Exception thrown while deserializing Entries
System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at System.Collections.Generic.List`1.get_Item(Int32 index)
   at UELib.UnrealStreamImplementations.ReadNameReference(IUnrealStream stream) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 838
   at UELib.Core.UDefaultProperty.DeserializeTagUE1() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 204
   at UELib.Core.UDefaultProperty.DeserializeNextTag() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 193
   at UELib.Core.UDefaultProperty.Deserialize() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 169
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 767 */
	Entries(2)=(Offset=/* Unknown default property type! */,SetHelpText=/* Unknown default property type! */,Command="a_dukevoice.DukeLines.Duke_BallsOfSteel_01k",Button=none)
	Entries(3)=(Text="One-Eyed Freak",Help="",Command="a_dukevoice.DukeLines.DUKE_Map00_Line_04_OneEyeFreak",Button=none)
	Entries(4)=(Text="Aliens Are Gonna Pay",Help="",Command="a_dukevoice.DukeLines.DUKE_Map03_Line_04",Button=none)
	Entries(5)=(Text="Power Armor",Help="",Command="a_dukevoice.DukeLines.DUKE_Map04_Line_01_PowerArmor",Button=none)
	Entries(6)=(Text="Ugly Motherfucker",Help="",Command="a_dukevoice.DukeLines.DUKE_Map04_Line_03_UglyMofo",Button=none)
	Entries(7)=(Text="Taste of my Ball",Help="",Command="a_dukevoice.DukeLines.DUKE_Map07_Line_05_TasteBall",Button=none)
	Entries(8)=(Text="Wish I Had Three Guns",Help="",Command="a_dukevoice.DukeLines.DUKE_Map07e_Line_01",Button=none)
	Entries(9)=(Text="Don't Stand a Chance",Help="",Command="a_dukevoice.DukeLines.DUKE_Map11_02",Button=none)
	Entries(10)=(Text="Who's Your Daddy Now?",Help="",Command="a_dukevoice.DukeLines.DUKE_Map12b_01_DaddyHelmet",Button=none)
	Entries(11)=(Text="Piss On Your Brain",Help="",Command="a_dukevoice.DukeLines.DUKE_Map12c_RipEyeOut",Button=none)
}