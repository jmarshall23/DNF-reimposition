using System;
using System.Collections.Generic;
using System.Text;
using System.Runtime.InteropServices;
using DllExporterNet4;

namespace DukeEdSharp
{
    public class EditorInterface
    {
        static BrowserFrm browserFrm = new BrowserFrm();

       [DllImport("dnfedit.dll")]
        public static extern IntPtr DukeSharp_FindActorClasses();

        [DllImport("dnfedit.dll", CharSet = CharSet.Unicode)]
        public static extern void DukeSharp_Exec([MarshalAs(UnmanagedType.LPWStr)] string exec);

        [DllImport("dnfedit.dll", CharSet = CharSet.Unicode)]
        private static extern IntPtr DukeSharp_Get([MarshalAs(UnmanagedType.LPWStr)] string topic, [MarshalAs(UnmanagedType.LPWStr)] string command);


        [DllImport("dnfedit.dll", CharSet = CharSet.Unicode)]
        private static extern IntPtr DukeSharp_CreateTextureViewport(IntPtr hWnd);

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
            browserFrm.Show();
            browserFrm.PopulateActorClassList();
        }

        [DllExport]
        public static void PostInit()
        {
            browserFrm.Show();
            browserFrm.Focus();
        }
    }
}
