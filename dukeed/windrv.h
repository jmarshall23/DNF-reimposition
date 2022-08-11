#pragma once

class UWindowsViewport;

__declspec(dllimport) class UWindowsClient {
public:
	virtual ~UWindowsClient() { }

	virtual void StupidUnreal1(void) { }
	virtual void StupidUnreal2(void) { }
	virtual void StupidUnreal3(void) { }
	virtual void StupidUnreal4(void) { }
	virtual void StupidUnreal5(void) { }
	virtual void StupidUnreal6(void) { }
	virtual void Destroy(void);
	virtual void StupidUnreal7(void) { }
	virtual void StupidUnreal8(void) { }
	virtual void StupidUnreal9(void) { }
	virtual void StupidUnreal10(void) { }
	virtual void StupidUnreal11(void) { }
	virtual void StupidUnreal12(void) { }
	virtual void StupidUnreal13(void) { }
	virtual void ShutdownAfterError(void);
	virtual void StupidUnreal14(void) { }
	virtual void StupidUnreal15(void) { }
	virtual void StupidUnreal16(void) { }
	virtual void StupidUnreal17(void) { }
	virtual void StupidUnreal18(void) { }
	virtual void StupidUnreal19(void) { }
	virtual void StupidUnreal20(void) { }
	virtual void Init(UEditorEngine*);
	virtual void StupidUnreal21(void) { }
	virtual void StupidUnreal22(void) { }
	virtual void ShowViewportWindows(unsigned long, int);
	virtual void EnableViewportWindows(unsigned long, int);
	virtual void Tick(void);
	virtual void Exec(wchar_t const*, dnOutputDevice&);
	virtual UWindowsViewport* NewViewport(dnName);
	virtual void MakeCurrent(UViewport*);
};

enum EInputKey;
enum EInputAction;

__declspec(dllimport) class UInput {
public:
	virtual ~UInput() { }
	virtual void fuckUnreal5(void);
	virtual void fuckUnreal4(void);
	virtual void physMeqon(float);
	virtual void fuckUnreal3(void);
	virtual void Modify(void);
	virtual void PostLoad(void);
	virtual void Destroy(void);
	virtual void Serialize(dnArchive&);
	virtual void Wake(void);
	virtual void physMeqon1(float);
	virtual void fuckUnreal2(void);
	virtual void Wake2(void);
	virtual void Wake1(void);
	virtual void InitExecution(void);
	virtual void vtPad6(void);
	virtual void vtPad7(void);
	virtual void fuckUnreal1(void);
	virtual void Register(int);
	virtual void LanguageChange(void);
	virtual void PostEditChange(void*);
	virtual void RestoreFromUndo(void);
	virtual void Rename(wchar_t const*, UObject*);
	virtual void fuckUnreal7(void);
	virtual void Init(UViewport*);
	virtual void InitSpecialKeyBindings(void);
	virtual void PreProcess(EInputKey, EInputAction, float);
	virtual void Process(dnOutputDevice&, EInputKey, EInputAction, float);
	virtual void ReadInput(float, dnOutputDevice&);
	virtual void ResetInput(void);
	virtual void ClearInput(void);
	virtual void PauseGameInput(int);
	virtual void GetKeyName(EInputKey);
	virtual void FindKeyName(wchar_t const*, EInputKey&);
	virtual void FindButtonName(AActor*, wchar_t const*);
	virtual void FindAxisName(AActor*, wchar_t const*);
	virtual void ExecInputCommands(wchar_t const*, dnOutputDevice&);
};

extern UWindowsClient* GClient;
