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
        private IntPtr textureViewportHandle;
        private string texturePackageName;
        private string staticMeshPackageName;

        public BrowserFrm()
        {
            InitializeComponent();

            this.FormClosing += BrowserFrm_FormClosing;
            textureListBox.DoubleClick += TextureListBox_DoubleClick;
            soundPackageListBox.DoubleClick += SoundPackageListBox_DoubleClick;

            //  textureViewportHandle = EditorInterface.CreateTextureViewport(textureViewportPanel.Handle);
        }

        private void SoundPackageListBox_DoubleClick(object sender, EventArgs e)
        {
            //string groupSelected = (string)soundGroupComboBox.SelectedItem;
           // string s = String.Format("HOOK CLASSPROPERTIES Class=\"{2}\"", soundPackageName, groupSelected, soundPackageListBox.SelectedItems[0]);
           // EditorInterface.DukeSharp_Exec(s);
        }

        private void TextureListBox_DoubleClick(object sender, EventArgs e)
        {
            string groupSelected = (string)textureGroupComboBox.SelectedItem;
            string s = String.Format("POLY DEFAULT TEXTURE={0}.{1}.{2}", texturePackageName, groupSelected, textureListBox.SelectedItems[0]);
            EditorInterface.DukeSharp_Exec(s);

            string s1 = "POLY SETTEXTURE";
            EditorInterface.DukeSharp_Exec(s1);
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
            actorClassList.Items.Clear();

            IntPtr listStrptr = EditorInterface.DukeSharp_FindActorClasses();
            string list = Marshal.PtrToStringAuto(listStrptr);
            string[] actorList = list.Split(',');

            Array.Sort(actorList, (x, y) => String.Compare(x, y));

            foreach (string s in actorList)
            {
                string clsname = s.Remove(0, 1);

                if (!showPlaceableOnlyCheckBox.Checked || EditorInterface.IsClassPlaceable(clsname))
                {
                    actorClassList.Items.Add(clsname);
                }
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

       
        private void openToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            var fileContent = string.Empty;
            var filePath = string.Empty;

            Thread t = new Thread((ThreadStart)(() => {
                OpenFileDialog openFileDialog = new OpenFileDialog();
                openFileDialog.InitialDirectory = "..\\sounds\\";
                openFileDialog.Filter = "Sound Packages (*.dfx)|*.dfx|All files (*.*)|*.*";
               // openFileDialog.FilterIndex = 2;
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

            RefreshSoundGroupList();
            RefreshSoundList();
        }

        

        private void openToolStripMenuItem_Click(object sender, EventArgs e)
        {
            var fileContent = string.Empty;
            var filePath = string.Empty;

            Thread t = new Thread((ThreadStart)(() =>
            {
                OpenFileDialog openFileDialog = new OpenFileDialog();
                openFileDialog.InitialDirectory = "..\\textures\\";
                openFileDialog.Filter = "Texture Packages (*.dtx)|*.dtx|All files (*.*)|*.*";
             //   openFileDialog.FilterIndex = 2;
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

            texturePackageName = Path.GetFileName(filePath);
            texturePackageName = Path.GetFileNameWithoutExtension(texturePackageName);

            if (filePath != string.Empty)
            {
                string s = "OBJ LOAD FILE=\"" + filePath + "\"";
                EditorInterface.DukeSharp_Exec(s);
                RefreshTextureGroupList();
                RefreshTextureList();
            }            
        }

        private void textureGroupComboBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            RefreshTextureList();
        }

        private void saveToolStripMenuItem_Click(object sender, EventArgs e)
        {
            var fileContent = string.Empty;
            var filePath = string.Empty;

            Thread t = new Thread((ThreadStart)(() =>
            {
                SaveFileDialog saveFileDialog = new SaveFileDialog();
                saveFileDialog.InitialDirectory = "..\\textures\\";
                saveFileDialog.Filter = "Texture Packages (*.dtx)|*.dtx|All files (*.*)|*.*";
            //    saveFileDialog.FilterIndex = 2;
                saveFileDialog.RestoreDirectory = true;

                if (saveFileDialog.ShowDialog() == DialogResult.OK)
                {
                    //Get the path of specified file
                    filePath = saveFileDialog.FileName;
                }
            }));

            // Run your code from a thread that joins the STA Thread
            t.SetApartmentState(ApartmentState.STA);
            t.Start();
            t.Join();

            if (filePath != string.Empty)
            {
                string s = "OBJ SavePackage FILE=\"" + filePath + "\" Package=\"" + texturePackageName + "\"";
                EditorInterface.DukeSharp_Exec(s);
            }
        }

        private void propertiesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            string groupSelected = (string)textureGroupComboBox.SelectedItem;

            string s = String.Format("HOOK TEXTUREPROPERTIES TEXTURE={0}.{1}.{2}", texturePackageName, groupSelected, textureListBox.SelectedItems[0]);
            EditorInterface.DukeSharp_Exec(s);
        }

        private void exportToolStripMenuItem_Click(object sender, EventArgs e)
        {
            var fileContent = string.Empty;
            var filePath = string.Empty;

            Thread t = new Thread((ThreadStart)(() =>
            {
                SaveFileDialog saveFileDialog = new SaveFileDialog();
                saveFileDialog.InitialDirectory = "..\\textures\\";
                saveFileDialog.Filter = "TGA Texture (*.TGA)|*.tga";
                //    saveFileDialog.FilterIndex = 2;
                saveFileDialog.RestoreDirectory = true;

                if (saveFileDialog.ShowDialog() == DialogResult.OK)
                {
                    //Get the path of specified file
                    filePath = saveFileDialog.FileName;
                }
            }));

            // Run your code from a thread that joins the STA Thread
            t.SetApartmentState(ApartmentState.STA);
            t.Start();
            t.Join();

            if (filePath != string.Empty)
            {
                string groupSelected = (string)textureGroupComboBox.SelectedItem;
                string s = String.Format("OBJ EXPORT TYPE=TEXTURE NAME=\"{0}.{1}.{2}\" FILE=\"{3}\"", texturePackageName, groupSelected, textureListBox.SelectedItems[0], filePath);
                EditorInterface.DukeSharp_Exec(s);
            }
        }

        private void importToolStripMenuItem_Click(object sender, EventArgs e)
        {
            var fileContent = string.Empty;
            var filePath = string.Empty;

            Thread t = new Thread((ThreadStart)(() =>
            {
                OpenFileDialog saveFileDialog = new OpenFileDialog();
                saveFileDialog.InitialDirectory = "..\\textures\\";
                saveFileDialog.Filter = "TGA Texture (*.TGA)|*.tga";
                //    saveFileDialog.FilterIndex = 2;
                saveFileDialog.RestoreDirectory = true;

                if (saveFileDialog.ShowDialog() == DialogResult.OK)
                {
                    //Get the path of specified file
                    filePath = saveFileDialog.FileName;
                }
            }));

            // Run your code from a thread that joins the STA Thread
            t.SetApartmentState(ApartmentState.STA);
            t.Start();
            t.Join();

            string groupSelected = (string)textureGroupComboBox.SelectedItem;

            if (filePath != string.Empty)
            {
                TextureImportFrm frm = new TextureImportFrm();
                frm.SetInfo(filePath, texturePackageName, groupSelected);
                frm.ShowDialog();
                RefreshTextureList();
            }
        }

        private void showPlaceableOnlyCheckBox_CheckedChanged(object sender, EventArgs e)
        {
            PopulateActorClassList();
        }

        private void soundGroupComboBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            RefreshSoundList();
        }

        private void playToolStripMenuItem_Click(object sender, EventArgs e)
        {
            // HACK ALERT! Because the audio files are inside of the .dat files(except for user files) we have to force extract so it loads the data.
            // Investigate a better way to do this!

            {
                string temp = String.Format("OBJ EXPORT TYPE=SOUND PACKAGE=\"{0}\" NAME=\"{1}\" FILE=\"{2}\"", soundPackageName, soundPackageListBox.SelectedItem, "../EditorTemp/temp.wav");
                EditorInterface.DukeSharp_Exec(temp);
            }


            string groupSelected = (string)soundGroupComboBox.SelectedItem;
            string s = String.Format("AUDIO PLAY NAME=\"{2}\"", soundPackageName, groupSelected, soundPackageListBox.SelectedItem);
            EditorInterface.DukeSharp_Exec(s);
        }

        private void importToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            var fileContent = string.Empty;
            var filePath = string.Empty;

            Thread t = new Thread((ThreadStart)(() =>
            {
                OpenFileDialog saveFileDialog = new OpenFileDialog();
                saveFileDialog.InitialDirectory = "..\\sounds\\";
                saveFileDialog.Filter = "WAV File (*.wav)|*.wav";
                //    saveFileDialog.FilterIndex = 2;
                saveFileDialog.RestoreDirectory = true;

                if (saveFileDialog.ShowDialog() == DialogResult.OK)
                {
                    //Get the path of specified file
                    filePath = saveFileDialog.FileName;
                }
            }));

            // Run your code from a thread that joins the STA Thread
            t.SetApartmentState(ApartmentState.STA);
            t.Start();
            t.Join();

            string groupSelected = (string)soundGroupComboBox.SelectedItem;

            if (filePath != string.Empty)
            {
                SoundImportFrm frm = new SoundImportFrm();
                frm.SetInfo(filePath, soundPackageName, groupSelected);
                frm.ShowDialog();
                RefreshSoundList();
            }
        }

        private void exportToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            var fileContent = string.Empty;
            var filePath = string.Empty;

            Thread t = new Thread((ThreadStart)(() =>
            {
                SaveFileDialog saveFileDialog = new SaveFileDialog();
                saveFileDialog.InitialDirectory = "..\\sounds\\";
                saveFileDialog.Filter = "WAV file (*.wav)|*.wav";
                //    saveFileDialog.FilterIndex = 2;
                saveFileDialog.RestoreDirectory = true;

                if (saveFileDialog.ShowDialog() == DialogResult.OK)
                {
                    //Get the path of specified file
                    filePath = saveFileDialog.FileName;
                }
            }));

            // Run your code from a thread that joins the STA Thread
            t.SetApartmentState(ApartmentState.STA);
            t.Start();
            t.Join();

            if (filePath != string.Empty)
            {
                string s = String.Format("OBJ EXPORT TYPE=SOUND PACKAGE=\"{0}\" NAME=\"{1}\" FILE=\"{2}\"", soundPackageName, soundPackageListBox.SelectedItem, filePath);
                EditorInterface.DukeSharp_Exec(s);
            }
        }

        private void saveToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            var fileContent = string.Empty;
            var filePath = string.Empty;

            Thread t = new Thread((ThreadStart)(() =>
            {
                SaveFileDialog saveFileDialog = new SaveFileDialog();
                saveFileDialog.InitialDirectory = "..\\sounds\\";
                saveFileDialog.Filter = "Sound Packages (*.dfx)|*.dfx|All files (*.*)|*.*";
                //    saveFileDialog.FilterIndex = 2;
                saveFileDialog.RestoreDirectory = true;

                if (saveFileDialog.ShowDialog() == DialogResult.OK)
                {
                    //Get the path of specified file
                    filePath = saveFileDialog.FileName;
                }
            }));

            // Run your code from a thread that joins the STA Thread
            t.SetApartmentState(ApartmentState.STA);
            t.Start();
            t.Join();

            if (filePath != string.Empty)
            {
                string s = "OBJ SavePackage FILE=\"" + filePath + "\" Package=\"" + soundPackageName + "\"";
                EditorInterface.DukeSharp_Exec(s);
            }
        }

        private void textureListBox_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void soundPackageListBox_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void BrowserFrm_Load(object sender, EventArgs e)
        {
            EditorInterface.CreateStaticMeshViewport(staticMeshViewerPanel.Handle);
        }

        private void openToolStripMenuItem2_Click(object sender, EventArgs e)
        {
            var fileContent = string.Empty;
            var filePath = string.Empty;

            Thread t = new Thread((ThreadStart)(() =>
            {
                OpenFileDialog openFileDialog = new OpenFileDialog();
                openFileDialog.InitialDirectory = "..\\StaticMeshes\\";
                openFileDialog.Filter = "StaticMesh Packages (*.dsm)|*.dsm|All files (*.*)|*.*";
                // openFileDialog.FilterIndex = 2;
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

            staticMeshPackageName = Path.GetFileName(filePath);
            staticMeshPackageName = Path.GetFileNameWithoutExtension(staticMeshPackageName);

            if (filePath != string.Empty)
            {
                string s = "OBJ LOAD FILE=\"" + filePath + "\"";
                EditorInterface.DukeSharp_Exec(s);
            }

            RefreshStaticMeshGroupList();
            RefreshStaticMeshList();
        }

        private void menuStrip2_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }

        private void staticMeshListBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            string groupSelected = (string)staticMeshGroupComboBox.SelectedItem;
            EditorInterface.DukeSharp_SetPreviewStaticMesh(staticMeshPackageName, groupSelected, (string)staticMeshListBox.SelectedItem);
        }

        private void staticMeshGroupComboBox_SelectedIndexChanged_1(object sender, EventArgs e)
        {
            RefreshStaticMeshList();
        }

        private void createEntityFromMeshToolStripMenuItem_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_AddStaticModelToLevel();
        }

        private void importToolStripMenuItem2_Click(object sender, EventArgs e)
        {
            var fileContent = string.Empty;
            var filePath = string.Empty;

            Thread t = new Thread((ThreadStart)(() =>
            {
                OpenFileDialog saveFileDialog = new OpenFileDialog();
                saveFileDialog.InitialDirectory = "..\\staticmesh\\";
                saveFileDialog.Filter = "LWO File (*.lwo)|*.lwo";
                //    saveFileDialog.FilterIndex = 2;
                saveFileDialog.RestoreDirectory = true;

                if (saveFileDialog.ShowDialog() == DialogResult.OK)
                {
                    //Get the path of specified file
                    filePath = saveFileDialog.FileName;
                }
            }));

            // Run your code from a thread that joins the STA Thread
            t.SetApartmentState(ApartmentState.STA);
            t.Start();
            t.Join();

            string groupSelected = (string)staticMeshGroupComboBox.SelectedItem;

            if (filePath != string.Empty)
            {
                StaticMeshImportFrm frm = new StaticMeshImportFrm();
                frm.SetInfo(filePath, staticMeshPackageName, groupSelected);
                frm.ShowDialog();
                RefreshStaticMeshList();
            }

            
        }

        private void saveToolStripMenuItem2_Click(object sender, EventArgs e)
        {
            var fileContent = string.Empty;
            var filePath = string.Empty;

            Thread t = new Thread((ThreadStart)(() =>
            {
                SaveFileDialog saveFileDialog = new SaveFileDialog();
                saveFileDialog.InitialDirectory = "..\\staticmeshes\\";
                saveFileDialog.Filter = "StaticMesh Packages (*.dsm)|*.dsm|All files (*.*)|*.*";
                //    saveFileDialog.FilterIndex = 2;
                saveFileDialog.RestoreDirectory = true;

                if (saveFileDialog.ShowDialog() == DialogResult.OK)
                {
                    //Get the path of specified file
                    filePath = saveFileDialog.FileName;
                }
            }));

            // Run your code from a thread that joins the STA Thread
            t.SetApartmentState(ApartmentState.STA);
            t.Start();
            t.Join();

            if (filePath != string.Empty)
            {
                string s = "OBJ SavePackage FILE=\"" + filePath + "\" Package=\"" + staticMeshPackageName + "\"";
                EditorInterface.DukeSharp_Exec(s);
            }
        }
    }
}
