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
    public partial class BrushScale : Form
    {
        public BrushScale()
        {
            InitializeComponent();

            this.FormClosing += BrushScale_FormClosing;
        }

        private void BrushScale_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (e.CloseReason == CloseReason.UserClosing)
            {
                e.Cancel = true;
                Hide();
            }
        }

        private void BrushScale_Load(object sender, EventArgs e)
        {
            ScaleXText.Text = "1.0";
            scaleYText.Text = "1.0";
            scaleZText.Text = "1.0";
        }

        private void ApplyButton_Click(object sender, EventArgs e)
        {
            string s = String.Format("BRUSH SCALE X={0}, Y={1}, Z={2}", ScaleXText.Text, scaleYText.Text, scaleZText.Text);
            EditorInterface.DukeSharp_Exec(s);
        }
    }
}
