// Unreal.h
//

#pragma once

#include "MinHook.h"

#include <assert.h>
#include <algorithm> 
#include <vector>
#include <string>

#undef min
#undef max

#define FString dnString
#define TArray dnArray

extern bool ignoreGLog;

extern void* globalLog;

// Global constants.
enum { INDEX_NONE = -1 };
enum { UNICODE_BOM = 0xfeff };
enum ENoInit { E_NoInit = 0 };

__declspec(dllimport) enum EInputKey;
__declspec(dllimport) enum EInputAction;

// Unsigned base types.
typedef unsigned char		BYTE;		// 8-bit  unsigned.
typedef unsigned short		_WORD;		// 16-bit unsigned.
typedef unsigned long		DWORD;		// 32-bit unsigned.
typedef unsigned __int64	QWORD;		// 64-bit unsigned.

// Signed base types.
typedef	signed char			SBYTE;		// 8-bit  signed.
typedef signed short		SWORD;		// 16-bit signed.
typedef signed int  		INT;		// 32-bit signed.
typedef signed __int64		SQWORD;		// 64-bit signed.

// Character types.
typedef char				ANSICHAR;	// An ANSI character.
typedef unsigned short      UNICHAR;	// A unicode character.
typedef unsigned char		ANSICHARU;	// An ANSI character.
typedef unsigned short      UNICHARU;	// A unicode character.

// Other base types.
typedef signed int			UBOOL;		// Boolean 0 (false) or 1 (true).
typedef float				FLOAT;		// 32-bit IEEE floating point.
typedef double				DOUBLE;		// 64-bit IEEE double.
typedef unsigned long       SIZE_T;     // Corresponds to C SIZE_T.

// Bitfield type.
typedef unsigned long       BITFIELD;	// For bitfields.

#define TCHAR_CALL_OS(funcW,funcA) (funcW)
__declspec(dllimport) const TCHAR* LocalizeGeneral(const TCHAR* Key, const TCHAR* Package, const TCHAR* LangExt = nullptr);

__declspec(dllimport) void __stdcall NE_EdInit(HWND hwnd1, HWND hwnd2);

__declspec(dllimport) enum EFindName;

template<class T>
class dnArray {
public:
	dnArray() {
		Data = nullptr;
		ArrayNum = 0;
		ArrayMax = 0;
	}

	int Num() { return ArrayNum; }

	void* GetData()
	{
		return Data;
	}
	const void* GetData() const
	{
		return Data;
	}

	const T& operator()(INT i) const
	{
		return ((T*)Data)[i];
	}

	INT AddItem(const T& Item)
	{	
		INT Index = Add(1, true);
		(*this)(Index) = Item;
		return Index;
	}

	T& operator()(INT i) 
	{
		return ((T*)Data)[i];
	}

	const T& Get(INT i) const
	{
		return ((T*)Data)[i];
	}
	
	INT Add(INT Count, INT ElementSize)
	{		
		INT Index = ArrayNum;
		if ((ArrayNum += Count) > ArrayMax)
		{
			ArrayMax = ArrayNum + 3 * ArrayNum / 8 + 32;
			Realloc(ElementSize);
		}

		return Index;
	}

	void Empty(INT ElementSize, INT Slack = 0)
	{
		ArrayNum = 0;
		ArrayMax = Slack;
		Realloc(ElementSize);
	}

	void Realloc(INT ElementSize)
	{
		Data = (T *)::realloc(Data, ArrayMax * ElementSize);
	}

	// Functions dependent on Add, Remove.
	dnArray& operator=(const dnArray& Other)
	{
		if (this != &Other)
		{
			Empty(Other.ArrayNum);
			for (INT i = 0; i < Other.ArrayNum; i++)
				new(*this)T(Other(i));
		}
		return *this;
	}

	T* Data;
	INT	  ArrayNum;
	INT	  ArrayMax;
};

__declspec(dllimport) enum EName {
	NAME_None = 0,
};

__declspec(dllimport) class dnName {
public:
	dnName();
	dnName(enum EName N);
	dnName(const wchar_t* name, EFindName f = (EFindName)0);

	const TCHAR* operator*() const;
};

__declspec(dllimport) class dnString
{
public:
	dnString();
	dnString(const wchar_t* name);

	INT InStr(const TCHAR* SubStr, UBOOL Right = 0) const;
	dnString Mid(INT Start, INT Count = MAXINT) const;
	dnString Left(INT Count) const;
	INT Len() const;
	dnString Right(INT Count) const;
	const TCHAR* operator*() const;
	UBOOL operator==(const TCHAR* Other) const;
	UBOOL operator==(const dnString& Other) const;
	dnString& operator+=(const TCHAR* Str);

	void* Data;
	int ArrayNum;
	int ArrayMax;
};


struct UEditorEngineVTable
{
	void* vtable[400];
};

class UEditorEngineVTableGeneric {
public:
	UEditorEngineVTable* vtable;
};

__declspec(dllimport) class dnArchive {
public:

};

__declspec(dllimport) class UPackageMap {
public:

};

__declspec(dllimport) class UViewport {
public:
	virtual ~UViewport();
};

class UClass;

__declspec(dllimport) class UObject {
public:
	UObject();

	int ObjectInternal[6];
	UObject* outer;
	const int ObjectFlags;
	dnName name;
	UClass* _class;

	UBOOL __fastcall IsA(UClass* SomeBaseClass) const;

	static dnArray<UObject*>			*GObjObjects;

	static UClass* StaticClass();

	static class UPackage* GetTransientPackage();

	static UObject* StaticLoadObject(class UClass* ObjectClass, UObject* InOuter, const TCHAR* InName, const TCHAR* Filename, DWORD LoadFlags, UPackageMap* Sandbox);
	static UObject* StaticConstructObject(class UClass* cls, UObject* outer, const dnName &name, DWORD SetFlags, UObject* unknown, class dnOutputDevice* outpoutDevice, UObject* unknown2);
	static void ResetLoaders(UObject* Pkg, UBOOL DynamicOnly, UBOOL ForceLazyLoad);
};

// Load an object.
template< class T > T* LoadObject(UObject* Outer, const TCHAR* Name, const TCHAR* Filename, DWORD LoadFlags, UPackageMap* Sandbox)
{
	return (T*)UObject::StaticLoadObject(T::StaticClass(), Outer, Name, Filename, LoadFlags, Sandbox);
}

__forceinline INT appRound(FLOAT Value)
{
	return (INT)floor(Value + 0.5);
}

// Information for rendering the viewport (detail level settings).
__declspec(dllimport) enum ERenderType
{
	REN_None = 0,	// Hide completely.
	REN_Wire = 1,	// Wireframe of EdPolys.
	REN_Zones = 2,	// Show zones and zone portals.
	REN_Polys = 3,	// Flat-shaded Bsp.
	REN_PolyCuts = 4,	// Flat-shaded Bsp with normals displayed.
	REN_DynLight = 5,	// Illuminated texture mapping.
	REN_PlainTex = 6,	// Plain texture mapping.
	REN_OrthXY = 13,	// Orthogonal overhead (XY) view.
	REN_OrthXZ = 14,	// Orthogonal XZ view.
	REN_OrthYZ = 15,	// Orthogonal YZ view.
	REN_TexView = 16,	// Viewing a texture (no actor).
	REN_TexBrowser = 17,	// Viewing a texture browser (no actor).
	REN_MeshView = 18,	// Viewing a mesh.
	REN_MAX = 20
};

__declspec(dllimport)  class AActor;
__declspec(dllimport)  struct FVector;
__declspec(dllimport)  class UPlayer;
__declspec(dllimport)  enum ENetRole;
__declspec(dllimport)  class ALevelInfo;
__declspec(dllimport)  class UNetConnection;
__declspec(dllimport)  class UClass;
__declspec(dllimport)  struct FURL;
__declspec(dllimport)  struct FCheckResult;
__declspec(dllimport)  class dnMemStack;

__declspec(dllimport) class ULevel {
public:
	//UEditorEngineVTable* vtable;
	static UClass* StaticClass();

	virtual ~ULevel() { };
	virtual void UObject_ProcessEvent(void*, void*, void*) { }
	virtual void UObject_ProcessDelegate(dnName, void*, void*, void*) { }
	virtual void stupid_unreal1(void) { }
	virtual void stupid_unreal2(void) { }
	virtual void stupid_unreal3(void) { }
	virtual void PostLoad(void);
	virtual void Destroy(void);
	virtual void Serialize(dnArchive&);
	virtual void stupid_unreal4(void) { }
	virtual void stupid_unreal5(void) { }
	virtual void stupid_unreal6(void) { }
	virtual void stupid_unreal7(void) { }
	virtual void stupid_unreal8(void) { }
	virtual void stupid_unreal10(void) { }
	virtual void stupid_unreal11(void) { }
	virtual void stupid_unreal12(void) { }
	virtual void stupid_unreal13(void) { }
	virtual void stupid_unreal14(void) { }
	virtual void stupid_unreal15(void) { }
	virtual void stupid_unreal16(void) { }
	virtual void stupid_unreal17(void) { }
	virtual void stupid_unreal18(void) { }
	virtual void Modify(int);
	virtual void SetActorCollision(int);
	virtual void RemoveFalseGametypeSpecificActors(void);
	virtual void ResetLights(void);
	virtual void ReconcileActors(void);
	virtual void RememberActors(void);
	virtual void Exec(wchar_t const*, dnOutputDevice&);
	virtual void ShrinkLevel(void);
	virtual void CompactActors(void);
	virtual void Listen(dnString&);
	virtual UBOOL IsServer(void);
	virtual void DropToFloor(AActor*);
	virtual void DestroyActor(AActor*, int);
	virtual void CleanupDestroyed(int);
	virtual void SpawnBrush(void);
	virtual void SpawnViewActor(UViewport*);
	virtual void SpawnNullActor(UClass*);
	virtual void SpawnPlayActor(UPlayer*, ENetRole, FURL const&, dnString&);
	virtual void SpawnNewPlayerClass(UPlayer*, ENetRole, wchar_t const*, dnString&);
	virtual void FindSpot(FVector const&, FVector&, int, int, AActor*);
	virtual void AdjustSpot(AActor*, FVector&, FVector, float, unsigned long, FCheckResult&);
	virtual void SinglePointCheck(FCheckResult&, FVector, FVector, ALevelInfo*, unsigned long, AActor*, AActor*);
	virtual void MultiPointCheck(dnMemStack&, FVector, FVector, ALevelInfo*, unsigned long, AActor*, AActor*);
	virtual void InitStats(void);
	virtual void GetStats(wchar_t*);
	virtual void TickDemoRecord(float);
	virtual void TickDemoPlayback(float);
	virtual void UpdateTime(ALevelInfo*);
	virtual void WelcomePlayer(UNetConnection*, wchar_t const*);
	virtual void TickMaterialExInstances(UViewport*, float);
	virtual void FlushMaterialExInstances(void);
	virtual void LockActors(void);
	virtual void UnLockActors(void);
	virtual void TickNetClient(float);
	virtual void TickNetServer(float);
	virtual void ServerTickClient(UNetConnection*, float, AActor**, int);
};

class ABrush;
class UModel;
enum ECsgOper;
struct FPoly;
struct FEdge;
enum ETexAlign;
enum ETAxis;
struct FSceneNode;
struct FColor;
struct dnFeedbackContext;

__declspec(dllimport) class UEditorEngine
{
public:
	virtual ~UEditorEngine() { }
	virtual void StupidUnreal1(void);
	virtual void StupidUnreal2(void);
	virtual void StupidUnreal3(void);
	virtual void StupidUnreal4(void);
	virtual void StupidUnreal5(void);
	virtual void StupidUnreal6(void);
	virtual void StupidUnreal7(void);
	virtual void StupidUnreal8(void);
	virtual void StupidUnreal9(void);
	virtual void StupidUnreal10(void);
	virtual void StupidUnreal11(void);
	virtual void StupidUnreal12(void);
	virtual void StupidUnreal13(void);
	virtual void StupidUnreal14(void);
	virtual void StupidUnreal15(void);
	virtual void StupidUnreal16(void);
	virtual void StupidUnreal17(void);
	virtual void StupidUnreal18(void);
	virtual void StupidUnreal19(void);
	virtual void StupidUnreal20(void);
	virtual void StupidUnreal21(void);
	virtual void StupidUnreal22(void);
	virtual void StupidUnreal23(void);
	virtual void StupidUnreal24(void);
	virtual void StupidUnreal25(void);
	virtual void StupidUnreal26(void);
	virtual void StupidUnreal27(void);
	virtual void StupidUnreal28(void);
	virtual void StupidUnreal29(void);
	virtual void StupidUnreal30(void);
	virtual void StupidUnreal31(void);
	virtual INT Key(UViewport* Viewport, EInputKey Key);
	virtual void InputEvent(UViewport*, EInputKey, EInputAction, float);
	virtual void Draw(UViewport*, int, unsigned char*, int*);
	virtual void MouseDelta(UViewport*, unsigned long, float, float);
	virtual void MousePosition(UViewport*, unsigned long, float, float);
	virtual void Click(UViewport*, unsigned long, float, float);
	virtual void FuckUnreal12(void);
	virtual void FuckUnreal10(void);
	virtual void FuckUnreal9(void);
	virtual void FuckUnreal8(void);
	virtual void FuckUnreal6(void);
	virtual void FuckUnreal7(void);
	virtual void FuckUnreal46(void);
	virtual void FuckUnreal5(void);
	virtual void FuckUnreal4(void);
	virtual void FuckUnreal3(void);
	virtual void FuckUnreal2(void);
	virtual void FuckUnreal(void);
	virtual void SafeExec(wchar_t const*, dnOutputDevice&);
	virtual void Cleanse(int, wchar_t const*);
	virtual void FinishAllSnaps(ULevel*);
	virtual void RedrawLevel(ULevel*);
	virtual void ResetSound(void);
	virtual void AddActor(ULevel*, UClass*, FVector, int);
	virtual void NoteSelectionChange(ULevel*);
	virtual void NoteActorMovement(ULevel*);
	virtual void SetPivot(FVector, int, int);
	virtual void ResetPivot(void);
	virtual void UpdatePropertiesWindows(void);
	virtual void CreateTrans(void);
	virtual void edcamSetMode(int);
	virtual void csgPrepMovingBrush(ABrush*);
	virtual void csgCopyBrush(ABrush*, ABrush*, unsigned long, unsigned long, int);
	virtual void csgAddOperation(ABrush*, ULevel*, unsigned long, ECsgOper);
	virtual void csgRebuild(ULevel*, int);
	virtual void csgGetName(ECsgOper);
	virtual void csgBrushReCenter(ULevel*, ABrush*);
	virtual void polyFindMaster(UModel*, int, FPoly&);
	virtual void polyUpdateMaster(UModel*, int, int, int);
	virtual void polyGetLinkedPolys(ABrush*, FPoly*, dnArray<FPoly>*);
	virtual void polyGetOuterEdgeList(dnArray<FPoly>*, dnArray<FEdge>*);
	virtual void polySplitOverlappingEdges(dnArray<FPoly>*, dnArray<FPoly>*);
	virtual void polyFindByFlags(UModel*, unsigned long, unsigned long, void (*)(UModel*, int));
	virtual void polyFindByBrush(UModel*, ABrush*, int, void (*)(UModel*, int));
	virtual void polySetAndClearPolyFlags(UModel*, unsigned long, unsigned long, int, int);
	virtual void polySetSurfaceTags(UModel*, int, dnName, int, int);
	virtual void SelectNone(ULevel*, int);
	virtual void SelectSetEvents(dnName, ULevel*, int);
	virtual void SelectSetMountParents(dnName, ULevel*, int);
	virtual void polyResetSelection(UModel*);
	virtual void polySelectAll(UModel*);
	virtual void polySelectMatchingGroups(UModel*);
	virtual void polySelectMatchingItems(UModel*);
	virtual void polySelectCoplanars(UModel*);
	virtual void polySelectAdjacents(UModel*);
	virtual void polySelectAdjacentWalls(UModel*);
	virtual void polySelectAdjacentFloors(UModel*);
	virtual void polySelectAdjacentSlants(UModel*);
	virtual void polySelectMatchingBrush(UModel*);
	virtual void polySelectMatchingTexture(UModel*);
	virtual void polySelectMatchingOldMaterial(UModel*);
	virtual void polySelectReverse(UModel*);
	virtual void polyMemorizeSet(UModel*);
	virtual void polyRememberSet(UModel*);
	virtual void polyXorSet(UModel*);
	virtual void polyUnionSet(UModel*);
	virtual void polyIntersectSet(UModel*);
	virtual void polySelectZone(UModel*);
	virtual void polyTexPan(UModel*, int, int, int);
	virtual void polyTexScale(UModel*, float, float, float, float, int);
	virtual void polyTexAlign(UModel*, ETexAlign, ETAxis, int, int);
	virtual void mapSelectOperation(ULevel*, ECsgOper);
	virtual void mapSelectFlags(ULevel*, unsigned long);
	virtual void mapSelectFirst(ULevel*);
	virtual void mapSelectLast(ULevel*);
	virtual void mapBrushGet(ULevel*);
	virtual void mapBrushPut(ULevel*);
	virtual void mapSendToFirst(ULevel*);
	virtual void mapSendToLast(ULevel*);
	virtual void mapSendToSwap(ULevel*);
	virtual void mapSetBrush(ULevel*, enum EMapSetBrushFlags, unsigned short, dnName, unsigned long, unsigned long, unsigned long, int);
	virtual void UpdateAllMasterPolys(UModel*, int);
	virtual void BuildSmoothingMasks(UModel*, int, int, float);
	virtual void ResetSmoothingMasks(UModel*, int);
	virtual void SetAndClearSmoothMasks(UModel*, unsigned long, unsigned long, int, int);
	virtual void edactSelectAll(ULevel*);
	virtual void edactSelectInside(ULevel*);
	virtual void edactSelectZoned(ULevel*);
	virtual void edactSelectInvert(ULevel*);
	virtual void edactSelectOfClass(ULevel*, UClass*);
	virtual void edactSelectSubclassOf(ULevel*, UClass*);
	virtual void edactSelectDeleted(ULevel*);
	virtual void edactDeleteSelected(ULevel*);
	virtual void edactCopySelected(ULevel*);
	virtual void edactPasteSelected(wchar_t const*, ULevel*, int);
	virtual void edactReplaceSelectedBrush(ULevel*);
	virtual void edactReplaceSelectedWithClass(ULevel*, UClass*);
	virtual void edactReplaceClassWithClass(ULevel*, UClass*, UClass*);
	virtual void edactAlignVertices(ULevel*);
	virtual void edactHideSelected(ULevel*);
	virtual void edactHideOutside(ULevel*);
	virtual void edactHideUnselected(ULevel*);
	virtual void edactUnHideAll(ULevel*);
	virtual void edactApplyTransform(ULevel*);
	virtual void edactApplyTransformToBrush(ABrush*);
	virtual void edactBoxSelect(UViewport*, ULevel*, FVector, FVector);
	virtual void bspRepartition(UModel*, int, int);
	virtual void bspAddVector(UModel*, FVector*, int);
	virtual void bspAddPoint(UModel*, FVector*, int);
	virtual void bspNodeToFPoly(UModel*, int, FPoly*);
	virtual void bspBuild(UModel*, enum EBspOptimization, int, int, int);
	virtual void bspRefresh(UModel*, int);
	virtual void bspCleanup(UModel*);
	virtual void bspBuildBounds(UModel*);
	virtual void bspBuildFPolys(UModel*, int, int);
	virtual void bspMergeCoplanars(UModel*, int, int);
	virtual void bspBrushCSG(ABrush*, UModel*, unsigned long, ECsgOper, int, int);
	virtual void bspModelCSG(UModel*, UModel*, unsigned long, ECsgOper, int, int);
	virtual void bspOptGeom(UModel*);
	virtual void bspValidateBrush(UModel*, int, int);
	virtual void bspUnlinkPolys(UModel*);
	virtual void bspAddNode(UModel*, int, enum ENodePlace, unsigned long, FPoly*);
	virtual void CreateModelFromBrushes(UObject*, struct FCoords&);
	virtual void shadowIlluminateBsp(ULevel*, int, int);
	virtual void TestVisibility(ULevel*, UModel*, int, int);
	virtual void MakeScripts(UClass*, dnFeedbackContext*, int, int, int);
	virtual void CheckScripts(dnFeedbackContext*, UClass*, dnOutputDevice&);
	virtual void ReCenterPatchActor(class APatchActor*);
	virtual void Get(wchar_t const*, wchar_t const*, dnOutputDevice&);
	virtual void Set(wchar_t const*, wchar_t const*, wchar_t const*);
	virtual void EdCallback(unsigned , int, unsigned long);
	virtual void SetZClipping(void);
	virtual void ResetZClipping(void);
	virtual void DrawFPoly(FSceneNode*, FPoly*, FColor);
	virtual void DrawFPolySolid(FSceneNode*, FPoly*, FColor);
	virtual void DrawGridSection(FSceneNode*, int, int, float, FVector*, FVector*, float*, float*, int, FColor, FColor);
	virtual void DrawWireBackground(FSceneNode*);
	virtual void Draw3DGridGround(FSceneNode*, float, int);
	virtual void DrawLevelBrushes(FSceneNode*);
	virtual void DrawLevelBrush(FSceneNode*, ABrush*, int);
	virtual void DrawBoundingBox(FSceneNode*, struct FBox*, AActor*);

	byte someKindaOfData[29];
	ULevel* level;

	// Any object that is capable of taking commands.
	class __declspec(dllimport) FExec
	{
	public:
		virtual UBOOL Exec(const TCHAR* cmd, dnOutputDevice& Ar = (dnOutputDevice&)globalLog);
	};

	dnArray<AActor*>* GetActorList()
	{
		return (dnArray<AActor*>*)(*((DWORD*)this + 33) + 44);
	}

	FExec exec;
};

extern UEditorEngine* GEditor;

extern void* (__fastcall* UObject__GetOuter)(void* _this, void* edx);

__declspec(dllimport) class dnOutputDevice {
public:
	virtual void Serialize(const TCHAR* Data, EName Event) { }
	virtual void Flush(void) { }
	virtual void FlushRealtime(void) { }
	virtual void PrintfArgList(wchar_t*, unsigned int, wchar_t const*, char*) { }
};

class dnOuputDeviceString {
public:
	virtual void		Flush(void) { }
	virtual void		FlushRealtime( void ) { }
	virtual void		PrintfArglist(const wchar_t* txt, unsigned int unknown, const wchar_t* txt2, char* temp) { }

	std::wstring		str;
};

extern dnOuputDeviceString GetPropResult;

extern void* globalLog;

class WViewportFrame;
class UViewport;

typedef struct {
	INT RendMap;
	FLOAT PctLeft, PctTop, PctRight, PctBottom;	// Percentages of the parent window client size (VSTYLE_Fixed)
	FLOAT Left, Top, Right, Bottom;				// Literal window positions (VSTYLE_Floatin)
	WViewportFrame* m_pViewportFrame;
} VIEWPORTCONFIG;

extern std::vector< VIEWPORTCONFIG> GViewports;
extern UViewport* globalInitViewport;

extern __declspec(dllimport) int r_ShowPortals;
//extern __declspec(dllimport) int r_AllowAlwaysVisible;

extern __declspec(dllimport) class FDnExec {
public:
	virtual UBOOL Exec(const TCHAR* Cmd, dnOutputDevice& Ar);
};

extern __declspec(dllimport) FDnExec* GDnExec;

#pragma warning(disable : 4996)

__declspec(dllimport) class UStruct {
public:
	UBOOL IsChildOf(const UStruct* SomeBase) const;
};

__declspec(dllimport) class UClass : public UStruct
{
public:
	//UEditorEngineVTable* vtable;

	const TCHAR* GetName(void) {
		dnName* name = (dnName*)(this + 32);
		return **name;
	}
	static UClass* StaticClass();

	UClass* GetSuperClass() const;
};

inline INT appStrnicmp(const TCHAR* A, const TCHAR* B, INT Count) {
	return _wcsnicmp(A, B, Count);
}
inline INT appStrlen(const TCHAR* String)
{
	return wcslen(String);
}

inline UBOOL appIsAlnum(TCHAR c)
{
	return (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || (c >= '0' && c <= '9');
}

//
// Sees if Stream starts with the named command.  If it does,
// skips through the command and blanks past it.  Returns 1 of match,
// 0 if not.
//
inline UBOOL ParseCommand
(
	const TCHAR** Stream,
	const TCHAR* Match
)
{

	while ((**Stream == ' ') || (**Stream == 9))
		(*Stream)++;

	if (appStrnicmp(*Stream, Match, appStrlen(Match)) == 0)
	{
		*Stream += appStrlen(Match);
		if (!appIsAlnum(**Stream))
		{
			while ((**Stream == ' ') || (**Stream == 9)) (*Stream)++;
			return 1; // Success.
		}
		else
		{
			*Stream -= appStrlen(Match);
			return 0; // Only found partial match.
		}
	}
	else return 0; // No match.
}

__declspec(dllimport) UBOOL ParseObject(const TCHAR* Stream, const TCHAR* Match, UClass* Class, UObject*& DestRes, UObject* InParent);

template< class T > UBOOL ParseObject(const TCHAR* Stream, const TCHAR* Match, T*& Obj, UObject* Outer)
{
	return ParseObject(Stream, Match, T::StaticClass(), *(UObject**)&Obj, Outer);
}

__declspec(dllimport) class UPackage {
public:

};


/*----------------------------------------------------------------------------
	Object iterators.
----------------------------------------------------------------------------*/

//
// Class for iterating through all objects.
//
class FObjectIterator
{
public:
	FObjectIterator(UClass* InClass = UObject::StaticClass())
		: Class(InClass), Index(-1)
	{
		//check(Class);
		++* this;
	}
	void operator++()
	{
		while (++Index < UObject::GObjObjects->Num() && (!UObject::GObjObjects->Get(Index) || !UObject::GObjObjects->Get(Index)->IsA(Class)));
	}
	UObject* operator*()
	{
		return UObject::GObjObjects->Get(Index);
	}
	UObject* operator->()
	{
		return UObject::GObjObjects->Get(Index);
	}
	operator UBOOL()
	{
		return Index < UObject::GObjObjects->Num();
	}
protected:
	UClass* Class;
	INT Index;
};

//
// Class for iterating through all objects which inherit from a
// specified base class.
//
template< class T > class TObjectIterator : public FObjectIterator
{
public:
	TObjectIterator()
		: FObjectIterator(T::StaticClass())
	{}
	T* operator* ()
	{
		return (T*)FObjectIterator::operator*();
	}
	T* operator-> ()
	{
		return (T*)FObjectIterator::operator->();
	}
};

__declspec(dllimport) INT appGetVarArgs(TCHAR* Dest, INT Count, const TCHAR*& Fmt);

// Special canonical package for FindObject, ParseObject.
#define ANY_PACKAGE ((UPackage*)-1)
#define ARRAY_COUNT(XXX) (sizeof(XXX)/sizeof(*(XXX)))
#define GET_VARARGS(msg,len,fmt) appGetVarArgs(msg,len,fmt)

__forceinline std::wstring VAPrintf(const TCHAR* Fmt, ...)
{
	TCHAR TempStr[4096];
	GET_VARARGS(TempStr, ARRAY_COUNT(TempStr), Fmt);
	return TempStr;
}

__declspec(dllimport) UBOOL ParseUBOOL(const TCHAR* Stream, const TCHAR* Match, UBOOL& OnOff);

//
// Get a static result string.
//
static TCHAR* appStaticString1024()
{
	static TCHAR Results[256][1024];
	static INT Count = 0;
	TCHAR* Result = Results[Count++ & 255];
	*Result = 0;
	return Result;
}

inline TCHAR    FromAnsi(ANSICHAR In) { return (BYTE)In; }


inline const TCHAR* appFromAnsi(const ANSICHAR* ACh)
{
	if (!ACh)
		return NULL;
	TCHAR* Ch = appStaticString1024();
	INT Count;
	for (Count = 0; Count < 1024 - 1 && ACh[Count]; Count++)
		Ch[Count] = FromAnsi(ACh[Count]);
	Ch[Count] = 0;
	return Ch;
}

/*-----------------------------------------------------------------------------
	Unicode support.
-----------------------------------------------------------------------------*/

#define RegSetValueExX(a,b,c,d,e,f)		TCHAR_CALL_OS(RegSetValueExW(a,b,c,d,e,f),RegSetValueExA(a,TCHAR_TO_ANSI(b),c,d,(BYTE*)TCHAR_TO_ANSI((TCHAR*)e),f))
#define RegSetValueX(a,b,c,d,e)			TCHAR_CALL_OS(RegSetValueW(a,b,c,d,e),RegSetValueA(a,TCHAR_TO_ANSI(b),c,TCHAR_TO_ANSI(d),e))
#define RegCreateKeyX(a,b,c)			TCHAR_CALL_OS(RegCreateKeyW(a,b,c),RegCreateKeyA(a,TCHAR_TO_ANSI(b),c))
#define RegQueryValueX(a,b,c,d)			TCHAR_CALL_OS(RegQueryValueW(a,b,c,d),RegQueryValueW(a,TCHAR_TO_ANSI(b),TCHAR_TO_ANSI(c),d))
#define RegOpenKeyX(a,b,c)				TCHAR_CALL_OS(RegOpenKeyW(a,b,c),RegOpenKeyA(a,TCHAR_TO_ANSI(b),c))
#define RegDeleteKeyX(a,b)				TCHAR_CALL_OS(RegDeleteKeyW(a,b),RegDeleteKeyA(a,TCHAR_TO_ANSI(b)))
#define RegDeleteValueX(a,b)			TCHAR_CALL_OS(RegDeleteValueW(a,b),RegDeleteValueA(a,TCHAR_TO_ANSI(b)))
#define RegQueryInfoKeyX(a,b)			TCHAR_CALL_OS(RegQueryInfoKeyW(a,NULL,NULL,NULL,b,NULL,NULL,NULL,NULL,NULL,NULL,NULL),RegQueryInfoKeyA(a,NULL,NULL,NULL,b,NULL,NULL,NULL,NULL,NULL,NULL,NULL))
#define RegOpenKeyExX(a,b,c,d,e)        TCHAR_CALL_OS(RegOpenKeyExW(a,b,c,d,e),RegOpenKeyExA(a,TCHAR_TO_ANSI(b),c,d,e))
#define LookupPrivilegeValueX(a,b,c)	TCHAR_CALL_OS(LookupPrivilegeValueW(a,b,c),LookupPrivilegeValueA(TCHAR_TO_ANSI(a),TCHAR_TO_ANSI(b),c))
#define GetDriveTypeX(a)				TCHAR_CALL_OS(GetDriveTypeW(a),GetDriveTypeA(TCHAR_TO_ANSI(a)))
#define GetDiskFreeSpaceX(a,b,c,d,e)	TCHAR_CALL_OS(GetDiskFreeSpaceW(a,b,c,d,e),GetDiskFreeSpaceA(TCHAR_TO_ANSI(a),b,c,d,e))
#define SetFileAttributesX(a,b)			TCHAR_CALL_OS(SetFileAttributesW(a,b),SetFileAttributesA(TCHAR_TO_ANSI(a),b))
#define DrawTextExX(a,b,c,d,e,f)		TCHAR_CALL_OS(DrawTextExW(a,b,c,d,e,f),DrawTextExA(a,const_cast<ANSICHAR*>(TCHAR_TO_ANSI(b)),c,d,e,f))
#define DrawTextX(a,b,c,d,e)			TCHAR_CALL_OS(DrawTextW(a,b,c,d,e),DrawTextA(a,TCHAR_TO_ANSI(b),c,d,e))
#define GetTextExtentPoint32X(a,b,c,d)  TCHAR_CALL_OS(GetTextExtentPoint32W(a,b,c,d),GetTextExtentPoint32A(a,TCHAR_TO_ANSI(b),c,d))
#define DefMDIChildProcX(a,b,c,d)		TCHAR_CALL_OS(DefMDIChildProcW(a,b,c,d),DefMDIChildProcA(a,b,c,d))
#define SetClassLongX(a,b,c)			TCHAR_CALL_OS(SetClassLongW(a,b,c),SetClassLongA(a,b,c))
#define GetClassLongX(a,b)				TCHAR_CALL_OS(GetClassLongW(a,b),GetClassLongA(a,b))
#define RemovePropX(a,b)				TCHAR_CALL_OS(RemovePropW(a,b),RemovePropA(a,TCHAR_TO_ANSI(b)))
#define GetPropX(a,b)					TCHAR_CALL_OS(GetPropW(a,b),GetPropA(a,TCHAR_TO_ANSI(b)))
#define SetPropX(a,b,c)					TCHAR_CALL_OS(SetPropW(a,b,c),SetPropA(a,TCHAR_TO_ANSI(b),c))
#define ShellExecuteX(a,b,c,d,e,f)      TCHAR_CALL_OS(ShellExecuteW(a,b,c,d,e,f),ShellExecuteA(a,TCHAR_TO_ANSI(b),TCHAR_TO_ANSI(c),TCHAR_TO_ANSI(d),TCHAR_TO_ANSI(e),f))
#define CreateMutexX(a,b,c)				TCHAR_CALL_OS(CreateMutexW(a,b,c),CreateMutexA(a,b,TCHAR_TO_ANSI(c)))
#define DefFrameProcX(a,b,c,d,e)		TCHAR_CALL_OS(DefFrameProcW(a,b,c,d,e),DefFrameProcA(a,b,c,d,e))
#define RegisterWindowMessageX(a)       TCHAR_CALL_OS(RegisterWindowMessageW(a),RegisterWindowMessageA(TCHAR_TO_ANSI(a)))
#define AppendMenuX(a,b,c,d)            TCHAR_CALL_OS(AppendMenuW(a,b,c,d),AppendMenuA(a,b,c,TCHAR_TO_ANSI(d)))
#define LoadLibraryX(a)					TCHAR_CALL_OS(LoadLibraryW(a),LoadLibraryA(TCHAR_TO_ANSI(a)))
#define SystemParametersInfoX(a,b,c,d)	TCHAR_CALL_OS(SystemParametersInfoW(a,b,c,d),SystemParametersInfoA(a,b,c,d))
#define DispatchMessageX(a)				TCHAR_CALL_OS(DispatchMessageW(a),DispatchMessageA(a))
#define PeekMessageX(a,b,c,d,e)			TCHAR_CALL_OS(PeekMessageW(a,b,c,d,e),PeekMessageA(a,b,c,d,e))
#define PostMessageX(a,b,c,d)			TCHAR_CALL_OS(PostMessageW(a,b,c,d),PostMessageA(a,b,c,d))
#define SendMessageX(a,b,c,d)			TCHAR_CALL_OS(SendMessageW(a,b,c,d),SendMessageA(a,b,c,d))
#define SendMessageLX(a,b,c,d)			TCHAR_CALL_OS(SendMessageW(a,b,c,(LPARAM)d),SendMessageA(a,b,c,(LPARAM)TCHAR_TO_ANSI(d)))
#define SendMessageWX(a,b,c,d)			TCHAR_CALL_OS(SendMessageW(a,b,(WPARAM)c,d),SendMessageA(a,b,(WPARAM)TCHAR_TO_ANSI(c),d))
#define DefWindowProcX(a,b,c,d)			TCHAR_CALL_OS(DefWindowProcW(a,b,c,d),DefWindowProcA(a,b,c,d))
#define CallWindowProcX(a,b,c,d,e)		TCHAR_CALL_OS(CallWindowProcW(a,b,c,d,e),CallWindowProcA(a,b,c,d,e))
#define GetWindowLongX(a,b)				TCHAR_CALL_OS(GetWindowLongW(a,b),GetWindowLongA(a,b))
#define SetWindowLongX(a,b,c)			TCHAR_CALL_OS(SetWindowLongW(a,b,c),SetWindowLongA(a,b,c))
#define LoadMenuIdX(i,n)				TCHAR_CALL_OS(LoadMenuW(i,MAKEINTRESOURCEW(n)),LoadMenuA(i,MAKEINTRESOURCEA(n)))
#define LoadCursorIdX(i,n)				TCHAR_CALL_OS(LoadCursorW(i,MAKEINTRESOURCEW(n)),LoadCursorA(i,MAKEINTRESOURCEA(n)))


extern BOOL			dumpTobrowserOut;

//
// String output device.
//
class FStringOutputDevice : public dnOutputDevice, public dnString
{
public:
	FStringOutputDevice(const TCHAR* InStr = TEXT(""))
		: dnString(InStr)
	{}
	virtual void Serialize(const TCHAR* Data, EName Event) override
	{
		*this += (TCHAR*)Data;
	}
};

extern void* (*AColisionVolume__StaticClass)(void);

__declspec(dllimport) struct FBuilderPoly;

__declspec(dllimport) class UBrushBuilder : public UObject
{
public:
	dnString		 BitmapFilename;
	dnString		 ToolTip;
	dnArray<FVector> Vertices;
	dnArray<FBuilderPoly> Polys;
	dnName Group;
	BITFIELD MergeCoplanars;

	float			Breadth;
	float			width;
	float			height;

	static UClass* StaticClass();

	BITFIELD __fastcall eventBuild(void);
};

// Construct an object of a particular class.
template< class T > T* ConstructObject(UClass* Class, UObject* Outer = (UObject*)-1, dnName Name = NAME_None, DWORD SetFlags = 0)
{
	if (Outer == (UObject*)-1)
		Outer = (UObject*)UObject::GetTransientPackage();
	return (T*)UObject::StaticConstructObject(Class, Outer, Name, SetFlags, nullptr, (dnOutputDevice *)globalLog, nullptr);
}

template <class T> void* operator new(size_t Size, TArray<T>& Array, INT Index)
{
	Array.Insert(Index, 1, sizeof(T));
	return &Array(Index);
}

template <class T> void* operator new(size_t Size, TArray<T>& Array)
{
	INT Index = Array.Add(1, sizeof(T));
	return &Array(Index);
}

__declspec(dllimport) extern unsigned long GCurrentViewport;

enum EViewportShowFlags
{
	SHOW_Frame = 0x00000001, 	// Show world bounding cube.
	SHOW_ActorRadii = 0x00000002, 	// Show actor collision radii.
	SHOW_Backdrop = 0x00000004, 	// Show background scene.
	SHOW_Actors = 0x00000008,	// Show actors.
	SHOW_Coords = 0x00000010,	// Show brush/actor coords.
	SHOW_ActorIcons = 0x00000020,	// Show actors as icons.
	SHOW_Brush = 0x00000040,	// Show the active brush.
	SHOW_StandardView = 0x00000080,	// Viewport is a standard view.
	SHOW_EdViewport = 0x00000100,	// This is a special editor viewport and shouldn't have it's level reset by level loads
	SHOW_ChildWindow = 0x00000200,	// Show as true child window.
	SHOW_MovingBrushes = 0x00000400,	// Show moving brushes.
	SHOW_PlayerCtrl = 0x00000800,	// Player controls are on.
	SHOW_Paths = 0x00001000,   // Show paths.
	SHOW_KarmaMassProps = 0x00002000,   // Show Karma mass properties (centre-of-mass, inertia tensor)
	SHOW_RealTime = 0x00004000,	// Update window in realtime.
	SHOW_StaticMeshes = 0x00008000,	// Show static meshes.
	SHOW_EventLines = 0x00010000,   // Show event lines (from triggers, etc)
	SHOW_SelectionHighlight = 0x00020000,   // Show green highlights on selections?
	SHOW_Terrain = 0x00040000,	// Show terrain.
	SHOW_DistanceFog = 0x00080000,	// Show distance fog.
	SHOW_MatRotations = 0x00100000,	// Show rotation indicators (matinee preview windows)
	SHOW_MatPaths = 0x00200000,	// Show the path itself (matinee preview windows)
	SHOW_Coronas = 0x00400000,	// Show coronas.
	SHOW_Volumes = 0x00800000,	// Show volume brushes.
	SHOW_Particles = 0x01000000,	// Show pahticuls.
	SHOW_BSP = 0x02000000,	// Show BSP surfaces.
	SHOW_ActorInfo = 0x04000000,	// Shows extended information about actors (class name, event, tag, etc)
	SHOW_KarmaPrimitives = 0x08000000,   // Show Karma collision primitives.
	SHOW_FluidSurfaces = 0x10000000,	// Show simulated fluid surfaces.
	SHOW_Projectors = 0x20000000,	// Show projectors.
	SHOW_NoFallbackMaterials = 0x40000000,	// Don't evaluate fallback materials.
	SHOW_Collision = 0x80000000	// Show simple collision for static meshes etc.
};
