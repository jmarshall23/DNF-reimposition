// dnIceMain.cpp
//

#include <windows.h>
#include "../../dukeed/Unreal.h"
#include <d3d9.h>
#include <D3DX9Shader.h>

UObject* IceSpawnManager = nullptr;

__declspec(dllimport) extern int g_LoadScreenInputReceived;

DWORD WINAPI MyThreadFunction(LPVOID lpParam) {
	while (true)
	{
		g_LoadScreenInputReceived = 1;
		Sleep(1);
	}

	return 0;
}

struct ObjectCall_Parms
{
	UObject* object;
	BITFIELD ReturnValue;
};

struct FPlaySoundArgs {
	int unnknown0;
	int unnknown1;
	int unnknown2;
	int unnknown3;
	int unnknown4;
	int unnknown5;
	float volume;
	int unknonw[21];
};

// ps_4_0_level_9_3 

struct ID3DXBuffer;

HRESULT (__stdcall *D3DXCompileShaderActual)(LPCSTR pSrcData, UINT srcDataLen, const D3DXMACRO* pDefines,LPD3DXINCLUDE pInclude, LPCSTR pFunctionName, LPCSTR pProfile, DWORD Flags, LPD3DXBUFFER* ppShader, LPD3DXBUFFER* ppErrorMsgs, LPD3DXCONSTANTTABLE* ppConstantTable );
HRESULT __stdcall D3DXCompileShader2(LPCSTR pSrcData, UINT srcDataLen, const D3DXMACRO* pDefines, LPD3DXINCLUDE pInclude, LPCSTR pFunctionName, LPCSTR pProfile, DWORD Flags, LPD3DXBUFFER* ppShader, LPD3DXBUFFER* ppErrorMsgs, LPD3DXCONSTANTTABLE* ppConstantTable)
{
	//if (!strcmp(pProfile, "ps_3_0") || !strcmp(pProfile, "ps_2_0"))
	//{
	//	pProfile = "ps_4_0_level_9_3";
	//}

	HRESULT hr = D3DXCompileShaderActual(pSrcData, srcDataLen, pDefines, pInclude, pFunctionName, pProfile, Flags, ppShader, ppErrorMsgs, ppConstantTable);

	return hr;
}

char * (__fastcall* dnShaderCompiler_GetPSTargetActual)(void* _this);
const char* __fastcall dnShaderCompiler_GetPSTarget(void* _this) {
	return "ps_4_0_level_9_3";
}

void(__fastcall* dnShader_CompilerVSActual)(void* _this, void* edx, void* dnShader);
void __fastcall dnShader_CompilerVS(void* _this, void* edx, void* dnShader) {
	ID3DXBuffer** d3dbuffer = (struct ID3DXBuffer**)_this;

	//dnString shaderBuffer = *(dnString*)(d3dbuffer + 213);

	//OutputDebugStringW(*shaderBuffer);

	dnShader_CompilerVSActual(_this, edx, dnShader);
}

void(__fastcall* dnShader_CompilerPSActual)(void* _this, void* edx, void* dnShader);
void __fastcall dnShader_CompilerPS(void* _this, void* edx, void* dnShader) {
	ID3DXBuffer** d3dbuffer = (struct ID3DXBuffer**)_this;

	//dnString shaderBuffer = *(dnString*)(d3dbuffer + 213);

	//OutputDebugStringW(*shaderBuffer);

	dnShader_CompilerPSActual(_this, edx, dnShader);
}

UBOOL(*InitializeMeqonActorActual)(struct AKarmaActor* karmaActor);
UBOOL InitializeMeqonActor(struct AKarmaActor* karmaActor) {
	return InitializeMeqonActorActual(karmaActor);
}

void (__fastcall* AActor_InternalPlaySoundActual)(UObject *_this, void* edx, int param, FPlaySoundArgs & ptr);
void __fastcall AActor_InternalPlaySound(UObject* _this, void* edx, int param, FPlaySoundArgs& ptr)
{
	UObject* owner = (UObject*) *((DWORD*)_this + 27);

	if (wcsstr(_this->GetName(), TEXT("IcePlayer")))
	{
		if (ptr.volume > 0.5)
		{
			ptr.volume = 1.0f;
		}
	}
	else if (owner != nullptr && wcsstr(owner->GetName(), TEXT("IcePlayer")))
	{
		if (ptr.volume > 0.5)
		{
			ptr.volume = 1.0f;
		}
	}
	else 
	{
		ptr.volume -= 0.15f;
	}
	AActor_InternalPlaySoundActual(_this, edx, param, ptr);
}


void (__fastcall * UObject_DestroyActual)(void* _this, void *edx);
void __fastcall UObject_Destroy(void* _this, void* edx)
{
	if (_this == IceSpawnManager && IceSpawnManager != nullptr)
	{
		IceSpawnManager = nullptr;
	}

	UObject_DestroyActual(_this, edx);
}

void (__fastcall * AActor__eventSpawnedActual)(AActor* _this, void *edx);
void __fastcall AActor__eventSpawned(AActor* _this, void *edx)
{
	UObject* _object = (UObject*)_this;

	//OutputDebugStringW(_object->GetName());

	if (wcsstr(_object->GetName(), TEXT("IceSpawnManager")))
	{
		IceSpawnManager = _object;
		AActor__eventSpawnedActual(_this, edx);
		return;
	}

	if (IceSpawnManager == nullptr)
	{
		AActor__eventSpawnedActual(_this, edx);
		return;
	}
	
	AActor__eventSpawnedActual(_this, edx);

	ObjectCall_Parms Params;
	Params.object = _object;
	Params.ReturnValue = 0;

	UFunction* function = IceSpawnManager->FindFunction(TEXT("PostEntitySpawn"), FALSE);
	IceSpawnManager->ProcessEvent(function, &Params);


	//OutputDebugStringW(_object->GetName());
	//OutputDebugStringW(TEXT("\n"));
}


void InitDNFHooks()
{
	MH_Initialize();

	

	if (MH_CreateHookApi(TEXT("engine.dll"), MAKEINTRESOURCEA(12968), AActor__eventSpawned, (LPVOID*)&AActor__eventSpawnedActual) != MH_OK) {
		_asm {
			int 3
		}
	}

	if (MH_CreateHookApi(TEXT("engine.dll"), MAKEINTRESOURCEA(5705), UObject_Destroy, (LPVOID*)&UObject_DestroyActual) != MH_OK) {
		_asm {
			int 3
		}
	}

	if (MH_CreateHookApi(TEXT("engine.dll"), MAKEINTRESOURCEA(8801), AActor_InternalPlaySound, (LPVOID*)&AActor_InternalPlaySoundActual) != MH_OK) {
		_asm {
			int 3
		}
	}

	if (MH_CreateHookApi(TEXT("engine.dll"), MAKEINTRESOURCEA(8453), InitializeMeqonActor, (LPVOID*)&InitializeMeqonActorActual) != MH_OK) {
		_asm {
			int 3
		}
	}

	HMODULE module = LoadLibraryA("D3DX9_37.dll");

	if (MH_CreateHookApi(TEXT("D3DX9_37.dll"), "D3DXCompileShader", D3DXCompileShader2, (LPVOID*)&D3DXCompileShaderActual) != MH_OK) {
		_asm {
			int 3
		}
	}	
//
//	if (MH_CreateHookApi(TEXT("d3ddrv9.dll"), MAKEINTRESOURCEA(41), dnShader_CompilerVS, (LPVOID*)&dnShader_CompilerVSActual) != MH_OK) {
//		_asm {
//			int 3
//		}
//	}

	MH_EnableHook(MH_ALL_HOOKS);
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