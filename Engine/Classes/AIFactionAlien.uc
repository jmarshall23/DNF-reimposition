/*******************************************************************************
 * AIFactionAlien generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AIFactionAlien extends AIFaction
	abstract
	collapsecategories
	notplaceable;

static function Object.EFaction GetFaction()
{
	return 1;
	return;
}

static function bool IsAlien()
{
	return true;
	return;
}
