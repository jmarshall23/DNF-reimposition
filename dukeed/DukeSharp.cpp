// DukeSharp.cpp
//

#include <windows.h>
#include "DukeSharp.h"
#include "Unreal.h"
#include "windrv.h"
#include "uncamera.h"

#include <locale>
#include <codecvt>

DukeSharpInterface	dukeSharp;

void Query(ULevel* Level, const TCHAR* Item, std::wstring* pOutput);
void ParseStringToArray(const TCHAR* pchDelim, dnString String, std::vector<dnString>& _pArray);

UBrushBuilder* currentBuilder = nullptr;
UWindowsViewport* staticMeshViewport = nullptr;

/*
=================
DukeSharpOpenBuilder
=================
*/
void DukeSharpOpenBuilder(UBrushBuilder* builder) {
	currentBuilder = builder;
	dukeSharp.ShowBrushProperties(builder->width, builder->height, builder->Breadth);
}

/*
=================
DukeSharpInterface::LoadDll
=================
*/
void DukeSharpInterface::LoadDll(void) {
	HMODULE module = LoadLibraryA("DukeEdSharp.Exports.dll");

	InitBrowser = (void(__stdcall*)(void))GetProcAddress(module, "InitBrowser");
	InitBrowser();

	PostInit = (HWND(__stdcall*)(HWND))GetProcAddress(module, "PostInit");
	EditorResize = (void(__stdcall*)(int, int))GetProcAddress(module, "EditorResize");

	ShowBrushScale = (void(__stdcall*)(void))GetProcAddress(module, "ShowBrushScale");

	ShowBrushProperties = (void(__stdcall*)(float, float, float))GetProcAddress(module, "ShowBrushProperties");
}

/*
=================
DukeSharpInterface::Init
=================
*/
HWND  DukeSharpInterface::Init(HWND backgroundHolderHwnd) {
	return PostInit(backgroundHolderHwnd);
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

/*
=================
DukeSharp_Get
=================
*/
const wchar_t* __stdcall DukeSharp_Get(const wchar_t *topic, const wchar_t* command) {
	FStringOutputDevice GetPropResult;
	GEditor->Get(topic, command, GetPropResult);

	static std::wstring temp;
	temp = *GetPropResult;

	return temp.c_str();
}

void __stdcall DukeSharp_BuildBrush(float x, float y, float z)
{
	currentBuilder->width = x;
	currentBuilder->height = y;
	currentBuilder->Breadth = z;

	currentBuilder->eventBuild();
}

HWND __stdcall DukeSharp_GetParentWindow()
{
	return _mainParentHwnd;
}

int __stdcall DukeSharp_GetClassFlags(const wchar_t* _clsname)
{
	UClass* _cls = FindObject<UClass>(ANY_PACKAGE, _clsname);

	if (_cls == nullptr)
		return 0;

	return _cls->GetClassFlags();
}

void __stdcall DukeSharp_ToggleEditor(bool flag)
{
	*GIsEditor = flag;
}

void* __stdcall DukeSharp_CreateEditorViewport(HWND hWnd, int RendMap)
{
	// Create the viewport inside of the frame.
	UWindowsViewport* pViewport = GClient->NewViewport(TEXT(""));
	ULevel* level = (ULevel*)((int*)GEditor)[33];
	level->SpawnViewActor((UViewport*)pViewport);
	unsigned int* Viewport_Actor_Showflags = (unsigned*)(*((unsigned*)pViewport + 12) + 5936);
	int* Viewport_Actor_RendMap = (int*)(*((DWORD*)pViewport + 12) + 5940);

	*(char*)(*((int*)pViewport + 12) + 5936) |= 1UL << 8;
	*Viewport_Actor_Showflags |= (0x10 | 0x100 | 0x800 | 0x2000 | 0x20000 | 0x8000 | 0x800100 | SHOW_Backdrop | SHOW_Actors | SHOW_RealTime | SHOW_Brush | SHOW_MovingBrushes | SHOW_StandardView | SHOW_StaticMeshes); // showflags
	*Viewport_Actor_RendMap = RendMap; // rendermap

	UInput* input = (UInput*)*((DWORD*)pViewport + 23);
	input->Init(pViewport);

	RECT r;
	GetWindowRect(hWnd, &r);

	int width = r.right - r.left;
	int height = r.bottom - r.top;

	pViewport->OpenWindow(hWnd, 0, width, height, 0, 0);

	return pViewport;
}

void* __stdcall DukeSharp_CreateStaticMeshViewport(HWND hWnd)
{
	UWindowsViewport* pViewport = GClient->NewViewport(TEXT("StaticMeshBrowser"));
	ULevel* level = (ULevel*)((int*)GEditor)[33];
	level->SpawnViewActor((UViewport*)pViewport);
	unsigned int* Viewport_Actor_Showflags = (unsigned*)(*((unsigned*)pViewport + 12) + 5936);
	int* Viewport_Actor_RendMap = (int*)(*((DWORD*)pViewport + 12) + 5940);

	*(char*)(*((int*)pViewport + 12) + 5936) = 1UL << 8;
	*Viewport_Actor_RendMap = 0x13; //REN_StaticMeshBrowser

	//(*(char*)(*((int*)Viewport + 12) + 5936) & 0x100) = 0;
	// 0x2000 = triggers.

	staticMeshViewport = pViewport;

	*Viewport_Actor_Showflags |= (0x800 | SHOW_Backdrop | SHOW_Actors | SHOW_RealTime | SHOW_Brush | SHOW_MovingBrushes | SHOW_StandardView | SHOW_StaticMeshes); // showflags

	UInput* input = (UInput*)*((DWORD*)pViewport + 23);
	input->Init(pViewport);

	RECT r;
	GetWindowRect(hWnd, &r);

	int width = r.right - r.left;
	int height = r.bottom - r.top;

	pViewport->OpenWindow(hWnd, 0, width, height, 0, 0);

	return pViewport;
}

void __stdcall DukeSharp__ResizeViewport(UWindowsViewport* m_pViewport, int width, int height)
{
	::MoveWindow((HWND)m_pViewport->GetWindow(), 0, 0, width, height, 1);

}

void __stdcall DukeSharp_SetPreviewStaticMesh(const wchar_t* package, const wchar_t* group, const wchar_t* mesh)
{
	FString Package = package;
	FString Group = group;
	FString StaticMesh = mesh;

	UObject* Pkg = FindObject<UPackage>(ANY_PACKAGE, *Package);
	if (Pkg && Group.Len())
		Pkg = FindObject<UPackage>(Pkg, *Group);
		
	GEditor->SetCurrentStaticMesh(NULL);
	for (TObjectIterator<UStaticMesh> It; It; ++It)
	{
		if (StaticMesh == It->GetName() && It->IsIn(Pkg))
		{
			UStaticMesh* _staticMesh = *It;
//			InitStaticMesh(_staticMesh);

			//dnArray<int>* temp_data = (dnArray<int> *)((char*)_staticMesh + 112);
			GEditor->SetCurrentStaticMesh(_staticMesh);
			//PropertyWindow->Root.SetObjects((UObject**)&GUnrealEd->CurrentStaticMesh, 1);
		}
	}
}

void __stdcall DukeSharp_AddStaticModelToLevel(void)
{
	UViewport* Viewport = GEditor->GetCurrentViewport();

	std::wstring s = VAPrintf(TEXT("STATICMESH ADD NAME=%s SNAP=1 X=%1.1f Y=%1.1f Z=%1.1f"),
		GEditor->GetCurrentStaticMesh()->GetName(),
		Viewport->GetActor()->GetLocation()[0], Viewport->GetActor()->GetLocation()[1], Viewport->GetActor()->GetLocation()[2]);

	GEditor->exec.Exec(s.c_str());
	GEditor->exec.Exec(TEXT("POLY SELECT NONE"));
}

void* __stdcall DukeSharp_CreateTextureViewport(HWND hWnd)
{
	// Create the texture browser viewport
	//
	UWindowsViewport* pViewport = GClient->NewViewport(TEXT("TextureBrowser"));
	ULevel* level = (ULevel*)((int*)GEditor)[33];
	level->SpawnViewActor((UViewport *)pViewport);
	unsigned int* Viewport_Actor_Showflags = (unsigned*)(*((unsigned*)pViewport + 12) + 5936);
	int* Viewport_Actor_RendMap = (int*)(*((DWORD*)pViewport + 12) + 5940);
	int* Misc1 = (int*)(*((DWORD*)pViewport + 12) + 5944);
	int* Misc2 = (int*)(*((DWORD*)pViewport + 12) + 5948);

	*Viewport_Actor_Showflags = SHOW_StandardView | 0x08; //pViewport->Actor->ShowFlags = SHOW_StandardView | SHOW_NoButtons | SHOW_ChildWindow;
	*Viewport_Actor_RendMap = REN_TexBrowser; // pViewport->Actor->RendMap = REN_TexBrowser;
	
	UInput* input = (UInput*)*((DWORD*)pViewport + 23);
	input->Init(pViewport);

	*Misc1 = 128;
	*Misc2 = 0;

	RECT r;
	GetWindowRect(hWnd, &r);

	int width = r.right - r.left;
	int height = r.bottom - r.top;
	
	//pViewport->Actor->Misc1 = iZoom;
	//pViewport->Actor->Misc2 = iScroll;
	//pViewport->Group = NAME_None;
	//pViewport->MiscRes = NULL;
	pViewport->OpenWindow(hWnd, 0, width, height, 0, 0);

	return pViewport;
}