#pragma once


class WDockingFrame : public WWindow
{
	DECLARE_WINDOWCLASS(WDockingFrame, WWindow, DukeEd)

	// Variables.
	INT DockDepth;
	WWindow* Child;

	// Functions.
	WDockingFrame(const wchar_t* InPersistentName, WMdiFrame* InFrame, INT InDockDepth)
		: WWindow(InPersistentName, (WWindow*)InFrame)
		, DockDepth(InDockDepth)
		, Child(NULL)
	{}
	void OpenWindow()
	{
		PerformCreateWindowEx
		(
			0,
			NULL,
			WS_CHILD,
			0, 0, 0, 0,
			OwnerWindow->hWnd,
			NULL,
			*hinstWindowHack
		);
		//Show(1);
		ShowWindow(hWnd, SW_SHOWNOACTIVATE);
	}
	void Dock(WWindow* InChild)
	{
		Child = InChild;
	}
	void OnSize(DWORD Flags, INT InX, INT InY)
	{
		if (Child)
			Child->MoveWindow(GetClientRect(), TRUE);
	}

	void OnPaint()
	{
		PAINTSTRUCT PS;
		HDC hDC = BeginPaint(hWnd, &PS);
		HBRUSH brushBack = CreateSolidBrush(RGB(128, 128, 128));

		FRect Rect = GetClientRect();
		FillRect(hDC, Rect, brushBack);
		MyDrawEdge(hDC, Rect, 1);

		EndPaint(hWnd, &PS);

		DeleteObject(brushBack);
	}
};
