/*******************************************************************************
 * DecoActivityRules_HealthCheck generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class DecoActivityRules_HealthCheck extends DecoActivityRules
	native
	exportstructs
	hidecategories(Object);

cpptext
{
// Stripped
}

enum EHealthCheckType
{
	HEALTHCHECK_None,
	HEALTHCHECK_Threshold,
	HEALTHCHECK_Region
};

var() noexport DecoActivityRules_HealthCheck.EHealthCheckType HealthCheckStyle "Method to use for checking against the health of the actor to see if this activity should occur.";
var() noexport int HealthMin "Health must be above this value to occur in region, and below it in threshold. Set to -1 to use the decoration's HealthMin value. Use this when the check is a threshold.";
var() noexport int HealthMax "Health must be below or equal to this value to occur. Set to -1 to use the decoration's HealthCap value. Ignored when check is a threshold.";
var() noexport bool bHealthIsPercent "The health check values are percentages instead of a hard numbers.";
