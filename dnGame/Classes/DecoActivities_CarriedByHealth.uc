/*******************************************************************************
 * DecoActivities_CarriedByHealth generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class DecoActivities_CarriedByHealth extends DecoActivities
	native
	exportstructs
	hidecategories(Object);

cpptext
{
// Stripped
}

var() noexport float HealAmount "Amount to heal the carrying actor by.";
var() noexport float HealVariance "Amount to vary the healing touch by (Around HealAmount. So +/- half of HealVariance";
var() noexport float HealMaxAmount "Maximum amount to allow the target object to be healed to. If 0 then no limit.";
var() noexport float DamageAmount "Amount to damage the carrier by";
var() noexport float DamageVariance "Amount to vary the damage by: +/- half of DamageVariance, around DamageAmount.";
var() noexport class<DamageType> DamageTypeClass "Type of damage to inflict on the carrier.";

defaultproperties
{
	DamageTypeClass='Engine.CrushingDamage'
}