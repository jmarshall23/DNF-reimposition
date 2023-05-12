// DukeEd.cpp
//

#include <windows.h>
#include <vector>

#include "unmsg.h"
#include "windowres.h"
#include "Unreal.h"
#include "Window.h"
#include "windrv.h"
#include "dockingframe.h"
#include "DukeSharp.h"
#include "midclient.h"
#include "uncamera.h"
#include "resource.h"
#include "engine_resource.h"
#include "inc/TopBar.h"
#include "inc/ViewportFrame.h"
//#include "levelframe.h"
#include "inc/BottomBar.h"
#include "inc/Browser.h"

#include "inc/BrowserMaster.h"
WBrowserMaster* GBrowserMaster = NULL;
#include "inc/BrowserActor.h"
#include "inc/ButtonBar.h"

#include "inc/SurfacePropSheet.h"

HWND _mainParentHwnd;
dnOuputDeviceString GetPropResult;

dnArray<WWindow*> WWindow::_Windows;

void ShowPropertySheet()
{
	//GSurfPropSheet->Show(TRUE);
	//GSurfPropSheet->PropSheet->RefreshPages();
}

void (*__fastcall UEditorEngine__EdCallbackActual)(void* _this, void *edx, unsigned int code, HWND hwnd, unsigned int lParam);
void __fastcall UEditorEngine__EdCallback(void* _this, void* edx, unsigned int code, HWND hwnd, unsigned int lParam)
{
	// No need to call the original code here, which basically just sent a bunch of windows messages around which doesn't apply to us(since were not using that system anyway).
	// This function is just for us to figure out what the editor is doing(selection change, etc).
}

void InitEditor(void)
{
	ignoreGLog = false;

	dukeSharp.LoadDll();	

	{
		UEditorEngineVTableGeneric* _gen = (UEditorEngineVTableGeneric*)GEditor;
		void *ptr = (void *)_gen->vtable->vtable[162];

		MH_CreateHook(ptr, UEditorEngine__EdCallback, (LPVOID*)&UEditorEngine__EdCallbackActual);
		MH_EnableHook(ptr);
	}

	_mainParentHwnd = dukeSharp.Init(nullptr);
}