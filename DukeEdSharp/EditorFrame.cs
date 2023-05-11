using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DukeEdSharp
{
    public partial class EditorFrame : Form
    {
        public EditorFrame()
        {
            InitializeComponent();
            BackPanel.Resize += BackPanel_Resize;

            MenuItem mi = new MenuItem("Edit Box Brush Properties");
            mi.Click += new System.EventHandler(this.button1_properties_Click);
            this.button1.ContextMenu = new ContextMenu(new MenuItem[] { mi });
        }

        protected override void OnFormClosing(FormClosingEventArgs e)
        {
            base.OnFormClosing(e);

            Environment.Exit(0);
        }

        private void BackPanel_Resize(object sender, EventArgs e)
        {
            EditorInterface.EditorResize(BackPanel.Width, BackPanel.Height);
        }

        public void DockMidiFrm(EditorMidiFrm frm)
        {
            frm.TopLevel = false;
            BackPanel.Controls.Add(frm);
            frm.Dock = DockStyle.Fill; 
        }

        private void newMapToolStripMenuItem_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_RunLocalCommand(0, Handle);
        }

        private void menuStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }

        private void loadMapToolStripMenuItem_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_RunLocalCommand(1, Handle);
        }

        private void saveMapToolStripMenuItem_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_RunLocalCommand(4, Handle);
        }

        private void importToolStripMenuItem_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_RunLocalCommand(11, Handle);
        }

        private void exportToolStripMenuItem_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_RunLocalCommand(12, Handle);
        }

        private void undoToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void playLevelToolStripMenuItem_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_RunLocalCommand(3, Handle);
        }

        private void buildAllToolStripMenuItem_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_RunLocalCommand(2, Handle);
        }

        private void deleteToolStripMenuItem_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_RunLocalCommand(8, Handle);
        }

        private void actorClassBrowserToolStripMenuItem_Click(object sender, EventArgs e)
        {
            EditorInterface.browserFrm.Show();
            EditorInterface.browserFrm.Focus();
        }

        private void toolStripButton10_Click(object sender, EventArgs e)
        {
            
        }

        private void toolStripButton9_Click(object sender, EventArgs e)
        {
            
        }

        private void toolStripButton9_Click_1(object sender, EventArgs e)
        {
            
        }

        private void toolStripButton10_Click_1(object sender, EventArgs e)
        {
            
        }

        private void BackPanel_Paint(object sender, PaintEventArgs e)
        {

        }

        private void toolStripButton1_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_RunLocalCommand(1, Handle); // load
        }

        private void toolStripButton2_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_RunLocalCommand(4, Handle); // save
        }


        // BOX BRUSH
        private void button1_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_RunLocalCommand(16, (IntPtr)0);
        }

        private void button1_properties_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_RunLocalCommand(17, (IntPtr)0);
        }



        private void ConeCreateButton_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_RunLocalCommand(16, (IntPtr)7);
        }

        private void CreateStairsButton_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_RunLocalCommand(16, (IntPtr)1);
        }

        private void createstairs_properties_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_RunLocalCommand(17, (IntPtr)1);
        }

        private void CreateStraightStairsButton_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_RunLocalCommand(16, (IntPtr)3);
        }

        private void CreateSpiralStairsButton_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_RunLocalCommand(16, (IntPtr)2);
        }

        private void CreatePlaneButton_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_RunLocalCommand(16, (IntPtr)5);
        }

        private void button4_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_RunLocalCommand(16, (IntPtr)6);
        }

        private void button9_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_RunLocalCommand(16, (IntPtr)8);
        }

        private void button8_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_RunLocalCommand(16, (IntPtr)9); // sphere
        }

        private void levelPropertiesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_RunLocalCommand(9, Handle);
        }

        private void selectAllActorsToolStripMenuItem_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_RunLocalCommand(14, Handle);
        }

        private void selectAllPolysToolStripMenuItem_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_RunLocalCommand(15, Handle);
        }

        private void button10_Click(object sender, EventArgs e)
        {
            // Brush Add
            EditorInterface.DukeSharp_Exec("BRUSH ADD");
        }

        private void button11_Click(object sender, EventArgs e)
        {
            // Brush Subtract
            EditorInterface.DukeSharp_Exec("BRUSH SUBTRACT");
        }

        private void button12_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_Exec("BRUSH FROM INTERSECTION");
        }

        private void button13_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_Exec("BRUSH FROM DEINTERSECTION");
        }

        private void surfacePropertiesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_RunLocalCommand(18, Handle);
        }
    }
}
