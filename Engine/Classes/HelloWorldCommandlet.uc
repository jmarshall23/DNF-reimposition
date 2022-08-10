/*******************************************************************************
 * HelloWorldCommandlet generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class HelloWorldCommandlet extends Commandlet
	transient;

var int intparm;
var string strparm;

function int Main(string Parms)
{
	__NFUN_355__("Hello, world!");
	// End:0x44
	if(__NFUN_309__(Parms, ""))
	{
		__NFUN_355__(__NFUN_302__("Command line parameters=", Parms));
	}
	// End:0x73
	if(__NFUN_174__(intparm, 0))
	{
		__NFUN_355__(__NFUN_302__("You specified intparm=", string(intparm)));
	}
	// End:0xA3
	if(__NFUN_309__(strparm, ""))
	{
		__NFUN_355__(__NFUN_302__("You specified strparm=", strparm));
	}
	return 0;
	return;
}

defaultproperties
{
	HelpCmd="<?int?Engine.HelloWorldCommandlet.HelpCmd?>"
	HelpOneLiner="<?int?Engine.HelloWorldCommandlet.HelpOneLiner?>"
	HelpUsage="<?int?Engine.HelloWorldCommandlet.HelpUsage?>"
	HelpWebLink="<?int?Engine.HelloWorldCommandlet.HelpWebLink?>"
	HelpParm[0]="<?int?Engine.HelloWorldCommandlet.HelpParm?>"
	HelpParm[1]="<?int?Engine.HelloWorldCommandlet.HelpParm?>"
	HelpDesc[0]="<?int?Engine.HelloWorldCommandlet.HelpDesc?>"
	HelpDesc[1]="<?int?Engine.HelloWorldCommandlet.HelpDesc?>"
}