/*******************************************************************************
 * UDukeLocalLink generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeLocalLink extends UdpLink
	transient
	collapsecategories
	dependson(UDukeLocalFact)
	hidecategories(movement,Collision,Lighting,LightColor);

var UDukeLocalFact OwnerFactory;
var string BeaconProduct;
var int ServerBeaconPort;

function Start()
{
	local int P;

	// End:0x4C
	if(__NFUN_173__(__NFUN_1135__(), 0))
	{
		OwnerFactory.QueryFinished(false, "UDukeLocalLink: Could not bind to a free port.");
		return;
	}
	BroadcastBeacon();
	return;
}

function BroadcastBeacon()
{
	local IpAddr Addr;
	local int i;

	Addr.Addr = BroadcastAddr;
	i = 0;
	J0x17:

	// End:0x59 [Loop If]
	if(__NFUN_169__(i, 10))
	{
		Addr.Port = __NFUN_165__(ServerBeaconPort, i);
		__NFUN_1136__(Addr, "REPORTQUERY");
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x17;
	}
	return;
}

event ReceivedText(IpAddr Addr, string Text)
{
	local int n, QueryPort;
	local string address;

	n = __NFUN_314__(BeaconProduct);
	// End:0x8E
	if(__NFUN_310__(__NFUN_317__(Text, __NFUN_165__(n, 1)), __NFUN_302__(BeaconProduct, " ")))
	{
		QueryPort = int(__NFUN_316__(Text, __NFUN_165__(n, 1)));
		address = __NFUN_1131__(Addr);
		address = __NFUN_317__(address, __NFUN_315__(address, ":"));
		OwnerFactory.FoundServer(address, QueryPort, "", BeaconProduct);
	}
	return;
}
