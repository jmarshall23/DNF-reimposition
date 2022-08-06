#pragma once

class WViewportFrame;

class WLevelFrame : public WWindow
{
	DECLARE_WINDOWCLASS(WLevelFrame, WWindow, DukeEd)

	WLevelFrame(const wchar_t* InPersistentName, WWindow* InOwnerWindow)
		: WWindow(InPersistentName, InOwnerWindow)
	{

	}

	void OpenWindow(UBOOL bMdi, UBOOL bMax)
	{
		MdiChild = bMdi;
		PerformCreateWindowEx
		(
			MdiChild
			? (WS_EX_MDICHILD)
			: (0),
			TEXT("Level"),
			(bMax ? WS_MAXIMIZE : 0) |
			(MdiChild
				? (WS_CHILD | WS_CLIPSIBLINGS | WS_CLIPCHILDREN | WS_SYSMENU | WS_CAPTION | WS_THICKFRAME | WS_MINIMIZEBOX | WS_MAXIMIZEBOX)
				: (WS_CHILD | WS_CLIPCHILDREN | WS_CLIPSIBLINGS)),
			CW_USEDEFAULT,
			CW_USEDEFAULT,
			512,
			384,
			MdiChild ? OwnerWindow->OwnerWindow->hWnd : OwnerWindow->hWnd,
			NULL,
			*hinstWindowHack
		);
		if (!MdiChild)
		{
			SetWindowLong(hWnd, GWL_STYLE, WS_POPUP | WS_CLIPCHILDREN | WS_CLIPSIBLINGS);
			OwnerWindow->Show(1);
		}

	//	GViewportStyle = 1;

		VIEWPORTCONFIG* pVC = nullptr;

		OpenFrameViewport(REN_OrthXY, 0, 0, 10, 10, 0);
		pVC = &GViewports[0];
		pVC->PctLeft = 0.000000;
		pVC->PctTop = 0.000000;
		pVC->PctRight = 0.480000;
		pVC->PctBottom = 0.500000;

		OpenFrameViewport(REN_OrthXZ, 0, 0, 10, 10, 0);
		pVC = &GViewports[1];
		pVC->PctLeft = 0.480000;
		pVC->PctTop = 0.000000;
		pVC->PctRight = 0.520000;
		pVC->PctBottom = 0.500000;

		OpenFrameViewport(REN_DynLight, 0, 0, 10, 10, 0);
		pVC = &GViewports[2];
		pVC->PctLeft = 0.000000;
		pVC->PctTop = 0.500000;
		pVC->PctRight = 0.5f;
		pVC->PctBottom = 0.5f;


		OpenFrameViewport(REN_OrthYZ, 0, 0, 10, 10, 0);
		pVC = &GViewports[3];
		pVC->PctLeft = 0.480000;
		pVC->PctTop = 0.500000;
		pVC->PctRight = 0.520000;
		pVC->PctBottom = 0.500000;

		FitViewportsToWindow();
	}

	virtual void FitViewportsToWindow();


	virtual void OnSize(DWORD Flags, INT NewX, INT NewY)
	{
		WWindow::OnSize(Flags, NewX, NewY);

		FitViewportsToWindow();
	}

	// Looks for an empty viewport slot, allocates a viewport and returns a pointer to it.
	WViewportFrame* NewViewportFrame(const wchar_t* pName, UBOOL bNoSize)
	{
		// Create the viewport.
		VIEWPORTCONFIG config;
		config.PctLeft = 0;
		config.PctTop = 0;
		config.PctRight = bNoSize ? 0 : 50;
		config.PctBottom = bNoSize ? 0 : 50;
		config.Left = 0;
		config.Top = 0;
		config.Right = bNoSize ? 0 : 320;
		config.Bottom = bNoSize ? 0 : 200;
		config.m_pViewportFrame = new WViewportFrame(pName, this);
		config.m_pViewportFrame->m_iIdx = GViewports.size();

		GViewports.push_back(config);
		return GViewports[GViewports.size() - 1].m_pViewportFrame;
	}	

	// Opens a new viewport window.  It creates a viewportframe of the specified size, then creates
	// a viewport that fits inside of it.
	void OpenFrameViewport(INT RendMap, INT X, INT Y, INT W, INT H, DWORD ShowFlags)
	{		
		// Open a viewport frame.
		WViewportFrame* pViewportFrame = NewViewportFrame(TEXT(""), 1);

		if (pViewportFrame)
		{
			pViewportFrame->OpenWindow();

			// Create the viewport inside of the frame.
			UViewport* Viewport = GClient->NewViewport(TEXT(""));

			ULevel* level = (ULevel*)((int*)GEditor)[33];

			level->SpawnViewActor(Viewport);

			int test2 = ((int*)Viewport)[12];

			unsigned int* Viewport_Actor_Showflags = (unsigned*)(*((unsigned*)Viewport + 12) + 5936);
			int* Viewport_Actor_RendMap = (int*)(*((DWORD*)Viewport + 12) + 5940);

			//*Viewport_Actor_Showflags = (SHOW_Backdrop | SHOW_Actors | SHOW_PlayerCtrl | SHOW_RealTime | SHOW_Brush); // showflags

			//if (RendMap == REN_DynLight)
			//	*Viewport_Actor_Showflags = SHOW_Coords;			

			//*(char*)(*((int*)Viewport + 12) + 5936) = -*(char*)(*((int*)Viewport + 12) + 5936);
			*(char*)(*((int*)Viewport + 12) + 5936) |= 1UL << 8;


			//(*(char*)(*((int*)Viewport + 12) + 5936) & 0x100) = 0;
			// 0x2000 = triggers.

			*Viewport_Actor_Showflags |= (0x10 | 0x100 | 0x800 | 0x2000 | 0x20000 | 0x8000 | 0x800100 | SHOW_Backdrop | SHOW_Actors | SHOW_RealTime | SHOW_Brush |  SHOW_MovingBrushes | SHOW_StandardView | SHOW_StaticMeshes); // showflags

			//if(RendMap != REN_DynLight)
			*Viewport_Actor_RendMap = RendMap; // rendermap

		//Viewport->Actor->ShowFlags = ShowFlags;
		//Viewport->Actor->RendMap = RendMap;

			UInput* input = (UInput*)*((DWORD*)Viewport + 23);

			// 
			input->Init(Viewport);

			// 3drealms made this so negative flag means child window.

			globalInitViewport = Viewport;
			//*Viewport_Actor_Showflags *= -1; // -*Viewport_Actor_Showflags;
			pViewportFrame->SetViewport((UWindowsViewport*)Viewport);
			//	*Viewport_Actor_Showflags = -*Viewport_Actor_Showflags;
			globalInitViewport = nullptr;
			//	::MoveWindow((HWND)pViewportFrame->hWnd, X, Y, W, H, 1);
			::BringWindowToTop(pViewportFrame->hWnd);
			pViewportFrame->ComputePositionData();
		}
	}

	void SetMapFilename(TCHAR* _MapFilename)
	{
		wcscpy(MapFilename, _MapFilename);
		if (::IsWindow(hWnd))
			SetText(MapFilename);
	}

	TCHAR* GetMapFilename()
	{
		return MapFilename;
	}

	virtual void OnCommand(INT Command) override
	{

	}
private:
	TCHAR MapFilename[256];
};