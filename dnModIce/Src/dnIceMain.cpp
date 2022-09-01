// dnIceMain.cpp
//

#include <windows.h>
#include "../../dukeed/Unreal.h"
#include <d3d9.h>
#include <d3dx9.h>
#include <D3DX9Shader.h>
#include <D3DX9Mesh.h>
#include <fstream>

UObject* IceSpawnManager = nullptr;

void InitDirect3D(void);

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

class IceD3DXBuffer : public ID3DXBuffer {
public:
	virtual ULONG __stdcall Release() override {
		free(_cacheShaderBlob);
		_cacheShaderBlob = nullptr;
		_cacheShaderLen = 0;
		return 0;
	}

	virtual HRESULT __stdcall QueryInterface(REFIID iid, LPVOID* ppv) override {
		return S_OK;
	}

	virtual ULONG __stdcall AddRef() override {
		return 0;
	}

	virtual DWORD __stdcall GetBufferSize() override {
		return _cacheShaderLen;
	}

	virtual LPVOID __stdcall GetBufferPointer() override {
		return _cacheShaderBlob;
	}

	void* _cacheShaderBlob;
	int _cacheShaderLen;
};

int shader_val1 = -1;
int shader_val2 = -1;
int shader_val3 = -1;

UBOOL(__fastcall *D3DShaderDat__GetShaderBinDataActual)(void* _this, void* edx, int val1, int val2, int val3);
UBOOL __fastcall D3DShaderDat__GetShaderBinData(void* _this, void *edx, int val1, int val2, int val3) {
	shader_val1 = val1;
	shader_val2 = 0; // I think this is the pointer.
	shader_val3 = val3;
	return D3DShaderDat__GetShaderBinDataActual(_this, edx, val1, val2, val3);
}

HRESULT (__stdcall *D3DXCompileShaderActual)(LPCSTR pSrcData, UINT srcDataLen, const D3DXMACRO* pDefines,LPD3DXINCLUDE pInclude, LPCSTR pFunctionName, LPCSTR pProfile, DWORD Flags, ID3DXBuffer** ppShader, LPD3DXBUFFER* ppErrorMsgs, LPD3DXCONSTANTTABLE* ppConstantTable );
HRESULT __stdcall D3DXCompileShader2(LPCSTR pSrcData, UINT srcDataLen, const D3DXMACRO* pDefines, LPD3DXINCLUDE pInclude, LPCSTR pFunctionName, LPCSTR pProfile, DWORD Flags, ID3DXBuffer** ppShader, LPD3DXBUFFER* ppErrorMsgs, LPD3DXCONSTANTTABLE* ppConstantTable)
{
	char path[512], path2[512];
	sprintf(path, "shaders/cache/shader_%s_%u_%u_%u.shaderbin", pFunctionName, shader_val1, shader_val2,shader_val3);
	sprintf(path2, "shaders/cache/shader_%s_%u_%u_%u.hlsl", pFunctionName, shader_val1, shader_val2, shader_val3);

	FILE* cachef = fopen(path, "rb");
	if (cachef)
	{
		fclose(cachef);
		IceD3DXBuffer* newBuffer = new IceD3DXBuffer();		

		std::ifstream file(path, std::ios::binary | std::ios::ate);
		newBuffer->_cacheShaderLen = file.tellg();
		file.seekg(0, std::ios::beg);

		newBuffer->_cacheShaderBlob = malloc(newBuffer->_cacheShaderLen);

		file.read((char *)newBuffer->_cacheShaderBlob, newBuffer->_cacheShaderLen);

		*ppShader = newBuffer;
		return S_OK;
	}

	HRESULT hr = D3DXCompileShaderActual(pSrcData, srcDataLen, pDefines, pInclude, pFunctionName, pProfile, Flags, ppShader, ppErrorMsgs, ppConstantTable);
	if (hr != S_OK || *ppShader == nullptr)
		return hr;
#if 0
	{
		FILE* f = fopen(path2, "wb");
		fwrite(pSrcData, 1, srcDataLen, f);
		fclose(f);
	}

	FILE* f = fopen(path, "wb");

	ID3DXBuffer* newShader = *ppShader;

	fwrite(newShader->GetBufferPointer(), 1, newShader->GetBufferSize(), f);
	fclose(f);
#endif
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

void* (__fastcall* UObject__FindFunctionCheckedActual)(UObject* _this, const dnName& functionName, int unknown);
void *__fastcall UObject__FindFunctionChecked(UObject* _this, const dnName& functionName, int unknown)
{
	std::wstring _name = *functionName;
	void *ptr = UObject__FindFunctionCheckedActual(_this, functionName, unknown);

	if (IceSpawnManager && _name == TEXT("PreGameInit"))
	{
		UObject* _object = (UObject*)_this;

		ObjectCall_Parms Params;
		Params.object = _object;
		Params.ReturnValue = 0;

		UFunction* function = IceSpawnManager->FindFunction(TEXT("PreGameInitHook"), FALSE);
		IceSpawnManager->ProcessEvent(function, &Params);
	}

	return ptr;
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

	InitDirect3D();

	if (MH_CreateHookApi(TEXT("engine.dll"), MAKEINTRESOURCEA(6736), UObject__FindFunctionChecked, (LPVOID*)&UObject__FindFunctionCheckedActual) != MH_OK) {
		_asm {
			int 3
		}
	}

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
	HMODULE module2 = LoadLibraryA("d3ddrv9.dll");

	if (MH_CreateHookApi(TEXT("D3DX9_37.dll"), "D3DXCompileShader", D3DXCompileShader2, (LPVOID*)&D3DXCompileShaderActual) != MH_OK) {
		_asm {
			int 3
		}
	}	
//
	if (MH_CreateHookApi(TEXT("d3ddrv9.dll"), MAKEINTRESOURCEA(93), D3DShaderDat__GetShaderBinData, (LPVOID*)&D3DShaderDat__GetShaderBinDataActual) != MH_OK) {
		_asm {
			int 3
		}
	}

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