#include <windows.h>
#include "../../dukeed/Unreal.h"
#include <d3d9.h>
#include <d3dx9.h>
#include <D3DX9Shader.h>
#include <D3DX9Mesh.h>
#include <fstream>

int GetFileSize(const char* fileName)
{
	std::streamsize fileSize;

	std::ifstream file(fileName, std::ios::binary | std::ios::ate);
	fileSize = file.tellg();
	file.close();

	return fileSize;
}

void* (__cdecl* dnDefinitionMgr__GetDefinition_internal)(const char* fileName, int* unknown);
void* (__cdecl* dnSkeletonMgr__GetDefinition_internal)(const char* fileName);



void* (__cdecl* dnDefinitionMgr__GetDefinition)(const char* fileName, int *unknown);
void* __cdecl DefinitionMgr__GetDefinition(const char* name, int* unknown)
{
	char fileName[512];

	sprintf(fileName, "../skinmeshes/%s", name);
	printf("Animation Def loading %s\n", name);

	int fileSize = GetFileSize(fileName);

	if (fileSize <= 0)
	{
		//OutputDebugStringA("Defaulting for ");
		//OutputDebugStringA(fileName);
		//OutputDebugStringA("\n");
		sprintf(fileName, "../skinmeshes/missing.def");
		fileSize = GetFileSize(fileName);
	}

	HANDLE hFile = CreateFileA(fileName,               // file to open
		GENERIC_READ,          // open for reading
		FILE_SHARE_READ,       // share for reading
		NULL,                  // default security
		OPEN_EXISTING,         // existing file only
		0x80u, // normal file
		NULL);                 // no attr. template

	if (hFile == INVALID_HANDLE_VALUE)
	{
		return 0;
	}

	void* pMemory2 = malloc(8280);
	dnArchiveFileReader* reader = new (pMemory2) dnArchiveFileReader(hFile, nullptr, fileSize);

	void* pMemory = malloc(88);
	dnDefinition* def = (dnDefinition * )dnDefinitionMgr__GetDefinition_internal(name, 0);

	if (!def->Serialize(*reader))
	{
		delete def;
		return nullptr;
	}
	CloseHandle(hFile);
	delete reader;

	return def;
}

void InitAnimation(void)
{
	intptr_t  module2 = (intptr_t)GetModuleHandleA("dnAnimation.dll");

	intptr_t addr2 = (intptr_t )module2 + ((intptr_t)0x0002D060);
	dnDefinitionMgr__GetDefinition_internal = (void* (__cdecl*)(const char*, int*))addr2;

	intptr_t addr3 = (intptr_t)module2 + ((intptr_t)0x00030620);
	dnSkeletonMgr__GetDefinition_internal = (void* (__cdecl*)(const char*))addr2;

	if (MH_CreateHookApi(TEXT("dnAnimation.dll"), MAKEINTRESOURCEA(260), DefinitionMgr__GetDefinition, (LPVOID*)&dnDefinitionMgr__GetDefinition) != MH_OK) {
		_asm {
			int 3
		}
	}
}