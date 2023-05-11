namespace DukeEdSharp
{
    partial class WireframeViews
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(WireframeViews));
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.viewsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.topToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.frontToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.sizeToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.Panel = new System.Windows.Forms.Panel();
            this.menuStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // menuStrip1
            // 
            this.menuStrip1.BackColor = System.Drawing.SystemColors.ControlDark;
            this.menuStrip1.GripMargin = new System.Windows.Forms.Padding(2, 2, 0, 2);
            this.menuStrip1.ImageScalingSize = new System.Drawing.Size(24, 24);
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.viewsToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(1143, 33);
            this.menuStrip1.TabIndex = 0;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // viewsToolStripMenuItem
            // 
            this.viewsToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.topToolStripMenuItem,
            this.frontToolStripMenuItem,
            this.sizeToolStripMenuItem});
            this.viewsToolStripMenuItem.Name = "viewsToolStripMenuItem";
            this.viewsToolStripMenuItem.Size = new System.Drawing.Size(73, 29);
            this.viewsToolStripMenuItem.Text = "&Views";
            // 
            // topToolStripMenuItem
            // 
            this.topToolStripMenuItem.Name = "topToolStripMenuItem";
            this.topToolStripMenuItem.Size = new System.Drawing.Size(270, 34);
            this.topToolStripMenuItem.Text = "&Top";
            // 
            // frontToolStripMenuItem
            // 
            this.frontToolStripMenuItem.Name = "frontToolStripMenuItem";
            this.frontToolStripMenuItem.Size = new System.Drawing.Size(270, 34);
            this.frontToolStripMenuItem.Text = "&Front";
            // 
            // sizeToolStripMenuItem
            // 
            this.sizeToolStripMenuItem.Name = "sizeToolStripMenuItem";
            this.sizeToolStripMenuItem.Size = new System.Drawing.Size(270, 34);
            this.sizeToolStripMenuItem.Text = "&Size";
            // 
            // Panel
            // 
            this.Panel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.Panel.Location = new System.Drawing.Point(0, 33);
            this.Panel.Name = "Panel";
            this.Panel.Size = new System.Drawing.Size(1143, 780);
            this.Panel.TabIndex = 1;
            // 
            // WireframeViews
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1143, 813);
            this.Controls.Add(this.Panel);
            this.Controls.Add(this.menuStrip1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MainMenuStrip = this.menuStrip1;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "WireframeViews";
            this.Text = "Editor Wireframe Views";
            this.TopMost = true;
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem viewsToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem topToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem frontToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem sizeToolStripMenuItem;
        private System.Windows.Forms.Panel Panel;
    }
}