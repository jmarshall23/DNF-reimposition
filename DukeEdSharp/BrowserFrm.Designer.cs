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
            this.soundsGroupComboBox = new System.Windows.Forms.TabControl();
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
            this.contextMenuStrip1 = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.entityToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.createEntityFromMeshToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.soundsGroupComboBox.SuspendLayout();
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
            // soundsGroupComboBox
            // 
            this.soundsGroupComboBox.Controls.Add(this.actorClassPage);
            this.soundsGroupComboBox.Controls.Add(this.texturePage);
            this.soundsGroupComboBox.Controls.Add(this.soundPage);
            this.soundsGroupComboBox.Controls.Add(this.staticMeshPage);
            this.soundsGroupComboBox.Dock = System.Windows.Forms.DockStyle.Fill;
            this.soundsGroupComboBox.Location = new System.Drawing.Point(0, 0);
            this.soundsGroupComboBox.Name = "soundsGroupComboBox";
            this.soundsGroupComboBox.SelectedIndex = 0;
            this.soundsGroupComboBox.Size = new System.Drawing.Size(687, 565);
            this.soundsGroupComboBox.TabIndex = 0;
            // 
            // actorClassPage
            // 
            this.actorClassPage.Controls.Add(this.showPlaceableOnlyCheckBox);
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
            // showPlaceableOnlyCheckBox
            // 
            this.showPlaceableOnlyCheckBox.AutoSize = true;
            this.showPlaceableOnlyCheckBox.Checked = true;
            this.showPlaceableOnlyCheckBox.CheckState = System.Windows.Forms.CheckState.Checked;
            this.showPlaceableOnlyCheckBox.Location = new System.Drawing.Point(7, 30);
            this.showPlaceableOnlyCheckBox.Name = "showPlaceableOnlyCheckBox";
            this.showPlaceableOnlyCheckBox.Size = new System.Drawing.Size(127, 17);
            this.showPlaceableOnlyCheckBox.TabIndex = 4;
            this.showPlaceableOnlyCheckBox.Text = "Show Placeable Only";
            this.showPlaceableOnlyCheckBox.UseVisualStyleBackColor = true;
            this.showPlaceableOnlyCheckBox.CheckedChanged += new System.EventHandler(this.showPlaceableOnlyCheckBox_CheckedChanged);
            // 
            // actorClassList
            // 
            this.actorClassList.FormattingEnabled = true;
            this.actorClassList.Location = new System.Drawing.Point(3, 53);
            this.actorClassList.Name = "actorClassList";
            this.actorClassList.Size = new System.Drawing.Size(673, 472);
            this.actorClassList.TabIndex = 3;
            // 
            // listBox1
            // 
            this.listBox1.FormattingEnabled = true;
            this.listBox1.Location = new System.Drawing.Point(402, 298);
            this.listBox1.Name = "listBox1";
            this.listBox1.Size = new System.Drawing.Size(8, 4);
            this.listBox1.TabIndex = 2;
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
            this.menuStrip1.Text = "actorBrowersMenuStrip";
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
            this.placeEntityToolStripMenuItem.Size = new System.Drawing.Size(135, 22);
            this.placeEntityToolStripMenuItem.Text = "Place Entity";
            this.placeEntityToolStripMenuItem.Click += new System.EventHandler(this.placeEntityToolStripMenuItem_Click);
            // 
            // sortToolStripMenuItem
            // 
            this.sortToolStripMenuItem.Name = "sortToolStripMenuItem";
            this.sortToolStripMenuItem.Size = new System.Drawing.Size(40, 20);
            this.sortToolStripMenuItem.Text = "&Sort";
            // 
            // texturePage
            // 
            this.texturePage.Controls.Add(this.textureGroupComboBox);
            this.texturePage.Controls.Add(this.textureListBox);
            this.texturePage.Controls.Add(this.textureBrowserStripMenu);
            this.texturePage.Location = new System.Drawing.Point(4, 22);
            this.texturePage.Name = "texturePage";
            this.texturePage.Padding = new System.Windows.Forms.Padding(3);
            this.texturePage.Size = new System.Drawing.Size(679, 539);
            this.texturePage.TabIndex = 1;
            this.texturePage.Text = "Textures";
            this.texturePage.UseVisualStyleBackColor = true;
            // 
            // textureGroupComboBox
            // 
            this.textureGroupComboBox.Dock = System.Windows.Forms.DockStyle.Top;
            this.textureGroupComboBox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.textureGroupComboBox.FormattingEnabled = true;
            this.textureGroupComboBox.Location = new System.Drawing.Point(3, 27);
            this.textureGroupComboBox.Name = "textureGroupComboBox";
            this.textureGroupComboBox.Size = new System.Drawing.Size(673, 21);
            this.textureGroupComboBox.TabIndex = 2;
            this.textureGroupComboBox.SelectedIndexChanged += new System.EventHandler(this.textureGroupComboBox_SelectedIndexChanged);
            // 
            // textureListBox
            // 
            this.textureListBox.FormattingEnabled = true;
            this.textureListBox.Location = new System.Drawing.Point(3, 54);
            this.textureListBox.Name = "textureListBox";
            this.textureListBox.Size = new System.Drawing.Size(680, 485);
            this.textureListBox.TabIndex = 1;
            this.textureListBox.SelectedIndexChanged += new System.EventHandler(this.textureListBox_SelectedIndexChanged);
            // 
            // textureBrowserStripMenu
            // 
            this.textureBrowserStripMenu.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.fileToolStripMenuItem1,
            this.editToolStripMenuItem,
            this.viewToolStripMenuItem});
            this.textureBrowserStripMenu.Location = new System.Drawing.Point(3, 3);
            this.textureBrowserStripMenu.Name = "textureBrowserStripMenu";
            this.textureBrowserStripMenu.Size = new System.Drawing.Size(673, 24);
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
            this.fileToolStripMenuItem1.Size = new System.Drawing.Size(37, 20);
            this.fileToolStripMenuItem1.Text = "&File";
            // 
            // newToolStripMenuItem
            // 
            this.newToolStripMenuItem.Name = "newToolStripMenuItem";
            this.newToolStripMenuItem.Size = new System.Drawing.Size(110, 22);
            this.newToolStripMenuItem.Text = "New";
            // 
            // openToolStripMenuItem
            // 
            this.openToolStripMenuItem.Name = "openToolStripMenuItem";
            this.openToolStripMenuItem.Size = new System.Drawing.Size(110, 22);
            this.openToolStripMenuItem.Text = "Open";
            this.openToolStripMenuItem.Click += new System.EventHandler(this.openToolStripMenuItem_Click);
            // 
            // saveToolStripMenuItem
            // 
            this.saveToolStripMenuItem.Name = "saveToolStripMenuItem";
            this.saveToolStripMenuItem.Size = new System.Drawing.Size(110, 22);
            this.saveToolStripMenuItem.Text = "Save";
            this.saveToolStripMenuItem.Click += new System.EventHandler(this.saveToolStripMenuItem_Click);
            // 
            // toolStripSeparator1
            // 
            this.toolStripSeparator1.Name = "toolStripSeparator1";
            this.toolStripSeparator1.Size = new System.Drawing.Size(107, 6);
            // 
            // importToolStripMenuItem
            // 
            this.importToolStripMenuItem.Name = "importToolStripMenuItem";
            this.importToolStripMenuItem.Size = new System.Drawing.Size(110, 22);
            this.importToolStripMenuItem.Text = "Import";
            this.importToolStripMenuItem.Click += new System.EventHandler(this.importToolStripMenuItem_Click);
            // 
            // exportToolStripMenuItem
            // 
            this.exportToolStripMenuItem.Name = "exportToolStripMenuItem";
            this.exportToolStripMenuItem.Size = new System.Drawing.Size(110, 22);
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
            this.editToolStripMenuItem.Size = new System.Drawing.Size(39, 20);
            this.editToolStripMenuItem.Text = "&Edit";
            // 
            // propertiesToolStripMenuItem
            // 
            this.propertiesToolStripMenuItem.Name = "propertiesToolStripMenuItem";
            this.propertiesToolStripMenuItem.Size = new System.Drawing.Size(127, 22);
            this.propertiesToolStripMenuItem.Text = "Properties";
            this.propertiesToolStripMenuItem.Click += new System.EventHandler(this.propertiesToolStripMenuItem_Click);
            // 
            // deleteToolStripMenuItem
            // 
            this.deleteToolStripMenuItem.Name = "deleteToolStripMenuItem";
            this.deleteToolStripMenuItem.Size = new System.Drawing.Size(127, 22);
            this.deleteToolStripMenuItem.Text = "Delete";
            // 
            // renameToolStripMenuItem
            // 
            this.renameToolStripMenuItem.Name = "renameToolStripMenuItem";
            this.renameToolStripMenuItem.Size = new System.Drawing.Size(127, 22);
            this.renameToolStripMenuItem.Text = "Rename";
            // 
            // viewToolStripMenuItem
            // 
            this.viewToolStripMenuItem.Name = "viewToolStripMenuItem";
            this.viewToolStripMenuItem.Size = new System.Drawing.Size(44, 20);
            this.viewToolStripMenuItem.Text = "&View";
            // 
            // soundPage
            // 
            this.soundPage.Controls.Add(this.soundGroupComboBox);
            this.soundPage.Controls.Add(this.soundPackageListBox);
            this.soundPage.Controls.Add(this.menuStrip3);
            this.soundPage.Location = new System.Drawing.Point(4, 22);
            this.soundPage.Name = "soundPage";
            this.soundPage.Size = new System.Drawing.Size(679, 539);
            this.soundPage.TabIndex = 3;
            this.soundPage.Text = "Sounds";
            this.soundPage.UseVisualStyleBackColor = true;
            // 
            // soundGroupComboBox
            // 
            this.soundGroupComboBox.Dock = System.Windows.Forms.DockStyle.Top;
            this.soundGroupComboBox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.soundGroupComboBox.FormattingEnabled = true;
            this.soundGroupComboBox.Location = new System.Drawing.Point(0, 24);
            this.soundGroupComboBox.Name = "soundGroupComboBox";
            this.soundGroupComboBox.Size = new System.Drawing.Size(679, 21);
            this.soundGroupComboBox.TabIndex = 3;
            this.soundGroupComboBox.SelectedIndexChanged += new System.EventHandler(this.soundGroupComboBox_SelectedIndexChanged);
            // 
            // soundPackageListBox
            // 
            this.soundPackageListBox.FormattingEnabled = true;
            this.soundPackageListBox.Location = new System.Drawing.Point(0, 50);
            this.soundPackageListBox.Name = "soundPackageListBox";
            this.soundPackageListBox.Size = new System.Drawing.Size(679, 485);
            this.soundPackageListBox.TabIndex = 1;
            this.soundPackageListBox.SelectedIndexChanged += new System.EventHandler(this.soundPackageListBox_SelectedIndexChanged);
            // 
            // menuStrip3
            // 
            this.menuStrip3.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.fileToolStripMenuItem2,
            this.editToolStripMenuItem1,
            this.viewToolStripMenuItem1});
            this.menuStrip3.Location = new System.Drawing.Point(0, 0);
            this.menuStrip3.Name = "menuStrip3";
            this.menuStrip3.Size = new System.Drawing.Size(679, 24);
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
            this.fileToolStripMenuItem2.Size = new System.Drawing.Size(37, 20);
            this.fileToolStripMenuItem2.Text = "&File";
            // 
            // openToolStripMenuItem1
            // 
            this.openToolStripMenuItem1.Name = "openToolStripMenuItem1";
            this.openToolStripMenuItem1.Size = new System.Drawing.Size(110, 22);
            this.openToolStripMenuItem1.Text = "Open";
            this.openToolStripMenuItem1.Click += new System.EventHandler(this.openToolStripMenuItem1_Click);
            // 
            // saveToolStripMenuItem1
            // 
            this.saveToolStripMenuItem1.Name = "saveToolStripMenuItem1";
            this.saveToolStripMenuItem1.Size = new System.Drawing.Size(110, 22);
            this.saveToolStripMenuItem1.Text = "Save";
            this.saveToolStripMenuItem1.Click += new System.EventHandler(this.saveToolStripMenuItem1_Click);
            // 
            // toolStripSeparator2
            // 
            this.toolStripSeparator2.Name = "toolStripSeparator2";
            this.toolStripSeparator2.Size = new System.Drawing.Size(107, 6);
            // 
            // importToolStripMenuItem1
            // 
            this.importToolStripMenuItem1.Name = "importToolStripMenuItem1";
            this.importToolStripMenuItem1.Size = new System.Drawing.Size(110, 22);
            this.importToolStripMenuItem1.Text = "Import";
            this.importToolStripMenuItem1.Click += new System.EventHandler(this.importToolStripMenuItem1_Click);
            // 
            // exportToolStripMenuItem1
            // 
            this.exportToolStripMenuItem1.Name = "exportToolStripMenuItem1";
            this.exportToolStripMenuItem1.Size = new System.Drawing.Size(110, 22);
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
            this.editToolStripMenuItem1.Size = new System.Drawing.Size(39, 20);
            this.editToolStripMenuItem1.Text = "&Edit";
            // 
            // deleteToolStripMenuItem1
            // 
            this.deleteToolStripMenuItem1.Name = "deleteToolStripMenuItem1";
            this.deleteToolStripMenuItem1.Size = new System.Drawing.Size(107, 22);
            this.deleteToolStripMenuItem1.Text = "Delete";
            // 
            // toolStripSeparator3
            // 
            this.toolStripSeparator3.Name = "toolStripSeparator3";
            this.toolStripSeparator3.Size = new System.Drawing.Size(104, 6);
            // 
            // playToolStripMenuItem
            // 
            this.playToolStripMenuItem.Name = "playToolStripMenuItem";
            this.playToolStripMenuItem.Size = new System.Drawing.Size(107, 22);
            this.playToolStripMenuItem.Text = "Play";
            this.playToolStripMenuItem.Click += new System.EventHandler(this.playToolStripMenuItem_Click);
            // 
            // stopToolStripMenuItem
            // 
            this.stopToolStripMenuItem.Name = "stopToolStripMenuItem";
            this.stopToolStripMenuItem.Size = new System.Drawing.Size(107, 22);
            this.stopToolStripMenuItem.Text = "Stop";
            // 
            // viewToolStripMenuItem1
            // 
            this.viewToolStripMenuItem1.Name = "viewToolStripMenuItem1";
            this.viewToolStripMenuItem1.Size = new System.Drawing.Size(44, 20);
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
            this.staticMeshPage.Location = new System.Drawing.Point(4, 22);
            this.staticMeshPage.Name = "staticMeshPage";
            this.staticMeshPage.Size = new System.Drawing.Size(679, 539);
            this.staticMeshPage.TabIndex = 4;
            this.staticMeshPage.Text = "Static Meshes";
            this.staticMeshPage.UseVisualStyleBackColor = true;
            // 
            // staticMeshGroupComboBox
            // 
            this.staticMeshGroupComboBox.FormattingEnabled = true;
            this.staticMeshGroupComboBox.Location = new System.Drawing.Point(8, 28);
            this.staticMeshGroupComboBox.Name = "staticMeshGroupComboBox";
            this.staticMeshGroupComboBox.Size = new System.Drawing.Size(660, 21);
            this.staticMeshGroupComboBox.TabIndex = 7;
            this.staticMeshGroupComboBox.SelectedIndexChanged += new System.EventHandler(this.staticMeshGroupComboBox_SelectedIndexChanged_1);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(8, 62);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(44, 13);
            this.label2.TabIndex = 6;
            this.label2.Text = "Meshes";
            // 
            // staticMeshListBox
            // 
            this.staticMeshListBox.FormattingEnabled = true;
            this.staticMeshListBox.Location = new System.Drawing.Point(11, 78);
            this.staticMeshListBox.Name = "staticMeshListBox";
            this.staticMeshListBox.Size = new System.Drawing.Size(182, 459);
            this.staticMeshListBox.TabIndex = 5;
            this.staticMeshListBox.SelectedIndexChanged += new System.EventHandler(this.staticMeshListBox_SelectedIndexChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(199, 62);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(98, 13);
            this.label1.TabIndex = 2;
            this.label1.Text = "Static Mesh Viewer";
            // 
            // staticMeshViewerPanel
            // 
            this.staticMeshViewerPanel.Location = new System.Drawing.Point(202, 78);
            this.staticMeshViewerPanel.Name = "staticMeshViewerPanel";
            this.staticMeshViewerPanel.Size = new System.Drawing.Size(469, 339);
            this.staticMeshViewerPanel.TabIndex = 1;
            // 
            // menuStrip2
            // 
            this.menuStrip2.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.fileToolStripMenuItem3,
            this.entityToolStripMenuItem});
            this.menuStrip2.Location = new System.Drawing.Point(0, 0);
            this.menuStrip2.Name = "menuStrip2";
            this.menuStrip2.Size = new System.Drawing.Size(679, 24);
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
            this.fileToolStripMenuItem3.Size = new System.Drawing.Size(37, 20);
            this.fileToolStripMenuItem3.Text = "&File";
            // 
            // openToolStripMenuItem2
            // 
            this.openToolStripMenuItem2.Name = "openToolStripMenuItem2";
            this.openToolStripMenuItem2.Size = new System.Drawing.Size(110, 22);
            this.openToolStripMenuItem2.Text = "Open";
            this.openToolStripMenuItem2.Click += new System.EventHandler(this.openToolStripMenuItem2_Click);
            // 
            // saveToolStripMenuItem2
            // 
            this.saveToolStripMenuItem2.Name = "saveToolStripMenuItem2";
            this.saveToolStripMenuItem2.Size = new System.Drawing.Size(110, 22);
            this.saveToolStripMenuItem2.Text = "Save";
            // 
            // toolStripSeparator4
            // 
            this.toolStripSeparator4.Name = "toolStripSeparator4";
            this.toolStripSeparator4.Size = new System.Drawing.Size(107, 6);
            // 
            // importToolStripMenuItem2
            // 
            this.importToolStripMenuItem2.Name = "importToolStripMenuItem2";
            this.importToolStripMenuItem2.Size = new System.Drawing.Size(110, 22);
            this.importToolStripMenuItem2.Text = "Import";
            // 
            // exportToolStripMenuItem2
            // 
            this.exportToolStripMenuItem2.Name = "exportToolStripMenuItem2";
            this.exportToolStripMenuItem2.Size = new System.Drawing.Size(110, 22);
            this.exportToolStripMenuItem2.Text = "Export";
            // 
            // contextMenuStrip1
            // 
            this.contextMenuStrip1.Name = "contextMenuStrip1";
            this.contextMenuStrip1.Size = new System.Drawing.Size(61, 4);
            // 
            // entityToolStripMenuItem
            // 
            this.entityToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.createEntityFromMeshToolStripMenuItem});
            this.entityToolStripMenuItem.Name = "entityToolStripMenuItem";
            this.entityToolStripMenuItem.Size = new System.Drawing.Size(49, 20);
            this.entityToolStripMenuItem.Text = "Entity";
            // 
            // createEntityFromMeshToolStripMenuItem
            // 
            this.createEntityFromMeshToolStripMenuItem.Name = "createEntityFromMeshToolStripMenuItem";
            this.createEntityFromMeshToolStripMenuItem.Size = new System.Drawing.Size(202, 22);
            this.createEntityFromMeshToolStripMenuItem.Text = "Create Entity from Mesh";
            this.createEntityFromMeshToolStripMenuItem.Click += new System.EventHandler(this.createEntityFromMeshToolStripMenuItem_Click);
            // 
            // BrowserFrm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(687, 565);
            this.Controls.Add(this.soundsGroupComboBox);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.Fixed3D;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MainMenuStrip = this.textureBrowserStripMenu;
            this.MaximizeBox = false;
            this.Name = "BrowserFrm";
            this.Text = "DukeEdit Browsers";
            this.Load += new System.EventHandler(this.BrowserFrm_Load);
            this.soundsGroupComboBox.ResumeLayout(false);
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

        private System.Windows.Forms.TabControl soundsGroupComboBox;
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