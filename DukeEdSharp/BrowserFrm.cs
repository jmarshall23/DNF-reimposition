using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Runtime.InteropServices;
using System.Threading;
using System.IO;

namespace DukeEdSharp
{
    public partial class BrowserFrm : Form
    {
        private string soundPackageName;

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

        private void exitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            
        }

        private void RefreshSoundList()
        {
            string temp = EditorInterface.Get("OBJ", "QUERY TYPE=Sound PACKAGE=\"" + soundPackageName + "\"");
            string[] sounds = temp.Split(' ');

            soundPackageListBox.Items.Clear();

            foreach(string s in sounds)
            {
                soundPackageListBox.Items.Add(s);
            }
        }
        private void openToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            var fileContent = string.Empty;
            var filePath = string.Empty;

            Thread t = new Thread((ThreadStart)(() => {
                OpenFileDialog openFileDialog = new OpenFileDialog();
                openFileDialog.InitialDirectory = "..\\sounds\\";
                openFileDialog.Filter = "Sound Packages (*.dfx)|*.dfx|All files (*.*)|*.*";
                openFileDialog.FilterIndex = 2;
                openFileDialog.RestoreDirectory = true;

                if (openFileDialog.ShowDialog() == DialogResult.OK)
                {
                    //Get the path of specified file
                    filePath = openFileDialog.FileName;
                }
            }));

            // Run your code from a thread that joins the STA Thread
            t.SetApartmentState(ApartmentState.STA);
            t.Start();
            t.Join();

            soundPackageName = Path.GetFileName(filePath);
            soundPackageName = Path.GetFileNameWithoutExtension(soundPackageName);

            if (filePath != string.Empty)
            {
                string s = "OBJ LOAD FILE=\"" + filePath + "\"";
                EditorInterface.DukeSharp_Exec(s);
            }

            RefreshSoundList();
        }
    }
}
