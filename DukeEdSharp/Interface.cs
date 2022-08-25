﻿using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Forms;
using System.Runtime.InteropServices;
using DllExporterNet4;
using System.Diagnostics;

namespace DukeEdSharp
{
    public class EditorInterface
    {
        static BrowserFrm browserFrm = new BrowserFrm();
        static BrushScale brushScaleForm = new BrushScale();
        static BrushProperties brushProperties = new BrushProperties();
        static EditorMidiFrm midiFrm = new EditorMidiFrm();

        public static int GWL_STYLE = -16;
        public static int WS_CHILD = 0x40000000;

        private static void SetFormParent(Form frm, IntPtr parentHandle)
        {
            SetWindowLong(frm.Handle, GWL_STYLE, GetWindowLong(frm.Handle, GWL_STYLE) | WS_CHILD);
            SetParent(frm.Handle, parentHandle);
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
        public static extern IntPtr DukeSharp_CreateEditorViewport(IntPtr hWnd, int RendMap);

        [DllImport("dnfedit.dll", CharSet = CharSet.Unicode)]
        public static extern void DukeSharp__ResizeViewport(IntPtr m_pViewport, int width, int height);

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
        public static void InitBrowser()
        {
            browserFrm.PopulateActorClassList();
        }

        [DllExport]
        public static void EditorResize(int width, int height)
        {
            midiFrm.WindowState = FormWindowState.Normal;
            midiFrm.Size = new System.Drawing.Size(width, height);
            midiFrm.WindowState = FormWindowState.Maximized;
        }

        [DllExport]
        public static IntPtr PostInit(IntPtr backgroundHolderHwnd)
        {
            if(backgroundHolderHwnd == IntPtr.Zero)
            {
                browserFrm.Show();
                browserFrm.Focus();

                return IntPtr.Zero;
            }

            SetFormParent(midiFrm, backgroundHolderHwnd);
            midiFrm.Show();

            SetFormParent(browserFrm, midiFrm.Handle);
            SetFormParent(brushScaleForm, midiFrm.Handle);
            SetFormParent(brushProperties, midiFrm.Handle);

            browserFrm.Show();
            browserFrm.Focus();                        

            return midiFrm.Handle;
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
