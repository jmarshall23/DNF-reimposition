// Window.h
//

#pragma once

#include <CommCtrl.h>

#undef max
#undef min
#undef GetClientRect

#define FIRST_AUTO_CONTROL 8192

__forceinline void MakeWindowClassName(TCHAR* Result, const TCHAR* Base)
{
	wsprintf(Result, TEXT("%sUnreal%s"), TEXT("DukeED"), Base);

//	OutputDebugStringW(TEXT("MakeWindowClassName %s\n"), Result);
}

// Text formatting.
inline const TCHAR* LineFormat(const TCHAR* In)
{
	static TCHAR Result[4069];
	TCHAR* Ptr = Result;
	while (*In)
		*Ptr++ = *In++ != '\\' ? In[-1] : *In++ == 'n' ? '\n' : In[-1];
	*Ptr++ = 0;
	return Result;
}

/*-----------------------------------------------------------------------------
	FCommandTarget.
-----------------------------------------------------------------------------*/

//
// Interface for accepting commands.
//
class __declspec(dllimport) FCommandTarget
{
public:
	virtual void Unused() {}
};

class WWindow;

//
// Delegate function pointers.
//
typedef void(WWindow::* TDelegate)();
typedef void(WWindow::* TDelegateInt)(INT);

//
// Simple bindings to an object and a member function of that object.
//
struct FDelegate
{
	WWindow* TargetObject;
	void (WWindow::* TargetInvoke)();
	FDelegate(WWindow* InTargetObject = NULL, TDelegate InTargetInvoke = NULL)
		: TargetObject(InTargetObject)
		, TargetInvoke(InTargetInvoke)
	{}
	virtual void operator()() { if (TargetObject) (TargetObject->*TargetInvoke)(); }
};

class WMdiFrame;

struct FPoint
{
	INT X, Y;
	FPoint()
	{}
	FPoint( INT InX, INT InY )
	:	X( InX )
	,	Y( InY )
	{}
	static FPoint ZeroValue()
	{
		return FPoint(0,0);
	}
	static FPoint NoneValue()
	{
		return FPoint(INDEX_NONE,INDEX_NONE);
	}
	operator POINT*() const
	{
		return (POINT*)this;
	}
	const INT& operator()( INT i ) const
	{
		return (&X)[i];
	}
	INT& operator()( INT i )
	{
		return (&X)[i];
	}
	static INT Num()
	{
		return 2;
	}
	UBOOL operator==( const FPoint& Other ) const
	{
		return X==Other.X && Y==Other.Y;
	}
	UBOOL operator!=( const FPoint& Other ) const
	{
		return X!=Other.X || Y!=Other.Y;
	}
	FPoint& operator+=( const FPoint& Other )
	{
		X += Other.X;
		Y += Other.Y;
		return *this;
	}
	FPoint& operator-=( const FPoint& Other )
	{
		X -= Other.X;
		Y -= Other.Y;
		return *this;
	}
	FPoint operator+( const FPoint& Other ) const
	{
		return FPoint(*this) += Other;
	}
	FPoint operator-( const FPoint& Other ) const
	{
		return FPoint(*this) -= Other;
	}
};

struct FRect
{
	FPoint Min, Max;
	FRect()
	{}
	FRect(INT X0, INT Y0, INT X1, INT Y1)
		: Min(X0, Y0)
		, Max(X1, Y1)
	{}
	FRect(FPoint InMin, FPoint InMax)
		: Min(InMin)
		, Max(InMax)
	{}
	FRect(RECT R)
		: Min(R.left, R.top)
		, Max(R.right, R.bottom)
	{}
	operator RECT* () const
	{
		return (RECT*)this;
	}
	const FPoint& operator()(INT i) const
	{
		return (&Min)[i];
	}
	FPoint& operator()(INT i)
	{
		return (&Min)[i];
	}
	static INT Num()
	{
		return 2;
	}
	UBOOL operator==(const FRect& Other) const
	{
		return Min == Other.Min && Max == Other.Max;
	}
	UBOOL operator!=(const FRect& Other) const
	{
		return Min != Other.Min || Max != Other.Max;
	}
	FRect Right(INT Width)
	{
		return FRect(std::max(Min.X, Max.X - Width), Min.Y, Max.X, Max.Y);
	}
	FRect Bottom(INT Height)
	{
		return FRect(Min.X, ::std::max(Min.Y, Max.Y - Height), Max.X, Max.Y);
	}
	FPoint Size()
	{
		return FPoint(Max.X - Min.X, Max.Y - Min.Y);
	}
	INT Width()
	{
		return Max.X - Min.X;
	}
	INT Height()
	{
		return Max.Y - Min.Y;
	}
	FRect& operator+=(const FPoint& P)
	{
		Min += P;
		Max += P;
		return *this;
	}
	FRect& operator-=(const FPoint& P)
	{
		Min -= P;
		Max -= P;
		return *this;
	}
	FRect operator+(const FPoint& P) const
	{
		return FRect(Min + P, Max + P);
	}
	FRect operator-(const FPoint& P) const
	{
		return FRect(Min - P, Max - P);
	}
	FRect operator+(const FRect& R) const
	{
		return FRect(Min + R.Min, Max + R.Max);
	}
	FRect operator-(const FRect& R) const
	{
		return FRect(Min - R.Min, Max - R.Max);
	}
	FRect Inner(FPoint P) const
	{
		return FRect(Min + P, Max - P);
	}
	UBOOL Contains(FPoint P) const
	{
		return P.X >= Min.X && P.X < Max.X&& P.Y >= Min.Y && P.Y < Max.Y;
	}
};

#define IMPLEMENT_WINDOWCLASS(cls,clsf) \
{\
	TCHAR Temp[256];\
	MakeWindowClassName(Temp,TEXT(#cls));\
	cls::RegisterWindowClass( Temp, clsf );\
}

#define IMPLEMENT_WINDOWSUBCLASS(cls,wincls) \
	{TCHAR Temp[256]; MakeWindowClassName(Temp,TEXT(#cls)); cls::SuperProc = cls::RegisterWindowClass( Temp, wincls );}


#define DECLARE_WINDOWCLASS(cls,parentcls,pkg) \
	public: \
		virtual void GetWindowClassName( TCHAR* Result ) override {MakeWindowClassName(Result,TEXT(#cls));} \
		~cls() {MaybeDestroy();} \
		virtual const TCHAR* GetPackageName() { return TEXT(#pkg); }

#define DECLARE_WINDOWSUBCLASS(cls,parentcls,pkg) \
	DECLARE_WINDOWCLASS(cls,parentcls,pkg) \
	static WNDPROC SuperProc;


struct UEditorWindowVTable
{
	void* vtable[400];
};

extern HINSTANCE* hinstWindowHack;

LRESULT APIENTRY StaticWndProcNew(HWND hWnd, UINT Message, WPARAM wParam, WPARAM lParam);

class WControl;

__declspec(dllimport) class WWindow
{
public:
	// Variables.
	HWND					hWnd;
	dnName					PersistentName;
	WORD					ControlId, TopControlId;
	BITFIELD				Destroyed : 1;
	BITFIELD				MdiChild : 1;
	WWindow*				OwnerWindow;
	void*					NotifyHook;
	void*					Snoop;
	dnArray<WControl*>		Controls;	
	BOOL m_bShow;
	WPARAM LastwParam;
	LPARAM LastlParam;

	static dnArray<WWindow*> _Windows;

	WWindow(WWindow* InFrame);
	WWindow(const wchar_t* name, WWindow* InFrame) : PersistentName(name)
		, ControlId(0)
		, TopControlId(FIRST_AUTO_CONTROL)
		, Destroyed(0)
		, MdiChild(0)
		, OwnerWindow(InFrame)
		, NotifyHook(0)
		, Snoop(NULL) {
		OwnerWindow = InFrame;
	}
	virtual ~WWindow() { }

	static LONG APIENTRY StaticWndProc(HWND hWnd, UINT Message, UINT wParam, LONG lParam);

	void MaybeDestroy();
	void Show(UBOOL bShow);
	void MoveWindow(FRect R, UBOOL bRepaint)
	{
		::MoveWindow(hWnd, R.Min.X, R.Min.Y, R.Width(), R.Height(), bRepaint);
	}
	void MoveWindow(int Left, int Top, int Width, int Height, UBOOL bRepaint)
	{
		::MoveWindow(hWnd, Left, Top, Width, Height, bRepaint);
	}

	FRect GetClientRect(void) const;	
	void PerformCreateWindowEx(DWORD dwExStyle, LPCWSTR lpWindowName, DWORD dwStyle, INT x, INT y, INT nWidth, INT nHeight, HWND hWndParent, HMENU hMenu, HINSTANCE hInstance);
	virtual void Unknown() { }
	virtual void SetMinWidth(int& width);
	virtual void SetMinHeight(int& height);
	virtual void Serialize(dnArchive& arhive);
	virtual const TCHAR* GetPackageName() { return TEXT("DukeEd"); }
	virtual void DoDestroy(void);
	virtual void GetWindowClassName(TCHAR* Result) = 0;
	virtual LONG WndProc(UINT Message, UINT wParam, LONG lParam)
#if 1
	{
		try
		{
			LastwParam = wParam;
			LastlParam = lParam;

			// Message processing.
			if (Message == WM_DESTROY)
			{
				OnDestroy();
			}
			else if (Message == WM_DRAWITEM) {
				DRAWITEMSTRUCT* Info = (DRAWITEMSTRUCT*)lParam;
				for (INT i = 0; i < Controls.Num(); i++) {
					WWindow* control = (WWindow*)Controls.Data[i];

					if (control->hWnd == Info->hwndItem)
					{
						control->OnDrawItem(Info); break;
					}
				}

				return 1;
			}
			else if (Message == WM_MEASUREITEM) {
				return 1;
			}
			//else if (Message == WM_DRAWITEM)
			//{
			//	DRAWITEMSTRUCT* Info = (DRAWITEMSTRUCT*)lParam;
			//	for (INT i = 0; i < Controls.Num(); i++)
			//		if (((WWindow*)Controls(i))->hWnd == Info->hwndItem)
			//		{
			//			((WWindow*)Controls(i))->OnDrawItem(Info); break;
			//		}
			//	return 1;
			//}
			//else if (Message == WM_MEASUREITEM)
			//{
			//	MEASUREITEMSTRUCT* Info = (MEASUREITEMSTRUCT*)lParam;
			//	for (INT i = 0; i < Controls.Num(); i++)
			//		if (((WWindow*)Controls(i))->ControlId == Info->CtlID)
			//		{
			//			((WWindow*)Controls(i))->OnMeasureItem(Info); break;
			//		}
			//	return 1;
			//}
			else if (Message == WM_CLOSE)
			{
				if (ShouldClose())
					OnClose();
				else
					return 0;
			}
			else if (Message == WM_CHAR)
			{
				OnChar(wParam);
			}
			else if (Message == WM_KEYDOWN)
			{
				OnKeyDown(wParam);
			}
			else if (Message == WM_PAINT)
			{
				OnPaint();
			}
			else if (Message == WM_CREATE)
			{
				OnCreate();
			}
			else if (Message == WM_TIMER)
			{
				OnTimer();
			}
			else if (Message == WM_INITDIALOG)
			{
				OnInitDialog();
			}
			else if (Message == WM_ENTERIDLE)
			{
				OnEnterIdle();
			}
			else if (Message == WM_SETFOCUS)
			{
				OnSetFocus((HWND)wParam);
			}
			else if (Message == WM_ACTIVATE)
			{
				OnActivate(LOWORD(wParam) != 0);
			}
			else if (Message == WM_KILLFOCUS)
			{
				OnKillFocus((HWND)wParam);
			}
			else if (Message == WM_SIZE)
			{
				OnSize(wParam, LOWORD(lParam), HIWORD(lParam));
			}
			else if (Message == WM_PASTE)
			{
				OnPaste();
			}
			else if (Message == WM_SHOWWINDOW)
			{
				OnShowWindow(wParam);
			}
			else if (Message == WM_COPYDATA)
			{
				OnCopyData((HWND)wParam, (COPYDATASTRUCT*)lParam);
			}
			else if (Message == WM_CAPTURECHANGED)
			{
				OnReleaseCapture();
			}
			else if (Message == WM_MDIACTIVATE)
			{
				OnMdiActivate((HWND)lParam == hWnd);
			}
			else if (Message == WM_MOUSEMOVE)
			{
				OnMouseMove(wParam, FPoint(LOWORD(lParam), HIWORD(lParam)));
			}
			else if (Message == WM_LBUTTONDOWN)
			{
				OnLeftButtonDown();
			}
			else if (Message == WM_RBUTTONDOWN)
			{
				OnRightButtonDown();
			}
			else if (Message == WM_LBUTTONUP)
			{
				OnLeftButtonUp();
			}
			else if (Message == WM_RBUTTONUP)
			{
				OnRightButtonUp();
			}
			else if (Message == WM_CUT)
			{
				OnCut();
			}
			else if (Message == WM_COPY)
			{
				OnCopy();
			}
			else if (Message == WM_UNDO)
			{
				OnUndo();
			}
			else if (Message == WM_SETCURSOR)
			{
				if (OnSetCursor())
					return 1;
			}
			else if (Message == WM_NOTIFY)
			{
				for (INT i = 0; i < Controls.Num(); i++)
					if (wParam == ((WWindow*)Controls(i))->ControlId
						&& ((WWindow*)Controls(i))->InterceptControlCommand(Message, wParam, lParam))
						return 1;
				OnCommand(wParam);

			}
			else if (Message == WM_VSCROLL)
			{
				OnVScroll(wParam, lParam);
			}
			else if (Message == WM_KEYUP)
			{
				OnKeyUp(wParam, lParam);
			}
			else if (Message == WM_COMMAND)
			{
				for (INT i = 0; i < Controls.Num(); i++)
				{
					if (Controls(i) == NULL)
						continue;

					if ((HWND)lParam == ((WWindow*)Controls(i))->hWnd
						&& ((WWindow*)Controls(i))->InterceptControlCommand(Message, wParam, lParam))
						return 1;
				}
				OnCommand(wParam);
			}
			else if (Message == WM_SYSCOMMAND)
			{
				if (OnSysCommand(wParam))
					return 1;
			}
			return CallDefaultProc(Message, wParam, lParam);
		}
		catch (const TCHAR*)
		{
			// This exception prevents the message from being routed to the default proc.
			return 0;
		}
	}
#endif
	virtual INT CallDefaultProc(UINT Message, UINT wParam, LONG lParam);
	virtual UBOOL InterceptControlCommand(UINT Message, UINT wParam, LONG lParam);
	virtual dnString GetText();
	virtual void SetText(const dnString& text);
	virtual void SetText(const TCHAR* Text);
	virtual INT GetLength();
	virtual void OnCopyData(HWND hWndSender, COPYDATASTRUCT* CD);
	virtual void OnSetFocus(HWND hWndLosingFocus);
	virtual void OnKillFocus(HWND hWndGaininFocus);
	virtual void OnSize(DWORD Flags, INT NewX, INT NewY);
	virtual void OnCommand(INT Command);
	virtual INT OnSysCommand(INT Command);
	virtual void OnActivate(UBOOL Active);
	virtual void OnChar(TCHAR Ch);
	virtual void RecoverLostWindow(void);
	virtual void OnKeyDown(TCHAR Ch);
	virtual void OnCut();
	virtual void OnCopy();
	virtual void OnPaste();
	virtual void OnShowWindow(UBOOL bShow);
	virtual void OnUndo();
	virtual void OnVScroll(WPARAM wParam, LPARAM lParam);
	virtual void OnHScroll(WPARAM wParam, LPARAM lParam);
	virtual void OnKeyUp(WPARAM wParam, LPARAM lParam);
	virtual void OnPaint();
	virtual void OnCreate();
	virtual void OnDrawItem(DRAWITEMSTRUCT* Info);
	virtual void OnMeasureItem(MEASUREITEMSTRUCT* Info);
	virtual void OnInitDialog();
	virtual void OnEnterIdle();
	virtual void OnMouseEnter();
	virtual void OnMouseLeave();
	virtual void OnMouseHover();
	virtual void OnTimer();
	virtual void OnReleaseCapture();
	virtual void OnMdiActivate(UBOOL Active);
	virtual void OnMouseMove(DWORD Flags, FPoint Location);
	virtual void OnLeftButtonDown(void);
	virtual void OnRightButtonDown(void);
	virtual void OnLeftButtonUp(void);
	virtual void OnRightButtonUp(void);
	virtual void OnFinishSplitterDrag(void* Drag, UBOOL Success) { }
	virtual INT OnSetCursor();
	virtual UBOOL ShouldClose(void);
	virtual UBOOL OnClose(void) { return false; }
	virtual void OnDestroy(void);
	virtual void ClipOrCenterWindowToMonitor(HWND__*, unsigned int);
	virtual void MyDrawEdge(HDC hdc, LPRECT qrc, UBOOL bRaised);

	static WNDPROC RegisterWindowClass(const TCHAR* Name, DWORD Style);

	//static __declspec(dllimport) dnArray<WWindow*> _windows;
};

__declspec(dllimport) class WControl : public WWindow
{
public:
	// Variables.
	WNDPROC WindowDefWndProc;

	WControl(WWindow* InOwnerWindow, int InId, WNDPROC InSuperProc) : WWindow(TEXT(""), InOwnerWindow)
	{
		WindowDefWndProc = InSuperProc;
		ControlId = InId ? InId : InOwnerWindow->TopControlId++;
		OwnerWindow->Controls.AddItem(this);
	}

	static WNDPROC RegisterWindowClass(const TCHAR* Name, const TCHAR* WinBaseClass)
	{
		WNDPROC SuperProc = NULL;
		WNDCLASSEXW Cls;
		memset(&Cls, 0, sizeof(Cls));
		Cls.cbSize = sizeof(Cls);
		GetClassInfoExW(NULL, WinBaseClass, &Cls);
		SuperProc = Cls.lpfnWndProc;
		Cls.lpfnWndProc = WWindow::StaticWndProc;
		Cls.lpszClassName = Name;
		Cls.hInstance = *hinstWindowHack;
		//Cls.lpszMenuName == NULL);
		int ret = RegisterClassExW(&Cls);
		ret = ret;
		return SuperProc;
	}

	// WWindow interface.
	virtual INT CallDefaultProc(UINT Message, UINT wParam, LONG lParam)
	{
		if (::IsWindow(hWnd))
			return CallWindowProcW(WindowDefWndProc, hWnd, Message, wParam, lParam);
		else
			return 1;
	}
};

class WWindowFake : public WWindow {
public:
	WWindowFake(const wchar_t *name, WWindow* InFrame) : WWindow(name, InFrame) {

	}

	virtual void GetWindowClassName(TCHAR* Result) { }
};

__declspec(dllimport) class WToolTip : public WControl
{
	//W_DECLARE_CLASS(WToolTip, WControl, CLASS_Transient);
	DECLARE_WINDOWSUBCLASS(WToolTip, WControl, Window)

	// Constructor.
	WToolTip(WWindow* InOwner, INT InId = 900, WNDPROC InSuperProc = NULL)
		: WControl(InOwner, InId, InSuperProc ? InSuperProc : SuperProc)
	{
		WindowDefWndProc = InSuperProc ? InSuperProc : SuperProc;
	}

	void OpenWindow()
	{
		PerformCreateWindowEx
		(
			0,
			NULL,
			TTS_ALWAYSTIP,
			0, 0,
			0, 0,
			NULL,
			(HMENU)NULL,
			*hinstWindowHack
		);

		SendMessageW(hWnd, WM_SETFONT, (WPARAM)GetStockObject(DEFAULT_GUI_FONT), MAKELPARAM(0, 0));
	}
	void AddTool(HWND InHwnd, dnString InToolTip, INT InId, RECT* InRect = NULL)
	{
		RECT rect;
		::GetClientRect(InHwnd, &rect);

		TOOLINFO ti;
		TCHAR chToolTip[128] = TEXT("");
		wcscpy(chToolTip, *InToolTip);
		ti.cbSize = sizeof(TOOLINFO);
		ti.uFlags = TTF_SUBCLASS;
		ti.hwnd = InHwnd;
		ti.hinst = *hinstWindowHack;
		ti.uId = ControlId + InId;
		ti.lpszText = chToolTip;
		if (InRect)
			ti.rect = *InRect;
		else
			ti.rect = rect;

		SendMessageX(hWnd, TTM_ADDTOOL, 0, (LPARAM)(LPTOOLINFO)&ti);
	}
};


// A button.
__declspec(dllimport) class WButton : public WControl
{
	DECLARE_WINDOWSUBCLASS(WButton, WControl, Window)

	// Delegates.
	FDelegate ClickDelegate;
	FDelegate DoubleClickDelegate;
	FDelegate PushDelegate;
	FDelegate UnPushDelegate;
	FDelegate SetFocusDelegate;
	FDelegate KillFocusDelegate;
	HBITMAP hbm;
	UBOOL bChecked, bOwnerDraw;

	// Constructor.
	WButton(WWindow* InOwner, INT InId = 0, FDelegate InClicked = FDelegate(), WNDPROC InSuperProc = NULL)
		: WControl(InOwner, InId, InSuperProc ? InSuperProc : SuperProc)
		, ClickDelegate(InClicked)
	{
		WindowDefWndProc = InSuperProc ? InSuperProc : SuperProc;
		bChecked = 0;
	}

	void OpenWindow(UBOOL Visible, INT X, INT Y, INT XL, INT YL, const TCHAR* Text, UBOOL bBitmap = 0, DWORD dwExtraStyle = 0)
	{
		int style = WS_CHILD | BS_PUSHBUTTON | (bBitmap ? BS_BITMAP : 0) | dwExtraStyle;
		PerformCreateWindowEx
		(
			0,
			NULL,
			style,
			X, Y,
			XL, YL,
			OwnerWindow->hWnd,
			(HMENU)ControlId,
			*hinstWindowHack
		);
		SendMessageW(hWnd, WM_SETFONT, (WPARAM)GetStockObject(DEFAULT_GUI_FONT), MAKELPARAM(0, 0));
		SetText(Text);
		if (Visible)
			ShowWindow(hWnd, SW_SHOWNOACTIVATE);

		bOwnerDraw = (dwExtraStyle & BS_OWNERDRAW);
	}
	void SetVisibleText(const TCHAR* Text);
	void SetBitmapReal(HBITMAP Inhbm)
	{
		SendMessage(hWnd, BM_SETIMAGE, IMAGE_BITMAP, (LPARAM)Inhbm);
		hbm = Inhbm;
	}
	virtual void Clicked();
	void OnDrawItem(DRAWITEMSTRUCT* Item)
	{
		RECT R = Item->rcItem;
		UBOOL bPressed = (Item->itemState & ODS_SELECTED) != 0 || bChecked;

		HBRUSH brush = CreateSolidBrush(RGB(128, 128, 128));
		FillRect(Item->hDC, &Item->rcItem, brush);

		MyDrawEdge(Item->hDC, &R, !bPressed);

		HDC hdcMem;
		HBITMAP hbmOld;

		hdcMem = CreateCompatibleDC(Item->hDC);
		hbmOld = (HBITMAP)SelectObject(hdcMem, hbm);
		BITMAP bitmap;
		GetObjectA(hbm, sizeof(BITMAP), (LPSTR)&bitmap);

		int Adjust = (bPressed) ? 2 : 0;

		BitBlt(Item->hDC,
			(R.right / 2) - (bitmap.bmWidth / 2) + Adjust, (R.bottom / 2) - (bitmap.bmHeight / 2) + Adjust,
			bitmap.bmWidth, bitmap.bmHeight,
			hdcMem,
			0, 0,
			SRCCOPY);

		// If this button is checked, draw a light border around in the inside to make it obvious.
		if (bPressed)
		{
			HPEN penOld, pen = CreatePen(PS_SOLID, 1, RGB(145, 210, 198));

			RECT rc = R;
			rc.left++;	rc.top++;	rc.right--;		rc.bottom--;

			penOld = (HPEN)SelectObject(Item->hDC, pen);
			::MoveToEx(Item->hDC, rc.left, rc.top, NULL);
			::LineTo(Item->hDC, rc.right, rc.top);
			::LineTo(Item->hDC, rc.right, rc.bottom);
			::LineTo(Item->hDC, rc.left, rc.bottom);
			::LineTo(Item->hDC, rc.left, rc.top);
			SelectObject(Item->hDC, penOld);

			DeleteObject(pen);
		}

		// Clean up.
		//
		DeleteObject(brush);
		SelectObject(hdcMem, hbmOld);
		DeleteDC(hdcMem);
	}
	UBOOL IsChecked(void);
	void SetCheck(INT iCheck);
	UBOOL InterceptControlCommand(UINT Message, UINT wParam, LONG lParam)
	{
		if (HIWORD(wParam) == BN_CLICKED)
		{
			Clicked();
			ClickDelegate();
			// This notification returns 0 instead of 1 because the editor sometimes wants
			// to know about clicks without using a delegate (i.e. dynamically created buttons)
			return 0;
		}
		else if (HIWORD(wParam) == BN_DBLCLK) { DoubleClickDelegate(); return 1; }
		else if (HIWORD(wParam) == BN_PUSHED) { PushDelegate();        return 1; }
		else if (HIWORD(wParam) == BN_UNPUSHED) { UnPushDelegate();      return 1; }
		else if (HIWORD(wParam) == BN_SETFOCUS) { SetFocusDelegate();    return 1; }
		else if (HIWORD(wParam) == BN_KILLFOCUS) { UnPushDelegate();      return 1; }
		else return 0;
	}
};

/*-----------------------------------------------------------------------------
	WPictureButton.
-----------------------------------------------------------------------------*/

__declspec(dllimport) class WPictureButton : public WWindow
{
	DECLARE_WINDOWCLASS(WPictureButton, WWindow, Window)

	HBITMAP hbmOn, hbmOff;
	RECT ClientPos, BmpOffPos, BmpOnPos;
	//dnString ToolTipText;
	INT ID;
	WToolTip* ToolTipCtrl;
	UBOOL bOn, bHasBeenSetup;

	// Structors.
	WPictureButton(WWindow* InOwnerWindow)
		: WWindow(TEXT("PictureButton"), InOwnerWindow)
	{
		hbmOn = hbmOff = NULL;
		bOn = bHasBeenSetup = 0;
		ToolTipCtrl = NULL;
	}

	void OpenWindow()
	{
		MdiChild = 0;

		// HAVE to call "SetUp" before opening the window
		//check(bHasBeenSetup);

		PerformCreateWindowEx
		(
			0,
			NULL,
			WS_CHILD | WS_VISIBLE | WS_CLIPCHILDREN | WS_CLIPSIBLINGS,
			ClientPos.left,
			ClientPos.top,
			ClientPos.right,
			ClientPos.bottom,
			OwnerWindow ? OwnerWindow->hWnd : NULL,
			NULL,
			GetModuleHandle(NULL)
		);
		SendMessageW(hWnd, WM_SETFONT, (WPARAM)GetStockObject(DEFAULT_GUI_FONT), MAKELPARAM(0, 0));

		ToolTipCtrl = new WToolTip(this);
		ToolTipCtrl->OpenWindow();
	}
	virtual void OnSize(DWORD Flags, INT NewX, INT NewY)
	{
		WWindow::OnSize(Flags, NewX, NewY);

		RECT rect;
		::GetClientRect(hWnd, &rect);

		//if (ToolTipCtrl && ToolTipText.Len())
		//	ToolTipCtrl->AddTool(hWnd, ToolTipText, 0);
	}
//	virtual void OnDestroy();
	virtual void OnPaint()
	{
		PAINTSTRUCT PS;
		HDC hDC = BeginPaint(hWnd, &PS);
		HBRUSH brushBack = CreateSolidBrush(RGB(255, 255, 255));

		RECT rc;
		::GetClientRect(hWnd, &rc);

		FillRect(hDC, &rc, brushBack);

		HDC hdcMem;
		HBITMAP hbmOld;

		hdcMem = CreateCompatibleDC(hDC);
		hbmOld = (HBITMAP)SelectObject(hdcMem, (bOn ? hbmOn : hbmOff));

		RECT BmpPos = (bOn ? BmpOnPos : BmpOffPos);

		BitBlt(hDC,
			(rc.right - BmpPos.right) / 2, (rc.bottom - BmpPos.bottom) / 2,
			BmpPos.right, BmpPos.bottom,
			hdcMem,
			BmpPos.left, BmpPos.top,
			SRCCOPY);

		// Clean up.
		//
		SelectObject(hdcMem, hbmOld);
		DeleteDC(hdcMem);
		DeleteObject(brushBack);

		EndPaint(hWnd, &PS);
	}
//	virtual void OnLeftButtonDown();

	void SetUp(dnString InToolTipText, INT InID,
		INT InClientLeft, INT InClientTop, INT InClientRight, INT InClientBottom,
		HBITMAP InHbmOff, INT InBmpOffLeft, INT InBmpOffTop, INT InBmpOffRight, INT InBmpOffBottom,
		HBITMAP InHbmOn, INT InBmpOnLeft, INT InBmpOnTop, INT InBmpOnRight, INT InBmpOnBottom)
	{
		bHasBeenSetup = 1;

		//ToolTipText = InToolTipText;
		ID = InID;
		ClientPos.left = InClientLeft;
		ClientPos.top = InClientTop;
		ClientPos.right = InClientRight;
		ClientPos.bottom = InClientBottom;
		hbmOff = InHbmOff;
		BmpOffPos.left = InBmpOffLeft;
		BmpOffPos.top = InBmpOffTop;
		BmpOffPos.right = InBmpOffRight;
		BmpOffPos.bottom = InBmpOffBottom;
		hbmOn = InHbmOn;
		BmpOnPos.left = InBmpOnLeft;
		BmpOnPos.top = InBmpOnTop;
		BmpOnPos.right = InBmpOnRight;
		BmpOnPos.bottom = InBmpOnBottom;
	}
};


/*-----------------------------------------------------------------------------
	WLabel.
-----------------------------------------------------------------------------*/

// A non-interactive label control.
__declspec(dllimport) class WLabel : public WControl
{	
	DECLARE_WINDOWSUBCLASS(WLabel, WControl, Window)

	// Constructor.
	WLabel(WWindow* InOwner, INT InId = 0, WNDPROC InSuperProc = NULL)
		: WControl(InOwner, InId, InSuperProc ? InSuperProc : SuperProc)
	{}

	// WWindow interface.
	void OpenWindow(UBOOL Visible, UBOOL ClientEdge = 1, DWORD dwExtraStyle = 0)
	{
		PerformCreateWindowEx
		(
			(ClientEdge ? WS_EX_CLIENTEDGE : 0),
			NULL,
			WS_CHILD | (Visible ? WS_VISIBLE : 0) | dwExtraStyle,
			0, 0,
			0, 0,
			OwnerWindow->hWnd,
			(HMENU)ControlId,
			GetModuleHandle(NULL)
		);

		SendMessageW(hWnd, WM_SETFONT, (WPARAM)GetStockObject(DEFAULT_GUI_FONT), MAKELPARAM(0, 0));
	}
};

/*-----------------------------------------------------------------------------
	WCustomLabel.
-----------------------------------------------------------------------------*/

__declspec(dllimport) class WCustomLabel : public WLabel
{	
	DECLARE_WINDOWSUBCLASS(WCustomLabel, WLabel, Window)

	WCustomLabel(WWindow* InOwner, INT InId = 0, WNDPROC InSuperProc = NULL)
		: WLabel(InOwner, InId, InSuperProc ? InSuperProc : SuperProc)
	{}

	// WWindow interface.
	void OnPaint()
	{
		PAINTSTRUCT PS;
		HDC hDC = BeginPaint(hWnd, &PS);
		HBRUSH brushBack = CreateSolidBrush(RGB(128, 128, 128));

		FRect Rect = GetClientRect();
		FillRect(hDC, Rect, brushBack);

		HFONT OldFont = (HFONT)SelectObject(hDC, GetStockObject(DEFAULT_GUI_FONT));

		wchar_t *Caption = (wchar_t *)GetText().Data;
		::SetBkMode(hDC, TRANSPARENT);
		DrawTextW(hDC, Caption, wcslen(Caption), Rect, DT_CENTER | DT_SINGLELINE);

		SelectObject(hDC, OldFont);

		EndPaint(hWnd, &PS);

		DeleteObject(brushBack);
	}
};


/*-----------------------------------------------------------------------------
	WComboBox.
-----------------------------------------------------------------------------*/

// A combo box control.
__declspec(dllimport) class WComboBox : public WControl
{
	DECLARE_WINDOWSUBCLASS(WComboBox, WControl, Window)

	// Delegates.
	FDelegate DoubleClickDelegate;
	FDelegate DropDownDelegate;
	FDelegate CloseComboDelegate;
	FDelegate EditChangeDelegate;
	FDelegate EditUpdateDelegate;
	FDelegate SetFocusDelegate;
	FDelegate KillFocusDelegate;
	FDelegate SelectionChangeDelegate;
	FDelegate SelectionEndOkDelegate;
	FDelegate SelectionEndCancelDelegate;

	// Constructor.
	WComboBox(WWindow* InOwner, INT InId = 0, WNDPROC InSuperProc = NULL)
		: WControl(InOwner, InId, InSuperProc ? InSuperProc : SuperProc)
	{}

	// WWindow interface.
	void OpenWindow(UBOOL Visible, UBOOL Sort = FALSE, UINT InListType = CBS_DROPDOWNLIST)
	{
		PerformCreateWindowEx
		(
			0,
			NULL,
			WS_CHILD | WS_VSCROLL | InListType | (Sort ? CBS_SORT : 0) | (Visible ? WS_VISIBLE : 0),
			0, 0,
			64, 384,
			OwnerWindow->hWnd,
			(HMENU)ControlId,
			GetModuleHandle(NULL)
		);

		SendMessageW(hWnd, WM_SETFONT, (WPARAM)GetStockObject(DEFAULT_GUI_FONT), MAKELPARAM(0, 0));
	}
	virtual LONG WndProc(UINT Message, UINT wParam, LONG lParam)
	{
		if (Message == WM_KEYDOWN && (wParam == VK_UP || wParam == VK_DOWN))
		{
			// Suppress arrow keys.
//			if (Snoop)
//				Snoop->SnoopKeyDown(this, wParam);
			return 1;
		}
		else return WControl::WndProc(Message, wParam, lParam);
	}

	// WControl interface.
	UBOOL InterceptControlCommand(UINT Message, UINT wParam, LONG lParam)
	{
		if (HIWORD(wParam) == CBN_DBLCLK) { DoubleClickDelegate();        return 1; }
		else if (HIWORD(wParam) == CBN_DROPDOWN) { DropDownDelegate();           return 1; }
		else if (HIWORD(wParam) == CBN_CLOSEUP) { CloseComboDelegate();         return 1; }
		else if (HIWORD(wParam) == CBN_EDITCHANGE) { EditChangeDelegate();         return 1; }
		else if (HIWORD(wParam) == CBN_EDITUPDATE) { EditUpdateDelegate();         return 1; }
		else if (HIWORD(wParam) == CBN_SETFOCUS) { SetFocusDelegate();           return 1; }
		else if (HIWORD(wParam) == CBN_KILLFOCUS) { KillFocusDelegate();          return 1; }
		else if (HIWORD(wParam) == CBN_SELCHANGE) { SelectionChangeDelegate();    return 1; }
		else if (HIWORD(wParam) == CBN_SELENDOK) { SelectionEndOkDelegate();     return 1; }
		else if (HIWORD(wParam) == CBN_SELENDCANCEL) { SelectionEndCancelDelegate(); return 1; }
		else return 0;
	}

	// WComboBox interface.
	virtual void AddString(const TCHAR* Str)
	{
		SendMessageW(hWnd, CB_ADDSTRING, 0, (LPARAM)Str);
	}
	virtual dnString GetString(INT Index)
	{
		INT Length = SendMessageW(hWnd, CB_GETLBTEXTLEN, Index, 0);
		if (Length == CB_ERR)
			return TEXT("");

		TCHAR* Text = (TCHAR*)_alloca((Length + 1) * sizeof(TCHAR));
		SendMessage(hWnd, CB_GETLBTEXT, Index, (LPARAM)Text);
		return Text;
	}

	virtual TCHAR *GetString2(INT Index)
	{
		static TCHAR Text[2048];

		memset(Text, 0, sizeof(Text));

		INT Length = SendMessageW(hWnd, CB_GETLBTEXTLEN, Index, 0);
		if (Length == CB_ERR)
			return Text;

		//TCHAR* Text = (TCHAR*)malloc((Length + 1) * sizeof(TCHAR));		
		SendMessage(hWnd, CB_GETLBTEXT, Index, (LPARAM)Text);
		return Text;
	}
	virtual INT GetCount()
	{
		return SendMessageW(hWnd, CB_GETCOUNT, 0, 0);
	}
	virtual void SetCurrent(INT Index)
	{
		SendMessageW(hWnd, CB_SETCURSEL, Index, 0);
	}
	virtual INT GetCurrent()
	{
		return SendMessageW(hWnd, CB_GETCURSEL, 0, 0);
	}
	virtual INT FindString(const TCHAR* String)
	{
		INT Index = SendMessageW(hWnd, CB_FINDSTRING, -1, (LPARAM)String);
		return Index != CB_ERR ? Index : -1;
	}
	virtual INT FindStringExact(const TCHAR* String)
	{
		INT Index = SendMessageW(hWnd, CB_FINDSTRINGEXACT, -1, (LPARAM)String);
		return Index != CB_ERR ? Index : -1;
	}
	void Empty()
	{
		SendMessageW(hWnd, CB_RESETCONTENT, 0, 0);
	}
};


/*-----------------------------------------------------------------------------
	WTreeView.
-----------------------------------------------------------------------------*/

// A tree control
__declspec(dllimport) class WTreeView : public WControl
{
	//W_DECLARE_CLASS(WTreeView, WControl, CLASS_Transient);
	DECLARE_WINDOWSUBCLASS(WTreeView, WControl, Window)

	// Delegates.
	FDelegate ItemExpandingDelegate;
	FDelegate SelChangedDelegate;
	FDelegate DblClkDelegate;

	// Constructor.
	WTreeView(WWindow* InOwner, INT InId = 0, WNDPROC InSuperProc = NULL);

	// WWindow interface.
	void OpenWindow(UBOOL Visible, INT X, INT Y, INT XL, INT YL, DWORD dwExtraStyle = 0);
	void Empty(void);
	HTREEITEM AddItem(const TCHAR* pName, HTREEITEM hti, BOOL bHasChildren);
	virtual void OnRightButtonDown();
	UBOOL InterceptControlCommand(UINT Message, UINT wParam, LONG lParam);
};


/*-----------------------------------------------------------------------------
	WCheckBox.
-----------------------------------------------------------------------------*/

// A checkbox.
__declspec(dllimport) class WCheckBox : public WButton
{
	//W_DECLARE_CLASS(WCheckBox, WButton, CLASS_Transient);
	DECLARE_WINDOWSUBCLASS(WCheckBox, WButton, Window)

	UBOOL bAutocheck;
	int _overrideControlId;

	// Constructor.
	WCheckBox(WWindow* InOwner, INT InId = 0, FDelegate InClicked = FDelegate())
		: WButton(InOwner, InId, InClicked)
	{}

	// WWindow interface.
	void OpenWindow(UBOOL Visible, DWORD overrideControlId, INT X, INT Y, INT XL, INT YL, const TCHAR* Text, UBOOL InbAutocheck = 1, UBOOL bBitmap = 0, DWORD dwExtraStyle = 0)
	{		
		bAutocheck = InbAutocheck;
		PerformCreateWindowEx
		(
			0,
			NULL,
			WS_CHILD | BS_CHECKBOX | (bAutocheck ? BS_AUTOCHECKBOX : 0) | (bBitmap ? BS_BITMAP : 0) | dwExtraStyle,
			X, Y,
			XL, YL,
			OwnerWindow->hWnd,
			(HMENU)overrideControlId,
			GetModuleHandle(NULL)
		);
		_overrideControlId = overrideControlId;
		SetText(Text);
		SendMessageW(hWnd, WM_SETFONT, (WPARAM)GetStockObject(DEFAULT_GUI_FONT), MAKELPARAM(0, 0));
		if (Visible)
			ShowWindow(hWnd, SW_SHOWNOACTIVATE);
		bOwnerDraw = (dwExtraStyle & BS_OWNERDRAW);
	}
	void OnCreate()
	{
		WButton::OnCreate();
		bOwnerDraw = 0;
	}
	virtual void OnRightButtonDown()
	{
		// This is just a quick hack so the parent window can know when the user right clicks on
		// one of the buttons in the UnrealEd button bar.
		SendMessageW(::GetParent(hWnd), WM_COMMAND, WM_BB_RCLICK, _overrideControlId);
	}
	virtual void Clicked(void)
	{
		if (bAutocheck)
			bChecked = !bChecked;
		else
			bChecked = FALSE;
	}
};


/*-----------------------------------------------------------------------------
	WListBox.
-----------------------------------------------------------------------------*/

// A list box.
__declspec(dllimport) class WListBox : public WControl
{
	//W_DECLARE_CLASS(WListBox, WControl, CLASS_Transient);
	DECLARE_WINDOWSUBCLASS(WListBox, WControl, Window)

	// Delegates.
	FDelegate DoubleClickDelegate;
	FDelegate SelectionChangeDelegate;
	FDelegate SelectionCancelDelegate;
	FDelegate SetFocusDelegate;
	FDelegate KillFocusDelegate;

	BOOL m_bMultiSel;

	// Constructor.
	WListBox(WWindow* InOwner, INT InId = 0, WNDPROC InSuperProc = NULL)
		: WControl(InOwner, InId, InSuperProc ? InSuperProc : SuperProc)
	{
		//check(OwnerWindow);
		m_bMultiSel = FALSE;
	}

	// WWindow interface.
	void OpenWindow(UBOOL Visible, UBOOL Integral, UBOOL MultiSel, UBOOL OwnerDrawVariable, UBOOL Sort = 0, DWORD dwExtraStyle = 0)
	{
		m_bMultiSel = MultiSel;
		PerformCreateWindowEx
		(
			WS_EX_CLIENTEDGE,
			NULL,
			WS_CHILD | WS_BORDER | WS_VSCROLL | WS_CLIPCHILDREN | LBS_NOTIFY | (Visible ? WS_VISIBLE : 0) | (Integral ? 0 : LBS_NOINTEGRALHEIGHT)
			| (MultiSel ? (LBS_EXTENDEDSEL | LBS_MULTIPLESEL) : 0) | (OwnerDrawVariable ? LBS_OWNERDRAWVARIABLE : 0) | (Sort ? LBS_SORT : 0) | dwExtraStyle,
			0, 0,
			0, 0,
			OwnerWindow->hWnd,
			(HMENU)ControlId,
			GetModuleHandle(NULL)
		);

		SendMessageW(hWnd, WM_SETFONT, (WPARAM)GetStockObject(DEFAULT_GUI_FONT), MAKELPARAM(0, 0));
	}

	// WControl interface.
	UBOOL InterceptControlCommand(UINT Message, UINT wParam, LONG lParam)
	{
		if (HIWORD(wParam) == LBN_DBLCLK) { DoubleClickDelegate();     return 1; }
		else if (HIWORD(wParam) == LBN_SELCHANGE) { SelectionChangeDelegate(); return 1; }
		else if (HIWORD(wParam) == LBN_SELCANCEL) { SelectionCancelDelegate(); return 1; }
		else if (HIWORD(wParam) == LBN_SETFOCUS) { SetFocusDelegate();        return 1; }
		else if (HIWORD(wParam) == LBN_KILLFOCUS) { KillFocusDelegate();       return 1; }
		else return 0;
	}

	// WListBox interface.
	std::wstring GetString(INT Index)
	{
		INT Length = SendMessageW(hWnd, LB_GETTEXTLEN, Index, 0);

		{
			TCHAR* Ch = (TCHAR*)_alloca((Length + 1) * sizeof(TCHAR));
			SendMessageW(hWnd, LB_GETTEXT, Index, (LPARAM)Ch);
			Ch[Length] = 0;
			return Ch;
		}
	}
	void* GetItemData(INT Index)
	{
		return (void*)SendMessageW(hWnd, LB_GETITEMDATA, Index, 0);
	}
	void SetItemData(INT Index, void* Value)
	{
		SendMessageW(hWnd, LB_SETITEMDATA, Index, (LPARAM)Value);
	}
	void SetItemData(INT Index, INT Value)
	{
		SendMessageW(hWnd, LB_SETITEMDATA, Index, (LPARAM)Value);
	}
	INT GetCurrent()
	{
		return SendMessageW(hWnd, LB_GETCARETINDEX, 0, 0);
	}
	void ClearSel()
	{
		SendMessageW(hWnd, LB_SETSEL, FALSE, -1);
	}
	void SetCurrent(INT Index, UBOOL bScrollIntoView = 1)
	{
		if (m_bMultiSel)
		{
			ClearSel();
			SendMessageW(hWnd, LB_SETSEL, TRUE, Index);
			SendMessageW(hWnd, LB_SETCARETINDEX, Index, bScrollIntoView);
		}
		else
		{
			SendMessageW(hWnd, LB_SETCURSEL, Index, 0);
			SendMessageW(hWnd, LB_SETCARETINDEX, Index, bScrollIntoView);
		}
	}
	INT GetTop()
	{
		return SendMessageW(hWnd, LB_GETTOPINDEX, 0, 0);
	}
	void SetTop(INT Index)
	{
		SendMessageW(hWnd, LB_SETTOPINDEX, Index, 0);
	}
	void DeleteString(INT Index)
	{
		SendMessageW(hWnd, LB_DELETESTRING, Index, 0);
	}
	INT GetCount()
	{
		return SendMessageW(hWnd, LB_GETCOUNT, 0, 0);
	}
	INT GetItemHeight(INT Index)
	{
		return SendMessageW(hWnd, LB_GETITEMHEIGHT, Index, 0);
	}
	INT ItemFromPoint(FPoint P)
	{
		DWORD Result = SendMessageW(hWnd, LB_ITEMFROMPOINT, 0, MAKELPARAM(P.X, P.Y));
		return HIWORD(Result) ? -1 : LOWORD(Result);
	}
	FRect GetItemRect(INT Index)
	{
		RECT R; R.left = R.right = R.top = R.bottom = 0;
		SendMessageW(hWnd, LB_GETITEMRECT, Index, (LPARAM)&R);
		return R;
	}
	void Empty()
	{
		SendMessageW(hWnd, LB_RESETCONTENT, 0, 0);
	}
	UBOOL GetSelected(INT Index)
	{
		return SendMessageW(hWnd, LB_GETSEL, Index, 0);
	}
	INT GetSelectedItems(INT Count, INT* Buffer)
	{
		return SendMessageW(hWnd, LB_GETSELITEMS, (WPARAM)Count, (LPARAM)Buffer);
	}
	INT GetSelectedCount()
	{
		return SendMessageW(hWnd, LB_GETSELCOUNT, 0, 0);
	}

	void SetMultiSelection(int index, UBOOL value)
	{
		SendMessageW(hWnd, LB_SETSEL, value, index);
	}

	void InvertSelection()
	{
		int SelCount = GetSelectedCount();
		int TotalCount = GetCount();

		int* Buffer = NULL;

		if (SelCount)
		{
			Buffer = new int[SelCount];
		}

		for (int i = 0; i < TotalCount; i++)
		{
			UBOOL value = true;

			if (Buffer)
				for (int j = 0; j < SelCount; j++)
				{
					if (i == j)
					{
						value = false;
						break;
					}
				}

			SetMultiSelection(i, value);
		}

		if (Buffer) { delete[] Buffer; Buffer = NULL; }
	}

	// Accessing as strings.
	INT AddString(const TCHAR* C)
	{
		return SendMessageW(hWnd, LB_ADDSTRING, 0, (LPARAM)C);
	}
	void InsertString(INT Index, const TCHAR* C)
	{
		SendMessageW(hWnd, LB_INSERTSTRING, Index, (LPARAM)C);
	}
	INT FindStringExact(const TCHAR* C)
	{
		return SendMessageW(hWnd, LB_FINDSTRINGEXACT, -1, (LPARAM)C);
	}
	INT FindString(const TCHAR* C)
	{
		return SendMessageW(hWnd, LB_FINDSTRING, -1, (LPARAM)C);
	}
	INT FindStringChecked(const TCHAR* C)
	{
		INT Result = SendMessageW(hWnd, LB_FINDSTRING, -1, (LPARAM)C);
		return Result;
	}
	void InsertStringAfter(const TCHAR* Existing, const TCHAR* New)
	{
		InsertString(FindStringChecked(Existing) + 1, New);
	}

	// Accessing as pointers.
	INT AddItem(const void* C)
	{
		return SendMessageW(hWnd, LB_ADDSTRING, 0, (LPARAM)C);
	}
	void InsertItem(INT Index, const void* C)
	{
		SendMessageW(hWnd, LB_INSERTSTRING, Index, (LPARAM)C);
	}
	INT FindItem(const void* C)
	{
		return SendMessageW(hWnd, LB_FINDSTRING, -1, (LPARAM)C);
	}
	INT FindItemChecked(const void* C)
	{
		INT Result = SendMessageW(hWnd, LB_FINDSTRING, -1, (LPARAM)C);
		return Result;
	}
	void InsertItemAfter(const void* Existing, const void* New)
	{
		InsertItem(FindItemChecked(Existing) + 1, New);
	}
};

/*-----------------------------------------------------------------------------
	WCheckListBox.
-----------------------------------------------------------------------------*/

// A list box where each item has a checkbox beside it.
__declspec(dllimport) class WCheckListBox : public WListBox
{
	DECLARE_WINDOWSUBCLASS(WCheckListBox, WListBox, Window)

	HBITMAP hbmOff, hbmOn;
	int bOn;

	// Constructor.
	WCheckListBox(WWindow* InOwner, INT InId = 0, WNDPROC InSuperProc = NULL)
		: WListBox(InOwner, InId)
	{
		hbmOff = (HBITMAP)LoadImageA(GetModuleHandle(NULL), MAKEINTRESOURCEA(IDBM_CHECKBOX_OFF), IMAGE_BITMAP, 0, 0, LR_LOADMAP3DCOLORS);
		hbmOn = (HBITMAP)LoadImageA(GetModuleHandle(NULL), MAKEINTRESOURCEA(IDBM_CHECKBOX_ON), IMAGE_BITMAP, 0, 0, LR_LOADMAP3DCOLORS);
		bOn = 0;
	}

	// WWindow interface.
	void OpenWindow(UBOOL Visible, UBOOL Integral, UBOOL MultiSel, UBOOL Sort = FALSE, DWORD dwExtraStyle = 0)
	{
		m_bMultiSel = MultiSel;
		PerformCreateWindowEx
		(
			WS_EX_CLIENTEDGE,
			NULL,
			WS_CHILD | WS_BORDER | WS_VSCROLL | WS_CLIPCHILDREN | LBS_NOTIFY | (Visible ? WS_VISIBLE : 0) | (Integral ? 0 : LBS_NOINTEGRALHEIGHT)
			| (MultiSel ? (LBS_EXTENDEDSEL | LBS_MULTIPLESEL) : 0) | LBS_OWNERDRAWFIXED | LBS_HASSTRINGS | (Sort ? LBS_SORT : 0) | dwExtraStyle,
			0, 0,
			0, 0,
			OwnerWindow->hWnd,
			(HMENU)ControlId,
			GetModuleHandle(NULL)
		);

		SendMessageW(hWnd, WM_SETFONT, (WPARAM)GetStockObject(DEFAULT_GUI_FONT), MAKELPARAM(0, 0));
	}
	void OnDestroy()
	{
		WListBox::OnDestroy();
		DeleteObject(hbmOff);
		DeleteObject(hbmOn);
	}
	void OnDrawItem(DRAWITEMSTRUCT* Item)
	{
		if (((LONG)(Item->itemID) >= 0)
			&& (Item->itemAction & (ODA_DRAWENTIRE | ODA_SELECT)))
		{
			BOOL fDisabled = !IsWindowEnabled(hWnd);

			COLORREF newTextColor = fDisabled ? RGB(0x80, 0x80, 0x80) : GetSysColor(COLOR_WINDOWTEXT);  // light gray
			COLORREF oldTextColor = SetTextColor(Item->hDC, newTextColor);

			COLORREF newBkColor = GetSysColor(COLOR_WINDOW);
			COLORREF oldBkColor = SetBkColor(Item->hDC, newBkColor);

			if (newTextColor == newBkColor)
				newTextColor = RGB(0xC0, 0xC0, 0xC0);   // dark gray

			if (!fDisabled && ((Item->itemState & ODS_SELECTED) != 0))
			{
				SetTextColor(Item->hDC, GetSysColor(COLOR_HIGHLIGHTTEXT));
				SetBkColor(Item->hDC, GetSysColor(COLOR_HIGHLIGHT));
			}

			std::wstring strText = GetString(Item->itemID);
			ExtTextOutW(Item->hDC, Item->rcItem.left + 18,
				Item->rcItem.top + 2,
				ETO_OPAQUE, &(Item->rcItem), strText.c_str(), strText.size(), NULL);

			SetTextColor(Item->hDC, oldTextColor);
			SetBkColor(Item->hDC, oldBkColor);

			// BITMAP
			//
			HDC hdcMem = CreateCompatibleDC(Item->hDC);
			HBITMAP hbmOld = (HBITMAP)SelectObject(hdcMem, ((int)GetItemData(Item->itemID) ? hbmOn : hbmOff));

			BitBlt(Item->hDC,
				Item->rcItem.left + 2, Item->rcItem.top + 3,
				13, 13,
				hdcMem,
				0, 0,
				SRCCOPY);

			SelectObject(hdcMem, hbmOld);
			DeleteDC(hdcMem);
		}

		if ((Item->itemAction & ODA_FOCUS) != 0)
			DrawFocusRect(Item->hDC, &(Item->rcItem));
	}

	void InvertSelection()
	{
		int Count = GetCount();
		for (int i = 0; i < Count; i++)
		{
			int ItemData = (int)GetItemData(i);
			SetItemData(i, ItemData ^ true);
		}

		//check(OwnerWindow);
		PostMessageW(OwnerWindow->hWnd, WM_COMMAND, WM_WCLB_UPDATE_VISIBILITY, 0L);
		InvalidateRect(hWnd, NULL, FALSE);
	}
	void OnLeftButtonDown()
	{
		WListBox::OnLeftButtonDown();

		FPoint pt;
		::GetCursorPos((POINT*)pt);
		::ScreenToClient(hWnd, (POINT*)pt);

		if (pt.X <= 16)
		{
			int Item = ItemFromPoint(pt);
			int Data = (int)GetItemData(Item);
			Data = Data ? 0 : 1;
			SetItemData(Item, Data);
		}

		//check(OwnerWindow);
		PostMessageW(OwnerWindow->hWnd, WM_COMMAND, WM_WCLB_UPDATE_VISIBILITY, 0L);
		InvalidateRect(hWnd, NULL, FALSE);
	}
};

/*-----------------------------------------------------------------------------
	WTabControl.
-----------------------------------------------------------------------------*/

__declspec(dllimport) class WTabControl : public WControl
{
	//W_DECLARE_CLASS(WTabControl, WControl, CLASS_Transient)
	DECLARE_WINDOWSUBCLASS(WTabControl, WControl, Window)

	FDelegate SelectionChangeDelegate;

	// Constructor.
	WTabControl(WWindow* InOwner, INT InId = 0, WNDPROC InSuperProc = NULL)
		: WControl(InOwner, InId, InSuperProc ? InSuperProc : SuperProc)
	{}

	// WWindow interface.
	void OpenWindow(UBOOL Visible, DWORD dwExtraStyle = 0)
	{
		PerformCreateWindowEx
		(
			0,
			NULL,
			WS_CHILD | (Visible ? WS_VISIBLE : 0) | dwExtraStyle,
			0, 0,
			0, 0,
			OwnerWindow->hWnd,
			(HMENU)ControlId,
			GetModuleHandle(NULL)
		);

		SendMessageW(hWnd, WM_SETFONT, (WPARAM)GetStockObject(DEFAULT_GUI_FONT), MAKELPARAM(0, 0));
	}
	void AddTab(std::wstring InText, int InlParam)
	{
		TCHAR Text[256] = TEXT("");
		wcscpy(Text, InText.c_str());

		TCITEM tci;

		tci.mask = TCIF_TEXT | TCIF_PARAM;
		tci.pszText = Text;
		tci.lParam = InlParam;

		SendMessageW(hWnd, TCM_INSERTITEM, GetCount(), (LPARAM)(const LPTCITEM)&tci);
	}
	void Empty()
	{
		SendMessageW(hWnd, TCM_DELETEALLITEMS, 0, 0);
	}
	int GetCount()
	{
		return SendMessageW(hWnd, TCM_GETITEMCOUNT, 0, 0);
	}
	int SetCurrent(int Index)
	{
		return SendMessageW(hWnd, TCM_SETCURSEL, Index, 0);
	}
	int GetCurrent()
	{
		return SendMessageW(hWnd, TCM_GETCURFOCUS, 0, 0);
	}
	int GetIndexFromlParam(int InlParam)
	{
		TCITEM tci;
		tci.mask = TCIF_PARAM;

		for (int x = 0; x < GetCount(); x++)
		{
			SendMessageW(hWnd, TCM_GETITEM, x, (LPARAM)(LPTCITEM)&tci);
			if (tci.lParam == InlParam)
				return x;
		}

		return -1;
	}
	std::wstring GetString(int Index)
	{
		TCHAR Buffer[256] = TEXT("");

		TCITEM tci;
		tci.mask = TCIF_TEXT;
		tci.pszText = Buffer;

		SendMessageW(hWnd, TCM_GETITEM, Index, (LPARAM)(LPTCITEM)&tci);

		return std::wstring(Buffer);
	}
	int GetlParam(int Index)
	{
		TCITEM tci;
		tci.mask = TCIF_PARAM;

		SendMessageW(hWnd, TCM_GETITEM, Index, (LPARAM)(LPTCITEM)&tci);

		return tci.lParam;
	}
	UBOOL InterceptControlCommand(UINT Message, UINT wParam, LONG lParam)
	{
		LastwParam = wParam;
		LastlParam = lParam;

		NMHDR* pnmhdr = (LPNMHDR)lParam;

		if (pnmhdr->code == TCN_SELCHANGE)
			SelectionChangeDelegate();

		return 0;
	}
};


/*-----------------------------------------------------------------------------
	WDialog.
-----------------------------------------------------------------------------*/

// A dialog window, always based on a Visual C++ dialog template.
__declspec(dllimport) class WDialog : public WWindow
{	
	WDialog(const wchar_t* InPersistentName, INT InDialogId, WWindow* InOwnerWindow = NULL)
		: WWindow(InPersistentName, InOwnerWindow)
	{
		ControlId = InDialogId;
	}

	// WDialog interface.
	INT CallDefaultProc(UINT Message, UINT wParam, LONG lParam)
	{
		return 0;
	}
	virtual INT DoModal(HINSTANCE hInst = *hinstWindowHack)
	{
		_Windows.AddItem(this);
		INT Result = TCHAR_CALL_OS(DialogBoxParamW(hInst/*!!*/, MAKEINTRESOURCEW(ControlId), OwnerWindow ? OwnerWindow->hWnd : NULL, (INT(APIENTRY*)(HWND, UINT, WPARAM, LPARAM))StaticWndProc, (LPARAM)this), DialogBoxParamA(hInst/*!!*/, MAKEINTRESOURCEA(ControlId), OwnerWindow ? OwnerWindow->hWnd : NULL, (INT(APIENTRY*)(HWND, UINT, WPARAM, LPARAM))StaticWndProc, (LPARAM)this));
		return Result;
	}
	void OpenChildWindow(INT InControlId, UBOOL Visible)
	{
		_Windows.AddItem(this);
		HWND hWndParent = InControlId ? GetDlgItem(OwnerWindow->hWnd, InControlId) : OwnerWindow ? OwnerWindow->hWnd : NULL;
		HWND hWndCreated = TCHAR_CALL_OS(CreateDialogParamW(*hinstWindowHack/*!!*/, MAKEINTRESOURCEW(ControlId), hWndParent, (INT(APIENTRY*)(HWND, UINT, WPARAM, LPARAM))StaticWndProc, (LPARAM)this), CreateDialogParamA(*hinstWindowHack/*!!*/, MAKEINTRESOURCEA(ControlId), hWndParent, (INT(APIENTRY*)(HWND, UINT, WPARAM, LPARAM))StaticWndProc, (LPARAM)this));
		Show(Visible);
	}
	static BOOL CALLBACK LocalizeTextEnumProc(HWND hInWmd, LPARAM lParam)
	{
		dnString String;
		TCHAR** Temp = (TCHAR**)lParam;

		{
			TCHAR Ch[1024] = TEXT("");
			SendMessage(hInWmd, WM_GETTEXT, ARRAY_COUNT(Ch), (LPARAM)Ch);
			String = Ch;
		}
		if (dnString(String).Left(4) == TEXT("IDC_"))
			SendMessageW(hInWmd, WM_SETTEXT, 0, (LPARAM)LineFormat(*String));
		else if (String == TEXT("IDOK"))
			SendMessageW(hInWmd, WM_SETTEXT, 0, (LPARAM)TEXT("OK"));
		else if (String == TEXT("IDCANCEL"))
			SendMessageW(hInWmd, WM_SETTEXT, 0, (LPARAM)TEXT("CANCEL"));
		SendMessageW(hInWmd, WM_SETFONT, (WPARAM)GetStockObject(DEFAULT_GUI_FONT), MAKELPARAM(1, 0));
		return 1;
	}
	virtual void LocalizeText(const TCHAR* Section, const TCHAR* Package)
	{
		const TCHAR* Temp[3];
		Temp[0] = Section;
		Temp[1] = Package;
		Temp[2] = (TCHAR*)this;
		EnumChildWindows(hWnd, LocalizeTextEnumProc, (LPARAM)Temp);
		LocalizeTextEnumProc(hWnd, (LPARAM)Temp);
	}
	virtual void OnInitDialog()
	{
		WWindow::OnInitDialog();

		SendMessageX(hWnd, WM_SETFONT, (WPARAM)GetStockObject(DEFAULT_GUI_FONT), MAKELPARAM(1, 0));
		for (INT i = 0; i < Controls.Num(); i++)
		{
			// Bind all child controls.
			WControl* Control = Controls(i);
			//check(!Control->hWnd);
			Control->hWnd = GetDlgItem(hWnd, Control->ControlId);
			//check(Control->hWnd);
			_Windows.AddItem(Control);
			Control->WindowDefWndProc = (WNDPROC)GetWindowLongX(Control->hWnd, GWL_WNDPROC);
			SetWindowLongX(Control->hWnd, GWL_WNDPROC, (LONG)WWindow::StaticWndProc);
			//warning: Don't set GWL_HINSTANCE, it screws up subclassed edit controls in Win95.
		}
		for (int i = 0; i < Controls.Num(); i++)
		{
			// Send create to all controls.
			Controls(i)->OnCreate();
		}
		TCHAR Temp[256];
		wsprintf(Temp, TEXT("IDDIALOG_%s"), *PersistentName);
		LocalizeText(Temp, TEXT("DukeForever"));
	}
	void EndDialog(INT Result)
	{
		::EndDialog(hWnd, Result);
	}
	void EndDialogTrue()
	{
		EndDialog(1);
	}
	void EndDialogFalse()
	{
		EndDialog(0);
	}
};


/*-----------------------------------------------------------------------------
	WPropertyPage.

	A WPropertySheet has 1 or more of these on it.  Each tab
	represents one page.  A page uses a dialog box resource as it's
	template to determine where to place child controls.
-----------------------------------------------------------------------------*/

// This is a helper struct that is just used to store the window positions
// of the various controls this page contains.
struct WPropertyPageCtrl
{
	WPropertyPageCtrl(INT InId, RECT InRect, FString InCaption, LONG InStyle, LONG InExStyle)
	{
		id = InId;
		rect = InRect;
		Caption = InCaption;
		Style = InStyle;
		ExStyle = InExStyle;
	}

	INT id;
	RECT rect;
	FString Caption;
	LONG Style;
	LONG ExStyle;
};

__declspec(dllimport) class WPropertyPage : public WWindow
{
	DECLARE_WINDOWCLASS(WPropertyPage, WWindow, Window)

	TArray<WPropertyPageCtrl> Ctrls;
	TArray<WLabel*> Labels;
	FString Caption;
	INT id;

	// Structors.
	WPropertyPage(WWindow* InOwnerWindow)
		: WWindow(TEXT("WPropertyPage"), InOwnerWindow)
	{
	}

	// WWindow interface.
	virtual void OpenWindow(INT InDlgId, HMODULE InHMOD)
	{
		MdiChild = 0;

		id = InDlgId;

		PerformCreateWindowEx
		(
			0,
			NULL,
			WS_CHILD | WS_VISIBLE | WS_CLIPCHILDREN | WS_CLIPSIBLINGS,
			0, 0,
			0, 0,
			OwnerWindow ? OwnerWindow->hWnd : NULL,
			NULL,
			*hinstWindowHack
		);
		SendMessageX(hWnd, WM_SETFONT, (WPARAM)GetStockObject(DEFAULT_GUI_FONT), MAKELPARAM(0, 0));

		// Create an invisible dialog box from the specified resource id, and read the control
		// positions from it.  Put these positions into an array for future reference.
		char ResName[80] = "";
		HRSRC hrsrc = FindResourceW(InHMOD, VAPrintf(TEXT("#%d"), InDlgId).c_str(), (LPWSTR)RT_DIALOG);
		//check(hrsrc);

		HGLOBAL hgbl = LoadResource(InHMOD, hrsrc);
		//check(hgbl);

		DLGTEMPLATE* dlgtemplate = (DLGTEMPLATE*)LockResource(hgbl);
		//check(dlgtemplate);

		HWND hwndDlg = ::CreateDialogIndirectA(*hinstWindowHack, dlgtemplate, hWnd, NULL);
		//check(hwndDlg);	// Specified ID is NOT a valid dialog resource.

		char TempCaption[80] = "";
		GetWindowTextA(hwndDlg, TempCaption, 80);
		Caption = appFromAnsi(TempCaption);
		for (HWND ChildWnd = ::GetWindow(hwndDlg, GW_CHILD); ChildWnd; ChildWnd = ::GetNextWindow(ChildWnd, GW_HWNDNEXT))
		{
			RECT rect;
			::GetWindowRect(ChildWnd, &rect);
			::ScreenToClient(hwndDlg, (POINT*)&rect.left);
			::ScreenToClient(hwndDlg, (POINT*)&rect.right);

			INT id = GetDlgCtrlID(ChildWnd);

			::GetWindowTextA(ChildWnd, TempCaption, 80);
			LONG Style, ExStyle;
			Style = GetWindowLong(ChildWnd, GWL_STYLE);
			ExStyle = GetWindowLong(ChildWnd, GWL_EXSTYLE);
			new(Ctrls)WPropertyPageCtrl(id, rect, appFromAnsi(TempCaption), Style, ExStyle);
		}

		// Get the size of the dialog resource and use this as the default size of the property page.
		RECT rectDlg;
		::GetClientRect(hwndDlg, &rectDlg);
		::MoveWindow(hWnd, 0, 0, rectDlg.right, rectDlg.bottom, 1);

		UnlockResource(dlgtemplate);
	}
	// Places a control based on the position that it previously read from the dialog template
	void PlaceControl(WControl* InControl)
	{
		for (int x = 0; x < Ctrls.Num(); x++)
			if (Ctrls(x).id == InControl->ControlId)
			{
				::MoveWindow(InControl->hWnd, Ctrls(x).rect.left, Ctrls(x).rect.top, Ctrls(x).rect.right - Ctrls(x).rect.left, Ctrls(x).rect.bottom - Ctrls(x).rect.top, 1);
				InControl->SetText(*Ctrls(x).Caption);
				SetWindowLong(InControl->hWnd, GWL_STYLE, Ctrls(x).Style);
				SetWindowLong(InControl->hWnd, GWL_EXSTYLE, Ctrls(x).ExStyle);
				Ctrls.Remove(x);
				break;
			}
	}
	// Loops through the control list and for any controls that are left over, create static 
	// controls for them and place them.
	void Finalize()
	{
		for (int x = 0; x < Ctrls.Num(); x++)
		{
			WLabel* lbl = new WLabel(this, Ctrls(x).id);
			Labels.AddItem(lbl);
			lbl->OpenWindow(1, 0);
			RECT rect = Ctrls(x).rect;
			::MoveWindow(lbl->hWnd, rect.left, rect.top, rect.right - rect.left, rect.bottom - rect.top, 1);
			lbl->SetText(*Ctrls(x).Caption);
			SetWindowLong(lbl->hWnd, GWL_STYLE, Ctrls(x).Style);
			SetWindowLong(lbl->hWnd, GWL_EXSTYLE, Ctrls(x).ExStyle);
		}
	}
	void Cleanup()
	{
		for (int x = 0; x < Labels.Num(); x++)
		{
			DestroyWindow(Labels(x)->hWnd);
			delete Labels(x);
		}
	}	FString GetCaption()
	{
		return Caption;
	}
	INT GetID()
	{
		return id;
	}
	virtual void Refresh()
	{
	}
};


/*-----------------------------------------------------------------------------
	WEdit.
-----------------------------------------------------------------------------*/

// A single-line or multiline edit control.
__declspec(dllimport) class WEdit : public WControl
{
	//W_DECLARE_CLASS(WEdit, WControl, CLASS_Transient);
	DECLARE_WINDOWSUBCLASS(WEdit, WControl, Window)

	// Variables.
	FDelegate ChangeDelegate;

	// Constructor.
	WEdit(WWindow* InOwner, INT InId = 0, WNDPROC InSuperProc = NULL)
		: WControl(InOwner, InId, InSuperProc ? InSuperProc : SuperProc)
	{}

	// WWindow interface.
	void OpenWindow(UBOOL Visible, UBOOL Multiline, UBOOL ReadOnly, UBOOL HorizScroll = FALSE, UBOOL NoHideSel = FALSE)
	{
		PerformCreateWindowEx
		(
			WS_EX_CLIENTEDGE,
			NULL,
			WS_CHILD | (HorizScroll ? WS_HSCROLL : 0) | (Visible ? WS_VISIBLE : 0) | ES_LEFT | (Multiline ? (ES_MULTILINE | WS_VSCROLL) : 0) | ES_AUTOVSCROLL | ES_AUTOHSCROLL | (ReadOnly ? ES_READONLY : 0) | (NoHideSel ? ES_NOHIDESEL : 0),
			0, 0,
			0, 0,
			OwnerWindow->hWnd,
			(HMENU)ControlId,
			*hinstWindowHack
		);

		SendMessageW(hWnd, WM_SETFONT, (WPARAM)GetStockObject(DEFAULT_GUI_FONT), MAKELPARAM(0, 0));
	}
	UBOOL InterceptControlCommand(UINT Message, UINT wParam, LONG lParam)
	{
		if (HIWORD(wParam) == EN_CHANGE)
		{
			ChangeDelegate();
			return 1;
		}
		else return 0;
	}

	// WEdit interface.
	UBOOL GetReadOnly()
	{
	//	check(hWnd);
		return (GetWindowLongW(hWnd, GWL_STYLE) & ES_READONLY) != 0;
	}
	void SetReadOnly(UBOOL ReadOnly)
	{
		//check(hWnd);
		SendMessageW(hWnd, EM_SETREADONLY, ReadOnly, 0);
	}
	INT GetLineCount()
	{
		//check(hWnd);
		return SendMessageW(hWnd, EM_GETLINECOUNT, 0, 0);
	}
	INT GetLineIndex(INT Line)
	{
		//check(hWnd);
		return SendMessageW(hWnd, EM_LINEINDEX, Line, 0);
	}
	void GetSelection(INT& Start, INT& End)
	{
		//check(hWnd);
		SendMessageW(hWnd, EM_GETSEL, (WPARAM)&Start, (LPARAM)&End);
	}
	void SetSelection(INT Start, INT End)
	{
		//check(hWnd);
		SendMessageW(hWnd, EM_SETSEL, Start, End);
	}
	void SetSelectedText(const TCHAR* Text)
	{
		//check(hWnd);
		SendMessageW(hWnd, EM_REPLACESEL, 1, (LPARAM)Text);
	}
	UBOOL GetModify()
	{
		return SendMessageW(hWnd, EM_GETMODIFY, 0, 0) != 0;
	}
	void SetModify(UBOOL Modified)
	{
		SendMessageW(hWnd, EM_SETMODIFY, Modified, 0);
	}
	void ScrollCaret()
	{
		SendMessageW(hWnd, EM_SCROLLCARET, 0, 0);
	}
	virtual FString GetText()
	{
		FString Str;
		Str = WWindow::GetText();

		// If the string begins with an "=" sign, we will evaluate it as a mathematical expresssion
		if (Str.Left(1) == TEXT("="))
		{
			Str = Str.Mid(1);	// Strip off the "=" sign

			float Result;
			if (!Eval(Str, &Result))
				Result = 0;

			Str = VAPrintf(TEXT("%f"), Result).c_str();
		}

		return Str;
	}
	// Evaluate a numerical expression.
	// Returns 1 if ok, 0 if error.
	// Sets Result, or 0.0 if error.
	//
	// Operators and precedence: 1:+- 2:/% 3:* 4:^ 5:&|
	// Unary: -
	// Types: Numbers (0-9.), Hex ($0-$f)
	// Grouping: ( )
	//
	virtual UBOOL Eval(FString Str, float* pResult)
	{
		float Result;

		// Check for a matching number of brackets right up front.
		int Brackets = 0;
		for (int x = 0; x < Str.Len(); x++)
		{
			if (Str.Mid(x, 1) == TEXT("("))
				Brackets++;
			else
				if (Str.Mid(x, 1) == TEXT(")"))
					Brackets--;
		}
		if (Brackets != 0)
		{
	//		appMsgf(TEXT("Mismatched brackets."));
			Result = 0;
		}
		else
			if (!SubEval(&Str, &Result, 0))
			{
				//appMsgf(TEXT("Error in expression."));
				Result = 0;
			}

		*pResult = Result;

		return 1;
	}
	virtual UBOOL SubEval(FString* pStr, float* pResult, int Prec)
	{
		FString c;
		float V, W, N;

		V = W = N = 0.0f;

		c = GrabChar(pStr);

		if ((c >= TEXT("0") && c <= TEXT("9")) || c == TEXT(".")) // Number
		{
			V = 0;
			while (c >= TEXT("0") && c <= TEXT("9"))
			{
				V = V * 10 + Val(c);
				c = GrabChar(pStr);
			}
			if (c == TEXT("."))
			{
				N = 0.1f;
				c = GrabChar(pStr);
				while (c >= TEXT("0") && c <= TEXT("9"))
				{
					V = V + N * Val(c);
					N = N / 10.0f;
					c = GrabChar(pStr);
				}
			}
		}
		else if (c == TEXT("(")) // Opening parenthesis
		{
			if (!SubEval(pStr, &V, 0))
				return 0;
			c = GrabChar(pStr);
		}
		else if (c == TEXT("-")) // Negation
		{
			if (!SubEval(pStr, &V, 1000))
				return 0;
			V = -V;
			c = GrabChar(pStr);
		}
		else if (c == TEXT("+")) // Positive
		{
			if (!SubEval(pStr, &V, 1000))
				return 0;
			c = GrabChar(pStr);
		}
		else if (c == TEXT("@")) // Square root
		{
			if (!SubEval(pStr, &V, 1000))
				return 0;
			if (V < 0)
			{
				//appMsgf(TEXT("Can't take square root of negative number"));
				return 0;
			}
			else
				V = sqrt(V);
			c = GrabChar(pStr);
		}
		else // Error
		{
			//appMsgf(TEXT("No value recognized"));
			return 0;
		}
	PrecLoop:
		if (c == TEXT(""))
		{
			*pResult = V;
			return 1;
		}
#if 0
		else if (c == TEXT(")"))
		{
			*pStr = TEXT(")") + *pStr;
			*pResult = V;
			return 1;
		}
		else if (c == TEXT("+"))
		{
			if (Prec > 1)
			{
				*pResult = V;
				*pStr = c + *pStr;
				return 1;
			}
			else
				if (SubEval(pStr, &W, 2))
				{
					V = V + W;
					c = GrabChar(pStr);
					goto PrecLoop;
				}
		}
		else if (c == TEXT("-"))
		{
			if (Prec > 1)
			{
				*pResult = V;
				*pStr = c + *pStr;
				return 1;
			}
			else
				if (SubEval(pStr, &W, 2))
				{
					V = V - W;
					c = GrabChar(pStr);
					goto PrecLoop;
				}
		}
		else if (c == TEXT("/"))
		{
			if (Prec > 2)
			{
				*pResult = V;
				*pStr = c + *pStr;
				return 1;
			}
			else
				if (SubEval(pStr, &W, 3))
				{
					if (W == 0)
					{
					//	appMsgf(TEXT("Division by zero isn't allowed"));
						return 0;
					}
					else
					{
						V = V / W;
						c = GrabChar(pStr);
						goto PrecLoop;
					}
				}
		}
		else if (c == TEXT("%"))
		{
			if (Prec > 2)
			{
				*pResult = V;
				*pStr = c + *pStr;
				return 1;
			}
			else
				if (SubEval(pStr, &W, 3))
				{
					if (W == 0)
					{
					//	appMsgf(TEXT("Modulo zero isn't allowed"));
						return 0;
					}
					else
					{
						V = (int)V % (int)W;
						c = GrabChar(pStr);
						goto PrecLoop;
					}
				}
		}
		else if (c == TEXT("*"))
		{
			if (Prec > 3)
			{
				*pResult = V;
				*pStr = c + *pStr;
				return 1;
			}
			else
				if (SubEval(pStr, &W, 4))
				{
					V = V * W;
					c = GrabChar(pStr);
					goto PrecLoop;
				}
		}
		else
		{
			//appMsgf(TEXT("Unrecognized Operator"));
		}
#endif
		*pResult = V;
		return 1;
	}
	FString GrabChar(FString* pStr)
	{
		FString GrabChar;
		if (pStr->Len())
			do {
				GrabChar = pStr->Left(1);
				*pStr = pStr->Mid(1);
			} while (GrabChar == TEXT(" "));
		else
			GrabChar = TEXT("");

		return GrabChar;
	}
	// Converts a string to it's numeric equivalent, ignoring whitespace.
	// "123  45" - becomes 12,345
	FLOAT Val(FString Value)
	{
		FLOAT RetValue = 0;

		for (int x = 0; x < Value.Len(); x++)
		{
			FString Char = Value.Mid(x, 1);

			if (Char >= TEXT("0") && Char <= TEXT("9"))
			{
				RetValue *= 10;
				RetValue += _wtoi(*Char);
			}
			else
				if (Char != TEXT(" "))
					break;
		}

		return RetValue;
	}
};


/*-----------------------------------------------------------------------------
	WPropertySheet.
-----------------------------------------------------------------------------*/

#define WPS_TABS	19900
__declspec(dllimport) class WPropertySheet : public WControl
{
	//W_DECLARE_CLASS(WPropertySheet, WControl, CLASS_Transient)
	DECLARE_WINDOWSUBCLASS(WPropertySheet, WControl, Window)

	WTabControl* Tabs;
	TArray<WPropertyPage*> Pages;

	WPropertySheet(WWindow* InOwner, INT InId = 0, WNDPROC InSuperProc = NULL)
		: WControl(InOwner, InId, InSuperProc ? InSuperProc : SuperProc)
	{}

	// WWindow interface.
	void OpenWindow(UBOOL Visible, DWORD dwExtraStyle = 0)
	{
		PerformCreateWindowEx
		(
			0,
			NULL,
			WS_CHILD | (Visible ? WS_VISIBLE : 0) | dwExtraStyle,
			0, 0,
			0, 0,
			OwnerWindow->hWnd,
			(HMENU)ControlId,
			*hinstWindowHack
		);

		SendMessageW(hWnd, WM_SETFONT, (WPARAM)GetStockObject(DEFAULT_GUI_FONT), MAKELPARAM(0, 0));
	}
	void OnCreate()
	{
		WControl::OnCreate();

		Tabs = new WTabControl(this, WPS_TABS);
		Tabs->OpenWindow(1);
		Tabs->SelectionChangeDelegate = FDelegate(this, (TDelegate)&WPropertySheet::OnTabsSelChange);
	}
	void OnSize(DWORD Flags, INT NewX, INT NewY)
	{
		WControl::OnSize(Flags, NewX, NewY);

		RECT rect;
		::GetClientRect(hWnd, &rect);
		::MoveWindow(Tabs->hWnd, 4, 4, rect.right - 8, rect.bottom - 8, 1);

		RefreshPages();

		InvalidateRect(hWnd, NULL, 1);
	}
	void RefreshPages()
	{
		if (!Pages.Num()) return;

		INT idx = Tabs->GetCurrent();
		if (idx == -1)	idx = 0;
		//check(idx < Pages.Num());

		// Hide all pages.
		for (INT x = 0; x < Pages.Num(); x++)
		{
			if (x == idx)
				Pages(x)->Show(1);
			else
				Pages(x)->Show(0);
			Pages(x)->Refresh();
		}

		::SetWindowPos(Pages(idx)->hWnd, HWND_TOP, 8, 24, 0, 0, SWP_NOSIZE);
	}
	void Empty()
	{
		Tabs->Empty();
	}
	void AddPage(WPropertyPage* InPage)
	{
		Pages.AddItem(InPage);
		Tabs->AddTab(*InPage->GetCaption(), InPage->GetID());
	}
	int SetCurrent(int Index)
	{
		INT ret = Tabs->SetCurrent(Index);
		RefreshPages();
		return ret;
	}
	void OnTabsSelChange()
	{
		RefreshPages();
	}
};


/*-----------------------------------------------------------------------------
	WGroupBox.
-----------------------------------------------------------------------------*/

__declspec(dllimport) class WGroupBox : public WControl
{
	DECLARE_WINDOWSUBCLASS(WGroupBox, WControl, Window)

	// Constructor.
	WGroupBox(WWindow* InOwner, INT InId = 0, WNDPROC InSuperProc = NULL)
		: WControl(InOwner, InId, InSuperProc ? InSuperProc : SuperProc)
	{}

	// WWindow interface.
	void OpenWindow(UBOOL Visible, DWORD dwExtraStyle = 0)
	{
		PerformCreateWindowEx
		(
			0,
			NULL,
			BS_GROUPBOX | WS_CHILD | (Visible ? WS_VISIBLE : 0) | dwExtraStyle,
			0, 0,
			0, 0,
			OwnerWindow->hWnd,
			(HMENU)ControlId,
			*hinstWindowHack
		);

		SendMessageW(hWnd, WM_SETFONT, (WPARAM)GetStockObject(DEFAULT_GUI_FONT), MAKELPARAM(0, 0));
	}
};