#pragma once

class DukeSharpInterface {
public:
	void					LoadDll(void);
	HWND					Init(HWND backgroundHolderHwnd);

	void					ShowBrushScaleDialog() { ShowBrushScale(); }

	void					(__stdcall* EditorResize)(int width, int height);
	void					(__stdcall *ShowBrushProperties)(float x, float y, float z);

	void					(__stdcall* Tick)(float DeltaSeconds);
private:
	void					(__stdcall *InitBrowser)(void);
	HWND					(__stdcall *PostInit)(HWND);	

	void					(__stdcall*ShowBrushScale)(void);	

	HMODULE	handle;
};

extern DukeSharpInterface	dukeSharp;