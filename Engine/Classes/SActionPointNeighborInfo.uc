struct SActionPointNeighborInfo
{
	var float PathDistance;
	var float ViewDistance;
	var float DotToAP;
	var float DotToAPDir;
	var float ForwardDistance;
	var int MaxPathID;
	var ActionPoint ActionPoint;
	var array<SActionPointJumpInfo> JumpToInfo;
};