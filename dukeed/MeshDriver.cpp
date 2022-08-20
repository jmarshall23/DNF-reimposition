// MeshDriver.cpp
//

#include <windows.h>
#include <stdio.h>
#include <stdint.h>
#include <assert.h>

#include "Unreal.h"
#include "unmsg.h"
#include "windowres.h"
#include "Window.h"
#include "windrv.h"

static void(__fastcall* UKMeshProps__DebugDrawActual)(void* _this, void* edx, void* sceneNode);
static void __fastcall UKMeshProps__DebugDraw(void* _this, void* edx, void* sceneNode)
{

}



static void* ( *AStaticMeshActor__StaticClass)(void);

static void *(__fastcall* StaticMesh_GetData)(class UStaticMesh* _this, void* edx);

static void(__fastcall* SerializeEngineActual)(class UObject* _this, void *edx, struct dnArchive_t* a2);
static void __fastcall SerializeEngine(class UObject* _this, void *edx, struct dnArchive_t* a2) {
	*GIsEditor = false;
	SerializeEngineActual(_this, edx, a2);	

	dnArray<int>* temp_data = (dnArray<int> *)((char*)_this + 112);

	// If we loaded a zero data blob from dnArchive that means we need to pull from the stream.
	int tableIndex = *((DWORD*)_this + 18);
	if (temp_data->Num() == 0 && tableIndex > 0)
	{		
		*((DWORD*)_this + 19) = 0;

		void* data = StaticMesh_GetData((class UStaticMesh*)_this, edx);
	}

	*GIsEditor = true;
}

void InitStaticMesh(void* _this)
{
	*GIsEditor = false;
	dnArray<int>* temp_data = (dnArray<int> *)((char*)_this + 112);

	// If we loaded a zero data blob from dnArchive that means we need to pull from the stream.
	int tableIndex = *((DWORD*)_this + 18);
	if (temp_data->Num() == 0 && tableIndex > 0)
	{
		*((DWORD*)_this + 19) = 0;
		*((DWORD*)_this + 18) = -1;

		void* data = StaticMesh_GetData((class UStaticMesh*)_this, nullptr);
	}
	*GIsEditor = true;
}


void InitMeshDriver(void) {
	HINSTANCE engine = LoadLibraryA("engine.dll");

	StaticMesh_GetData = (void* (__fastcall*)(UStaticMesh*, void*))GetProcAddress(engine, MAKEINTRESOURCEA(7148));

	AStaticMeshActor__StaticClass = (void* (__cdecl*)(void))GetProcAddress(engine, MAKEINTRESOURCEA(11299));

	void* MeshSerialize = GetProcAddress(engine, MAKEINTRESOURCEA(10659));
	{
		MH_CreateHook(MeshSerialize, SerializeEngine, (LPVOID*)&SerializeEngineActual);
		MH_EnableHook(MeshSerialize);
	}

	void* DebugDraw = GetProcAddress(engine, MAKEINTRESOURCEA(5626));
	{
		MH_CreateHook(DebugDraw, UKMeshProps__DebugDraw, (LPVOID*)&UKMeshProps__DebugDrawActual);
		MH_EnableHook(DebugDraw);
	}
}