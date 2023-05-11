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
        WireframeViews wireframeViews;

        public EditorFrame()
        {
            InitializeComponent();
            BackPanel.Resize += BackPanel_Resize;

            // MenuItem mi = new MenuItem("Edit Box Brush Properties");
            // mi.Click += new System.EventHandler(this.button1_properties_Click);
            // this.toolStripButton9.ContextMenu = new ContextMenu(new MenuItem[] { mi });

            var pvAttribute = EditorInterface.DWM_WINDOW_CORNER_PREFERENCE.DWMWCP_ROUNDSMALL;
            EditorInterface.DwmSetWindowAttribute(this.Handle,
                                  EditorInterface.DWMWINDOWATTRIBUTE.DWMWA_USE_IMMERSIVE_DARK_MODE,
                                  ref pvAttribute, sizeof(uint));

            menuStrip1.ForeColor = Color.White;

            wireframeViews = new WireframeViews();
        }

        public void Init()
        {
            wireframeViews.Init();
            wireframeViews.Show();            
        }

        public void AttachBrowserFrm(BrowserFrm frm)
        {
            frm.TopLevel = false;
            splitContainer2.Panel2.Controls.Add(frm);
            frm.Dock = DockStyle.Fill;
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

        public void DockMidiFrm(Form frm)
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

        private void toolStripButton22_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_RunLocalCommand(17, (IntPtr)0);
        }

        private void toolStripButton23_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_Exec("MODE VERTEXEDIT");
        }

        private void toolStripButton24_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_Exec("MODE NEWCAMERAMOVE");
        }

        private void toolStripButton25_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_Exec("MODE FACEDRAG");            
        }

        private void EditorFrame_Load(object sender, EventArgs e)
        {

        }

        private void dynamicLightToolStripMenuItem_Click(object sender, EventArgs e)
        {
            EditorInterface.mainViewportFrm.SetRenderDynamicLight();
        }

        private void texturedToolStripMenuItem_Click(object sender, EventArgs e)
        {
            EditorInterface.mainViewportFrm.SetRenderTexture();
        }

        private void flatToolStripMenuItem_Click(object sender, EventArgs e)
        {
            EditorInterface.mainViewportFrm.SetFlatRender();
        }

        private void wireframeToolStripMenuItem_Click(object sender, EventArgs e)
        {
            EditorInterface.mainViewportFrm.SetWireframe();
        }

        private void zonesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            EditorInterface.mainViewportFrm.SetZonesOnly();
        }

        private void toolStripMenuItem2_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_Exec("MAP GRID X=1 Y=1 Z=1");
        }

        private void toolStripMenuItem3_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_Exec("MAP GRID X=2 Y=2 Z=2");
        }

        private void toolStripMenuItem4_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_Exec("MAP GRID X=4 Y=4 Z=4");
        }

        private void toolStripMenuItem5_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_Exec("MAP GRID X=8 Y=8 Z=8");
        }

        private void toolStripMenuItem6_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_Exec("MAP GRID X=16 Y=16 Z=16");
        }

        private void toolStripMenuItem7_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_Exec("MAP GRID X=32 Y=32 Z=32");
        }

        private void toolStripMenuItem8_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_Exec("MAP GRID X=64 Y=64 Z=64");
        }

        private void toolStripMenuItem9_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_Exec("MAP GRID X=128 Y=128 Z=128");
        }

        private void toolStripMenuItem10_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_Exec("MAP GRID X=256 Y=256 Z=256");
        }

        private void wireframeViewsToolStripMenuItem_Click(object sender, EventArgs e)
        {
            wireframeViews.Show();
        }
    }
}
