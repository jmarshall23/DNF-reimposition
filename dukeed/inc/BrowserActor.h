/*=============================================================================
	BrowserActor : Browser window for actor classes
	Copyright 1997-1999 Epic Games, Inc. All Rights Reserved.

	Revision history:
		* Created by Warren Marshall

    Work-in-progress todo's:

=============================================================================*/


// --------------------------------------------------------------
//
// WBrowserActor
//
// --------------------------------------------------------------

#define ID_BA_TOOLBAR	29030
TBBUTTON tbBAButtons[] = {
	{ 0, IDMN_MB_DOCK, TBSTATE_ENABLED, TBSTYLE_BUTTON, 0L, 0}
	, { 0, 0, TBSTATE_ENABLED, TBSTYLE_SEP, 0L, 0}
	, { 1, IDMN_AB_FileOpen, TBSTATE_ENABLED, TBSTYLE_BUTTON, 0L, 0}
	, { 2, IDMN_AB_FileSave, TBSTATE_ENABLED, TBSTYLE_BUTTON, 0L, 0}
	, { 0, 0, TBSTATE_ENABLED, TBSTYLE_SEP, 0L, 0}
	, { 3, IDMN_AB_NEW_CLASS, TBSTATE_ENABLED, TBSTYLE_BUTTON, 0L, 0}
	, { 4, IDMN_AB_EDIT_SCRIPT, TBSTATE_ENABLED, TBSTYLE_BUTTON, 0L, 0}
	, { 5, IDMN_AB_DEF_PROP, TBSTATE_ENABLED, TBSTYLE_BUTTON, 0L, 0}
};
struct {
	TCHAR ToolTip[64];
	INT ID;
} ToolTips_BA[] = {
	TEXT("Toggle Dock Status"), IDMN_MB_DOCK,
	TEXT("Open Package"), IDMN_AB_FileOpen,
	TEXT("Save Selected Packages"), IDMN_AB_FileSave,
	TEXT("New Script"), IDMN_AB_NEW_CLASS,
	TEXT("Edit Script"), IDMN_AB_EDIT_SCRIPT,
	TEXT("Edit Default Properties"), IDMN_AB_DEF_PROP,
	NULL, 0
};

class WBrowserActor : public WBrowser
{
	DECLARE_WINDOWCLASS(WBrowserActor,WBrowser,Window)

	WTreeView* pTreeView;
	WCheckBox* pInfoActorCheck;
	WCheckBox* pRenderActorCheck;
	WCheckListBox* pPackagesList;
	WLabel* pPinLabel;
	HTREEITEM htiRoot, htiLastSel;
	HWND hWndToolBar;
	WToolTip* ToolTipCtrl;

	HMENU BrowserActorMenu;
	HMENU BrowserActorContext;

	UBOOL bShowPackages;
	UBOOL bCustomPin;
	std::wstring CustomPinName;

	// Structors.
	WBrowserActor( dnName InPersistentName, WWindow* InOwnerWindow, HWND InEditorFrame )
	:	WBrowser( InPersistentName, InOwnerWindow, InEditorFrame )
	{
		pTreeView = NULL;
		pInfoActorCheck = NULL;
		pRenderActorCheck = NULL;
		pPinLabel = NULL;
		htiRoot = htiLastSel = NULL;
		MenuID = IDMENU_BrowserActor;
		BrowserID = eBROWSER_ACTOR;
		Description = TEXT("Actor Classes");
		bCustomPin = 0;
	}

	// WBrowser interface.
	void OpenWindow( UBOOL bChild )
	{
		WBrowser::OpenWindow( bChild );
		//SetCaption();
	}
	virtual void SetCaption( dnString* Tail = NULL )
	{
		//FString Extra;
		//if( GEditor->CurrentClass )
		//{
		//	Extra = GEditor->CurrentClass->GetFullName();
		//	Extra = Extra.Right( Extra.Len() - 6 );	// remove "class" from the front of it
		//}
		//
		//WBrowser::SetCaption( &Extra );
	}
	void OnCreate()
	{
		WBrowser::OnCreate();

		BrowserActorMenu = LoadMenuIdX(GetModuleHandle(NULL), IDMENU_BrowserActor);
		SetMenu( hWnd, BrowserActorMenu );
		
		BrowserActorContext = LoadMenuIdX(GetModuleHandle(NULL), IDMENU_BrowserActor_Context);

		pInfoActorCheck = new WCheckBox( this, IDCK_INFOACTOR );
		pInfoActorCheck->ClickDelegate = FDelegate(this, (TDelegate)&WBrowserActor::OnInfoActorClick);
		pInfoActorCheck->OpenWindow(1, 0, 0, 1, 1, TEXT("InfoActor Only"));

		pRenderActorCheck = new WCheckBox(this, IDCK_RENDERACTOR);
		pRenderActorCheck->ClickDelegate = FDelegate(this, (TDelegate)&WBrowserActor::OnRenderActorClick);
		pRenderActorCheck->OpenWindow(1, 0, 0, 1, 1, TEXT("RenderActor Only"));

		pPinLabel = new WLabel( this, IDSC_PINLABEL );
		pPinLabel->OpenWindow( 1, 0 );

		pTreeView = new WTreeView( this, IDTV_TREEVIEW );
		pTreeView->OpenWindow( 1, 1, 0, 0, 1 );
		pTreeView->SelChangedDelegate = FDelegate(this, (TDelegate)&WBrowserActor::OnTreeViewSelChanged);
		pTreeView->ItemExpandingDelegate = FDelegate(this, (TDelegate)&WBrowserActor::OnTreeViewItemExpanding);
		pTreeView->DblClkDelegate = FDelegate(this, (TDelegate)&WBrowserActor::OnTreeViewDblClk);
		
		pPackagesList = new WCheckListBox( this, IDLB_PACKAGES );
		pPackagesList->OpenWindow( 1, 0, 0, 1 );

		//if(!GConfig->GetInt( *PersistentName, TEXT("ShowPackages"), bShowPackages, TEXT("DukeEd.ini") ))		bShowPackages = 1;
		UpdateMenu();

		hWndToolBar = CreateToolbarEx( 
			hWnd, WS_CHILD | WS_BORDER | WS_VISIBLE | CCS_ADJUSTABLE,
			IDB_BrowserActor_TOOLBAR,
			6,
			GetModuleHandle(NULL),
			IDB_BrowserActor_TOOLBAR,
			(LPCTBBUTTON)&tbBAButtons,
			8,
			16,16,
			16,16,
			sizeof(TBBUTTON));
		//check(hWndToolBar);

		ToolTipCtrl = new WToolTip(this);
		ToolTipCtrl->OpenWindow();
		for( INT tooltip = 0 ; ToolTips_BA[tooltip].ID > 0 ; tooltip++ )
		{
			// Figure out the rectangle for the toolbar button.
			INT index = SendMessageX( hWndToolBar, TB_COMMANDTOINDEX, ToolTips_BA[tooltip].ID, 0 );
			RECT rect;
			SendMessageX( hWndToolBar, TB_GETITEMRECT, index, (LPARAM)&rect);

			ToolTipCtrl->AddTool( hWndToolBar, ToolTips_BA[tooltip].ToolTip, tooltip, &rect );
		}

		PositionChildControls();
		RefreshPackages();
		RefreshActorList();
		SendMessageX( pTreeView->hWnd, TVM_EXPAND, TVE_EXPAND, (LPARAM)htiRoot );
	}
	virtual void UpdateMenu()
	{
		HMENU menu = IsDocked() ? GetMenu( OwnerWindow->hWnd ) : GetMenu( hWnd );

		CheckMenuItem( menu, IDMN_AB_SHOWPACKAGES, MF_BYCOMMAND | (bShowPackages ? MF_CHECKED : MF_UNCHECKED) );
		CheckMenuItem( menu, IDMN_MB_DOCK, MF_BYCOMMAND | (IsDocked() ? MF_CHECKED : MF_UNCHECKED) );
	}
	void RefreshPackages(void)
	{
		FStringOutputDevice log;

		// PACKAGES
		//
		GetPropResult.str.clear();
		dumpTobrowserOut = TRUE;
		GEditor->Get(TEXT("OBJ"), TEXT("PACKAGES CLASS=Class"), (dnOutputDevice&)log);
		dumpTobrowserOut = FALSE;

		std::vector<dnString> PkgArray;
		ParseStringToArray(TEXT(","), GetPropResult.str.c_str(), PkgArray);

		pPackagesList->Empty();

		for (INT x = 0; x < PkgArray.size(); x++)
			pPackagesList->AddString(*PkgArray[x]);

	}
	void OnDestroy()
	{
		delete pTreeView;
		delete pInfoActorCheck;
		delete pRenderActorCheck;
		delete pPinLabel;
		delete pPackagesList;

		::DestroyWindow( hWndToolBar );
		delete ToolTipCtrl;

		DestroyMenu( BrowserActorMenu );
		DestroyMenu( BrowserActorContext );

	//	GConfig->SetInt( *PersistentName, TEXT("ShowPackages"), bShowPackages, TEXT("DukeEd.ini") );

		WBrowser::OnDestroy();
	}
	void OnCommand( INT Command )
	{
		switch( Command )
		{
			case WM_TREEVIEW_RIGHT_CLICK:
				{
					// Select the tree item underneath the mouse cursor.
					TVHITTESTINFO tvhti;
					POINT ptScreen;
					::GetCursorPos( &ptScreen );
					tvhti.pt = ptScreen;
					::ScreenToClient( pTreeView->hWnd, &tvhti.pt );

					SendMessageX( pTreeView->hWnd, TVM_HITTEST, 0, (LPARAM)&tvhti);

					if( tvhti.hItem )
						SendMessageX( pTreeView->hWnd, TVM_SELECTITEM, TVGN_CARET, (LPARAM)(HTREEITEM)tvhti.hItem);

					// Show a context menu for the currently selected item.
					HMENU menu = GetSubMenu( BrowserActorContext, 0 );
					TrackPopupMenu( menu,
						TPM_LEFTALIGN | TPM_TOPALIGN | TPM_RIGHTBUTTON,
						ptScreen.x, ptScreen.y, 0,
						hWnd, NULL);
				}
				break;

			case IDMN_AB_EXPORT_ALL:
				{
					if( ::MessageBox( hWnd, TEXT("This option will export all classes to text .uc files which can later be rebuilt. Do you want to do this?"), TEXT("Export classes to *.uc files"), MB_YESNO) == IDYES)
					{
						GEditor->exec.Exec( TEXT("CLASS SPEW ALL"), (dnOutputDevice &)globalLog);
					}
				}
				break;

			case IDMN_AB_EXPORT:
				{
					if( ::MessageBox( hWnd, TEXT("This option will export all modified classes to text .uc files which can later be rebuilt. Do you want to do this?"), TEXT("Export classes to *.uc files"), MB_YESNO) == IDYES)
					{
						GEditor->exec.Exec(TEXT("CLASS SPEW"), (dnOutputDevice&)globalLog);
					}
				}
				break;

			case IDMN_AB_SHOWPACKAGES:
				{
					bShowPackages = !bShowPackages;
					PositionChildControls();
					UpdateMenu();
				}
				break;

				///case IDMN_AB_PIN_CLASS:
				///	bCustomPin = 1;
				///	CustomPinName = FString::Printf( TEXT(" %s"), GEditor->CurrentClass->GetName() );
				///	::EnableWindow( pRenderActorCheck->hWnd, 0 );
				///	::EnableWindow( pInfoActorCheck->hWnd, 0 );
				///	pPinLabel->SetText( TEXT("*Custom Tree Root*") );
				///	RefreshActorList();
				///	break;
				///
				///case IDMN_AB_UNPIN_CLASS:
				///	bCustomPin = 0;
				///	::EnableWindow( pRenderActorCheck->hWnd, 1 );
				///	::EnableWindow( pInfoActorCheck->hWnd, 1 );
				///	pPinLabel->SetText( TEXT("") );
				///	RefreshActorList();
				///	break;
				///
				///case IDMN_AB_NEW_CLASS:
				///	{
				///		WDlgNewClass l_dlg( NULL, this );
				///		if( l_dlg.DoModal( GEditor->CurrentClass ? GEditor->CurrentClass->GetName() : TEXT("Actor") ) )
				///		{
				///			// Open an editing window.
				///			//
				///			GCodeFrame->AddClass( GEditor->CurrentClass );
				///			RefreshActorList();
				///			RefreshPackages();
				///		}
				///	}
				///	break;
				///
				///case IDMN_AB_DELETE:
				///	{
				///		if( GEditor->CurrentClass )
				///		{
				///			FString CurName = GEditor->CurrentClass->GetName();
				///			GEditor->Exec( TEXT("SETCURRENTCLASS Class=Light") );
				///
				///			TCHAR l_chCmd[256];
				///			FStringOutputDevice GetPropResult = FStringOutputDevice();
				///			appSprintf( l_chCmd, TEXT("DELETE CLASS=CLASS OBJECT=\"%s\""), *CurName );
				///			
				///			GEditor->Get( TEXT("OBJ"), l_chCmd, GetPropResult);
				///
				///			if( !GetPropResult.Len() )
				///			{
				///				// Try to cleanly update the actor list.  If this fails, just reload it from scratch...
				///				if( !SendMessageX( pTreeView->hWnd, TVM_DELETEITEM, 0, (LPARAM)htiLastSel ) )
				///					RefreshActorList();
				///
				///				GCodeFrame->RemoveClass( CurName );
				///			}
				///			else
				///				appMsgf( TEXT("Can't delete class") );
				///		}
				///	}
				///	break;
				///
				///case IDMN_AB_DEF_PROP:
				///	GEditor->Exec( *(FString::Printf(TEXT("HOOK CLASSPROPERTIES CLASS=\"%s\""), GEditor->CurrentClass->GetName())) );
				///	break;

			case IDMN_AB_FileOpen:
			{
				static TCHAR buffer[512];
				HTREEITEM hSelectedItem = TreeView_GetSelection(pTreeView->hWnd);

				TVITEM item;
				item.hItem = hSelectedItem;
				item.mask = TVIF_TEXT;
				item.pszText = buffer;// allocate buffer
				item.cchTextMax = 512; // length of buffer
				TreeView_GetItem(pTreeView->hWnd, &item);

				TCHAR buffer2[512];
				wsprintf(buffer2, TEXT("ACTOR ADD CLASS=%s"), item.pszText);

				GEditor->exec.Exec(buffer2, (dnOutputDevice &)globalLog);
			}
			break;
			//
			//case IDMN_AB_FileSave:
			//	{
			//		FString Pkg;
			//
			//		GWarn->BeginSlowTask( TEXT("Saving Packages"), 1, 0 );
			//
			//		for( INT x = 0 ; x < pPackagesList->GetCount() ; x++ )
			//		{
			//			if( (int)pPackagesList->GetItemData(x) )
			//			{
			//				Pkg = *(pPackagesList->GetString( x ));
			//				GEditor->Exec( *(FString::Printf(TEXT("OBJ SAVEPACKAGE PACKAGE=\"%s\" FILE=\"%s.u\""), *Pkg, *Pkg )) );
			//			}
			//		}
			//
			//		GWarn->EndSlowTask();
			//	}
			//	break;
			//
			//case IDMN_AB_EDIT_SCRIPT:
			//	{
			//		GCodeFrame->AddClass( GEditor->CurrentClass );
			//	}
			//	break;

			default:
				WBrowser::OnCommand(Command);
				break;
		}
	}
	void OnSize( DWORD Flags, INT NewX, INT NewY )
	{
		WBrowser::OnSize(Flags, NewX, NewY);
		PositionChildControls();
		InvalidateRect( hWnd, NULL, FALSE );
		UpdateMenu();
	}
	void PositionChildControls( void )
	{
		if ( !pTreeView || !pInfoActorCheck || !pRenderActorCheck || !pPinLabel || !pPackagesList )
			return;

		FRect CR = GetClientRect();
		RECT R;
		::GetClientRect( hWndToolBar, &R );
		FLOAT Fraction = (CR.Width() - 8) / 10.0f;
		FLOAT Top = 4 + R.bottom;

		::MoveWindow( pInfoActorCheck->hWnd, 4, Top, 110, 20, 1 );
		::MoveWindow( pRenderActorCheck->hWnd, 120, Top, 110, 20, 1 );
		::MoveWindow( pPinLabel->hWnd, 240, Top+4, 130, 14, 1 );
		Top += 20;

		if( bShowPackages )
		{
			::MoveWindow( pTreeView->hWnd, 4, Top, CR.Width() - 8, ((CR.Height() / 3) * 2) - Top, 1 );	Top += ((CR.Height() / 3) * 2) - Top;
			::MoveWindow( pPackagesList->hWnd, 4, Top, CR.Width() - 8, (CR.Height() / 3) - 4, 1);
		
		}
		else
		{
			::MoveWindow( pTreeView->hWnd, 4, Top, CR.Width() - 8, CR.Height() - Top - 4, 1 );
			::MoveWindow( pPackagesList->hWnd, 0, 0, 0, 0, 1);
		}

		::InvalidateRect( hWnd, NULL, 1);
	}
	virtual void RefreshAll()
	{
		RefreshActorList();
	}
	void RefreshActorList( void )
	{
		pTreeView->Empty();

		if (pRenderActorCheck == nullptr)
			return;

		if ( bCustomPin )
		{
			htiRoot = pTreeView->AddItem( CustomPinName.c_str(), NULL, TRUE );
		}
		else
		{
			if ( pInfoActorCheck->IsChecked() )
				htiRoot = pTreeView->AddItem( TEXT(" InfoActor"), NULL, TRUE );
			else if ( pRenderActorCheck->IsChecked() )
				htiRoot = pTreeView->AddItem( TEXT(" RenderActor"), NULL, TRUE );
			else
				htiRoot = pTreeView->AddItem( TEXT(" Object"), NULL, TRUE );
		}

		NMTREEVIEW* pnmtv = (LPNMTREEVIEW)pTreeView->LastlParam;;
		AddChildren(TEXT("Object"), pnmtv->itemNew.hItem);

		htiLastSel = NULL;
	}
	void AddChildren( const TCHAR* pParentName, HTREEITEM hti )
	{
		HTREEITEM newhti;
		std::wstring String, StringQuery;

		dnString ParentName = pParentName;
		ParentName = ParentName.Right( ParentName.Len() - 1 );	// Remove any "placeable" markers

		StringQuery = VAPrintf( TEXT("GETCHILDREN CLASS=Object"), *ParentName );
		Query( GEditor->level, StringQuery.c_str(), &String );

		std::vector<dnString> StringArray;
		dnString String2 = String.c_str();
		ParseStringToArray( TEXT(","), String2, StringArray );

		for( INT x = 0 ; x < StringArray.size() ; x++ )
		{
			dnString NewName = StringArray[x];

			dnString Children = NewName.Left(1);
			NewName = NewName.Right( NewName.Len() - 1 );



			newhti = pTreeView->AddItem( *NewName, hti, Children == TEXT("C") );
		}
	}
	void OnTreeViewSelChanged( void )
	{
		NMTREEVIEW* pnmtv = (LPNMTREEVIEW)pTreeView->LastlParam;
		TCHAR chText[128] = TEXT("\0");
		TVITEM tvi;

		memset( &tvi, 0, sizeof(tvi));
		htiLastSel = tvi.hItem = pnmtv->itemNew.hItem;
		tvi.mask = TVIF_TEXT;
		tvi.pszText = chText;
		tvi.cchTextMax = sizeof(chText);

		if( SendMessageX( pTreeView->hWnd, TVM_GETITEM, 0, (LPARAM)&tvi) )
		{
			dnString Classname = tvi.pszText;
			Classname = Classname.Right( Classname.Len()-1 );
			GEditor->exec.Exec( (VAPrintf(TEXT("SETCURRENTCLASS CLASS=\"%s\""), *Classname )).c_str(), (dnOutputDevice &)globalLog);
		}
		SetCaption();
	}
	void OnTreeViewItemExpanding( void )
	{
		NMTREEVIEW* pnmtv = (LPNMTREEVIEW)pTreeView->LastlParam;
		TCHAR chText[128] = TEXT("\0");

		TVITEM tvi;

		memset( &tvi, 0, sizeof(tvi));
		tvi.hItem = pnmtv->itemNew.hItem;
		tvi.mask = TVIF_TEXT;
		tvi.pszText = chText;
		tvi.cchTextMax = sizeof(chText);

		// If this item already has children loaded, bail...
		if( SendMessageX( pTreeView->hWnd, TVM_GETNEXTITEM, TVGN_CHILD, (LPARAM)pnmtv->itemNew.hItem ) )
			return;

		if( SendMessageX( pTreeView->hWnd, TVM_GETITEM, 0, (LPARAM)&tvi) )
			AddChildren( tvi.pszText, pnmtv->itemNew.hItem );
	}
	void OnTreeViewDblClk( void )
	{
	//	GCodeFrame->AddClass( GEditor->CurrentClass );
	}
	void OnInfoActorClick()
	{
		SendMessageX( pRenderActorCheck->hWnd, BM_SETCHECK, BST_UNCHECKED, 0 );
		RefreshActorList();
		SendMessageX( pTreeView->hWnd, TVM_EXPAND, TVE_EXPAND, (LPARAM)htiRoot );
	}
	void OnRenderActorClick()
	{
		SendMessageX( pInfoActorCheck->hWnd, BM_SETCHECK, BST_UNCHECKED, 0 );
		RefreshActorList();
		SendMessageX( pTreeView->hWnd, TVM_EXPAND, TVE_EXPAND, (LPARAM)htiRoot );
	}
};

/*-----------------------------------------------------------------------------
	The End.
-----------------------------------------------------------------------------*/
