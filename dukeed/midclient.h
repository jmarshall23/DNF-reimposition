#pragma once


/*-----------------------------------------------------------------------------
	WMdiClient.
-----------------------------------------------------------------------------*/

// An MDI client window.
class WMdiClient : public WControl
{
	DECLARE_WINDOWSUBCLASS(WMdiClient, WControl, DukeEd)
	WMdiClient(WWindow* InOwner)
		: WControl(InOwner, 0, SuperProc)
	{}
	void OpenWindow(CLIENTCREATESTRUCT* ccs)
	{
		//must make nccreate work!! GetWindowClassName(),
		//!! WS_VSCROLL | WS_HSCROLL
		HWND hWndCreated = TCHAR_CALL_OS(CreateWindowEx(0, TEXT("MDICLIENT"), NULL, WS_CHILD | WS_CLIPCHILDREN | WS_CLIPSIBLINGS, 0, 0, 0, 0, OwnerWindow->hWnd, (HMENU)0xCAC, *hinstWindowHack, ccs), CreateWindowExA(0, "MDICLIENT", NULL, WS_CHILD | WS_CLIPCHILDREN | WS_CLIPSIBLINGS, 0, 0, 0, 0, OwnerWindow->hWnd, (HMENU)0xCAC, hInstance, ccs));
		//check(hWndCreated);
		//check(!hWnd);
		_Windows.AddItem(this);
		hWnd = hWndCreated;
		Show(1);
	}
};
INT GScrollBarWidth = GetSystemMetrics(SM_CXVSCROLL);
class WMdiFrame : public WWindow
{
	DECLARE_WINDOWCLASS(WMdiFrame, WWindow, DukeEd)

	// Variables.
	WMdiClient MdiClient;
	WDockingFrame NotAFrame, BottomFrame, TopFrame, LeftFrame;

	// Functions.
	WMdiFrame(const wchar_t* InPersistentName)
		: WWindow(InPersistentName, this)
		, MdiClient(this)
		, NotAFrame(TEXT("NotAFrame"), this, 32)
		, BottomFrame(TEXT("MdiFrameBottom"), this, 32)
		, LeftFrame(TEXT("MdiFrameLeft"), this, 68)
		, TopFrame(TEXT("MdiFrameTop"), this, 32)
	{}
	INT CallDefaultProc(UINT Message, UINT wParam, LONG lParam)
	{
		return DefFrameProcW(hWnd, MdiClient.hWnd, Message, wParam, lParam);
	}
	virtual void OnCreate() override
	{
		WWindow::OnCreate();

		// Create docking frames.		
		TopFrame.OpenWindow();
		BottomFrame.OpenWindow();
		LeftFrame.OpenWindow();
	}
	virtual void RepositionClient()
	{
		// Reposition docking frames.
		FRect Client = GetClientRect();
		LeftFrame.MoveWindow(FRect(0, TopFrame.DockDepth, LeftFrame.DockDepth, Client.Max.Y), 1);
		TopFrame.MoveWindow(FRect(0, 0, Client.Max.X, TopFrame.DockDepth), 1);
		BottomFrame.MoveWindow(FRect(LeftFrame.DockDepth, Client.Max.Y - BottomFrame.DockDepth, Client.Max.X, Client.Max.Y), 1);

		// Reposition MDI client window.
		MdiClient.MoveWindow(FRect(LeftFrame.DockDepth, TopFrame.DockDepth, Client.Max.X, Client.Max.Y - BottomFrame.DockDepth), 1);

		dukeSharp.EditorResize(Client.Max.X, Client.Max.Y);
	}
	void OnSize(DWORD Flags, INT NewX, INT NewY)
	{
		RepositionClient();
		throw TEXT("NoRoute");
	}
	void OpenWindow()
	{
		TCHAR Title[256];

		UEditorEngineVTableGeneric* gen = (UEditorEngineVTableGeneric*)this;

		wsprintf(Title, TEXT("Duke's Enormous Tool(build: %s %s)"), TEXT(__DATE__), TEXT(__TIME__));
		PerformCreateWindowEx
		(
			WS_EX_APPWINDOW,
			Title,
			WS_OVERLAPPED | WS_CAPTION | WS_SYSMENU | WS_SIZEBOX | WS_MAXIMIZEBOX | WS_MINIMIZEBOX,
			CW_USEDEFAULT,
			CW_USEDEFAULT,
			640,
			480,
			NULL,
			NULL,
			*hinstWindowHack
		);
		ShowWindow(hWnd, SW_SHOWMAXIMIZED);
	}
	void OnSetFocus()
	{
		SetFocus(MdiClient.hWnd);
	}

	virtual void OnCommand(INT Command) override
	{

	}
};