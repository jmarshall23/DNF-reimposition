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
#include "midclient.h"
#include "uncamera.h"
#include "resource.h"
#include "engine_resource.h"
#include "inc/TopBar.h"
#include "inc/ViewportFrame.h"
#include "levelframe.h"
#include "inc/BottomBar.h"
#include "inc/Browser.h"

#include "inc/BrowserMaster.h"
WBrowserMaster* GBrowserMaster = NULL;
#include "inc/BrowserActor.h"

class WEditorFrame *GEditorFrame;
WBrowserActor* GBrowserActor = NULL;
dnOuputDeviceString GetPropResult;

// Prefebbed viewport configs.  These should be in the same order as the buttons in DlgViewportConfig.
VIEWPORTCONFIG GTemplateViewportConfigs[4][4] =
{
	// 0
	REN_OrthXY,		0,		0,		.65f,		.50f,		0, 0, 0, 0,		NULL,
	REN_OrthXZ,		.65f,	0,		.35f,		.50f,		0, 0, 0, 0,		NULL,
	REN_DynLight,	0,		.50f,	.65f,		.50f,		0, 0, 0, 0,		NULL,
	REN_OrthYZ,		.65f,	.50f,	.35f,		.50f,		0, 0, 0, 0,		NULL,

	// 1
	REN_OrthXY,		0,		0,		.40f,		.40f,		0, 0, 0, 0,		NULL,
	REN_OrthXZ,		.40f,	0,		.30f,		.40f,		0, 0, 0, 0,		NULL,
	REN_OrthYZ,		.70f,	0,		.30f,		.40f,		0, 0, 0, 0,		NULL,
	REN_DynLight,	0,		.40f,	1.0f,		.60f,		0, 0, 0, 0,		NULL,

	// 2
	REN_DynLight,	0,		0,		.70f,		1.0f,		0, 0, 0, 0,		NULL,
	REN_OrthXY,		.70f,	0,		.30f,		.40f,		0, 0, 0, 0,		NULL,
	REN_OrthXZ,		.70f,	.40f,	.30f,		.30f,		0, 0, 0, 0,		NULL,
	REN_OrthYZ,		.70f,	.70f,	.30f,		.30f,		0, 0, 0, 0,		NULL,

	// 3
	REN_OrthXY,		0,		0,		1.0f,		.40f,		0, 0, 0, 0,		NULL,
	REN_DynLight,	0,		.40f,	1.0f,		.60f,		0, 0, 0, 0,		NULL,
	-1,	0, 0, 0, 0, 0, 0, 0, 0, NULL,
	-1,	0, 0, 0, 0, 0, 0, 0, 0, NULL,
};


std::vector< VIEWPORTCONFIG> GViewports;
UViewport* globalInitViewport = nullptr;
WLevelFrame* GLevelFrame = nullptr;
WBottomBar* GBottomBar = nullptr;

void WLevelFrame::FitViewportsToWindow()
{
	RECT R;
	::GetClientRect(GLevelFrame->hWnd, &R);

	for (INT x = 0; x < GViewports.size(); x++)
	{
		VIEWPORTCONFIG* pVC = &(GViewports[GViewports[x].m_pViewportFrame->m_iIdx]);
		float _x = pVC->PctLeft * R.right;
		float _y = pVC->PctTop * R.bottom;
		float _w = pVC->PctRight * R.right;
		float _h = pVC->PctBottom * R.bottom;

		::MoveWindow(GViewports[x].m_pViewportFrame->hWnd, _x, _y, _w, _h, 1);
		//::MoveWindow((HWND)GViewports[x].m_pViewportFrame->m_pViewport->GetWindow(), 0, 6, 320, 200, 1);

	}
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
	ofn.Flags = OFN_HIDEREADONLY | OFN_NOCHANGEDIR;

	// NJS: Ensure the file actually exists:
	ofn.Flags |= OFN_FILEMUSTEXIST | OFN_PATHMUSTEXIST;

	// Display the Open dialog box. 
	if (GetOpenFileNameW(&ofn))
	{
		wchar_t mapExecString[512];

		wsprintf(mapExecString, TEXT("MAP LOAD FILE=\"%s\""), File);

		// Make sure there's a level frame open.
		//GEditorFrame->OpenLevelView();

		// Convert the ANSI filename to UNICODE, and tell the editor to open it.
		GLevelFrame->SetMapFilename(File);
		GEditor->exec.Exec(mapExecString, (dnOutputDevice &)globalLog);

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
	if (!GLevelFrame) { return; }

	OPENFILENAMEW ofn;
	wchar_t File[8192], * pFilename;
	TCHAR l_chCmd[255];

	pFilename = GLevelFrame->GetMapFilename();
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
		wsprintf(l_chCmd, TEXT("MAP SAVE FILE=\"%s\""), File);
		GEditor->exec.Exec(l_chCmd, (dnOutputDevice &)globalLog);

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

WTopBar* GTopBar;

WNDPROC WToolTip::SuperProc;
WNDPROC WButton::SuperProc;

HMENU GMainMenu;

int GViewportConfig = 0;
int GViewportStyle = 0;

class WViewportFrame;

/*-----------------------------------------------------------------------------
	WBackgroundHolder.
-----------------------------------------------------------------------------*/

// Test.
class WBackgroundHolder : public WWindow
{
	DECLARE_WINDOWCLASS(WBackgroundHolder, WWindow, Window)

	// Structors.
	WBackgroundHolder(dnName InPersistentName, WWindow* InOwnerWindow)
		: WWindow(InPersistentName, InOwnerWindow)
	{}

	// WWindow interface.
	void OpenWindow()
	{
		MdiChild = 0;
		PerformCreateWindowEx
		(
			WS_EX_TOOLWINDOW | WS_EX_WINDOWEDGE,
			NULL,
			WS_CHILD | WS_POPUP | WS_CLIPCHILDREN | WS_CLIPSIBLINGS,
			0,
			0,
			512,
			256,
			OwnerWindow ? OwnerWindow->hWnd : NULL,
			NULL,
			*hinstWindowHack
		);
	}
};


// Editor frame window.
class WEditorFrame : public WMdiFrame //, public FNotifyHook, public FDocumentManager
{
	DECLARE_WINDOWCLASS(WEditorFrame, WMdiFrame, DukeEd)

	// Variables.
	WBackgroundHolder BackgroundHolder;
	//WConfigProperties* Preferences;

	// Popup menus.
	HMENU TexturePopupMenu;
	HMENU SurfPopupMenu;
	HMENU ActorPopupMenu;
	HMENU BackdropPopupMenu;

	const dnName backgroundName = TEXT("BackgroundWindow");

	// Constructors.
	WEditorFrame(dnName &name) : WMdiFrame(name)
								, BackgroundHolder(backgroundName, &MdiClient)
	{
		
	}

	// WWindow interface.
	virtual void OnCreate()
	{
 		WMdiFrame::OnCreate();

		// Create MDI client.
		CLIENTCREATESTRUCT ccs;
		ccs.hWindowMenu = NULL;
		ccs.idFirstChild = 60000;
		MdiClient.OpenWindow(&ccs);

		NE_EdInit(hWnd, hWnd);


	}

	void RepositionClient()
	{
		WMdiFrame::RepositionClient();
		BackgroundHolder.MoveWindow(MdiClient.GetClientRect(), 1);
	}

	void OpenLevelView()
	{
		// This is making it so you can only open one level window - it will reuse it for each
		// map you load ... which is not really MDI.  But the editor has problems with 2+ level windows open.  
		// Fix if you can...
		if (!GLevelFrame)
		{
			static dnName name = TEXT("LevelFrame");

			GLevelFrame = new WLevelFrame(name, &BackgroundHolder);
			GLevelFrame->OpenWindow(1, 1);
		}
	}

	virtual void OnCommand(INT Command) override
	{
		switch (Command)
		{
			case ID_FileNew:
			{
				//	FileSaveChanges(hWnd);
					//WNewObject Dialog( NULL, this );
					//UObject* Result = Dialog.DoModal();
					//if( Cast<ULevel>(Result) )
					//{
				GEditor->exec.Exec(TEXT("MAP NEW"), (dnOutputDevice &)globalLog);
				//GLevelFrame->SetMapFilename(TEXT(""));
				//OpenLevelView();
				//GButtonBar->RefreshBuilders();
				//RefreshOptionProxies();
				//if (GBrowserGroup)
				//	GBrowserGroup->RefreshGroupList();
				////}
			}
			break;

			case ID_FileOpen:
				FileOpen(hWnd);
				break;

			case ID_BuildPlay:
			{
				GEditor->exec.Exec(TEXT("HOOK PLAYMAP"), (dnOutputDevice&)globalLog);
			}
			break;
			case ID_FileSaveAs:
			{
				FileSaveAs(hWnd);
			}
			break;

			case ID_BrowserActor:
			{
				GBrowserMaster->ShowBrowser(eBROWSER_ACTOR);
			}
			break;


			case ID_EditDelete:
			{
				GEditor->exec.Exec(TEXT("ACTOR DELETE"), (dnOutputDevice&)globalLog);
			}
			break;

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

			case ID_ViewLevelProp:
			{
				GEditor->exec.Exec(TEXT("LEVELPROPERTIES"), (dnOutputDevice &)globalLog);
			}
			break;
		}
	}
};

WNDPROC WMdiClient::SuperProc = nullptr;
WNDPROC WLabel::SuperProc = nullptr;
WNDPROC WCustomLabel::SuperProc = nullptr;
WNDPROC WComboBox::SuperProc = nullptr;
WNDPROC WListBox::SuperProc = nullptr;
WNDPROC WCheckListBox::SuperProc = nullptr;
//WNDPROC WTreeView::SuperProc = nullptr;
WNDPROC WCheckBox::SuperProc = nullptr;
WNDPROC WTabControl::SuperProc = nullptr;

#define IDMENU_MainMenu                 101

void InitEditor(void)
{
	ignoreGLog = false;

	// Ensure that the common control DLL is loaded. 
	InitCommonControls();

	IMPLEMENT_WINDOWCLASS(WMdiFrame, CS_DBLCLKS)
	IMPLEMENT_WINDOWCLASS(WEditorFrame, CS_DBLCLKS);
	IMPLEMENT_WINDOWCLASS(WViewportFrame, CS_DBLCLKS);
	IMPLEMENT_WINDOWCLASS(WLevelFrame, CS_DBLCLKS);	
	IMPLEMENT_WINDOWCLASS(WTopBar, CS_DBLCLKS | CS_VREDRAW | CS_HREDRAW);
	IMPLEMENT_WINDOWSUBCLASS(WToolTip, TEXT("tooltips_class32"));
	IMPLEMENT_WINDOWSUBCLASS(WButton, TEXT("BUTTON"));
	IMPLEMENT_WINDOWCLASS(WDockingFrame, CS_DBLCLKS | CS_VREDRAW | CS_HREDRAW);
	IMPLEMENT_WINDOWCLASS(WBackgroundHolder, CS_DBLCLKS);
	IMPLEMENT_WINDOWSUBCLASS(WMdiClient, TEXT("MDICLIENT"));
	IMPLEMENT_WINDOWCLASS(WPictureButton, CS_DBLCLKS);
	IMPLEMENT_WINDOWCLASS(WVFToolBar, CS_DBLCLKS);
	IMPLEMENT_WINDOWSUBCLASS(WLabel, TEXT("STATIC"));
	IMPLEMENT_WINDOWSUBCLASS(WCustomLabel, TEXT("STATIC"));
	IMPLEMENT_WINDOWSUBCLASS(WComboBox, TEXT("COMBOBOX"));
	IMPLEMENT_WINDOWCLASS(WBottomBar, CS_DBLCLKS | CS_VREDRAW | CS_HREDRAW);
	IMPLEMENT_WINDOWCLASS(WBrowser, CS_DBLCLKS | CS_VREDRAW | CS_HREDRAW);
	//IMPLEMENT_WINDOWSUBCLASS(WTreeView, WC_TREEVIEW);
	IMPLEMENT_WINDOWSUBCLASS(WCheckBox, TEXT("BUTTON"));
	IMPLEMENT_WINDOWCLASS(WBrowserActor, CS_DBLCLKS | CS_VREDRAW | CS_HREDRAW);
	IMPLEMENT_WINDOWSUBCLASS(WListBox, TEXT("LISTBOX"));
	IMPLEMENT_WINDOWSUBCLASS(WCheckListBox, TEXT("LISTBOX"));

	IMPLEMENT_WINDOWSUBCLASS(WTabControl, WC_TABCONTROL);

	static dnName editorFrameName = TEXT("EditorFrame");

	static WEditorFrame Frame(editorFrameName);
	GEditorFrame = &Frame;

	Frame.OpenWindow();
	InvalidateRect(Frame.hWnd, NULL, 1);
	UpdateWindow(Frame.hWnd);

	//GBottomBar = new WBottomBar(TEXT("BottomBar"), &Frame.BottomFrame);
	//GBottomBar->OpenWindow();
	//Frame.BottomFrame.Dock(GBottomBar);
	//Frame.BottomFrame.OnSize(SWP_FRAMECHANGED | SWP_NOMOVE | SWP_NOSIZE, 0, 0);

	GTopBar = new WTopBar(TEXT("TopBar"), &Frame.TopFrame);
	GTopBar->OpenWindow();
	Frame.TopFrame.Dock(GTopBar);
	Frame.TopFrame.OnSize(SWP_FRAMECHANGED | SWP_NOMOVE | SWP_NOSIZE, 0, 0);	


	// Load initial data from templates
	for (int x = 0; x < GViewports.size(); x++)
		if (GTemplateViewportConfigs[0][x].PctLeft != -1)
		{
			GViewports[x].PctLeft = GTemplateViewportConfigs[GViewportConfig][x].PctLeft;
			GViewports[x].PctTop = GTemplateViewportConfigs[GViewportConfig][x].PctTop;
			GViewports[x].PctRight = GTemplateViewportConfigs[GViewportConfig][x].PctRight;
			GViewports[x].PctBottom = GTemplateViewportConfigs[GViewportConfig][x].PctBottom;
		}

	Frame.OpenLevelView();

	//GBrowserMaster = new WBrowserMaster(TEXT("Master Browser"), GEditorFrame);
	//GBrowserMaster->OpenWindow(0);
	//GBrowserMaster->Browsers[eBROWSER_MESH] = (WBrowser**)(&GBrowserMesh);
	//GBrowserMaster->Browsers[eBROWSER_MUSIC] = (WBrowser**)(&GBrowserMusic);
	//GBrowserMaster->Browsers[eBROWSER_SOUND] = (WBrowser**)(&GBrowserSound);
	//GBrowserMaster->Browsers[eBROWSER_ACTOR] = (WBrowser**)(&GBrowserActor);
	//GBrowserMaster->Browsers[eBROWSER_GROUP] = (WBrowser**)(&GBrowserGroup);
	//GBrowserMaster->Browsers[eBROWSER_TEXTURE] = (WBrowser**)(&GBrowserTexture);
	//::InvalidateRect(GBrowserMaster->hWnd, NULL, 1);



	GBrowserMaster = new WBrowserMaster(TEXT("Master Browser"), &Frame);
	GBrowserMaster->OpenWindow(eBROWSER_ACTOR);
	GBrowserMaster->Browsers[eBROWSER_ACTOR] = (WBrowser**)(&GBrowserActor);	
	::InvalidateRect(GBrowserMaster->hWnd, NULL, 1);

	SendMessageW(GEditorFrame->hWnd, WM_COMMAND, WM_BROWSER_UNDOCK, eBROWSER_ACTOR);
	GBrowserActor->Show(eBROWSER_ACTOR);

	GMainMenu = LoadMenuA(*hinstWindowHack, MAKEINTRESOURCEA(IDMENU_MainMenu));
	SetMenu(Frame.hWnd, GMainMenu);

//	GDnExec->Exec(TEXT("r_AllowAlwaysVisible 1"), (dnOutputDevice&)globalLog);

	//
	//GLevelFrame->FitViewportsToWindow();
}