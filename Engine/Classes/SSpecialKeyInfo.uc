struct SSpecialKeyInfo
{
	var noexport string Command "Command associated with this special key.";
	var noexport array<int> BoundKeys "Indeces of the keys that are bound to this SpecialKey.  Initialized on HUD creation and when exiting the control options menu.";
};