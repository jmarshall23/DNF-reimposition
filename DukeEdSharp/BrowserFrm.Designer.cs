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
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(BrowserFrm));
            this.browserTabControl = new System.Windows.Forms.TabControl();
            this.actorClassPage = new System.Windows.Forms.TabPage();
            this.showPlaceableOnlyCheckBox = new System.Windows.Forms.CheckBox();
            this.actorClassList = new System.Windows.Forms.ListBox();
            this.listBox1 = new System.Windows.Forms.ListBox();
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.fileToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.placeEntityToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.sortToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.texturePage = new System.Windows.Forms.TabPage();
            this.textureGroupComboBox = new System.Windows.Forms.ComboBox();
            this.textureListBox = new System.Windows.Forms.ListBox();
            this.textureBrowserStripMenu = new System.Windows.Forms.MenuStrip();
            this.fileToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.newToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.openToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.saveToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator1 = new System.Windows.Forms.ToolStripSeparator();
            this.importToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.exportToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.editToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.propertiesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.deleteToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.renameToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.viewToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.soundPage = new System.Windows.Forms.TabPage();
            this.soundGroupComboBox = new System.Windows.Forms.ComboBox();
            this.soundPackageListBox = new System.Windows.Forms.ListBox();
            this.menuStrip3 = new System.Windows.Forms.MenuStrip();
            this.fileToolStripMenuItem2 = new System.Windows.Forms.ToolStripMenuItem();
            this.openToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.saveToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator2 = new System.Windows.Forms.ToolStripSeparator();
            this.importToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.exportToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.editToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.deleteToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator3 = new System.Windows.Forms.ToolStripSeparator();
            this.playToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.stopToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.viewToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.staticMeshPage = new System.Windows.Forms.TabPage();
            this.staticMeshGroupComboBox = new System.Windows.Forms.ComboBox();
            this.label2 = new System.Windows.Forms.Label();
            this.staticMeshListBox = new System.Windows.Forms.ListBox();
            this.label1 = new System.Windows.Forms.Label();
            this.staticMeshViewerPanel = new System.Windows.Forms.Panel();
            this.menuStrip2 = new System.Windows.Forms.MenuStrip();
            this.fileToolStripMenuItem3 = new System.Windows.Forms.ToolStripMenuItem();
            this.openToolStripMenuItem2 = new System.Windows.Forms.ToolStripMenuItem();
            this.saveToolStripMenuItem2 = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator4 = new System.Windows.Forms.ToolStripSeparator();
            this.importToolStripMenuItem2 = new System.Windows.Forms.ToolStripMenuItem();
            this.exportToolStripMenuItem2 = new System.Windows.Forms.ToolStripMenuItem();
            this.entityToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.createEntityFromMeshToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.contextMenuStrip1 = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.browserTabControl.SuspendLayout();
            this.actorClassPage.SuspendLayout();
            this.menuStrip1.SuspendLayout();
            this.texturePage.SuspendLayout();
            this.textureBrowserStripMenu.SuspendLayout();
            this.soundPage.SuspendLayout();
            this.menuStrip3.SuspendLayout();
            this.staticMeshPage.SuspendLayout();
            this.menuStrip2.SuspendLayout();
            this.SuspendLayout();
            // 
            // browserTabControl
            // 
            this.browserTabControl.Alignment = System.Windows.Forms.TabAlignment.Bottom;
            this.browserTabControl.Controls.Add(this.actorClassPage);
            this.browserTabControl.Controls.Add(this.texturePage);
            this.browserTabControl.Controls.Add(this.soundPage);
            this.browserTabControl.Controls.Add(this.staticMeshPage);
            this.browserTabControl.Dock = System.Windows.Forms.DockStyle.Fill;
            this.browserTabControl.Location = new System.Drawing.Point(0, 0);
            this.browserTabControl.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.browserTabControl.Name = "browserTabControl";
            this.browserTabControl.SelectedIndex = 0;
            this.browserTabControl.Size = new System.Drawing.Size(1030, 869);
            this.browserTabControl.TabIndex = 0;
            // 
            // actorClassPage
            // 
            this.actorClassPage.Controls.Add(this.showPlaceableOnlyCheckBox);
            this.actorClassPage.Controls.Add(this.actorClassList);
            this.actorClassPage.Controls.Add(this.listBox1);
            this.actorClassPage.Controls.Add(this.menuStrip1);
            this.actorClassPage.Location = new System.Drawing.Point(4, 4);
            this.actorClassPage.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.actorClassPage.Name = "actorClassPage";
            this.actorClassPage.Padding = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.actorClassPage.Size = new System.Drawing.Size(1022, 836);
            this.actorClassPage.TabIndex = 0;
            this.actorClassPage.Text = "Actor Classes";
            this.actorClassPage.UseVisualStyleBackColor = true;
            this.actorClassPage.Click += new System.EventHandler(this.actorClassPage_Click);
            // 
            // showPlaceableOnlyCheckBox
            // 
            this.showPlaceableOnlyCheckBox.AutoSize = true;
            this.showPlaceableOnlyCheckBox.Checked = true;
            this.showPlaceableOnlyCheckBox.CheckState = System.Windows.Forms.CheckState.Checked;
            this.showPlaceableOnlyCheckBox.Location = new System.Drawing.Point(10, 46);
            this.showPlaceableOnlyCheckBox.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.showPlaceableOnlyCheckBox.Name = "showPlaceableOnlyCheckBox";
            this.showPlaceableOnlyCheckBox.Size = new System.Drawing.Size(183, 24);
            this.showPlaceableOnlyCheckBox.TabIndex = 4;
            this.showPlaceableOnlyCheckBox.Text = "Show Placeable Only";
            this.showPlaceableOnlyCheckBox.UseVisualStyleBackColor = true;
            this.showPlaceableOnlyCheckBox.CheckedChanged += new System.EventHandler(this.showPlaceableOnlyCheckBox_CheckedChanged);
            // 
            // actorClassList
            // 
            this.actorClassList.FormattingEnabled = true;
            this.actorClassList.ItemHeight = 20;
            this.actorClassList.Location = new System.Drawing.Point(4, 82);
            this.actorClassList.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.actorClassList.Name = "actorClassList";
            this.actorClassList.Size = new System.Drawing.Size(1008, 724);
            this.actorClassList.TabIndex = 3;
            // 
            // listBox1
            // 
            this.listBox1.FormattingEnabled = true;
            this.listBox1.ItemHeight = 20;
            this.listBox1.Location = new System.Drawing.Point(603, 458);
            this.listBox1.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.listBox1.Name = "listBox1";
            this.listBox1.Size = new System.Drawing.Size(10, 4);
            this.listBox1.TabIndex = 2;
            // 
            // menuStrip1
            // 
            this.menuStrip1.GripMargin = new System.Windows.Forms.Padding(2, 2, 0, 2);
            this.menuStrip1.ImageScalingSize = new System.Drawing.Size(24, 24);
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.fileToolStripMenuItem,
            this.sortToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(4, 5);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(1014, 35);
            this.menuStrip1.TabIndex = 0;
            this.menuStrip1.Text = "actorBrowersMenuStrip";
            // 
            // fileToolStripMenuItem
            // 
            this.fileToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.placeEntityToolStripMenuItem});
            this.fileToolStripMenuItem.Name = "fileToolStripMenuItem";
            this.fileToolStripMenuItem.Size = new System.Drawing.Size(54, 29);
            this.fileToolStripMenuItem.Text = "&File";
            // 
            // placeEntityToolStripMenuItem
            // 
            this.placeEntityToolStripMenuItem.Name = "placeEntityToolStripMenuItem";
            this.placeEntityToolStripMenuItem.Size = new System.Drawing.Size(203, 34);
            this.placeEntityToolStripMenuItem.Text = "Place Entity";
            this.placeEntityToolStripMenuItem.Click += new System.EventHandler(this.placeEntityToolStripMenuItem_Click);
            // 
            // sortToolStripMenuItem
            // 
            this.sortToolStripMenuItem.Name = "sortToolStripMenuItem";
            this.sortToolStripMenuItem.Size = new System.Drawing.Size(61, 29);
            this.sortToolStripMenuItem.Text = "&Sort";
            // 
            // texturePage
            // 
            this.texturePage.Controls.Add(this.textureGroupComboBox);
            this.texturePage.Controls.Add(this.textureListBox);
            this.texturePage.Controls.Add(this.textureBrowserStripMenu);
            this.texturePage.Location = new System.Drawing.Point(4, 4);
            this.texturePage.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.texturePage.Name = "texturePage";
            this.texturePage.Padding = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.texturePage.Size = new System.Drawing.Size(1022, 836);
            this.texturePage.TabIndex = 1;
            this.texturePage.Text = "Textures";
            this.texturePage.UseVisualStyleBackColor = true;
            // 
            // textureGroupComboBox
            // 
            this.textureGroupComboBox.Dock = System.Windows.Forms.DockStyle.Top;
            this.textureGroupComboBox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.textureGroupComboBox.FormattingEnabled = true;
            this.textureGroupComboBox.Location = new System.Drawing.Point(4, 40);
            this.textureGroupComboBox.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.textureGroupComboBox.Name = "textureGroupComboBox";
            this.textureGroupComboBox.Size = new System.Drawing.Size(1014, 28);
            this.textureGroupComboBox.TabIndex = 2;
            this.textureGroupComboBox.SelectedIndexChanged += new System.EventHandler(this.textureGroupComboBox_SelectedIndexChanged);
            // 
            // textureListBox
            // 
            this.textureListBox.FormattingEnabled = true;
            this.textureListBox.ItemHeight = 20;
            this.textureListBox.Location = new System.Drawing.Point(4, 83);
            this.textureListBox.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.textureListBox.Name = "textureListBox";
            this.textureListBox.Size = new System.Drawing.Size(1018, 744);
            this.textureListBox.TabIndex = 1;
            this.textureListBox.SelectedIndexChanged += new System.EventHandler(this.textureListBox_SelectedIndexChanged);
            // 
            // textureBrowserStripMenu
            // 
            this.textureBrowserStripMenu.GripMargin = new System.Windows.Forms.Padding(2, 2, 0, 2);
            this.textureBrowserStripMenu.ImageScalingSize = new System.Drawing.Size(24, 24);
            this.textureBrowserStripMenu.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.fileToolStripMenuItem1,
            this.editToolStripMenuItem,
            this.viewToolStripMenuItem});
            this.textureBrowserStripMenu.Location = new System.Drawing.Point(4, 5);
            this.textureBrowserStripMenu.Name = "textureBrowserStripMenu";
            this.textureBrowserStripMenu.Size = new System.Drawing.Size(1014, 35);
            this.textureBrowserStripMenu.TabIndex = 0;
            this.textureBrowserStripMenu.Text = "menuStrip2";
            // 
            // fileToolStripMenuItem1
            // 
            this.fileToolStripMenuItem1.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.newToolStripMenuItem,
            this.openToolStripMenuItem,
            this.saveToolStripMenuItem,
            this.toolStripSeparator1,
            this.importToolStripMenuItem,
            this.exportToolStripMenuItem});
            this.fileToolStripMenuItem1.Name = "fileToolStripMenuItem1";
            this.fileToolStripMenuItem1.Size = new System.Drawing.Size(54, 29);
            this.fileToolStripMenuItem1.Text = "&File";
            // 
            // newToolStripMenuItem
            // 
            this.newToolStripMenuItem.Name = "newToolStripMenuItem";
            this.newToolStripMenuItem.Size = new System.Drawing.Size(169, 34);
            this.newToolStripMenuItem.Text = "New";
            // 
            // openToolStripMenuItem
            // 
            this.openToolStripMenuItem.Name = "openToolStripMenuItem";
            this.openToolStripMenuItem.Size = new System.Drawing.Size(169, 34);
            this.openToolStripMenuItem.Text = "Open";
            this.openToolStripMenuItem.Click += new System.EventHandler(this.openToolStripMenuItem_Click);
            // 
            // saveToolStripMenuItem
            // 
            this.saveToolStripMenuItem.Name = "saveToolStripMenuItem";
            this.saveToolStripMenuItem.Size = new System.Drawing.Size(169, 34);
            this.saveToolStripMenuItem.Text = "Save";
            this.saveToolStripMenuItem.Click += new System.EventHandler(this.saveToolStripMenuItem_Click);
            // 
            // toolStripSeparator1
            // 
            this.toolStripSeparator1.Name = "toolStripSeparator1";
            this.toolStripSeparator1.Size = new System.Drawing.Size(166, 6);
            // 
            // importToolStripMenuItem
            // 
            this.importToolStripMenuItem.Name = "importToolStripMenuItem";
            this.importToolStripMenuItem.Size = new System.Drawing.Size(169, 34);
            this.importToolStripMenuItem.Text = "Import";
            this.importToolStripMenuItem.Click += new System.EventHandler(this.importToolStripMenuItem_Click);
            // 
            // exportToolStripMenuItem
            // 
            this.exportToolStripMenuItem.Name = "exportToolStripMenuItem";
            this.exportToolStripMenuItem.Size = new System.Drawing.Size(169, 34);
            this.exportToolStripMenuItem.Text = "Export";
            this.exportToolStripMenuItem.Click += new System.EventHandler(this.exportToolStripMenuItem_Click);
            // 
            // editToolStripMenuItem
            // 
            this.editToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.propertiesToolStripMenuItem,
            this.deleteToolStripMenuItem,
            this.renameToolStripMenuItem});
            this.editToolStripMenuItem.Name = "editToolStripMenuItem";
            this.editToolStripMenuItem.Size = new System.Drawing.Size(58, 29);
            this.editToolStripMenuItem.Text = "&Edit";
            // 
            // propertiesToolStripMenuItem
            // 
            this.propertiesToolStripMenuItem.Name = "propertiesToolStripMenuItem";
            this.propertiesToolStripMenuItem.Size = new System.Drawing.Size(194, 34);
            this.propertiesToolStripMenuItem.Text = "Properties";
            this.propertiesToolStripMenuItem.Click += new System.EventHandler(this.propertiesToolStripMenuItem_Click);
            // 
            // deleteToolStripMenuItem
            // 
            this.deleteToolStripMenuItem.Name = "deleteToolStripMenuItem";
            this.deleteToolStripMenuItem.Size = new System.Drawing.Size(194, 34);
            this.deleteToolStripMenuItem.Text = "Delete";
            // 
            // renameToolStripMenuItem
            // 
            this.renameToolStripMenuItem.Name = "renameToolStripMenuItem";
            this.renameToolStripMenuItem.Size = new System.Drawing.Size(194, 34);
            this.renameToolStripMenuItem.Text = "Rename";
            // 
            // viewToolStripMenuItem
            // 
            this.viewToolStripMenuItem.Name = "viewToolStripMenuItem";
            this.viewToolStripMenuItem.Size = new System.Drawing.Size(65, 29);
            this.viewToolStripMenuItem.Text = "&View";
            // 
            // soundPage
            // 
            this.soundPage.Controls.Add(this.soundGroupComboBox);
            this.soundPage.Controls.Add(this.soundPackageListBox);
            this.soundPage.Controls.Add(this.menuStrip3);
            this.soundPage.Location = new System.Drawing.Point(4, 4);
            this.soundPage.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.soundPage.Name = "soundPage";
            this.soundPage.Size = new System.Drawing.Size(1022, 836);
            this.soundPage.TabIndex = 3;
            this.soundPage.Text = "Sounds";
            this.soundPage.UseVisualStyleBackColor = true;
            // 
            // soundGroupComboBox
            // 
            this.soundGroupComboBox.Dock = System.Windows.Forms.DockStyle.Top;
            this.soundGroupComboBox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.soundGroupComboBox.FormattingEnabled = true;
            this.soundGroupComboBox.Location = new System.Drawing.Point(0, 35);
            this.soundGroupComboBox.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.soundGroupComboBox.Name = "soundGroupComboBox";
            this.soundGroupComboBox.Size = new System.Drawing.Size(1022, 28);
            this.soundGroupComboBox.TabIndex = 3;
            this.soundGroupComboBox.SelectedIndexChanged += new System.EventHandler(this.soundGroupComboBox_SelectedIndexChanged);
            // 
            // soundPackageListBox
            // 
            this.soundPackageListBox.FormattingEnabled = true;
            this.soundPackageListBox.ItemHeight = 20;
            this.soundPackageListBox.Location = new System.Drawing.Point(0, 77);
            this.soundPackageListBox.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.soundPackageListBox.Name = "soundPackageListBox";
            this.soundPackageListBox.Size = new System.Drawing.Size(1016, 744);
            this.soundPackageListBox.TabIndex = 1;
            this.soundPackageListBox.SelectedIndexChanged += new System.EventHandler(this.soundPackageListBox_SelectedIndexChanged);
            // 
            // menuStrip3
            // 
            this.menuStrip3.GripMargin = new System.Windows.Forms.Padding(2, 2, 0, 2);
            this.menuStrip3.ImageScalingSize = new System.Drawing.Size(24, 24);
            this.menuStrip3.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.fileToolStripMenuItem2,
            this.editToolStripMenuItem1,
            this.viewToolStripMenuItem1});
            this.menuStrip3.Location = new System.Drawing.Point(0, 0);
            this.menuStrip3.Name = "menuStrip3";
            this.menuStrip3.Size = new System.Drawing.Size(1022, 35);
            this.menuStrip3.TabIndex = 0;
            this.menuStrip3.Text = "menuStrip3";
            // 
            // fileToolStripMenuItem2
            // 
            this.fileToolStripMenuItem2.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.openToolStripMenuItem1,
            this.saveToolStripMenuItem1,
            this.toolStripSeparator2,
            this.importToolStripMenuItem1,
            this.exportToolStripMenuItem1});
            this.fileToolStripMenuItem2.Name = "fileToolStripMenuItem2";
            this.fileToolStripMenuItem2.Size = new System.Drawing.Size(54, 29);
            this.fileToolStripMenuItem2.Text = "&File";
            // 
            // openToolStripMenuItem1
            // 
            this.openToolStripMenuItem1.Name = "openToolStripMenuItem1";
            this.openToolStripMenuItem1.Size = new System.Drawing.Size(169, 34);
            this.openToolStripMenuItem1.Text = "Open";
            this.openToolStripMenuItem1.Click += new System.EventHandler(this.openToolStripMenuItem1_Click);
            // 
            // saveToolStripMenuItem1
            // 
            this.saveToolStripMenuItem1.Name = "saveToolStripMenuItem1";
            this.saveToolStripMenuItem1.Size = new System.Drawing.Size(169, 34);
            this.saveToolStripMenuItem1.Text = "Save";
            this.saveToolStripMenuItem1.Click += new System.EventHandler(this.saveToolStripMenuItem1_Click);
            // 
            // toolStripSeparator2
            // 
            this.toolStripSeparator2.Name = "toolStripSeparator2";
            this.toolStripSeparator2.Size = new System.Drawing.Size(166, 6);
            // 
            // importToolStripMenuItem1
            // 
            this.importToolStripMenuItem1.Name = "importToolStripMenuItem1";
            this.importToolStripMenuItem1.Size = new System.Drawing.Size(169, 34);
            this.importToolStripMenuItem1.Text = "Import";
            this.importToolStripMenuItem1.Click += new System.EventHandler(this.importToolStripMenuItem1_Click);
            // 
            // exportToolStripMenuItem1
            // 
            this.exportToolStripMenuItem1.Name = "exportToolStripMenuItem1";
            this.exportToolStripMenuItem1.Size = new System.Drawing.Size(169, 34);
            this.exportToolStripMenuItem1.Text = "Export";
            this.exportToolStripMenuItem1.Click += new System.EventHandler(this.exportToolStripMenuItem1_Click);
            // 
            // editToolStripMenuItem1
            // 
            this.editToolStripMenuItem1.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.deleteToolStripMenuItem1,
            this.toolStripSeparator3,
            this.playToolStripMenuItem,
            this.stopToolStripMenuItem});
            this.editToolStripMenuItem1.Name = "editToolStripMenuItem1";
            this.editToolStripMenuItem1.Size = new System.Drawing.Size(58, 29);
            this.editToolStripMenuItem1.Text = "&Edit";
            // 
            // deleteToolStripMenuItem1
            // 
            this.deleteToolStripMenuItem1.Name = "deleteToolStripMenuItem1";
            this.deleteToolStripMenuItem1.Size = new System.Drawing.Size(164, 34);
            this.deleteToolStripMenuItem1.Text = "Delete";
            // 
            // toolStripSeparator3
            // 
            this.toolStripSeparator3.Name = "toolStripSeparator3";
            this.toolStripSeparator3.Size = new System.Drawing.Size(161, 6);
            // 
            // playToolStripMenuItem
            // 
            this.playToolStripMenuItem.Name = "playToolStripMenuItem";
            this.playToolStripMenuItem.Size = new System.Drawing.Size(164, 34);
            this.playToolStripMenuItem.Text = "Play";
            this.playToolStripMenuItem.Click += new System.EventHandler(this.playToolStripMenuItem_Click);
            // 
            // stopToolStripMenuItem
            // 
            this.stopToolStripMenuItem.Name = "stopToolStripMenuItem";
            this.stopToolStripMenuItem.Size = new System.Drawing.Size(164, 34);
            this.stopToolStripMenuItem.Text = "Stop";
            // 
            // viewToolStripMenuItem1
            // 
            this.viewToolStripMenuItem1.Name = "viewToolStripMenuItem1";
            this.viewToolStripMenuItem1.Size = new System.Drawing.Size(65, 29);
            this.viewToolStripMenuItem1.Text = "&View";
            // 
            // staticMeshPage
            // 
            this.staticMeshPage.Controls.Add(this.staticMeshGroupComboBox);
            this.staticMeshPage.Controls.Add(this.label2);
            this.staticMeshPage.Controls.Add(this.staticMeshListBox);
            this.staticMeshPage.Controls.Add(this.label1);
            this.staticMeshPage.Controls.Add(this.staticMeshViewerPanel);
            this.staticMeshPage.Controls.Add(this.menuStrip2);
            this.staticMeshPage.Location = new System.Drawing.Point(4, 4);
            this.staticMeshPage.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.staticMeshPage.Name = "staticMeshPage";
            this.staticMeshPage.Size = new System.Drawing.Size(1022, 836);
            this.staticMeshPage.TabIndex = 4;
            this.staticMeshPage.Text = "Static Meshes";
            this.staticMeshPage.UseVisualStyleBackColor = true;
            // 
            // staticMeshGroupComboBox
            // 
            this.staticMeshGroupComboBox.FormattingEnabled = true;
            this.staticMeshGroupComboBox.Location = new System.Drawing.Point(12, 43);
            this.staticMeshGroupComboBox.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.staticMeshGroupComboBox.Name = "staticMeshGroupComboBox";
            this.staticMeshGroupComboBox.Size = new System.Drawing.Size(988, 28);
            this.staticMeshGroupComboBox.TabIndex = 7;
            this.staticMeshGroupComboBox.SelectedIndexChanged += new System.EventHandler(this.staticMeshGroupComboBox_SelectedIndexChanged_1);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 95);
            this.label2.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(65, 20);
            this.label2.TabIndex = 6;
            this.label2.Text = "Meshes";
            // 
            // staticMeshListBox
            // 
            this.staticMeshListBox.FormattingEnabled = true;
            this.staticMeshListBox.ItemHeight = 20;
            this.staticMeshListBox.Location = new System.Drawing.Point(16, 120);
            this.staticMeshListBox.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.staticMeshListBox.Name = "staticMeshListBox";
            this.staticMeshListBox.Size = new System.Drawing.Size(271, 704);
            this.staticMeshListBox.TabIndex = 5;
            this.staticMeshListBox.SelectedIndexChanged += new System.EventHandler(this.staticMeshListBox_SelectedIndexChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(298, 95);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(145, 20);
            this.label1.TabIndex = 2;
            this.label1.Text = "Static Mesh Viewer";
            // 
            // staticMeshViewerPanel
            // 
            this.staticMeshViewerPanel.Location = new System.Drawing.Point(303, 120);
            this.staticMeshViewerPanel.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.staticMeshViewerPanel.Name = "staticMeshViewerPanel";
            this.staticMeshViewerPanel.Size = new System.Drawing.Size(704, 522);
            this.staticMeshViewerPanel.TabIndex = 1;
            // 
            // menuStrip2
            // 
            this.menuStrip2.GripMargin = new System.Windows.Forms.Padding(2, 2, 0, 2);
            this.menuStrip2.ImageScalingSize = new System.Drawing.Size(24, 24);
            this.menuStrip2.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.fileToolStripMenuItem3,
            this.entityToolStripMenuItem});
            this.menuStrip2.Location = new System.Drawing.Point(0, 0);
            this.menuStrip2.Name = "menuStrip2";
            this.menuStrip2.Size = new System.Drawing.Size(1022, 35);
            this.menuStrip2.TabIndex = 0;
            this.menuStrip2.Text = "menuStrip2";
            this.menuStrip2.ItemClicked += new System.Windows.Forms.ToolStripItemClickedEventHandler(this.menuStrip2_ItemClicked);
            // 
            // fileToolStripMenuItem3
            // 
            this.fileToolStripMenuItem3.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.openToolStripMenuItem2,
            this.saveToolStripMenuItem2,
            this.toolStripSeparator4,
            this.importToolStripMenuItem2,
            this.exportToolStripMenuItem2});
            this.fileToolStripMenuItem3.Name = "fileToolStripMenuItem3";
            this.fileToolStripMenuItem3.Size = new System.Drawing.Size(54, 29);
            this.fileToolStripMenuItem3.Text = "&File";
            // 
            // openToolStripMenuItem2
            // 
            this.openToolStripMenuItem2.Name = "openToolStripMenuItem2";
            this.openToolStripMenuItem2.Size = new System.Drawing.Size(169, 34);
            this.openToolStripMenuItem2.Text = "Open";
            this.openToolStripMenuItem2.Click += new System.EventHandler(this.openToolStripMenuItem2_Click);
            // 
            // saveToolStripMenuItem2
            // 
            this.saveToolStripMenuItem2.Name = "saveToolStripMenuItem2";
            this.saveToolStripMenuItem2.Size = new System.Drawing.Size(169, 34);
            this.saveToolStripMenuItem2.Text = "Save";
            this.saveToolStripMenuItem2.Click += new System.EventHandler(this.saveToolStripMenuItem2_Click);
            // 
            // toolStripSeparator4
            // 
            this.toolStripSeparator4.Name = "toolStripSeparator4";
            this.toolStripSeparator4.Size = new System.Drawing.Size(166, 6);
            // 
            // importToolStripMenuItem2
            // 
            this.importToolStripMenuItem2.Name = "importToolStripMenuItem2";
            this.importToolStripMenuItem2.Size = new System.Drawing.Size(169, 34);
            this.importToolStripMenuItem2.Text = "Import";
            this.importToolStripMenuItem2.Click += new System.EventHandler(this.importToolStripMenuItem2_Click);
            // 
            // exportToolStripMenuItem2
            // 
            this.exportToolStripMenuItem2.Name = "exportToolStripMenuItem2";
            this.exportToolStripMenuItem2.Size = new System.Drawing.Size(169, 34);
            this.exportToolStripMenuItem2.Text = "Export";
            // 
            // entityToolStripMenuItem
            // 
            this.entityToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.createEntityFromMeshToolStripMenuItem});
            this.entityToolStripMenuItem.Name = "entityToolStripMenuItem";
            this.entityToolStripMenuItem.Size = new System.Drawing.Size(72, 29);
            this.entityToolStripMenuItem.Text = "Entity";
            // 
            // createEntityFromMeshToolStripMenuItem
            // 
            this.createEntityFromMeshToolStripMenuItem.Name = "createEntityFromMeshToolStripMenuItem";
            this.createEntityFromMeshToolStripMenuItem.Size = new System.Drawing.Size(305, 34);
            this.createEntityFromMeshToolStripMenuItem.Text = "Create Entity from Mesh";
            this.createEntityFromMeshToolStripMenuItem.Click += new System.EventHandler(this.createEntityFromMeshToolStripMenuItem_Click);
            // 
            // contextMenuStrip1
            // 
            this.contextMenuStrip1.ImageScalingSize = new System.Drawing.Size(24, 24);
            this.contextMenuStrip1.Name = "contextMenuStrip1";
            this.contextMenuStrip1.Size = new System.Drawing.Size(61, 4);
            // 
            // BrowserFrm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.Gray;
            this.ClientSize = new System.Drawing.Size(1030, 869);
            this.Controls.Add(this.browserTabControl);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MainMenuStrip = this.textureBrowserStripMenu;
            this.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.MaximizeBox = false;
            this.Name = "BrowserFrm";
            this.Text = "DukeEdit Browsers";
            this.Load += new System.EventHandler(this.BrowserFrm_Load);
            this.browserTabControl.ResumeLayout(false);
            this.actorClassPage.ResumeLayout(false);
            this.actorClassPage.PerformLayout();
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.texturePage.ResumeLayout(false);
            this.texturePage.PerformLayout();
            this.textureBrowserStripMenu.ResumeLayout(false);
            this.textureBrowserStripMenu.PerformLayout();
            this.soundPage.ResumeLayout(false);
            this.soundPage.PerformLayout();
            this.menuStrip3.ResumeLayout(false);
            this.menuStrip3.PerformLayout();
            this.staticMeshPage.ResumeLayout(false);
            this.staticMeshPage.PerformLayout();
            this.menuStrip2.ResumeLayout(false);
            this.menuStrip2.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TabControl browserTabControl;
        private System.Windows.Forms.TabPage actorClassPage;
        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem fileToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem placeEntityToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem sortToolStripMenuItem;
        private System.Windows.Forms.TabPage texturePage;
        private System.Windows.Forms.TabPage soundPage;
        private System.Windows.Forms.TabPage staticMeshPage;
        private System.Windows.Forms.ListBox listBox1;
        private System.Windows.Forms.ListBox actorClassList;
        private System.Windows.Forms.MenuStrip textureBrowserStripMenu;
        private System.Windows.Forms.ToolStripMenuItem fileToolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem newToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem openToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem saveToolStripMenuItem;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator1;
        private System.Windows.Forms.ToolStripMenuItem importToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem exportToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem editToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem propertiesToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem deleteToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem renameToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem viewToolStripMenuItem;
        private System.Windows.Forms.ContextMenuStrip contextMenuStrip1;
        private System.Windows.Forms.MenuStrip menuStrip3;
        private System.Windows.Forms.ToolStripMenuItem fileToolStripMenuItem2;
        private System.Windows.Forms.ToolStripMenuItem openToolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem saveToolStripMenuItem1;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator2;
        private System.Windows.Forms.ToolStripMenuItem importToolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem exportToolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem editToolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem deleteToolStripMenuItem1;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator3;
        private System.Windows.Forms.ToolStripMenuItem playToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem stopToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem viewToolStripMenuItem1;
        private System.Windows.Forms.ListBox soundPackageListBox;
        private System.Windows.Forms.ListBox textureListBox;
        private System.Windows.Forms.ComboBox textureGroupComboBox;
        private System.Windows.Forms.CheckBox showPlaceableOnlyCheckBox;
        private System.Windows.Forms.ComboBox soundGroupComboBox;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Panel staticMeshViewerPanel;
        private System.Windows.Forms.MenuStrip menuStrip2;
        private System.Windows.Forms.ToolStripMenuItem fileToolStripMenuItem3;
        private System.Windows.Forms.ToolStripMenuItem openToolStripMenuItem2;
        private System.Windows.Forms.ToolStripMenuItem saveToolStripMenuItem2;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator4;
        private System.Windows.Forms.ToolStripMenuItem importToolStripMenuItem2;
        private System.Windows.Forms.ToolStripMenuItem exportToolStripMenuItem2;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ListBox staticMeshListBox;
        private System.Windows.Forms.ComboBox staticMeshGroupComboBox;
        private System.Windows.Forms.ToolStripMenuItem entityToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem createEntityFromMeshToolStripMenuItem;
    }
}