#pragma once

class DukeSharpInterface {
public:
	void					LoadDll(void);
	void					Init(void);

	void					ShowBrushScaleDialog() { ShowBrushScale(); }

	void					(__stdcall *ShowBrushProperties)(float x, float y, float z);
private:
	void					(*InitBrowser)(void);
	void					(*PostInit)(void);

	void					(*ShowBrushScale)(void);

	HMODULE	handle;
};

extern DukeSharpInterface	dukeSharp;