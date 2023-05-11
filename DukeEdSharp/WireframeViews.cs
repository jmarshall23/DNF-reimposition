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
    public partial class WireframeViews : Form
    {
        private ViewportFrm topViewFrm = new ViewportFrm();
        private ViewportFrm frontViewFrm = new ViewportFrm();
        private ViewportFrm sideViewFrm = new ViewportFrm();        

        public WireframeViews()
        {
            InitializeComponent();

            var pvAttribute = EditorInterface.DWM_WINDOW_CORNER_PREFERENCE.DWMWCP_ROUNDSMALL;
            EditorInterface.DwmSetWindowAttribute(this.Handle,
                                  EditorInterface.DWMWINDOWATTRIBUTE.DWMWA_USE_IMMERSIVE_DARK_MODE,
                                  ref pvAttribute, sizeof(uint));

            this.FormClosing += WireframeViews_FormClosing;
        }

        public void Init()
        {
            topViewFrm.SetRendMap(13);
            topViewFrm.TopLevel = false;
            Panel.Controls.Add(topViewFrm);
            topViewFrm.Dock = DockStyle.Fill;
            topViewFrm.Show();
        }

        private void WireframeViews_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (e.CloseReason == CloseReason.UserClosing)
            {
                e.Cancel = true;
                Hide();
            }
        }
    }
}
