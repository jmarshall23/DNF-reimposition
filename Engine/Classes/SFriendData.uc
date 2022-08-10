struct SFriendData
{
	var() noexport SoftParticleSystem.EFriendStyle FriendStyle "Method to use for picking and spawning friends.";
	var() noexport array<SFriendInfo> FriendInfos "Actual different friends and their setups to use.";
	var int FriendIndex;
	var bool bDisabled;
	var float FriendDuration;
	var float FriendDelay;
};