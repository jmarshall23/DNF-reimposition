/*******************************************************************************
 * TriggerHint_SwapWeapons generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class TriggerHint_SwapWeapons extends TriggerHint
	hidecategories(Filter,Interactivity,Karma,Lighting,Networking,Sound);

var() noexport localized string MessageMWU "Message to display when mouse wheel alternate is not enabled. use $key(xxx) to do keybindings.";
var() noexport localized string MessageMWD "Message to display when mouse wheel alternate is not enabled. use $key(xxx) to do keybindings.";
var() noexport localized string MessageMW "Message to display when mouse wheel alternate is not enabled. use $key(xxx) to do keybindings.";
var() noexport localized string MessageMWOnly "Message to display when mouse wheel alternate is not enabled. use $key(xxx) to do keybindings.";

defaultproperties
{
	MessageMWU="<?int?dnGame.TriggerHint_SwapWeapons.MessageMWU?>"
	MessageMWD="<?int?dnGame.TriggerHint_SwapWeapons.MessageMWD?>"
	MessageMW="<?int?dnGame.TriggerHint_SwapWeapons.MessageMW?>"
	MessageMWOnly="<?int?dnGame.TriggerHint_SwapWeapons.MessageMWOnly?>"
	Message="<?int?dnGame.TriggerHint_SwapWeapons.Message?>"
	MaxDisplayTime=3
	SpecialKeys=/* Array type was not detected. */
	Pitch=/* Unknown default property type! */
}