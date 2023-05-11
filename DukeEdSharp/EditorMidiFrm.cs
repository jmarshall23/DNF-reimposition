using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Threading;

namespace DukeEdSharp
{
    public partial class EditorMidiFrm : Form
    {
        IntPtr xyviewport;
        IntPtr xzviewport;
        IntPtr dynlightviewport;
        IntPtr yzviewport;

        public EditorMidiFrm()
        {
            InitializeComponent();
            splitContainer1.Dock = DockStyle.Fill;

            WindowState = FormWindowState.Maximized;

            Resize += EditorMidiFrm_Resize;

            xyviewport = InitPanel(panel_xy, 13);
            panel_xy.Resize += Panel_xy_Resize;
            panel_xy.Paint += Panel_xy_Paint;

            xzviewport = InitPanel(panel_xz, 14);
            panel_xz.Resize += Panel_xz_Resize;

            dynlightviewport = InitPanel(panel_dynlight, 5);
            panel_dynlight.Resize += Panel_dynlight_Resize;

            yzviewport = InitPanel(panel_yz, 15);
            panel_yz.Resize += Panel_yz_Resize;

            this.KeyPreview = true;
            this.KeyDown += EditorMidiFrm_KeyDown;
        }

        private void EditorMidiFrm_KeyDown(object sender, KeyEventArgs e)
        {
            switch (e.KeyCode)
            {
                case Keys.F4:
                    EditorInterface.DukeSharp_Exec("TOGGLEEVENTLINES");
                    break;

                case Keys.F5:
                    EditorInterface.DukeSharp_Exec("TOGGLEWORKINGBRUSH");
                    break;

                case Keys.F7:
                    EditorInterface.DukeSharp_RemoveCollisionAndPortalsBeta();
                    break;

                case Keys.Delete:
                    EditorInterface.DukeSharp_Exec("ACTOR DELETE");
                    break;
            }
        }

        private void Panel_xy_Paint(object sender, PaintEventArgs e)
        {
            
        }

        private void EditorMidiFrm_Resize(object sender, EventArgs e)
        {
          
        }

        private void Panel_yz_Resize(object sender, EventArgs e)
        {
            Control control = (Control)sender;

            EditorInterface.DukeSharp__ResizeViewport(yzviewport, control.Size.Width, control.Size.Height);
        }

        private void Panel_dynlight_Resize(object sender, EventArgs e)
        {
            Control control = (Control)sender;
            EditorInterface.DukeSharp__ResizeViewport(dynlightviewport, control.Size.Width, control.Size.Height);
        }

        private void Panel_xz_Resize(object sender, EventArgs e)
        {
            Control control = (Control)sender;
            EditorInterface.DukeSharp__ResizeViewport(xzviewport, control.Size.Width, control.Size.Height);
        }

        private void Panel_xy_Resize(object sender, EventArgs e)
        {
            Control control = (Control)sender;
            EditorInterface.DukeSharp__ResizeViewport(xyviewport, control.Size.Width, control.Size.Height);
        }

        private IntPtr InitPanel(Panel panel, int rendMode)
        {
            return EditorInterface.DukeSharp_CreateEditorViewport(panel.Handle, rendMode);
        }

        private void splitContainer1_Panel2_Paint(object sender, PaintEventArgs e)
        {

        }

        private void splitContainer3_Panel2_Paint(object sender, PaintEventArgs e)
        {

        }

        private void dynamicLightToolStripMenuItem_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_SetViewportType(dynlightviewport, 5);
        }

        private void texturedToolStripMenuItem_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_SetViewportType(dynlightviewport, 6);
        }

        private void flatToolStripMenuItem_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_SetViewportType(dynlightviewport, 3);
        }

        private void wireframeToolStripMenuItem_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_SetViewportType(dynlightviewport, 1);
        }

        private void zonesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_SetViewportType(dynlightviewport, 2);
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

        private void panel_xy_Paint_1(object sender, PaintEventArgs e)
        {

        }
    }
}
