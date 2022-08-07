// DukeSharp.cpp
//

#include <windows.h>
#include "DukeSharp.h"
#include "Unreal.h"

#include <locale>
#include <codecvt>

DukeSharpInterface	dukeSharp;

void Query(ULevel* Level, const TCHAR* Item, std::wstring* pOutput);
void ParseStringToArray(const TCHAR* pchDelim, dnString String, std::vector<dnString>& _pArray);

/*
=================
DukeSharpInterface::LoadDll
=================
*/
void DukeSharpInterface::LoadDll(void) {
	HMODULE module = LoadLibraryA("DukeEdSharp.Exports.dll");

	InitBrowser = (void(__cdecl*)(void))GetProcAddress(module, "InitBrowser");	
}

/*
=================
DukeSharpInterface::Init
=================
*/
void DukeSharpInterface::Init(void) {
	InitBrowser();
}

/*
=================
DukeSharp_FindActorClasses
=================
*/
const wchar_t* DukeSharp_FindActorClasses(void) {
	static std::wstring String, StringQuery;

	StringQuery = VAPrintf(TEXT("GETCHILDREN CLASS=Object"));
	Query(GEditor->level, StringQuery.c_str(), &String);

	return String.c_str();
}

/*
=================
DukeSharp_Exec
=================
*/
void __stdcall DukeSharp_Exec(const wchar_t* command) {
	GEditor->exec.Exec(command);
}