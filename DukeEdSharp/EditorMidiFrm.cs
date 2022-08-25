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
using System.Windows.Input;

namespace DukeEdSharp
{
    public partial class EditorMidiFrm : Form
    {
        IntPtr xyviewport;
        IntPtr xzviewport;
        IntPtr dynlightviewport;
        IntPtr yzviewport;

        void MidiJob()
        {
            while(true)
            {
                if (EditorInterface.ApplicationIsActivated())
                {
                    if (Keyboard.IsKeyDown(Key.Delete))
                    {
                        EditorInterface.DukeSharp_Exec("ACTOR DELETE");
                    }
                }
                Thread.Sleep(1);
            }
        }

        public EditorMidiFrm()
        {
            InitializeComponent();
            splitContainer1.Dock = DockStyle.Fill;

            Thread thr = new Thread(MidiJob);
            thr.SetApartmentState(ApartmentState.STA);
            thr.IsBackground = true;
            thr.Start();

            WindowState = FormWindowState.Maximized;

            Resize += EditorMidiFrm_Resize;

            xyviewport = InitPanel(panel_xy, 13);
            panel_xy.Resize += Panel_xy_Resize;

            xzviewport = InitPanel(panel_xz, 14);
            panel_xz.Resize += Panel_xz_Resize;

            dynlightviewport = InitPanel(panel_dynlight, 5);
            panel_dynlight.Resize += Panel_dynlight_Resize;

            yzviewport = InitPanel(panel_yz, 15);
            panel_yz.Resize += Panel_yz_Resize;

            menuStrip1.ForeColor = Color.White;
            menuStrip2.ForeColor = Color.White;
            menuStrip3.ForeColor = Color.White;
            menuStrip4.ForeColor = Color.White;
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
    }
}
