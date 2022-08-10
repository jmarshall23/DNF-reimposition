struct SRadioStationDef
{
	var() editconst float Freq;
	var() editconst localized string Name;
	var() editconst name id;
	var() editconst array<SRadioProgramEntry> Program;
	var() editconst float ProgramTime;
	var() editconst float PauseTime;
	var array<int> SongPool;
	var array<int> CommercialPool;
};