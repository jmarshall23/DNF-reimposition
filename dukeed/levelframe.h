#pragma once

class WViewportFrame;

class WLevelFrame : public WWindow
{
	DECLARE_WINDOWCLASS(WLevelFrame, WWindow, DukeEd)

	WLevelFrame(dnName& InPersistentName, WWindow* InOwnerWindow)
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
	WViewportFrame* NewViewportFrame(dnName* pName, UBOOL bNoSize)
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
		config.m_pViewportFrame = new WViewportFrame(*pName, this);
		config.m_pViewportFrame->m_iIdx = GViewports.size();

		GViewports.push_back(config);
		return GViewports[GViewports.size() - 1].m_pViewportFrame;
	}

	enum EViewportShowFlags
	{
		SHOW_Frame = 0x00000001, 	// Show world bounding cube.
		SHOW_ActorRadii = 0x00000002, 	// Show actor collision radii.
		SHOW_Backdrop = 0x00000004, 	// Show background scene.
		SHOW_Actors = 0x00000008,	// Show actors.
		SHOW_Coords = 0x00000010,	// Show brush/actor coords.
		SHOW_ActorIcons = 0x00000020,	// Show actors as icons.
		SHOW_Brush = 0x00000040,	// Show the active brush.
		SHOW_StandardView = 0x00000080,	// Viewport is a standard view.
		SHOW_EdViewport = 0x00000100,	// This is a special editor viewport and shouldn't have it's level reset by level loads
		SHOW_ChildWindow = 0x00000200,	// Show as true child window.
		SHOW_MovingBrushes = 0x00000400,	// Show moving brushes.
		SHOW_PlayerCtrl = 0x00000800,	// Player controls are on.
		SHOW_Paths = 0x00001000,   // Show paths.
		SHOW_KarmaMassProps = 0x00002000,   // Show Karma mass properties (centre-of-mass, inertia tensor)
		SHOW_RealTime = 0x00004000,	// Update window in realtime.
		SHOW_StaticMeshes = 0x00008000,	// Show static meshes.
		SHOW_EventLines = 0x00010000,   // Show event lines (from triggers, etc)
		SHOW_SelectionHighlight = 0x00020000,   // Show green highlights on selections?
		SHOW_Terrain = 0x00040000,	// Show terrain.
		SHOW_DistanceFog = 0x00080000,	// Show distance fog.
		SHOW_MatRotations = 0x00100000,	// Show rotation indicators (matinee preview windows)
		SHOW_MatPaths = 0x00200000,	// Show the path itself (matinee preview windows)
		SHOW_Coronas = 0x00400000,	// Show coronas.
		SHOW_Volumes = 0x00800000,	// Show volume brushes.
		SHOW_Particles = 0x01000000,	// Show pahticuls.
		SHOW_BSP = 0x02000000,	// Show BSP surfaces.
		SHOW_ActorInfo = 0x04000000,	// Shows extended information about actors (class name, event, tag, etc)
		SHOW_KarmaPrimitives = 0x08000000,   // Show Karma collision primitives.
		SHOW_FluidSurfaces = 0x10000000,	// Show simulated fluid surfaces.
		SHOW_Projectors = 0x20000000,	// Show projectors.
		SHOW_NoFallbackMaterials = 0x40000000,	// Don't evaluate fallback materials.
		SHOW_Collision = 0x80000000	// Show simple collision for static meshes etc.
	};

	// Opens a new viewport window.  It creates a viewportframe of the specified size, then creates
	// a viewport that fits inside of it.
	void OpenFrameViewport(INT RendMap, INT X, INT Y, INT W, INT H, DWORD ShowFlags)
	{
		static dnName name = TEXT("");

		// Open a viewport frame.
		WViewportFrame* pViewportFrame = NewViewportFrame(&name, 1);

		if (pViewportFrame)
		{
			pViewportFrame->OpenWindow();

			// Create the viewport inside of the frame.
			UViewport* Viewport = GClient->NewViewport(name);

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