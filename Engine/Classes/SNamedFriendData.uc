struct SNamedFriendData
{
	var() noexport SFriendData FriendData "The data to execute when this name is specified.";
	var() noexport name FriendName "Unique name to identify this friend data when you want to have it executed. SysCreationFriend, SysDeathFriend, SysTriggeredFriend are some prefabs available to hand created systems.";
};