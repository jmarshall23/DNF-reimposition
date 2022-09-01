// dnDirect3DDriver.cpp
//

#include <windows.h>
#include "../../dukeed/Unreal.h"
#include <d3d9.h>
#include <d3dx9.h>
#include <D3DX9Shader.h>
#include <D3DX9Mesh.h>

IDirect3D9* g_d3d = nullptr;
IDirect3DDevice9* g_d3dDevice9 = nullptr;

HRESULT(__stdcall* IDirect3D9_CreateTextureActual)(void* _this, UINT Width, UINT Height, UINT Levels, DWORD Usage, D3DFORMAT Format, D3DPOOL Pool, IDirect3DTexture9** ppTexture, HANDLE* pSharedHandle);
HRESULT __stdcall IDirect3D9_CreateTexture(void* _this, UINT Width, UINT Height, UINT Levels, DWORD Usage, D3DFORMAT Format, D3DPOOL Pool, IDirect3DTexture9** ppTexture, HANDLE* pSharedHandle) {
	//if (Width == 2048 && Height == 2048 && Format == D3DFMT_D24S8)
	//{
	//	OutputDebugStringW(TEXT("FOUND SHADOW MAP!"));
	//}
	
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

void InitDirect3D(void)
{
	HMODULE module = LoadLibraryA("d3d9.dll");
	if (MH_CreateHookApi(TEXT("d3d9.dll"), "Direct3DCreate9", Direct3DCreate9New, (LPVOID*)&Direct3DCreate9Actual) != MH_OK) {
		_asm {
			int 3
		}
	}
}