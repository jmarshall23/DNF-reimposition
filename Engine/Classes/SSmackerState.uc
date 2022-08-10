struct SSmackerState
{
	var() const noexport string Filename "Path of movie, relative to ..\\Textures\\bik\\";
	var() noexport float FrameDelay "Seconds to delay between frames. 0 = Use Smacker settings";
	var() float _Time;
	var() const noexport float Volume "Volume of the audio for this movie (0.0 to 1.0).";
	var() const noexport int CurrentFrame "Current frame index the Smacker is on";
	var() bool bRestartOnLoad;
	var() noexport bool bSpool "Spool from disk?";
	var() noexport bool bLoop "Loop Smacker?";
	var() noexport bool bPause "Is the Smacker currently paused?";
	var() noexport bool bUseAlpha "Use alpha if available.";
	var() noexport bool bUpdateWhenNotVisible "If true, smacker will update even when it is not being rendered.";
	var bool _bInterlaced;
	var bool _bDoubled;
	var bool _bCentered;
	var() noexport bool bMenuSmack "Never pause in menus?";
	var bool _bYFlipped;
};