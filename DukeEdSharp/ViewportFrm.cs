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
    public partial class ViewportFrm : Form
    {
        IntPtr viewportHandle;

        public ViewportFrm()
        {
            InitializeComponent();            
        }

        public void SetRendMap(int id)
        {
            viewportHandle = EditorInterface.DukeSharp_CreateEditorViewport(renderPanel.Handle, id);
            renderPanel.Resize += RenderPanel_Resize;
        }

        private void menuStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }

        private void RenderPanel_Resize(object sender, EventArgs e)
        {
            Control control = (Control)sender;
            EditorInterface.DukeSharp__ResizeViewport(viewportHandle, control.Size.Width, control.Size.Height);
        }

        //private void dynamicLightToolStripMenuItem_Click(object sender, EventArgs e)
        public void SetRenderDynamicLight()
        {
            EditorInterface.DukeSharp_SetViewportType(viewportHandle, 5);
        }

        public void SetRenderTexture()
        {
            EditorInterface.DukeSharp_SetViewportType(viewportHandle, 6);
        }

        //private void flatToolStripMenuItem_Click(object sender, EventArgs e)
        public void SetFlatRender()
        {
            EditorInterface.DukeSharp_SetViewportType(viewportHandle, 3);
        }

        //private void wireframeToolStripMenuItem_Click(object sender, EventArgs e)
        public void SetWireframe()
        {
            EditorInterface.DukeSharp_SetViewportType(viewportHandle, 1);
        }

        //private void zonesToolStripMenuItem_Click(object sender, EventArgs e)
        public void SetZonesOnly()
        {
            EditorInterface.DukeSharp_SetViewportType(viewportHandle, 2);
        }
    }
}
