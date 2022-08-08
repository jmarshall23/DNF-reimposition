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
    public partial class BrushProperties : Form
    {
        public BrushProperties()
        {
            InitializeComponent();
            this.FormClosing += BrushProperties_FormClosing;
        }

        private void BrushProperties_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (e.CloseReason == CloseReason.UserClosing)
            {
                e.Cancel = true;
                Hide();
            }
        }

        public void ShowBrushProperties(float x, float y, float z)
        {
            SizeXText.Text = x.ToString();
            SizeYText.Text = y.ToString();
            SizeZText.Text = z.ToString();

            Show();
        }

        private void BuildButton_Click(object sender, EventArgs e)
        {
            EditorInterface.DukeSharp_BuildBrush(float.Parse(SizeXText.Text), float.Parse(SizeYText.Text), float.Parse(SizeZText.Text));
        }
    }
}
