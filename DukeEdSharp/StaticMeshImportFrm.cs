using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;

namespace DukeEdSharp
{
    public partial class StaticMeshImportFrm : Form
    {
        public StaticMeshImportFrm()
        {
            InitializeComponent();
        }

        // FILE=\"{0}\" NAME=\"{1}\" PACKAGE=\"{2}\" GROUP=\"{3}
        public void SetInfo(string filePath, string package, string group)
        {
            texturePathTxt.Text = filePath;
            packageTxt.Text = package;
            groupTxt.Text = group; 

            nameTxt.Text = Path.GetFileNameWithoutExtension(filePath);
        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void importButton_Click(object sender, EventArgs e)
        {
            string s = String.Format("STATICMESH IMPORT FILE=\"{0}\" NAME=\"{1}\" PACKAGE=\"{2}\" GROUP=\"{3}\"", texturePathTxt.Text, nameTxt.Text, packageTxt.Text, groupTxt.Text);
            EditorInterface.DukeSharp_Exec(s);
            Close();
        }

        private void TextureImportFrm_Load(object sender, EventArgs e)
        {

        }
    }
}
