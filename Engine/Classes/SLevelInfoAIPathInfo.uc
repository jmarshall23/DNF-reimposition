struct SLevelInfoAIPathInfo
{
	var() noexport class<BaseAI> ActorClass "If not null, we will look at this actors default collision width and height, along with draw scale and path ID set below, to generate pathing size, If NULL we use the info in StandardPathInfo to generate pathing.";
	var() noexport float ActorDrawScale "If ActorClass is not NULL we will use this draw scale to calculate pathing size. If ActorClassis NULL this will be ignored. Use this if you are scaling or shrinking the ";
	var() noexport name ActorPathID "If ActorClass is not NULL we will use this PathID. If ActorID is NULL we will use the PathID inside StandardPathInfo.";
	var() noexport SAIPathInfo StandardPathInfo "If ActorClass is NULL we will use the path info filled out here for your additional path systems.";
};