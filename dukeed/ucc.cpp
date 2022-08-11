#include <windows.h>
#include <vector>

#include "unmsg.h"
#include "windowres.h"
#include "Unreal.h"

//
// Flags describing a class.
//
enum EClassFlags
{
	// Base flags.
	CLASS_Abstract = 0x00001,  // Class is abstract and can't be instantiated directly.
	CLASS_Compiled = 0x00002,  // Script has been compiled successfully.
	CLASS_Config = 0x00004,  // Load object configuration at construction time.
	CLASS_Transient = 0x00008,	// This object type can't be saved; null it out at save time.
	CLASS_Parsed = 0x00010,	// Successfully parsed.
	CLASS_Localized = 0x00020,  // Class contains localized text.
	CLASS_SafeReplace = 0x00040,  // Objects of this class can be safely replaced with default or NULL.
	CLASS_RuntimeStatic = 0x00080,	// Objects of this class are static during gameplay.
	CLASS_NoExport = 0x00100,  // Don't export to C++ header.
	CLASS_NoUserCreate = 0x00200,  // Don't allow users to create in the editor.
	CLASS_PerObjectConfig = 0x00400,  // Handle object configuration on a per-object basis, rather than per-class.
	CLASS_NativeReplication = 0x00800,  // Replication handled in C++.
	CLASS_Obsolete = 0x01000,	// CDH: Class is obsolete and any current instances should be removed so class can be deleted.
	CLASS_Placeable = 0x02000,	// Class is placeable in a level.

	// Flags to inherit from base class.
	CLASS_Inherit = CLASS_Transient | CLASS_Config | CLASS_Localized | CLASS_SafeReplace | CLASS_RuntimeStatic | CLASS_PerObjectConfig | CLASS_Obsolete | CLASS_Placeable,
	CLASS_RecompilerClear = CLASS_Inherit | CLASS_Abstract | CLASS_NoExport | CLASS_NativeReplication,
};

// Editor.dll - 0x0009AF30 = MarkChangedScripts
void (*MarkChangedScriptsActual)(TArray<UClass*>& AllClasses, UBOOL MakeAll);

UBOOL(__fastcall* MakeScriptsActual)(void *_this, void *edx, UClass* BaseClass, void* Warn, UBOOL MakeAll, UBOOL Booting, UBOOL MakeSubclasses);
UBOOL __fastcall MakeScripts(void* _this, void* edx, UClass* BaseClass, void* Warn, UBOOL MakeAll, UBOOL Booting, UBOOL MakeSubclasses) {
	//BaseClass = UObject::StaticLoadClass(UObject::StaticClass(), (UObject*)UObject::GetTransientPackage(), TEXT("dnObjLoad.Justin"), TEXT("dnObjLoad"), 0, nullptr);
	
	//if (!BaseClass)
	//	BaseClass = UObject::StaticClass();
	//
	//// Make list of all classes underneath this base
	for (TObjectIterator<UClass> ObjIt; ObjIt; ++ObjIt)
	{
		UClass* _cls = *ObjIt;

		wprintf(TEXT("%s\n"), _cls->GetName());
		BaseClass = _cls;
	
		//if ((*ObjIt == BaseClass) || (MakeSubclasses && ObjIt->IsChildOf(BaseClass)))
		//{
		//	int class_flags = *(DWORD*)(_cls + 1184);
		//	class_flags |= CLASS_Parsed;
		//	*(DWORD*)(_cls + 1184) = class_flags;
		//}
	}

	return MakeScriptsActual(_this, edx, BaseClass, Warn, MakeAll, Booting, MakeSubclasses);
}

void __stdcall MarkChangedScripts(TArray<UClass*>& AllClasses, UBOOL MakeAll) {

}

FString RightPad(FString In, INT Count)
{
	while (In.Len() < Count)
		In += TEXT(" ");
	return In;
}

BOOL(__fastcall* FClassDependency__IsUpToDateActual)(void* _this);
BOOL __fastcall FClassDependency__IsUpToDate(void* _this) {
	return true;
}

typedef BOOL(__fastcall *PropertyOverride_t)(void* _this, void* a, void* b);

PropertyOverride_t propertyOverrideTable[16];
BOOL __fastcall PropertyIdenticalOverride(void* _this, void *edx, void* a, void* b) {
	return TRUE;
}

BOOL __fastcall PropertyIdenticalOverride2(void* _this, void* edx, void* a, void* b) {
	return FALSE;
}

void UCC(void)
{
	dnArray<FRegistryObjectInfo> List;
	UObject::GetRegistryObjects(List, UClass::StaticClass(), UCommandlet::StaticClass(), 0);

	HMODULE editor = LoadLibraryA("editor.dll");


	//void* engine_markchangeptr = (void *)((int)editor + 0x0009AF30 + 4320 + 4);
	//{
	//	MH_CreateHook(engine_markchangeptr, MarkChangedScripts, (LPVOID*)&MarkChangedScriptsActual);
	//	MH_EnableHook(engine_markchangeptr);
	//}

	void* engine_makescriptsptr = GetProcAddress(editor, MAKEINTRESOURCEA(656));
	{
		MH_CreateHook(engine_makescriptsptr, MakeScripts, (LPVOID*)&MakeScriptsActual);
		MH_EnableHook(engine_makescriptsptr);
	}

	int argc;
	wchar_t** argv = CommandLineToArgvW(GetCommandLineW(), &argc);

	dnString Token = argc > 1 ? argv[1] : TEXT("");

	LPWSTR cmdLine = GetCommandLineW();

	UBOOL Help = 0;
	DWORD LoadFlags = LOAD_NoWarn | LOAD_Quiet | LOAD_DisallowFiles;
	if (Token == TEXT(""))
	{
		//ShowBanner();
		wprintf(TEXT("Use \"ucc help\" for help"));
	}
	else if (Token == TEXT("HELP"))
	{
		//ShowBanner();
		UObject::StaticLoadClass(UCommandlet::StaticClass(), NULL, TEXT("Engine.Commandlet"), NULL, LOAD_NoFail, NULL);
		//const TCHAR* Tmp = appCmdLine();
		*GIsEditor = 0; // To enable loading localized text.
		//if (!ParseToken(Tmp, Token, 0))
		{
			INT i;
			wprintf(TEXT("Usage:"));
			wprintf(TEXT("   ucc <command> <parameters>"));
			wprintf(TEXT(""));
			wprintf(TEXT("Commands for \"ucc\":"));
			TArray<FString> Items;
			for (i = 0; i < List.Num(); i++)
			{
				UClass* Class = UObject::StaticLoadClass(UCommandlet::StaticClass(), NULL, *List(i).Object, NULL, LoadFlags, NULL);
				if (Class)
				{
					UCommandlet* Default = (UCommandlet*)Class->GetDefaultObject();
					Default->LoadLocalized();

					new(Items)FString(FString(TEXT("   ucc ")) + RightPad(Default->HelpCmd, 21) + TEXT(" ") + Default->HelpOneLiner + TEXT(" ") + Class->GetName());
				}
			}
			new(Items)FString(TEXT("   ucc help <command>        Get help on a command\n"));
			//Sort(&Items(0), Items.Num());
			for (i = 0; i < Items.Num(); i++)
				wprintf(TEXT("%s\n"), *Items(i));
		}
		//else
		//{
		//	Help = 1;
		//	goto Process;
		//}
	}
	else
	{
		//ShowBanner();
		UObject::StaticLoadClass(UCommandlet::StaticClass(), NULL, TEXT("Engine.Commandlet"), NULL, LOAD_NoFail, NULL);
		//const TCHAR* Tmp = appCmdLine();
		*GIsEditor = 0; // To enable loading localized text.
		//if (!ParseToken(Tmp, Token, 0))

		UClass* Class = nullptr;
		TArray<FString> Items;
		for (int i = 0; i < List.Num(); i++)
		{
			UClass* cls = UObject::StaticLoadClass(UCommandlet::StaticClass(), NULL, *List(i).Object, NULL, LoadFlags, NULL);
			if (cls)
			{
				UCommandlet* Default = (UCommandlet*)cls->GetDefaultObject();
				Default->LoadLocalized();

				FString cmdName = RightPad(Default->HelpCmd, 21);
				//wprintf(TEXT("%s\n"), *cmdName);

				const wchar_t* t1 = *cmdName;
				const wchar_t* t2 = *Token;

				std::wstring str(*cmdName);
				std::wstring str2(*Token);

				if (str.find(str2) != std::wstring::npos)
				{
					Class = cls;
					break;
				}
			}
		}

		if (Class)
		{
			UCommandlet* Default = (UCommandlet*)Class->GetDefaultObject();
			if (Help)
			{
				// Get help on it.
				if (Default->HelpUsage != TEXT(""))
				{
					wprintf(TEXT("Usage:"));
					wprintf(TEXT("   ucc %s"), *Default->HelpUsage);
				}
				if (Default->HelpParm[0] != TEXT(""))
				{
					wprintf(TEXT(""));
					wprintf(TEXT("Parameters:"));
					for (INT i = 0; i < ARRAY_COUNT(Default->HelpParm) && Default->HelpParm[i] != TEXT(""); i++)
						wprintf(TEXT("   %s %s"), *RightPad(Default->HelpParm[i], 16), *Default->HelpDesc[i]);
				}
				if (Default->HelpWebLink != TEXT(""))
				{
					wprintf(TEXT(""));
					wprintf(TEXT("For more info, see"));
					wprintf(TEXT("   %s"), *Default->HelpWebLink);
				}
			}
			else
			{
				// Run it.
				if (Default->LogToStdout)
				{
					//	Warn.AuxOut = GLog;
						//GLog = &Warn;
				}
				if (Default->ShowBanner)
				{
					//	ShowBanner(Warn);
				}
				wprintf(TEXT("Executing %s\n"), Class->GetName());
				*GIsClient = Default->IsClient;
				*GIsServer = Default->IsServer;
				*GIsEditor = Default->IsEditor;
				*GLazyLoad = Default->LazyLoad;
				UCommandlet* Commandlet = ConstructObject<UCommandlet>(Class);

				UEditorEngineVTableGeneric* _gen = (UEditorEngineVTableGeneric*)Commandlet;


				Commandlet->InitExecution();
				Commandlet->ParseParms(TEXT("NOCONFORM"));
				Commandlet->Main(TEXT("NOCONFORM"));
				// 

			//	GEditor->MakeScripts(nullptr, (dnFeedbackContext *)GWarn, 0, 1, 1);

// 
				//if (Commandlet->ShowErrorCount)
				//{
				//	if (Warn.ErrorCount == 0)
				//		GWarn->Logf(TEXT("Success - %d error(s), %d warning(s)"), Warn.ErrorCount, Warn.WarningCount);
				//	else
				//	{
				//		GWarn->Logf(TEXT("Failure - %d error(s), %d warning(s)"), Warn.ErrorCount, Warn.WarningCount);
				//		ErrorLevel = 1;
				//	}
				//}
				//if (Default->LogToStdout)
				//{
				//	Warn.AuxOut = NULL;
				//	GLog = &Log;
				//}
			}
		}
		else
		{
			//	ShowBanner(Warn);
			wprintf(TEXT("Commandlet %s not found"), *Token);
		}
	}

	wprintf(TEXT("COMMAND COMPLETED"));
	exit(0);
}