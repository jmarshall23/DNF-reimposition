using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Runtime.InteropServices;

namespace DukeEdSharp
{
    public partial class BrowserFrm : Form
    {
        public BrowserFrm()
        {
            InitializeComponent();

            this.FormClosing += BrowserFrm_FormClosing;
        }

        private void BrowserFrm_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (e.CloseReason == CloseReason.UserClosing)
            {
                e.Cancel = true;
                Hide();
            }
        }

        public void PopulateActorClassList()
        {
            IntPtr listStrptr = EditorInterface.DukeSharp_FindActorClasses();
            string list = Marshal.PtrToStringAuto(listStrptr);
            string[] actorList = list.Split(',');

            Array.Sort(actorList, (x, y) => String.Compare(x, y));

            foreach (string s in actorList)
            {
                actorClassList.Items.Add(s.Remove(0, 1));
            }
        }

        private void actorClassPage_Click(object sender, EventArgs e)
        {

        }

        private void placeEntityToolStripMenuItem_Click(object sender, EventArgs e)
        {
            string s = "ACTOR ADD CLASS=" + actorClassList.SelectedItems[0];
            EditorInterface.DukeSharp_Exec(s);
        }

        private void listFilterTxt_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
