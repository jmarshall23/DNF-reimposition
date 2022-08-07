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
