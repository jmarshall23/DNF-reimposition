#pragma warning(disable : 4996)

#include <windows.h>
#include <stdio.h>
#include <stdint.h>
#include <assert.h>

#include "Unreal.h"
#include "unmsg.h"
#include "windowres.h"
#include "Window.h"
#include "windrv.h"

std::vector<class WWindow*> _windows;

void* wwindow_windowproc = nullptr;

BOOL			dumpTobrowserOut = false;

UEditorEngine* GEditor;
UWindowsClient* GClient;

void InitEditor(void);

bool skipLogging = false;
bool ignoreGLog = true;

void* globalLog = nullptr;

bool **GIsEditorImport = (bool **)0x10912634;
bool* GIsEditor = (bool*)*GIsEditorImport;

bool** GIsUCCImport = (bool**)0x109124E4;
bool* GIsUCC = (bool*)*GIsEditorImport;

HINSTANCE* hinstHack = NULL;
HINSTANCE* hinstWindowHack = NULL;

extern UViewport* globalInitViewport;

dnArray<UObject*>* UObject::GObjObjects;

void(__fastcall* URender_DrawActorActual)(void* _this, struct FSceneNode* a2, struct AActor* a3);
void __fastcall URender_DrawActor(void* _this, struct FSceneNode* a2, struct AActor* a3) {
	URender_DrawActorActual(_this, a2, a3);
}


int(__fastcall* UStaticMesh__DrawSectionsActual)(void* _this, void* edx, struct FSceneNode* node, class AActor*, int DrawMode, void* UMaterialEx, unsigned long unknown, struct FColor& color);
int __fastcall UStaticMesh__DrawSections(void* _this, void* edx, struct FSceneNode* node, class AActor* actor, int DrawMode, void* UMaterialEx, unsigned long unknown, struct FColor& color)
{
	try
	{

//		int ret = UStaticMesh__DrawSectionsActual(_this, edx, node, actor, DrawMode, UMaterialEx, unknown, color);

	//	return ret;

		return 0;
	}
	catch (...)
	{
		return 0;
	}

	return 0;
}


HWND  (WINAPI *CreateWindowExWActual)(
	DWORD dwExStyle,
	LPCWSTR lpClassName,
	LPCWSTR lpWindowName,
	DWORD dwStyle,
	int X,
	int Y,
	int nWidth,
	int nHeight,
	HWND hWndParent,
	HMENU hMenu,
	HINSTANCE hInstance,
	LPVOID lpParam);

HWND WINAPI CreateWindowExWHooked(
	DWORD dwExStyle,
	LPCWSTR lpClassName,
	LPCWSTR lpWindowName,
	DWORD dwStyle,
	int X,
	int Y,
	int nWidth,
	int nHeight,
	HWND hWndParent,
	HMENU hMenu,
	HINSTANCE hInstance,
	LPVOID lpParam) {
	HWND hwnd = CreateWindowExWActual(dwExStyle, lpClassName, lpWindowName, dwStyle, X, Y, nWidth, nHeight, hWndParent, hMenu, hInstance, lpParam);
	return hwnd;
}

UBOOL(__fastcall *AActor__IsDrawFilteredActual)(void* actor, void* edx, void* viewport);

UBOOL __fastcall AActor__IsDrawFiltered(void* actor, void* edx, void* viewport)
{
	return false;
}

UBOOL(__fastcall* dnRenderer__IsActorHiddenActual)(void* __this, void * edx, struct AActor* a2, struct UViewport* a3);
UBOOL __fastcall dnRenderer__IsActorHidden (void* __this, void* edx, struct AActor* a2, struct UViewport* a3)
{
	return false;
}



void (*Editor_UpdateAudioActual)(int unknown, int* unknown2);
void Editor_UpdateAudio(int unknown, int* unknown2)
{
	// Running this causes a crash, so for now the editor doesn't have audio.
}

void (__fastcall *UClient_InitActual)(UWindowsClient* _this, void* edx, UEditorEngine* engine);
void __fastcall UClient_Init(UWindowsClient* _this, void *unknown, UEditorEngine* engine) {
	GClient = (UWindowsClient * )_this;
	UClient_InitActual(_this, unknown, engine);
}

INT_PTR StaticWndProc(HWND hWnd, UINT Msg, WPARAM wParam, LPARAM lParam) {
	return DefWindowProcW(hWnd, Msg, wParam, lParam);
}

ATOM (WINAPI *RegisterClassExWActual) (
	const WNDCLASSEXW* unnamedParam1
);

ATOM WINAPI RegisterClassExWHooked(
	const WNDCLASSEXW* unnamedParam1
) {

	WNDCLASSEXW wc = *unnamedParam1;

	ATOM r = RegisterClassExWActual(&wc);
	return r;
}



void(__fastcall* Uobject__LoadConfigActual)(void* _this, void* edx, int propagate, void* Class, const wchar_t* filename);
void Uobject__LoadConfig(void* _this, void* edx, int propagate, void* Class, const wchar_t* filename) {
	Uobject__LoadConfigActual(_this, edx, propagate, Class, filename);
}

void* (__fastcall* UObject__GetOuter)(void* _this, void* edx);

void* (*UObject__LoadPackage)(class UObject* InOuter, const TCHAR* Filename, DWORD LoadFlags);


void* (*UObject__MakeUniqueObjectName)(void* cls, void *cls2);
void* (*Uobject__GetTrasnientPackage)(void);

void (*UObject__SetLanguage)(const wchar_t* lang, int);

int (*DNFHackEntryEngine)(int unknown);

void* (*InitEngineActual)(DWORD splashID);

bool (*drm_initactual)(void);
bool drm_init(void) {
	MessageBoxA(nullptr, "fuck2", "fuck2", 0);
	
	drm_initactual();

	MessageBoxA(nullptr, "fuck", "fuck", 0);

	return true;
}

void (*appSaveStringToFileActual)(void* dnStringData, wchar_t* fileName, void* dnFileMgr);
void appSaveStringToFile(void* dnStringData, wchar_t* fileName, void* dnFileMgr)
{
	appSaveStringToFileActual(dnStringData, fileName, dnFileMgr);
}

//appInit(wchar_t const*, wchar_t const*, FMalloc*, dnOutputDevice*, dnOutputDeviceError*, dnFeedbackContext*, dnFileMgr*, dnConfigCache* (*)(void)).text	1003B420	0000086E	00000240	00000020	R	.	.	..B	T	.
void (*appInitActual)(const TCHAR* package, const TCHAR* commandLine, void* FMalloc, void* dnOutputDevice, void* dnOutputDeviceError, void* dnFeedbackContext, void* dnFileMgr, void* (*config)());
void  appInit(const TCHAR* package, const TCHAR* commandLine, void *FMalloc, void* dnOutputDevice, void* dnOutputDeviceError, void* dnFeedbackContext, void* dnFileMgr, void* (*config)())
{	
	//*GIsUCC = true;
	appInitActual(package, commandLine, FMalloc, dnOutputDevice, dnOutputDeviceError, dnFeedbackContext, dnFileMgr, config);
	//UObject__SetLanguage(TEXT("int"), 1);
	*GIsEditor = true;

	MessageBoxA(nullptr, "fuck", "fuck", 0);
}

void* (*ULevel__StaticClass)(void);
void* (*UExporter__StaticClass)(void);
void *(*UCommandlet__StaticClass)(void);
void* (*UObject__StaticLoadClass)(void* cls, void* uboject, const wchar_t *name, const wchar_t *name2, ULONG flags, void* packageMap);


class UBatchExportCommandlet
{
public:
	virtual ~UBatchExportCommandlet() = 0;

	virtual void ProcessEvent(void*, void*, void*) = 0;
	virtual void ProcessDelegate(class dnName, struct FScriptDelegate*, void*, void*);
	virtual void ProcessState(float);
	virtual void ProcessRemoteFunction(class UFunction*, void*, struct FFrame) = 0;
	virtual void Modify(void) = 0;
	virtual void PostLoad(void) = 0;
	virtual void Destroy(void) = 0;
	virtual void Serialize(class dnArchive&) = 0;
	virtual void SupportsUserText(void) = 0;
	virtual void ExportUserText(class dnOutputDevice&) = 0;
	virtual void ImportUserText(wchar_t const*&, wchar_t const*) = 0;
	virtual void IsPendingKill(void) = 0;
	virtual void IsGory(void) = 0;
	virtual void InitExecution(void) = 0;
	virtual void ShutdownAfterError(void) = 0;
	virtual void EnterSafeMode(void) = 0;
	virtual void ScriptConsoleExec(wchar_t const*, class dnOutputDevice&, class UObject*) = 0;
	virtual void Register(int) = 0;
	virtual void LanguageChange(void) = 0;
	virtual void PostEditChange(class UProperty*) = 0;
	virtual void RestoreFromUndo(void) = 0;
	virtual void Rename(wchar_t const*, class UObject*) = 0;
	virtual void sub_10017CA0(const TCHAR *Params) = 0;


};



__declspec(dllimport) class dnFeedbackContext {
};

__declspec(dllimport) class ULevelExporterT3D
{
public:
	virtual ~ULevelExporterT3D() { }

	virtual void ProcessEvent(UFunction*, void*, void*);
	virtual void ProcessDelegate(dnName, FScriptDelegate*, void*, void*);
	virtual void ProcessState(float);
	virtual void ProcessRemoteFunction(UFunction*, void*, FFrame*);
	virtual void Modify(void);
	virtual void PostLoad(void);
	virtual void Destroy(void);
	virtual void Serialize(dnArchive&);
	virtual void SupportsUserText(void);
	virtual void ExportUserText(dnOutputDevice&);
	virtual void ImportUserText(wchar_t const*&, wchar_t const*);
	virtual void IsPendingKill(void);
	virtual bool IsGory(void);
	virtual void InitExecution(void);
	virtual void ShutdownAfterError(void);
	virtual void EnterSafeMode(void);
	virtual void ScriptConsoleExec(wchar_t const*, dnOutputDevice&, UObject*);
	virtual void Register(int);
	virtual void LanguageChange(void);
	virtual void PostEditChange(UProperty*);
	virtual void RestoreFromUndo(void);
	virtual void Rename(wchar_t const*, UObject*);
	virtual UBOOL ExportText(UObject* object, const TCHAR* String1, dnOutputDevice &dnOutputDevice, dnFeedbackContext* context);
};






void* (*Uobject__StaticConstructObject)(UClass* cls, UObject* outer, dnName* name, DWORD SetFlags, UObject* unknown, dnOutputDevice* outpoutDevice, UObject* unknown2);

BOOL(*FindPackageActual)(wchar_t* fileName);

BOOL FindPackage(wchar_t* fileName) {

	*GIsEditor = false;
	BOOL r = FindPackageActual(fileName);
	*GIsEditor = true;
	return r;
}

void* InitEngineHooked(DWORD splashID) {
	UObject* obj;

	*GIsEditor = true;

	//MessageBoxA(nullptr, "Fuck 1", "Fuck 1", 0);	

	GEditor = (UEditorEngine *)InitEngineActual(splashID);

	InitEditor();
	skipLogging = true;
	GEditor->exec.Exec(TEXT("MODE MAPEXT=.DNF"), (dnOutputDevice &)globalLog);

	GEditor->exec.Exec(TEXT("MAP NEW"), (dnOutputDevice&)globalLog);

	r_ShowPortals = 1;
	//r_AllowAlwaysVisible = 1;
	
	//GEditor->exec.Exec(TEXT("CLASS SPEW ALL"), (dnOutputDevice&)globalLog);	
	//GEditor->exec.Exec(TEXT("MAP LOAD FILE=\"..\\MAPS\\MAP01.dnf\""), (dnOutputDevice&)globalLog);
	//GEditor->exec.Exec(TEXT("MAP SAVE FILE=\"..\\MAPS\\MAP00_TEST.dnf\""), (dnOutputDevice&)globalLog);
	//GEditor->exec.Exec(TEXT("MAP EXPORT FILE=\"..\\MAPS\\DM-Casino.T3D\""), (dnOutputDevice&)globalLog);
	skipLogging = false;
	return GEditor;
}

void (*SetGlobalExecHookActual) (void);
void SetGlobalExecHook(void) {

}

void (*dnInitAssertMgrActual)(void* func1, void* func2);
void dnInitAssertMgr(void* func1, void* func2)
{

}

void (*SetCrashHandlerFilterActual)(void* dontcare);
void SetCrashHandlerFilter(void* dontcare)
{

}

double DNFHackTimer(void)
{
	static bool help = false;

	if (!help)
	{
		//MH_CreateHook(initEnginePtr, InitEngineHooked, (LPVOID*)&InitEngineActual);

		if (MH_CreateHookApi(TEXT("engine.dll"), MAKEINTRESOURCEA(8420), InitEngineHooked, (LPVOID*)&InitEngineActual) != MH_OK)
			assert(!"fuck");
		if (MH_CreateHookApi(TEXT("engine.dll"), MAKEINTRESOURCEA(12585), FindPackage, (LPVOID*)&FindPackageActual) != MH_OK)
			assert(!"fuck");
		MH_EnableHook(MH_ALL_HOOKS);
		
		help = true;
	}

	return 0;
}

// We have no idea that this function is in DNF, but we dont care either. 
void DNFHackEntry(void)
{
	int LoadFlags = 0;

#if 0
	MessageBoxA(nullptr, "nasty", "waiting for you", 0);

	while (true)
	{
		static bool fuckme = false;

		if (fuckme)
		{
			if (!UObject__LoadPackage(nullptr, TEXT("Engine"), 2u))
			{
				assert(!"fuck");
			}
#if 0
			void* commandletClsType = UCommandlet__StaticClass();
			UClass* Class = (UClass*)UObject__StaticLoadClass(commandletClsType, NULL, TEXT("Editor.BatchExportCommandlet"), NULL, LoadFlags, NULL);

			UObject* transient = (UObject*)Uobject__GetTrasnientPackage();

			dnName name(TEXT("NoIdeda"), (EFindName)0);

			UBatchExportCommandlet* Commandlet = (UBatchExportCommandlet*)Uobject__StaticConstructObject(Class, transient, &name, 0, nullptr, (dnOutputDevice*)globalLog, nullptr); //ConstructObject<UCommandlet>(Class);
			Commandlet->sub_10017CA0(TEXT("engine.u class uc ..\\Engine\\Classes"));
#endif
			void* commandletClsType = (UClass*)UExporter__StaticClass();
			UClass* Class = (UClass*)UObject__StaticLoadClass(commandletClsType, NULL, TEXT("Editor.LevelExporterT3D"), NULL, LoadFlags, NULL);
			UObject* transient = (UObject*)Uobject__GetTrasnientPackage();
			dnName name(TEXT("NoIdeda"), (EFindName)0);
			UExporter* exporter = (UExporter*)Uobject__StaticConstructObject(Class, transient, &name, 0, nullptr, (dnOutputDevice*)globalLog, nullptr); //ConstructObject<UCommandlet>(Class);
			//UObject* level_outer = (UObject*)UObject__GetOuter(ptr->level, nullptr);

			//UObject__LoadPackage(level_outer, TEXT("..\\MAPS\\MAP00.DNF"), 0x0020);
		}

		Sleep(1);
	}
#endif
//	return DNFHackEntryEngine(unknown);
}

void (__fastcall *dnfOutput)(void* log, wchar_t* str, ...);
void __fastcall ReroutedOutput(void *log, wchar_t* str, ...)
{
	wchar_t buffer[512];

	if (skipLogging)
		return;

	va_list args;
	va_start(args, str);
	vswprintf(buffer, str, args);
	va_end(args);

	globalLog = log;

	dnfOutput(log, buffer);

	if (dumpTobrowserOut)
	{
		GetPropResult.str += buffer;
		return;
	}

	OutputDebugStringW(buffer);
	OutputDebugStringA("\n");

	wprintf(buffer);
	wprintf(TEXT("\n"));
}

void (*dnfOutput3)(void* log, char* str, ...);
void ReroutedOutput3(void* log, char* str, ...)
{
	char buffer[512];

	if (skipLogging)
		return;

	va_list args;
	va_start(args, str);
	vsprintf(buffer, str, args);
	va_end(args);

	globalLog = log;

	OutputDebugStringA(buffer);
	OutputDebugStringA("\n");

	printf("%s\n", buffer);
}

void (__fastcall *dnfOutput4)(void* log, char* str);
void __fastcall ReroutedOutput4(void* log, void *edx, char* str)
{
	if (skipLogging)
		return;

	if (dumpTobrowserOut)
	{
		int len = strlen(str);

		for(int i = 0; i < len; i++)
			GetPropResult.str += (wchar_t)str[i];
		return;
	}

	OutputDebugStringA(str);
	OutputDebugStringA("\n");

	printf("%s\n", str);
}

void (*dnfOutput5)(void* log, wchar_t* str);
void ReroutedOutput5(void* log, wchar_t* str)
{
	if (skipLogging)
		return;

	OutputDebugStringW(str);
	OutputDebugStringA("\n");

	wprintf(str);
	wprintf(TEXT("\n"));
}

void (__fastcall *dnfOutput2)(int type, wchar_t* str, ...);
void __fastcall ReroutedOutput2(int type, wchar_t* str, ...)
{
	if (skipLogging)
		return;
#if 0
	wchar_t buffer[512];

	va_list args;
	va_start(args, str);
	vswprintf(buffer, str, args);
	va_end(args);

	globalLog = log;

	OutputDebugStringW(buffer);
	OutputDebugStringA("\n");
#endif
	//wprintf(buffer);
	wprintf(TEXT("\n"));

}

void (*dnfOutput6)(void* log, int type, char* str, ...);
void ReroutedOutput6(void* log, int type, char* str, ...)
{
	if (skipLogging)
		return;

	char buffer[512];

	va_list args;
	va_start(args, str);
	vsprintf(buffer, str, args);
	va_end(args);

	globalLog = log;

	OutputDebugStringA(buffer);
	OutputDebugStringA("\n");
	printf("%s\n", buffer);
}

void CatchGearboxFunkyCode()
{
	MessageBoxA(nullptr, "fucked up exit", "fuck up exit", 0);
}

LONG WINAPI OurCrashHandler(EXCEPTION_POINTERS* /*ExceptionInfo*/)
{
	return EXCEPTION_EXECUTE_HANDLER;
}

void SetBeingDebuggedFlag(bool value)
{
#ifdef _WIN64
	auto peb = (uint8_t*)__readgsqword(0x60);   //Read x64 PEB
	*(uint8_t*)(peb + 2) = value;               //Set BeingDebugged
#else
	auto peb = (uint8_t*)__readfsdword(0x30);   //Read x86 PEB
	*(uint8_t*)(peb + 2) = value;               //Set BeingDebugged
#endif
}

void InitMeshDriver(void);

#include <cstdlib>
void InitDNFHooks()
{
	MH_Initialize();
	//
	std::atexit(CatchGearboxFunkyCode);
	//::SetUnhandledExceptionFilter(OurCrashHandler);
	//
	//SetBeingDebuggedFlag(false);

	void* function = (LPVOID)0x10901BF0;
	MH_CreateHook(function, DNFHackEntry, (LPVOID*)&DNFHackEntryEngine);
	MH_EnableHook(function);

	void* function2 = (LPVOID)0x10901C10;
	MH_CreateHook(function2, DNFHackTimer, (LPVOID*)&DNFHackEntryEngine);
	MH_EnableHook(function2);


	HINSTANCE hinst = LoadLibraryA("dncommon.dll");

	void* dnOutputArgList = GetProcAddress(hinst, MAKEINTRESOURCEA(971));
	{
		MH_CreateHook(dnOutputArgList, ReroutedOutput, (LPVOID*)&dnfOutput);
		MH_EnableHook(dnOutputArgList);
	}

	void *dnOutputArgList2 = GetProcAddress(hinst, MAKEINTRESOURCEA(966));
	{
		MH_CreateHook(dnOutputArgList2, ReroutedOutput2, (LPVOID*)&dnfOutput2);
		MH_EnableHook(dnOutputArgList2);
	}
#if 0
	void* dnOutputArgList6 = GetProcAddress(hinst, MAKEINTRESOURCEA(972));
	{
		MH_CreateHook(dnOutputArgList6, ReroutedOutput2, (LPVOID*)&dnfOutput2);
		MH_EnableHook(dnOutputArgList6);
	}
		
	void* dnOutputArgList3 = GetProcAddress(hinst, MAKEINTRESOURCEA(970));
	{
		MH_CreateHook(dnOutputArgList3, ReroutedOutput3, (LPVOID*)&dnfOutput3);
		MH_EnableHook(dnOutputArgList3);
	}

	void* dnOutputArgList4 = GetProcAddress(hinst, MAKEINTRESOURCEA(962));
	{
		MH_CreateHook(dnOutputArgList4, ReroutedOutput4, (LPVOID*)&dnfOutput4);
		MH_EnableHook(dnOutputArgList4);
	}
	
	void* dnOutputArgList5 = GetProcAddress(hinst, MAKEINTRESOURCEA(963));
	{
		MH_CreateHook(dnOutputArgList5, ReroutedOutput4, (LPVOID*)&dnfOutput4);
		MH_EnableHook(dnOutputArgList5);
	}
#endif	
	{
		MH_CreateHook(&CreateWindowExW, CreateWindowExWHooked, (LPVOID*)&CreateWindowExWActual);
		MH_EnableHook(&CreateWindowExW);
	}
	////
	{
		MH_CreateHook(&RegisterClassExW, RegisterClassExWHooked, (LPVOID*)&RegisterClassExWActual);
		MH_EnableHook(&RegisterClassExW);
	}
	
	//void* dnInitAssertMtrPtr = GetProcAddress(hinst, MAKEINTRESOURCEA(1509));
	//{
	//	MH_CreateHook(dnInitAssertMtrPtr, dnInitAssertMgr, (LPVOID*)&dnInitAssertMgrActual);
	//	MH_EnableHook(dnInitAssertMtrPtr);
	//}
	//
	//HINSTANCE bughandler = LoadLibraryA("BugHandler.dll");
	//void* SetCrashHandlerFilterPtr = GetProcAddress(bughandler, MAKEINTRESOURCEA(30));
	//{
	//	MH_CreateHook(SetCrashHandlerFilterPtr, SetCrashHandlerFilter, (LPVOID*)&SetCrashHandlerFilterActual);
	//	MH_EnableHook(SetCrashHandlerFilterPtr);
	//}

	HINSTANCE engine = LoadLibraryA("engine.dll");

	//UInput_Init = (void(__fastcall*)(void*, void*, UViewport*))GetProcAddress(engine, MAKEINTRESOURCEA(8396));
	//void* UInputResetPtr = GetProcAddress(engine, MAKEINTRESOURCEA(10474));
	//{
	//	MH_CreateHook(UInputResetPtr, UInput_ResetInput, (LPVOID*)&UInput_ResetInputActual);
	//	MH_EnableHook(UInputResetPtr);
	//}

	//void* stupidFunction = engine + 0x374740;


	//void* DrawActorPtr = GetProcAddress(engine, MAKEINTRESOURCEA(5827));
	//{
	//	MH_CreateHook(DrawActorPtr, URender_DrawActor, (LPVOID*)&URender_DrawActorActual);
	//	MH_EnableHook(DrawActorPtr);
	//}



	void* DrawSectionsPtr = GetProcAddress(engine, MAKEINTRESOURCEA(5907));
	{
		MH_CreateHook(DrawSectionsPtr, UStaticMesh__DrawSections, (LPVOID*)&UStaticMesh__DrawSectionsActual);
		MH_EnableHook(DrawSectionsPtr);
	}

	void* isActorHiddenPtr = GetProcAddress(engine, MAKEINTRESOURCEA(8823));
	{	
		MH_CreateHook(isActorHiddenPtr, dnRenderer__IsActorHidden, (LPVOID*)&dnRenderer__IsActorHiddenActual);
		MH_EnableHook(isActorHiddenPtr);
	}
		

	void* uclientInitPtr = GetProcAddress(engine, MAKEINTRESOURCEA(8391));
	{
		MH_CreateHook(uclientInitPtr, UClient_Init, (LPVOID*)&UClient_InitActual);
		MH_EnableHook(uclientInitPtr);		
	}

	void* isFilteredPtr = GetProcAddress(engine, MAKEINTRESOURCEA(8848));
	{
		MH_CreateHook(isFilteredPtr, AActor__IsDrawFiltered, (LPVOID*)&AActor__IsDrawFilteredActual);
		MH_EnableHook(isFilteredPtr);
	}

	wwindow_windowproc = GetProcAddress(engine, MAKEINTRESOURCEA(11848));
	//{
	//	MH_CreateHook(StaticWndProcActualPtr, WWindow::StaticWndProc, (LPVOID*)&StaticWndProcActual);
	//	MH_EnableHook(StaticWndProcActualPtr);
	//}

	//
	//void* initEnginePtr = GetProcAddress(engine, MAKEINTRESOURCEA(8420));

	//void* appInitPtr = GetProcAddress(engine, MAKEINTRESOURCEA(12325));
	//{
	//	MH_CreateHook(appInitPtr, appInit, (LPVOID*)&appInitActual);
	//	MH_EnableHook(appInitPtr);		
	//}

	//void* drm_init_ptr = GetProcAddress(engine, MAKEINTRESOURCEA(8446));
	//{
	//	MH_CreateHook(drm_init_ptr, drm_init, (LPVOID*)&drm_initactual);
	//	MH_EnableHook(drm_init_ptr);
	//}
	//
	//void* appSavePtr = GetProcAddress(engine, MAKEINTRESOURCEA(12346));
	//{
	//	MH_CreateHook(appSavePtr, appSaveStringToFile, (LPVOID*)&appSaveStringToFileActual);
	//	MH_EnableHook(appSavePtr);
	//}

//	static void* LoadConfigPtr = GetProcAddress(engine, MAKEINTRESOURCEA(9044));
	//{
	//	MH_CreateHook(LoadConfigPtr, Uobject__LoadConfig, (LPVOID*)&Uobject__LoadConfigActual);
	//	MH_EnableHook(LoadConfigPtr);
	//}

	

//	UObject__SetLanguage = (void(__cdecl*)(const wchar_t*, int))GetProcAddress(engine, MAKEINTRESOURCEA(10876));
//
	HINSTANCE editor = LoadLibraryA("editor.dll");

	static void* updateAudioPtr = GetProcAddress(editor, MAKEINTRESOURCEA(1021));
	{
		MH_CreateHook(updateAudioPtr, Editor_UpdateAudio, (LPVOID*)&Editor_UpdateAudioActual);
		MH_EnableHook(updateAudioPtr);
	}

	//UEditorEngine__Exec = (int(__stdcall*)(void*, const wchar_t*, const void*))GetProcAddress(editor, MAKEINTRESOURCEA(462));

	UObject::GObjObjects = (dnArray<UObject*> *)GetProcAddress(engine, MAKEINTRESOURCEA(6881));

	UCommandlet__StaticClass = (void* (__cdecl*)(void))GetProcAddress(engine, MAKEINTRESOURCEA(11350));
	UObject__StaticLoadClass = (void* (__cdecl*)(void*, void*, const wchar_t*, const wchar_t*, ULONG, void*))GetProcAddress(engine, MAKEINTRESOURCEA(11844));
	Uobject__GetTrasnientPackage = (void* (__cdecl*)(void))GetProcAddress(engine, MAKEINTRESOURCEA(8141));
	Uobject__StaticConstructObject = (void* (__cdecl*)(UClass*, UObject*, dnName*, DWORD, UObject*, dnOutputDevice*, UObject*))GetProcAddress(engine, MAKEINTRESOURCEA(11804));
	UObject__MakeUniqueObjectName = (void* (__cdecl*)(void*, void*))GetProcAddress(engine, MAKEINTRESOURCEA(9128));

	UExporter__StaticClass = (void* (__cdecl*)(void))GetProcAddress(engine, MAKEINTRESOURCEA(11368));
	ULevel__StaticClass = (void* (__cdecl*)(void))GetProcAddress(engine, MAKEINTRESOURCEA(11391));
//
	UObject__GetOuter = (void* (__fastcall*)(void*, void*))GetProcAddress(engine, MAKEINTRESOURCEA(7498));
	UObject__LoadPackage = (void* (__cdecl*)(UObject*, const TCHAR*, DWORD))GetProcAddress(engine, MAKEINTRESOURCEA(9060));

	//dnName _fake = TEXT("FAKE");
	//WWindowFake* window = new WWindowFake(_fake, nullptr);
	//
	//UEditorEngineVTableGeneric* gen = (UEditorEngineVTableGeneric*)window;

	//WControl* window = new WControl();
	//
	//int test;
	//window->OnCreate();
	//window = window;

	hinstHack = (HINSTANCE * )GetProcAddress(engine, MAKEINTRESOURCEA(15446));
	hinstWindowHack = (HINSTANCE*)GetProcAddress(engine, MAKEINTRESOURCEA(14870));

	InitMeshDriver();

	//*hinstHack = GetModuleHandle(NULL);
}

DWORD WINAPI MyThreadFunction(LPVOID lpParam) {
	while (true)
	{
		*hinstHack = GetModuleHandle(NULL);
		*hinstWindowHack = GetModuleHandle(NULL);
		Sleep(1);
	}

	return 0;
}

BOOL WINAPI DllMain(
	HINSTANCE hinstDLL,  // handle to DLL module
	DWORD fdwReason,     // reason for calling function
	LPVOID lpReserved)  // reserved
{
	// Perform actions based on the reason for calling.
	switch (fdwReason)
	{
	case DLL_PROCESS_ATTACH:
	{
		AllocConsole();
		freopen("CONOUT$", "w", stdout);
		InitDNFHooks();
		DWORD dontGiveTwoFucksAboutThisVariable = 0;
		CreateThread(
			NULL,                   // default security attributes
			0,                      // use default stack size  
			MyThreadFunction,       // thread function name
			nullptr,          // argument to thread function 
			0,                      // use default creation flags 
			&dontGiveTwoFucksAboutThisVariable);

	}
		break;

	case DLL_THREAD_ATTACH:
		// Do thread-specific initialization.
		break;

	case DLL_THREAD_DETACH:
		// Do thread-specific cleanup.
		break;

	case DLL_PROCESS_DETACH:
		// Perform any necessary cleanup.
		break;
	}
	return TRUE;  // Successful DLL_PROCESS_ATTACH.
}