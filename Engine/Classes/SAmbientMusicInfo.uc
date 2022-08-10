struct SAmbientMusicInfo
{
	var() noexport string MusicFilename "Music to play.";
	var() noexport bool bLoop "Should this music automatically loop?";
	var() noexport float Volume "0.0 - 1.0.  Volume of the music.";
	var() noexport float CrossfadeTime "Time in seconds it takes to transition to this song if one is already playing.";
	var() noexport float Radius "Audible radius of the music.";
	var() noexport float StartTime "Offset in seconds to start.";
	var float EarlyEndTime;
	var() noexport deprecated name EndEvent "Event to trigger when this song ends.  bLoop must be set to false in order for this to work.";
};