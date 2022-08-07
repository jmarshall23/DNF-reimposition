#pragma once

class DukeSharpInterface {
public:
	void					LoadDll(void);
	void					Init(void);

private:
	void					(*InitBrowser)(void);

	HMODULE	handle;
};

extern DukeSharpInterface	dukeSharp;