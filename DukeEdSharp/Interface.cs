using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Forms;
using System.Runtime.InteropServices;
using DllExporterNet4;
using System.Diagnostics;
using System.Windows.Input;
using System.Threading.Tasks;

namespace DukeEdSharp
{
    public class EditorInterface
    {
        static public EditorFrame mainFrm = new EditorFrame();
        static public BrowserFrm browserFrm = new BrowserFrm();
        static public BrushScale brushScaleForm = new BrushScale();
        static public BrushProperties brushProperties = new BrushProperties();
        //static public EditorMidiFrm midiFrm = new EditorMidiFrm();
        static public ViewportFrm mainViewportFrm = new ViewportFrm();

        public static int GWL_STYLE = -16;
        public static int WS_CHILD = 0x40000000;

        [DllImport("dnfedit.dll", CharSet = CharSet.Unicode)]
        public static extern void DukeSharp_RunLocalCommand(int Command, IntPtr hWnd);

        private static void SetFormParent(Form frm, IntPtr parentHandle)
        {
            SetWindowLong(frm.Handle, GWL_STYLE, GetWindowLong(frm.Handle, GWL_STYLE) | WS_CHILD);
            SetParent(frm.Handle, parentHandle);
        }

        [DllImport("dwmapi.dll", CharSet = CharSet.Unicode, PreserveSig = false)]
        public static extern void DwmSetWindowAttribute(IntPtr hwnd,
                                              DWMWINDOWATTRIBUTE attribute,
                                              ref DWM_WINDOW_CORNER_PREFERENCE pvAttribute,
                                              uint cbAttribute);

        // The DWM_WINDOW_CORNER_PREFERENCE enum for DwmSetWindowAttribute's third parameter, which tells the function
        // what value of the enum to set.
        // Copied from dwmapi.h
        public enum DWM_WINDOW_CORNER_PREFERENCE : uint
        {
            DWMWCP_DEFAULT = 0,
            DWMWCP_DONOTROUND = 1,
            DWMWCP_ROUND = 2,
            DWMWCP_ROUNDSMALL = 3
        }

        public enum DWMWINDOWATTRIBUTE : uint
        {
            DWMWA_NCRENDERING_ENABLED,
            DWMWA_NCRENDERING_POLICY,
            DWMWA_TRANSITIONS_FORCEDISABLED,
            DWMWA_ALLOW_NCPAINT,
            DWMWA_CAPTION_BUTTON_BOUNDS,
            DWMWA_NONCLIENT_RTL_LAYOUT,
            DWMWA_FORCE_ICONIC_REPRESENTATION,
            DWMWA_FLIP3D_POLICY,
            DWMWA_EXTENDED_FRAME_BOUNDS,
            DWMWA_HAS_ICONIC_BITMAP,
            DWMWA_DISALLOW_PEEK,
            DWMWA_EXCLUDED_FROM_PEEK,
            DWMWA_CLOAK,
            DWMWA_CLOAKED,
            DWMWA_FREEZE_REPRESENTATION,
            DWMWA_PASSIVE_UPDATE_MODE,
            DWMWA_USE_HOSTBACKDROPBRUSH,
            DWMWA_USE_IMMERSIVE_DARK_MODE = 20,
            DWMWA_WINDOW_CORNER_PREFERENCE = 33,
            DWMWA_BORDER_COLOR,
            DWMWA_CAPTION_COLOR,
            DWMWA_TEXT_COLOR,
            DWMWA_VISIBLE_FRAME_BORDER_THICKNESS,
            DWMWA_SYSTEMBACKDROP_TYPE,
            DWMWA_LAST
        }

        [DllImport("user32.dll")]
        public static extern int SetWindowLong(IntPtr hWnd, int nIndex, int dwNewLong);

        [DllImport("user32.dll")]
        public static extern int GetWindowLong(IntPtr hWnd, int nIndex);

        [DllImport("dnfedit.dll")]
        public static extern IntPtr DukeSharp_GetParentWindow();

        [DllImport("user32.dll", SetLastError = true)]
        public static extern IntPtr SetParent(IntPtr hWndChild, IntPtr hWndNewParent);

        [DllImport("dnfedit.dll")]
        public static extern void DukeSharp_BuildBrush(float x, float y, float z);

       [DllImport("dnfedit.dll")]
        public static extern IntPtr DukeSharp_FindActorClasses();

        [DllImport("dnfedit.dll", CharSet = CharSet.Unicode)]
        public static extern void DukeSharp_Exec([MarshalAs(UnmanagedType.LPWStr)] string exec);

        [DllImport("dnfedit.dll", CharSet = CharSet.Unicode)]
        private static extern IntPtr DukeSharp_Get([MarshalAs(UnmanagedType.LPWStr)] string topic, [MarshalAs(UnmanagedType.LPWStr)] string command);

        [DllImport("dnfedit.dll", CharSet = CharSet.Unicode)]
        public static extern void DukeSharp_SetPreviewStaticMesh([MarshalAs(UnmanagedType.LPWStr)] string package, [MarshalAs(UnmanagedType.LPWStr)] string group, [MarshalAs(UnmanagedType.LPWStr)] string mesh);
        
        [DllImport("dnfedit.dll", CharSet = CharSet.Unicode)]
        public static extern void DukeSharp_AddStaticModelToLevel();

        [DllImport("dnfedit.dll", CharSet = CharSet.Unicode)]
        private static extern IntPtr DukeSharp_CreateTextureViewport(IntPtr hWnd);

        [DllImport("dnfedit.dll", CharSet = CharSet.Unicode)]
        private static extern IntPtr DukeSharp_CreateStaticMeshViewport(IntPtr hWnd);

        [DllImport("dnfedit.dll", CharSet = CharSet.Unicode)]
        private static extern int DukeSharp_GetClassFlags([MarshalAs(UnmanagedType.LPWStr)] string clsname);

        [DllImport("dnfedit.dll", CharSet = CharSet.Unicode)]
        public static extern void DukeSharp_ToggleEditor(bool flag);


        [DllImport("dnfedit.dll", CharSet = CharSet.Unicode)]
        public static extern void DukeSharp_RemoveCollisionAndPortalsBeta();

        [DllImport("dnfedit.dll", CharSet = CharSet.Unicode)]
        public static extern IntPtr DukeSharp_CreateEditorViewport(IntPtr hWnd, int RendMap);

        [DllImport("dnfedit.dll", CharSet = CharSet.Unicode)]
        public static extern void DukeSharp__ResizeViewport(IntPtr m_pViewport, int width, int height);

        [DllImport("dnfedit.dll", CharSet = CharSet.Unicode)]
        public static extern void DukeSharp_SetViewportType(IntPtr m_pViewport, int type);

        [DllImport("dnfedit.dll", CharSet = CharSet.Unicode)]
        public static extern int DukeSharp_GetNumLevelActors();

        [DllImport("dnfedit.dll", CharSet = CharSet.Unicode)]
        public static extern string DukeSharp_GetLevelActorList();

        [DllImport("dnfedit.dll", CharSet = CharSet.Unicode)]
        public static extern void DukeSharp_SelectEntity([MarshalAs(UnmanagedType.LPWStr)] string name);

        public static string[] GetLevelActorList()
        {
            string s = DukeSharp_GetLevelActorList();
            string[] names = s.Split('|');

            Array.Sort(names, (x, y) => String.Compare(x, y));

            return names;
        }

        public static int GetClassFlags(string clsname)
        {
            return DukeSharp_GetClassFlags(clsname);
        }

        public static bool IsClassPlaceable(string clsname)
        {
            return (GetClassFlags(clsname) & 0x02000) != 0;
        }

        public static IntPtr CreateTextureViewport(IntPtr hWnd)
        {
            return DukeSharp_CreateTextureViewport(hWnd);
        }

        public static IntPtr CreateStaticMeshViewport(IntPtr hWnd)
        {
            return DukeSharp_CreateStaticMeshViewport(hWnd);
        }

        public static string Get(string topic, string command)
        {
            IntPtr ptr = DukeSharp_Get(topic, command);
            string tmp = Marshal.PtrToStringAuto(ptr);
            return tmp;
        }

        [DllExport]
        public static void Tick(float DeltaSeconds)
        {
#if false
            if (EditorInterface.ApplicationIsActivated())
            {
                
            }
#endif
        }

        [DllExport]
        public static void InitBrowser()
        {
            browserFrm.PopulateActorClassList();
        }

        [DllExport]
        public static void EditorResize(int width, int height)
        {
            mainViewportFrm.WindowState = FormWindowState.Normal;
            mainViewportFrm.Size = new System.Drawing.Size(width, height);
            mainViewportFrm.WindowState = FormWindowState.Maximized;
        }

        [DllExport]
        public static IntPtr PostInit(IntPtr backgroundHolderHwnd)
        {
            mainFrm.Show();
            //
            mainFrm.DockMidiFrm(mainViewportFrm);
            mainViewportFrm.Show();

            mainViewportFrm.SetRendMap(5);

            //SetFormParent(browserFrm, mainFrm.GetMainPanelHwnd());

            mainFrm.Init();
            mainFrm.AttachBrowserFrm(browserFrm);

            //SetFormParent(browserFrm, mainViewportFrm.Handle);
            //SetFormParent(brushScaleForm, mainViewportFrm.Handle);
            //SetFormParent(brushProperties, mainViewportFrm.Handle);

            browserFrm.Show();
            browserFrm.Focus();                        

            return mainViewportFrm.Handle;
        }

        [DllExport]
        public static void ShowBrushScale()
        {
            brushScaleForm.Show();
            brushScaleForm.Focus();
        }

        [DllExport]
        public static void ShowBrushProperties(float x, float y, float z)
        {
            brushProperties.ShowBrushProperties(x, y, z);
        }

        public static bool ApplicationIsActivated()
        {
            var activatedHandle = GetForegroundWindow();
            if (activatedHandle == IntPtr.Zero)
            {
                return false;       // No window is currently activated
            }

            var procId = Process.GetCurrentProcess().Id;
            int activeProcId;
            GetWindowThreadProcessId(activatedHandle, out activeProcId);

            return activeProcId == procId;
        }


        [DllImport("user32.dll", CharSet = CharSet.Auto, ExactSpelling = true)]
        private static extern IntPtr GetForegroundWindow();

        [DllImport("user32.dll", CharSet = CharSet.Auto, SetLastError = true)]
        private static extern int GetWindowThreadProcessId(IntPtr handle, out int processId);
    }
}
