
#pragma once

__declspec(dllimport) class UWindowsViewport : public UViewport {
public:
	virtual ~UWindowsViewport() { }
	virtual void ProcessEvent(void*, void*, void*) { }
	virtual void ProcessDelegate(dnName, void*, void*, void*) { }
	virtual void stupid_unreal1(void) { }
	virtual void stupid_unreal2(void) { }
	virtual void stupid_unreal3(void) { }
	virtual void stupid_unreal4(void) { }
	virtual void Destroy(void);
	virtual void Serialize(dnArchive&);
	virtual void stupid_unreal5(void) { }
	virtual void stupid_unreal6(void) { }
	virtual void stupid_unreal7(void) { }
	virtual void stupid_unreal8(void) { }
	virtual void stupid_unreal9(void) { }
	virtual void InitExecution(void);
	virtual void ShutdownAfterError(void);
	virtual void stupid_unreal10(void) { }
	virtual void stupid_unreal11(void) { }
	virtual void stupid_unreal12(void) { }
	virtual void stupid_unreal13(void) { }
	virtual void stupid_unreal14(void) { }
	virtual void stupid_unreal15(void) { }
	virtual void stupid_unreal16(void) { }
	virtual void ReadInput(FLOAT DeltaSeconds);
	virtual UBOOL IsUsingGamepad(void);
	virtual UBOOL IsUsingMouse(void);
	virtual int GetInputKeyState(int);
	virtual UBOOL HasFocus(void);
	virtual void ClearInput(void);
	virtual void FullscreenMinimized(void);
	virtual void PingInputDevices(void);
	virtual void SetDrag(int);
	virtual UBOOL IsFullscreen(void);
	virtual void Lock(struct FPlane, unsigned long, unsigned char*, int*);
	virtual void ResizeViewport(unsigned long, int, int, int, int);
	virtual void Unlock(int, int);
	virtual void Present(void);
	virtual void SetModeCursor(void);
	virtual void UpdateWindowFrame(void);
	virtual void OpenWindow(HWND hwnd, UBOOL, int, int, int, int);
	virtual void CloseWindow(void);
	virtual void UpdateInput(int);
	virtual void* GetWindow(void);
	virtual UBOOL IsClosing(void);
	virtual void SetMouseCapture(int, int, int);
	virtual void Repaint(int);
	virtual void TryRenderDevice(wchar_t const*, int, int, int, int);
};
