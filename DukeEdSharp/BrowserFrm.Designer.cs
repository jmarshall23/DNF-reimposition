namespace DukeEdSharp
{
    partial class BrowserFrm
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(BrowserFrm));
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.actorClassPage = new System.Windows.Forms.TabPage();
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.fileToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.placeEntityToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.sortToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.levelEntitiesPage = new System.Windows.Forms.TabPage();
            this.texturePage = new System.Windows.Forms.TabPage();
            this.soundPage = new System.Windows.Forms.TabPage();
            this.staticMeshPage = new System.Windows.Forms.TabPage();
            this.listBox1 = new System.Windows.Forms.ListBox();
            this.actorClassList = new System.Windows.Forms.ListBox();
            this.tabControl1.SuspendLayout();
            this.actorClassPage.SuspendLayout();
            this.menuStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // tabControl1
            // 
            this.tabControl1.Controls.Add(this.actorClassPage);
            this.tabControl1.Controls.Add(this.levelEntitiesPage);
            this.tabControl1.Controls.Add(this.texturePage);
            this.tabControl1.Controls.Add(this.soundPage);
            this.tabControl1.Controls.Add(this.staticMeshPage);
            this.tabControl1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tabControl1.Location = new System.Drawing.Point(0, 0);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(687, 565);
            this.tabControl1.TabIndex = 0;
            // 
            // actorClassPage
            // 
            this.actorClassPage.Controls.Add(this.actorClassList);
            this.actorClassPage.Controls.Add(this.listBox1);
            this.actorClassPage.Controls.Add(this.menuStrip1);
            this.actorClassPage.Location = new System.Drawing.Point(4, 22);
            this.actorClassPage.Name = "actorClassPage";
            this.actorClassPage.Padding = new System.Windows.Forms.Padding(3);
            this.actorClassPage.Size = new System.Drawing.Size(679, 539);
            this.actorClassPage.TabIndex = 0;
            this.actorClassPage.Text = "Actor Classes";
            this.actorClassPage.UseVisualStyleBackColor = true;
            this.actorClassPage.Click += new System.EventHandler(this.actorClassPage_Click);
            // 
            // menuStrip1
            // 
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.fileToolStripMenuItem,
            this.sortToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(3, 3);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(673, 24);
            this.menuStrip1.TabIndex = 0;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // fileToolStripMenuItem
            // 
            this.fileToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.placeEntityToolStripMenuItem});
            this.fileToolStripMenuItem.Name = "fileToolStripMenuItem";
            this.fileToolStripMenuItem.Size = new System.Drawing.Size(37, 20);
            this.fileToolStripMenuItem.Text = "&File";
            // 
            // placeEntityToolStripMenuItem
            // 
            this.placeEntityToolStripMenuItem.Name = "placeEntityToolStripMenuItem";
            this.placeEntityToolStripMenuItem.Size = new System.Drawing.Size(180, 22);
            this.placeEntityToolStripMenuItem.Text = "Place Entity";
            this.placeEntityToolStripMenuItem.Click += new System.EventHandler(this.placeEntityToolStripMenuItem_Click);
            // 
            // sortToolStripMenuItem
            // 
            this.sortToolStripMenuItem.Name = "sortToolStripMenuItem";
            this.sortToolStripMenuItem.Size = new System.Drawing.Size(40, 20);
            this.sortToolStripMenuItem.Text = "&Sort";
            // 
            // levelEntitiesPage
            // 
            this.levelEntitiesPage.Location = new System.Drawing.Point(4, 22);
            this.levelEntitiesPage.Name = "levelEntitiesPage";
            this.levelEntitiesPage.Size = new System.Drawing.Size(679, 539);
            this.levelEntitiesPage.TabIndex = 2;
            this.levelEntitiesPage.Text = "Level Entities";
            this.levelEntitiesPage.UseVisualStyleBackColor = true;
            // 
            // texturePage
            // 
            this.texturePage.Location = new System.Drawing.Point(4, 22);
            this.texturePage.Name = "texturePage";
            this.texturePage.Padding = new System.Windows.Forms.Padding(3);
            this.texturePage.Size = new System.Drawing.Size(679, 539);
            this.texturePage.TabIndex = 1;
            this.texturePage.Text = "Textures";
            this.texturePage.UseVisualStyleBackColor = true;
            // 
            // soundPage
            // 
            this.soundPage.Location = new System.Drawing.Point(4, 22);
            this.soundPage.Name = "soundPage";
            this.soundPage.Size = new System.Drawing.Size(679, 539);
            this.soundPage.TabIndex = 3;
            this.soundPage.Text = "Sounds";
            this.soundPage.UseVisualStyleBackColor = true;
            // 
            // staticMeshPage
            // 
            this.staticMeshPage.Location = new System.Drawing.Point(4, 22);
            this.staticMeshPage.Name = "staticMeshPage";
            this.staticMeshPage.Size = new System.Drawing.Size(679, 539);
            this.staticMeshPage.TabIndex = 4;
            this.staticMeshPage.Text = "Static Meshes";
            this.staticMeshPage.UseVisualStyleBackColor = true;
            // 
            // listBox1
            // 
            this.listBox1.FormattingEnabled = true;
            this.listBox1.Location = new System.Drawing.Point(402, 298);
            this.listBox1.Name = "listBox1";
            this.listBox1.Size = new System.Drawing.Size(8, 4);
            this.listBox1.TabIndex = 2;
            // 
            // actorClassList
            // 
            this.actorClassList.Dock = System.Windows.Forms.DockStyle.Fill;
            this.actorClassList.FormattingEnabled = true;
            this.actorClassList.Location = new System.Drawing.Point(3, 27);
            this.actorClassList.Name = "actorClassList";
            this.actorClassList.Size = new System.Drawing.Size(673, 509);
            this.actorClassList.TabIndex = 3;
            // 
            // BrowserFrm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(687, 565);
            this.Controls.Add(this.tabControl1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.Name = "BrowserFrm";
            this.Text = "DukeEdit Browsers";
            this.tabControl1.ResumeLayout(false);
            this.actorClassPage.ResumeLayout(false);
            this.actorClassPage.PerformLayout();
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TabControl tabControl1;
        private System.Windows.Forms.TabPage actorClassPage;
        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem fileToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem placeEntityToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem sortToolStripMenuItem;
        private System.Windows.Forms.TabPage levelEntitiesPage;
        private System.Windows.Forms.TabPage texturePage;
        private System.Windows.Forms.TabPage soundPage;
        private System.Windows.Forms.TabPage staticMeshPage;
        private System.Windows.Forms.ListBox listBox1;
        private System.Windows.Forms.ListBox actorClassList;
    }
}