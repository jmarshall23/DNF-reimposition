#pragma once

class DukeSharpInterface {
public:
	void					LoadDll(void);
	void					Init(void);

private:
	void					(*InitBrowser)(void);
	void					(*PostInit)(void);

	HMODULE	handle;
};

extern DukeSharpInterface	dukeSharp;