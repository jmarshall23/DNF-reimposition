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

UBrushBuilder *actualBrushBuilders[40];

std::wstring currentMapName;

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

	Tick = (void(__stdcall*)(float))GetProcAddress(module, "Tick");

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
	int brushBuilderId = 0;

	for (TObjectIterator<UClass> ItC; ItC; ++ItC)
		if (ItC->IsChildOf(UBrushBuilder::StaticClass()) /* && !(ItC->ClassFlags & CLASS_Abstract)*/)
		{
			UBrushBuilder* ubb = ConstructObject<UBrushBuilder>(*ItC);
			if (ubb)
			{
				//pGroup->AddButton(ID, 0, ubb->BitmapFilename, ubb->ToolTip, *ItC, 0);
				//ID++;

				UClass *builderClass = *ItC;
				actualBrushBuilders[brushBuilderId++] = ConstructObject<UBrushBuilder>(builderClass);
			}
		}

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

void FileOpen(HWND hWnd)
{
	//FileSaveChanges(hWnd);

	OPENFILENAMEW ofn;
	wchar_t File[255] = TEXT("\0");

	ZeroMemory(&ofn, sizeof(OPENFILENAMEA));
	ofn.lStructSize = sizeof(OPENFILENAMEA);
	ofn.hwndOwner = hWnd;
	ofn.lpstrFile = File;
	ofn.nMaxFile = sizeof(File);
	wchar_t Filter[255];
	::wsprintf(Filter,
		TEXT("DNF Map Files (*.%s)%c*.%s%cBuild Map Files (*.map)%c*.map%c%c"),
		TEXT("dnf"),
		'\0',
		TEXT("dnf"),
		'\0',
		'\0',
		'\0',
		'\0',
		'\0');
	ofn.lpstrFilter = Filter;
	//ofn.lpstrInitialDir = appToAnsi(*(GLastDir[eLASTDIR_DNF]));
	ofn.lpstrDefExt = TEXT("dnf");
	ofn.Flags = OFN_HIDEREADONLY | OFN_NOCHANGEDIR;

	// NJS: Ensure the file actually exists:
	ofn.Flags |= OFN_FILEMUSTEXIST | OFN_PATHMUSTEXIST;

	// Display the Open dialog box. 
	if (GetOpenFileNameW(&ofn))
	{
		if (wcsstr(File, TEXT(".MAP")) || wcsstr(File, TEXT(".map")))
		{
			std::wstring fullPath = File;
			std::wstring base_filename = fullPath.substr(fullPath.find_last_of(TEXT("/\\")) + 1);

			size_t lastindex = base_filename.find_last_of(TEXT("."));
			std::wstring rawname = base_filename.substr(0, lastindex);

			wchar_t mapExecString[512];
			wsprintf(mapExecString, TEXT("OPENBUILD %s"), rawname.c_str());

			skipLogging = true;
			GEditor->exec.Exec(mapExecString, (dnOutputDevice&)globalLog);
			skipLogging = false;

			UClass* _cls = FindObject<UClass>(ANY_PACKAGE, TEXT("SM_InvisibleCollisionHull"));
			UClass* _brushClass = FindObject<UClass>(ANY_PACKAGE, TEXT("Brush"));
			ULevel* _level = GEditor->GetLevel();

			dnArray<UObject*>* _actors = (dnArray<UObject*> *)GEditor->GetActorList();
		THIS_IS_DUMB:
			for (int i = 2; i < _actors->Num(); i++)
			{
				if (_actors->Get(i) == nullptr)
					continue;

				if (_actors->Get(i)->IsA(_brushClass))
				{
					ABrush* brush = (ABrush*)_actors->Get(i);

					if (brush->GetCSGFlags() != 2)
					{
						GEditor->GetLevel()->DestroyActor((AActor*)_actors->Get(i), 0);
					}
				}
				else
				{
					GEditor->GetLevel()->DestroyActor((AActor*)_actors->Get(i), 0);
				}
			}

			for (int i = 2; i < _actors->Num(); i++)
			{
				if (_actors->Get(i) == nullptr)
					continue;

				if (_actors->Get(i)->IsA(_brushClass))
				{
					ABrush* brush = (ABrush*)_actors->Get(i);

					if (brush->GetCSGFlags() == 2)
					{
						GEditor->bspBrushCSG(brush, GEditor->GetLevelModel(), 0, (ECsgOper)2, 0, 0);
					}
				}
			}

			GEditor->bspRepartition(GEditor->GetLevelModel(), 0, 0);

			FLOAT UU = 0;
			FLOAT VV = 0;
			FLOAT UV = 1;
			FLOAT VU = -1;

			GEditor->exec.Exec(TEXT("POLY SELECT ALL"));
			GEditor->exec.Exec(VAPrintf(TEXT("POLY TEXMULT UU=%f VV=%f UV=%f VU=%f"), UU, VV, UV, VU).c_str());

			return;
		}

		wchar_t mapExecString[512];

		wsprintf(mapExecString, TEXT("MAP LOAD FILE=\"%s\""), File);

		// Make sure there's a level frame open.
		//GEditorFrame->OpenLevelView();

		collectGarbage = false;

		// Convert the ANSI filename to UNICODE, and tell the editor to open it.
		//GLevelFrame->SetMapFilename(File);
		currentMapName = File;
		GEditor->exec.Exec(mapExecString, (dnOutputDevice&)globalLog);

		wchar_t windowText[512];
		wsprintf(windowText, TEXT("Dukes Enormous Tool: %s"), currentMapName.c_str());
		SetWindowTextW(hWnd, windowText);

		collectGarbage = true;

		//FString S = GLevelFrame->GetMapFilename();
		//GMRUList->AddItem(GLevelFrame->GetMapFilename());
		//GMRUList->AddToMenu(hWnd, GMainMenu, 1);
		//
		//GLastDir[eLASTDIR_DNF] = S.Left(S.InStr(TEXT("\\"), 1));
		//
		//GMRUList->AddItem(GLevelFrame->GetMapFilename());
		//GMRUList->AddToMenu(hWnd, GMainMenu, 1);
	}

	// Make sure that the browsers reflect any new data the map brought with it.
	//RefreshEditor();
	//GButtonBar->RefreshBuilders();
	//RefreshOptionProxies();

	//GFileManager->SetDefaultDirectory(appBaseDir());
}


void FileSaveAs(HWND hWnd)
{
	// Make sure we have a level loaded...

	OPENFILENAMEW ofn;
	wchar_t File[8192], * pFilename;
	TCHAR l_chCmd[255];

	pFilename = (wchar_t*)currentMapName.c_str();
	wcscpy(File, pFilename);

	ZeroMemory(&ofn, sizeof(OPENFILENAMEA));
	ofn.lStructSize = sizeof(OPENFILENAMEA);
	ofn.hwndOwner = hWnd;
	ofn.lpstrFile = File;
	ofn.nMaxFile = sizeof(wchar_t) * 8192;
	wchar_t Filter[255];
	::wsprintf(Filter,
		TEXT("Map Files (*.%s)%c*.%s%cAll Files%c*.*%c%c"),
		TEXT("dnf"),
		'\0',
		TEXT("dnf"),
		'\0',
		'\0',
		'\0',
		'\0');
	ofn.lpstrFilter = Filter;
	//ofn.lpstrInitialDir = appToAnsi(*(GLastDir[eLASTDIR_DNF]));
	ofn.lpstrDefExt = TEXT("dnf");
	ofn.Flags = OFN_HIDEREADONLY | OFN_NOCHANGEDIR | OFN_OVERWRITEPROMPT;

	// Display the Open dialog box. 
	if (GetSaveFileNameW(&ofn))
	{
		// Convert the ANSI filename to UNICODE, and tell the editor to open it.
		//GEditor->Exec(TEXT("BRUSHCLIP DELETE"));
		//GEditor->Exec(TEXT("POLYGON DELETE"));
		collectGarbage = false;

		wsprintf(l_chCmd, TEXT("MAP SAVE FILE=\"%s\""), File);
		GEditor->exec.Exec(l_chCmd, (dnOutputDevice&)globalLog);

		collectGarbage = true;

		// Save the filename.
		//GLevelFrame->SetMapFilename(ANSI_TO_TCHAR(File));
		//GMRUList->AddItem(GLevelFrame->GetMapFilename());
		//GMRUList->AddToMenu(hWnd, GMainMenu, 1);
		//
		//FString S = ANSI_TO_TCHAR(File);
		//GLastDir[eLASTDIR_DNF] = S.Left(S.InStr(TEXT("\\"), 1));
	}

	//GFileManager->SetDefaultDirectory(appBaseDir());
}

void __stdcall DukeSharp_RunLocalCommand(int Command, HWND hWnd)
{
	switch (Command)
	{
	case 0: //ID_FileNew:
	{
		GEditor->exec.Exec(TEXT("MAP NEW"), (dnOutputDevice&)globalLog);

		wchar_t windowText[512];
		wsprintf(windowText, TEXT("Dukes Enormous Tool: New Map"));
		SetWindowTextW(hWnd, windowText);
	}
	break;

	case 1: //ID_FileOpen:
		FileOpen(hWnd);
		break;

	case 2: //ID_BuildAll:
	{
		GEditor->exec.Exec(TEXT("MAP REBUILD VISIBLEONLY=0"), (dnOutputDevice&)globalLog);
		GEditor->exec.Exec(TEXT("PATCH BUILD"), (dnOutputDevice&)globalLog);
		GEditor->exec.Exec(TEXT("PATHS BUILD"), (dnOutputDevice&)globalLog);


	}
	break;

	case 3: //ID_BuildPlay:
	{
		GEditor->exec.Exec(TEXT("HOOK PLAYMAP"), (dnOutputDevice&)globalLog);
	}
	break;
	case 4: //ID_FileSaveAs:
	{
		FileSaveAs(hWnd);
	}
	break;

	case 5: //ID_BrowserActor:
	{
		//GBrowserMaster->ShowBrowser(eBROWSER_ACTOR);
		dukeSharp.Init(nullptr);
	}
	break;

	case 6:// ID_ViewSurfaceProp:
	{
	//	GSurfPropSheet->Show(TRUE);
	//	GSurfPropSheet->PropSheet->RefreshPages();
	}
	break;

	//case 1973:
	//case WM_EDC_SELPOLYCHANGE:
	//case WM_EDC_SELCHANGE:
	case 7:
	{
	//	GSurfPropSheet->PropSheet->RefreshPages();
	}
	break;

	case 8:
	{
		GEditor->exec.Exec(TEXT("ACTOR DELETE"), (dnOutputDevice&)globalLog);
	}
	break;
#if 0
	case WM_BROWSER_DOCK:
	{
		INT Browsr = LastlParam;
		switch (Browsr)
		{
		case eBROWSER_ACTOR:
			GBrowserActor = new WBrowserActor(TEXT("Actor Browser"), GBrowserMaster, GEditorFrame->hWnd);
			GBrowserActor->OpenWindow(1);
			GBrowserMaster->ShowBrowser(eBROWSER_ACTOR);
			break;
		}

	}
	break;

	case WM_BROWSER_UNDOCK:
	{
		INT Browsr = LastlParam;
		switch (Browsr)
		{
		case eBROWSER_ACTOR:
			GBrowserActor = new WBrowserActor(TEXT("Actor Browser"), GEditorFrame, GEditorFrame->hWnd);
			GBrowserActor->OpenWindow(0);
			GBrowserMaster->ShowBrowser(eBROWSER_ACTOR);
			break;
		}


		GBrowserMaster->RefreshBrowserTabs(-1);
	}
	break;
#endif
	case 9:
	{
		GEditor->exec.Exec(TEXT("LEVELPROPERTIES"), (dnOutputDevice&)globalLog);
	}
	break;

	case 10:
	{
		dukeSharp.ShowBrushScaleDialog();
	}
	break;

	case 11:
	{
		OPENFILENAMEW ofn;
		wchar_t File[8192] = TEXT("\0");

		ZeroMemory(&ofn, sizeof(OPENFILENAMEA));
		ofn.lStructSize = sizeof(OPENFILENAMEA);
		ofn.hwndOwner = hWnd;
		ofn.lpstrFile = File;
		ofn.nMaxFile = sizeof(char) * 8192;
		ofn.lpstrFilter = TEXT("Unreal Engine Text (*.t3d)\0*.t3d\0All Files\0*.*\0\0");
		//ofn.lpstrInitialDir = appToAnsi(*(GLastDir[eLASTDIR_DNF]));
		ofn.lpstrDefExt = TEXT("t3d");
		ofn.lpstrTitle = TEXT("Import Map");
		ofn.Flags = OFN_HIDEREADONLY | OFN_NOCHANGEDIR;

		// Display the Open dialog box.
		//GEditor->LockMeshView = 1;
		if (GetOpenFileNameW(&ofn))
		{
			TCHAR l_chCmd[512];
			wsprintf(l_chCmd, TEXT("MAP IMPORT FILE=\"%s\""), File);
			collectGarbage = false;
			GEditor->exec.Exec(l_chCmd, (dnOutputDevice&)globalLog);
			collectGarbage = true;
		}
	}
	break;

	case 12:
	{
		OPENFILENAMEW ofn;
		wchar_t File[8192] = TEXT("\0");

		ZeroMemory(&ofn, sizeof(OPENFILENAMEA));
		ofn.lStructSize = sizeof(OPENFILENAMEA);
		ofn.hwndOwner = hWnd;
		ofn.lpstrFile = File;
		ofn.nMaxFile = sizeof(char) * 8192;
		ofn.lpstrFilter = TEXT("Unreal Engine Text (*.t3d)\0*.t3d\0Maya Ascii (*.ma)\0*.ma\0All Files\0*.*\0\0");
		//ofn.lpstrInitialDir = appToAnsi(*(GLastDir[eLASTDIR_DNF]));
		ofn.lpstrDefExt = TEXT("t3d");
		ofn.lpstrTitle = TEXT("Export Map");
		ofn.Flags = OFN_HIDEREADONLY | OFN_NOCHANGEDIR | OFN_OVERWRITEPROMPT;

		if (GetSaveFileNameW(&ofn))
		{
			//GEditor->exec.Exec(TEXT("BRUSHCLIP DELETE"));
			//GEditor->exec.Exec(TEXT("POLYGON DELETE"));

			TCHAR l_chCmd[512];
			wsprintf(l_chCmd, TEXT("MAP EXPORT FILE=\"%s\""), File);
			GEditor->exec.Exec(l_chCmd, (dnOutputDevice&)globalLog);
		}
	}
	break;

	case 13:
	{
		GEditor->exec.Exec(TEXT("EDIT DUPLICATE"), (dnOutputDevice&)globalLog);
	}
	break;

	case 14:
	{
		GEditor->exec.Exec(TEXT("ACTOR SELECT ALL"), (dnOutputDevice&)globalLog);
	}
	break;

	case 15:
	{
		GEditor->exec.Exec(TEXT("POLY SELECT ALL"), (dnOutputDevice&)globalLog);
	}
	break;

	case 16:
	{
		int val = (int)hWnd;
		actualBrushBuilders[val]->eventBuild();
	}
	break;

	case 17:
	{
		void DukeSharpOpenBuilder(UBrushBuilder* builder);	
		int val = (int)hWnd;
		DukeSharpOpenBuilder(actualBrushBuilders[val]);
	}
	break;

	case 18:
	{
		void ShowPropertySheet();
		ShowPropertySheet();
	}
	break;

	case 19:
	{
		
	}
	break;

	//case ID_EditUndo:
	//{
	//	GEditor->exec.Exec(TEXT("TRANSACTION UNDO"), (dnOutputDevice&)globalLog);
	//}
	//break;
	//
	//case ID_EditRedo:
	//{
	//	GEditor->exec.Exec(TEXT("TRANSACTION REDO"), (dnOutputDevice&)globalLog);
	//}
	//break;
	//
	//case ID_EditCut:
	//{
	//	GEditor->exec.Exec(TEXT("EDIT CUT"), (dnOutputDevice&)globalLog);
	//}
	//break;
	//
	//case ID_EditCopy:
	//{
	//	GEditor->exec.Exec(TEXT("EDIT COPY"), (dnOutputDevice&)globalLog);
	//}
	//break;
	//
	//case ID_EditPaste:
	//{
	//	GEditor->exec.Exec(TEXT("EDIT PASTE"), (dnOutputDevice&)globalLog);
	//}
	//break;
	}
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

void __stdcall DukeSharp_SetViewportType(UWindowsViewport* viewport, int rendMode)
{
	int* Viewport_Actor_RendMap = (int*)(*((DWORD*)viewport + 12) + 5940);
	*Viewport_Actor_RendMap = rendMode;
}

void __stdcall DukeSharp__ResizeViewport(UWindowsViewport* m_pViewport, int width, int height)
{
	::MoveWindow((HWND)m_pViewport->GetWindow(), 0, 0, width, height, 1);

}

void __stdcall DukeSharp_RemoveCollisionAndPortalsBeta(void)
{
	UClass* _cls = FindObject<UClass>(ANY_PACKAGE, TEXT("SM_InvisibleCollisionHull"));
	UClass* _brushClass = FindObject<UClass>(ANY_PACKAGE, TEXT("Brush"));
	ULevel* _level = GEditor->GetLevel();
THIS_IS_DUMB:
	dnArray<UObject*>* _actors = (dnArray<UObject*> *)GEditor->GetActorList();
	for (int i = 0; i < _actors->Num(); i++)
	{
		if (_actors->Get(i) == nullptr)
			continue;

		if (_actors->Get(i)->IsA(_brushClass))
		{
			ABrush* brush = (ABrush*)_actors->Get(i);
			int flags = brush->GetPolyFlags();
			if (flags == 8)
			{
				AActor* _actor = (AActor*)brush;
				float* xyz = _actor->GetLocation();
				xyz[0] = 0;
				xyz[1] = 0;
				xyz[2] = 0;
				//goto THIS_IS_DUMB;
			}
		}

		// Destroy all collision volumes.
		if (_actors->Get(i)->IsA(_cls))
		{
			GEditor->GetLevel()->DestroyActor((AActor*)_actors->Get(i), 0);
			_actors->Remove(i, 1);
			goto THIS_IS_DUMB;
		}
	}
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