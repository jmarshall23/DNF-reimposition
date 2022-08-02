
/*=============================================================================
	Browser : Base class for browser windows
	Copyright 1997-1999 Epic Games, Inc. All Rights Reserved.

	Revision history:
		* Created by Warren Marshall

    Work-in-progress todo's:

=============================================================================*/

enum eBROWSER
{
	eBROWSER_MESH,
	eBROWSER_MUSIC,
	eBROWSER_SOUND,
	eBROWSER_ACTOR,
	eBROWSER_GROUP,
	eBROWSER_TEXTURE,
	eBROWSER_MAX,
};

INT CDECL ClassSortCompare( const void *elem1, const void *elem2 )
{
	UClass* cls1 = (UClass*)elem1;
	UClass* cls2 = (UClass*)elem2;

	return _wcsicmp(cls1->GetName(), cls2->GetName());
}
void Query( ULevel* Level, const TCHAR* Item, std::wstring* pOutput )
{
	enum	{MAX_RESULTS=1024};
	int		NumResults = 0;
	UClass	*Results[MAX_RESULTS];
	std::wstring Work;

	if( ParseCommand(&Item,TEXT("QUERY")) )
	{
		UClass *Parent = NULL;
		ParseObject<UClass>(Item,TEXT("PARENT="),Parent,(UObject *)ANY_PACKAGE);

		// Make a list of all child classes.
		for( TObjectIterator<UClass> It; It && NumResults<MAX_RESULTS; ++It )
			if( It->GetSuperClass()==Parent )
				Results[NumResults++] = *It;

		// Return the results.
		for( INT i=0; i<NumResults; i++ )
		{
			// See if this item has children.
			INT Children = 0;
			for( TObjectIterator<UClass> It; It; ++It )
				if( It->GetSuperClass()==Results[i] )
					Children++;

			// Add to result string.
			if( i>0 ) Work += TEXT(",");
			Work += VAPrintf( TEXT("%s%s%s"),
				Children ? TEXT("C") : TEXT("_"),
				TEXT(" "),
				Results[i]->GetName() );
		}

		*pOutput = Work;
	}
	if( ParseCommand(&Item,TEXT("GETCHILDREN")) )
	{
		UClass *Parent = NULL;
		ParseObject<UClass>(Item,TEXT("CLASS="),Parent, (UObject*)ANY_PACKAGE);
		UBOOL Concrete=0; //ParseUBOOL( Item, TEXT("CONCRETE="), Concrete );

		// Make a list of all child classes.
		for( TObjectIterator<UClass> It; It && NumResults<MAX_RESULTS; ++It )
			Results[NumResults++] = *It;


			//if( It->IsChildOf(Parent) /* && (!Concrete || !(It->ClassFlags & CLASS_Abstract)) */)				

		// Sort them by name.
		//qsort( Results, NumResults, sizeof(UClass*), ClassSortCompare );

		// Return the results.
		for( INT i=0; i<NumResults; i++ )
		{
			if( i>0 ) Work += TEXT(",");
			Work += VAPrintf( TEXT(" %s"), Results[i]->GetName() );
		}

		*pOutput = Work;
	}
}

// Takes a delimited string and breaks it up into elements of a string array.
//
void ParseStringToArray( const TCHAR* pchDelim, dnString String, std::vector<dnString> &_pArray)
{
	INT i;
	dnString S = String;

	i = S.InStr( pchDelim );

	while( i > 0 )
	{
		dnString _new( S.Left(i) );
		_pArray.push_back(_new);

		S = S.Mid( i + 1, S.Len() );
		i = S.InStr( pchDelim );
	}

	dnString _new(S);
	_pArray.push_back(_new);
}

// --------------------------------------------------------------
//
// WBrowser
//
// --------------------------------------------------------------

class WBrowser : public WWindow
{
	DECLARE_WINDOWCLASS(WBrowser,WWindow,Window)

	std::wstring SavePkgName, Description, DefCaption;
	INT MenuID, BrowserID;
	HWND hwndEditorFrame;
	HMENU hmenu;

	// Structors.
	WBrowser( dnName InPersistentName, WWindow* InOwnerWindow, HWND InEditorFrame )
	:	WWindow( InPersistentName, InOwnerWindow )
	{
		//check(InOwnerWindow);
		bDocked = 0;
		MenuID = 0;
		BrowserID = -1;
		hwndEditorFrame = InEditorFrame;
		Description = TEXT("Browser");
	}

	// WWindow interface.
	void OpenWindow( UBOOL bChild )
	{
		MdiChild = 0;

		PerformCreateWindowEx
		(
			0,
			NULL,
			(bChild ? WS_CHILD  : WS_OVERLAPPEDWINDOW) | WS_CLIPCHILDREN | WS_CLIPSIBLINGS,
			0,
			0,
			320,
			200,
			OwnerWindow ? OwnerWindow->hWnd : NULL,
			NULL,
			GetModuleHandle(nullptr)
		);
		bDocked = bChild;
		Show(0);
	}
	INT OnSysCommand( INT Command )
	{
		if( Command == SC_CLOSE )
		{
			Show(0);
			return 1;
		}

		return 0;
	}
	INT OnSetCursor()
	{
		WWindow::OnSetCursor();
		SetCursor(LoadCursor(NULL,IDC_ARROW));
		return 0;
	}
	void OnCreate()
	{
		WWindow::OnCreate();

		// Load windows last position.
		//
		INT X, Y, W, H;

		//if(!GConfig->GetInt( *PersistentName, TEXT("X"), X, TEXT("DukeEd.ini") ))	X = 0;
		//if(!GConfig->GetInt( *PersistentName, TEXT("Y"), Y, TEXT("DukeEd.ini") ))	Y = 0;
		//if(!GConfig->GetInt( *PersistentName, TEXT("W"), W, TEXT("DukeEd.ini") ))	W = 512;
		//if(!GConfig->GetInt( *PersistentName, TEXT("H"), H, TEXT("DukeEd.ini") ))	H = 384;
		X = 0;
		Y = 0;
		W = 320;
		H = 200;

		::MoveWindow( hWnd, X, Y, W, H, TRUE );
	}
	virtual void SetCaption( dnString* Tail = NULL )
	{
		//dnString Caption = *Tail;

		////Caption = Description;
		////
		////if( Tail && Tail->Len() )
		////	Caption = *(FString::Printf(TEXT("%s - %s"), *Caption, *Tail ) );
		//
		//if( IsDocked() )
		//	OwnerWindow->SetText( *Caption );
		//else
		//	SetText( *Caption );

		SetText(TEXT("Browser"));
	}
	virtual dnString	GetCaption()
	{
		return GetText();
	}
	virtual void UpdateMenu()
	{
	}
	void OnDestroy()
	{
		// Save Window position (base class doesn't always do this properly)
		// (Don't do this if the window is minimized.)
		//
		if( !::IsIconic( hWnd ) && !::IsZoomed( hWnd ) )
		{
			RECT R;
			::GetWindowRect(hWnd, &R);

			//GConfig->SetInt( *PersistentName, TEXT("Active"), m_bShow, TEXT("DukeEd.ini") );
			//GConfig->SetInt( *PersistentName, TEXT("Docked"), bDocked, TEXT("DukeEd.ini") );
			//GConfig->SetInt( *PersistentName, TEXT("X"), R.left, TEXT("DukeEd.ini") );
			//GConfig->SetInt( *PersistentName, TEXT("Y"), R.top, TEXT("DukeEd.ini") );
			//GConfig->SetInt( *PersistentName, TEXT("W"), R.right - R.left, TEXT("DukeEd.ini") );
			//GConfig->SetInt( *PersistentName, TEXT("H"), R.bottom - R.top, TEXT("DukeEd.ini") );
		}

		WWindow::OnDestroy();
	}
	void OnPaint()
	{
		PAINTSTRUCT PS;
		HDC hDC = BeginPaint( hWnd, &PS );
		FillRect( hDC, GetClientRect(), (HBRUSH)(COLOR_BTNFACE+1) );
		EndPaint(hWnd, &PS );
	}
	void OnSize( DWORD Flags, INT NewX, INT NewY )
	{
		WWindow::OnSize(Flags, NewX, NewY);
		PositionChildControls();
		InvalidateRect( hWnd, NULL, FALSE );
	}
	virtual void PositionChildControls( void )
	{
	}
	// Searches a list of filenames and replaces all single NULL's with | characters.  This allows
	// the regular parse routine to work correctly.  The return value is the number of NULL's
	// that were replaced -- if this is greater than zero, you have multiple filenames.
	//
	INT FormatFilenames( char* _pchFilenames )
	{
		char *pch = _pchFilenames;
		INT l_iNULLs = 0;

		while( true )
		{
			if( *pch == '\0' )
			{
				if( *(pch+1) == '\0') break;

				*pch = '|';
				l_iNULLs++;
			}
			pch++;
		}

		return l_iNULLs;
	}
	virtual dnString GetCurrentPathName( void )
	{
		return TEXT("");
	}
	virtual void RefreshAll()
	{
	}
	void OnCommand( INT Command )
	{
		switch( Command ) {

			case IDMN_MB_DOCK:
			{
				bDocked = !bDocked;
				SendMessage( hwndEditorFrame, WM_COMMAND, bDocked ? WM_BROWSER_DOCK : WM_BROWSER_UNDOCK, BrowserID );
			}
			break;

			default:
				WWindow::OnCommand(Command);
				break;
		}
	}
	inline UBOOL IsDocked() { return bDocked; }

private:
	UBOOL bDocked;	// If TRUE, then this browser is docked inside the master browser window
};

// Takes a fully pathed filename, and just returns the name.
// i.e. "c:\test\file.txt" gets returned as "file".
//
dnString GetFilenameOnly(dnString Filename)
{
	dnString NewFilename = Filename;

	while( NewFilename.InStr( TEXT("\\") ) != -1 )
		NewFilename = NewFilename.Mid( NewFilename.InStr( TEXT("\\") ) + 1, NewFilename.Len() );

	if( NewFilename.InStr( TEXT(".") ) != -1 )
		NewFilename = NewFilename.Left( NewFilename.InStr( TEXT(".") ) );

	return NewFilename;
}

/*-----------------------------------------------------------------------------
	The End.
-----------------------------------------------------------------------------*/
