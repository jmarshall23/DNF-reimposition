// dnDirect3DDriver.cpp
//

#include <windows.h>
#include "../../dukeed/Unreal.h"
#include <d3d9.h>
#include <d3dx9.h>
#include <D3DX9Shader.h>
#include <D3DX9Mesh.h>

__declspec(dllimport) class dnShaderCompiler {
public:
	void AddLinef(const wchar_t* a2, ...);
};

IDirect3D9* g_d3d = nullptr;
IDirect3DDevice9* g_d3dDevice9 = nullptr;
D3DVIEWPORT9 g_currentViewport;

HRESULT(__stdcall* IDirect3D9_SetPixelShaderActual)(void* _this, const IDirect3DPixelShader9* pixelShader);
HRESULT __stdcall IDirect3D9_SetPixelShader(void* _this, const IDirect3DPixelShader9* pixelShader) {
	HRESULT hr = IDirect3D9_SetPixelShaderActual(_this, pixelShader);

	float iceViewportValue[4] = { g_currentViewport.Width, g_currentViewport.Height, 0, 0 };

	g_d3dDevice9->SetPixelShaderConstantF(8, iceViewportValue, 1);

	return hr;
}

HRESULT(__stdcall* IDirect3D9_SetViewportActual)(void* _this, const D3DVIEWPORT9* pViewport);
HRESULT __stdcall IDirect3D9_SetViewport2(void* _this, const D3DVIEWPORT9* pViewport) {
	g_currentViewport = *pViewport;
	return IDirect3D9_SetViewportActual(_this, pViewport);
}

HRESULT(__stdcall* IDirect3D9_CreateTextureActual)(void* _this, UINT Width, UINT Height, UINT Levels, DWORD Usage, D3DFORMAT Format, D3DPOOL Pool, IDirect3DTexture9** ppTexture, HANDLE* pSharedHandle);
HRESULT __stdcall IDirect3D9_CreateTexture(void* _this, UINT Width, UINT Height, UINT Levels, DWORD Usage, D3DFORMAT Format, D3DPOOL Pool, IDirect3DTexture9** ppTexture, HANDLE* pSharedHandle) {
	return IDirect3D9_CreateTextureActual(_this, Width, Height, Levels, Usage, Format, Pool, ppTexture, pSharedHandle);
}

HRESULT (__stdcall *IDirect3D9_CreateDeviceActual)(void *_this, UINT Adapter,D3DDEVTYPE DeviceType,HWND hFocusWindow,DWORD BehaviorFlags,D3DPRESENT_PARAMETERS* pPresentationParameters, IDirect3DDevice9** ppReturnedDeviceInterface);
HRESULT __stdcall IDirect3D9_CreateDevice2(void* _this, UINT Adapter, D3DDEVTYPE DeviceType, HWND hFocusWindow, DWORD BehaviorFlags, D3DPRESENT_PARAMETERS* pPresentationParameters, IDirect3DDevice9** ppReturnedDeviceInterface) {
	HRESULT hr = IDirect3D9_CreateDeviceActual(_this, Adapter, DeviceType, hFocusWindow, BehaviorFlags, pPresentationParameters, ppReturnedDeviceInterface);

	g_d3dDevice9 = *ppReturnedDeviceInterface;

	UEditorEngineVTable* vtable = (UEditorEngineVTable*)g_d3dDevice9;
	UEditorEngineVTable* vtable_actual = (UEditorEngineVTable*)vtable->vtable[0];

	static bool hookOnce = false;
	if(!hookOnce)
	{
		MH_CreateHook(vtable_actual->vtable[23], IDirect3D9_CreateTexture, (LPVOID*)&IDirect3D9_CreateTextureActual);
		MH_EnableHook(vtable_actual->vtable[23]);

		MH_CreateHook(vtable_actual->vtable[47], IDirect3D9_SetViewport2, (LPVOID*)&IDirect3D9_SetViewportActual);
		MH_EnableHook(vtable_actual->vtable[47]);

		MH_CreateHook(vtable_actual->vtable[107], IDirect3D9_SetPixelShader, (LPVOID*)&IDirect3D9_SetPixelShaderActual);
		MH_EnableHook(vtable_actual->vtable[107]);
		hookOnce = true;
	}

	return hr;
}


IDirect3D9* (__stdcall *Direct3DCreate9Actual)(UINT SDKVersion);
IDirect3D9* __stdcall Direct3DCreate9New(UINT SDKVersion) {
	g_d3d = Direct3DCreate9Actual(SDKVersion);

	UEditorEngineVTable* vtable = (UEditorEngineVTable*)g_d3d;
	UEditorEngineVTable* vtable_actual = (UEditorEngineVTable*)vtable->vtable[0];

	static bool hookOnce = false;
	if (!hookOnce)
	{
		MH_CreateHook(vtable_actual->vtable[16], IDirect3D9_CreateDevice2, (LPVOID*)&IDirect3D9_CreateDeviceActual);
		MH_EnableHook(vtable_actual->vtable[16]);
		hookOnce = true;
	}

	return g_d3d;
}

void(__fastcall* dnShaderCompiler__CreatePS_INPUTActual)(dnShaderCompiler* _this, void *edx, void* dnShaderCode);
void __fastcall dnShaderCompiler__CreatePS_INPUT(dnShaderCompiler* _this, void* edx, void* shader) {
	_this->AddLinef(TEXT("struct PS_INPUT"));
	_this->AddLinef(TEXT("{"));

	if (*((_WORD*)shader + 3) & 0x14 || *((DWORD*)_this + 227))
	{
		if (*((DWORD*)_this + 224))
			_this->AddLinef( L"    float4    Diffuse : COLOR_centroid;");
		else
			_this->AddLinef(L"    float4    Diffuse : COLOR;");
	}

	if (*((DWORD*)_this + 228))
	{
		int numTexturesInShader = *((DWORD*)_this + 228);
		if (*((DWORD*)_this + 224))
			_this->AddLinef(L"    float4 Tex[%i] : TEXCOORD0_centroid;", numTexturesInShader);
		else
			_this->AddLinef(L"    float4 Tex[%i] : TEXCOORD0;", numTexturesInShader);
	}

	// Added this because some screen space passes don't actually use the st coordinates of the screen for some reason.
	_this->AddLinef(TEXT("    float2	   ScreenXY : VPOS;"));

	_this->AddLinef(TEXT("};"));

	_this->AddLinef(TEXT("float4 iceViewportInfo : register(c8);"));
}


void InitDirect3D(void)
{
	HMODULE module = LoadLibraryA("d3d9.dll");
	HMODULE module2 = LoadLibraryA("d3ddrv9.dll"); 

	if (MH_CreateHookApi(TEXT("d3d9.dll"), "Direct3DCreate9", Direct3DCreate9New, (LPVOID*)&Direct3DCreate9Actual) != MH_OK) {
		_asm {
			int 3
		}
	}

	if (MH_CreateHookApi(TEXT("d3ddrv9.dll"), MAKEINTRESOURCEA(47), dnShaderCompiler__CreatePS_INPUT, (LPVOID*)&dnShaderCompiler__CreatePS_INPUTActual) != MH_OK) {
		_asm {
			int 3
		}
	}
}