using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Forms;
using System.Runtime.InteropServices;
using DllExporterNet4;

namespace DukeEdSharp
{
    public class EditorInterface
    {
        static BrowserFrm browserFrm = new BrowserFrm();
        static BrushScale brushScaleForm = new BrushScale();
        static BrushProperties brushProperties = new BrushProperties();

        public static int GWL_STYLE = -16;
        public static int WS_CHILD = 0x40000000;

        private static void SetFormParent(Form frm)
        {
            SetWindowLong(frm.Handle, GWL_STYLE, GetWindowLong(frm.Handle, GWL_STYLE) | WS_CHILD);
            SetParent(frm.Handle, DukeSharp_GetParentWindow());
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
        private static extern IntPtr DukeSharp_CreateTextureViewport(IntPtr hWnd);

        [DllImport("dnfedit.dll", CharSet = CharSet.Unicode)]
        private static extern int DukeSharp_GetClassFlags([MarshalAs(UnmanagedType.LPWStr)] string clsname);

        [DllImport("dnfedit.dll", CharSet = CharSet.Unicode)]
        public static extern void DukeSharp_ToggleEditor(bool flag);

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

        public static string Get(string topic, string command)
        {
            IntPtr ptr = DukeSharp_Get(topic, command);
            string tmp = Marshal.PtrToStringAuto(ptr);
            return tmp;
        }

        [DllExport]
        public static void InitBrowser()
        {
            browserFrm.PopulateActorClassList();
        }

        [DllExport]
        public static void PostInit()
        {
            SetFormParent(browserFrm);
            SetFormParent(brushScaleForm);
            SetFormParent(brushProperties);

            browserFrm.Show();
            browserFrm.Focus();
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
    }
}
