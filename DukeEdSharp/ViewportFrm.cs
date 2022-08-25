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
        public ViewportFrm()
        {
            InitializeComponent();
            
        }

        public void SetRendMap(int id)
        {
            EditorInterface.DukeSharp_CreateEditorViewport(renderPanel.Handle, id);
        }

        private void menuStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }
    }
}
