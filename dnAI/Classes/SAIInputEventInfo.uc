struct SAIInputEventInfo
{
	var() noexport float Delay "Delay before firing input event";
	var() noexport Engine.Actor.EControlRemapperKeyType KeyType "Key to act on.";
	var() noexport Engine.BaseAI.EAIInputAction EventType "Event to perform on the key.";
};