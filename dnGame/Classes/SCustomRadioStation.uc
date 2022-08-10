struct SCustomRadioStation
{
	var() noexport float Freq "102.1 or whatever....";
	var() noexport localized string Name "Name of the station.";
	var() noexport array<string> Program "List of filenames for songs/commercials to play.  The order of the list will be the order of the program.";
	var() noexport float PauseTime "Time between each song/commercial.";
};